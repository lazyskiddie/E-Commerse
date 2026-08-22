package com.example.E_commerce.Admin.Service;

import com.example.E_commerce.Coffee;
import com.example.E_commerce.Admin.Repo.CoffeeRepo;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.*;

/**
 * Unit tests for CoffeeServiceImpl
 * Tests CRUD operations and service logic using Mockito for repository mocking
 */
@ExtendWith(MockitoExtension.class)
@DisplayName("Coffee Service Implementation Tests")
class CoffeeServiceImplTest {

    @Mock
    private CoffeeRepo coffeeRepo;

    @InjectMocks
    private CoffeeServiceImpl coffeeService;

    private Coffee testCoffee;

    @BeforeEach
    void setUp() {
        testCoffee = new Coffee();
        testCoffee.setId(1);
        testCoffee.setName("Espresso");
        testCoffee.setPrice(3.50);
        testCoffee.setDescription("Strong coffee");
        testCoffee.setImageFileName("espresso.jpg");
    }

    @Test
    @DisplayName("Should save coffee successfully")
    void testSaveCoffeeBasic() {
        // Arrange
        when(coffeeRepo.save(any(Coffee.class))).thenReturn(testCoffee);

        // Act
        Coffee savedCoffee = coffeeService.saveCoffee(testCoffee);

        // Assert
        assertNotNull(savedCoffee);
        assertEquals("Espresso", savedCoffee.getName());
        assertEquals(3.50, savedCoffee.getPrice());
        verify(coffeeRepo, times(1)).save(any(Coffee.class));
    }

    @Test
    @DisplayName("Should save coffee with image file name")
    void testSaveCoffeeWithImageFileName() {
        // Arrange
        String imageName = "espresso_special.jpg";
        Coffee coffeeWithoutImage = new Coffee();
        coffeeWithoutImage.setName("Espresso");
        
        when(coffeeRepo.save(any(Coffee.class))).thenReturn(testCoffee);

        // Act
        Coffee savedCoffee = coffeeService.saveCoffee(coffeeWithoutImage, imageName);

        // Assert
        assertNotNull(savedCoffee);
        assertEquals(imageName, savedCoffee.getImageFileName());
        verify(coffeeRepo, times(1)).save(any(Coffee.class));
    }

    @Test
    @DisplayName("Should retrieve all coffees")
    void testReadService() {
        // Arrange
        Coffee coffee2 = new Coffee(2, "Cappuccino", 4.50, "Creamy coffee", null, "cappuccino.jpg");
        Coffee coffee3 = new Coffee(3, "Latte", 4.75, "Smooth coffee", null, "latte.jpg");
        List<Coffee> coffeeList = Arrays.asList(testCoffee, coffee2, coffee3);

        when(coffeeRepo.findAll()).thenReturn(coffeeList);

        // Act
        List<Coffee> retrievedCoffees = coffeeService.readService();

        // Assert
        assertNotNull(retrievedCoffees);
        assertEquals(3, retrievedCoffees.size());
        assertEquals("Espresso", retrievedCoffees.get(0).getName());
        assertEquals("Cappuccino", retrievedCoffees.get(1).getName());
        verify(coffeeRepo, times(1)).findAll();
    }

    @Test
    @DisplayName("Should return empty list when no coffees found")
    void testReadServiceEmpty() {
        // Arrange
        when(coffeeRepo.findAll()).thenReturn(Arrays.asList());

        // Act
        List<Coffee> retrievedCoffees = coffeeService.readService();

        // Assert
        assertNotNull(retrievedCoffees);
        assertEquals(0, retrievedCoffees.size());
        verify(coffeeRepo, times(1)).findAll();
    }

    @Test
    @DisplayName("Should get coffee by valid id")
    void testGetCoffeeByIdValid() {
        // Arrange
        when(coffeeRepo.findById(1)).thenReturn(Optional.of(testCoffee));

        // Act
        Coffee retrievedCoffee = coffeeService.getCoffeeById(1);

        // Assert
        assertNotNull(retrievedCoffee);
        assertEquals(1, retrievedCoffee.getId());
        assertEquals("Espresso", retrievedCoffee.getName());
        verify(coffeeRepo, times(1)).findById(1);
    }

    @Test
    @DisplayName("Should return null when coffee not found by id")
    void testGetCoffeeByIdNotFound() {
        // Arrange
        when(coffeeRepo.findById(999)).thenReturn(Optional.empty());

        // Act
        Coffee retrievedCoffee = coffeeService.getCoffeeById(999);

        // Assert
        assertNull(retrievedCoffee);
        verify(coffeeRepo, times(1)).findById(999);
    }

    @ParameterizedTest
    @ValueSource(ints = {1, 5, 10, 100})
    @DisplayName("Should handle various coffee ids")
    void testGetCoffeeByVariousIds(int id) {
        // Arrange
        Coffee coffee = new Coffee();
        coffee.setId(id);
        when(coffeeRepo.findById(id)).thenReturn(Optional.of(coffee));

        // Act
        Coffee retrievedCoffee = coffeeService.getCoffeeById(id);

        // Assert
        assertNotNull(retrievedCoffee);
        assertEquals(id, retrievedCoffee.getId());
    }

    @Test
    @DisplayName("Should update coffee successfully")
    void testUpdateCoffeeSuccessfully() {
        // Arrange
        Coffee updatedCoffee = new Coffee();
        updatedCoffee.setId(1);
        updatedCoffee.setName("Espresso Primo");
        updatedCoffee.setPrice(4.00);
        String newImageName = "espresso_primo.jpg";

        when(coffeeRepo.save(any(Coffee.class))).thenReturn(updatedCoffee);

        // Act
        Coffee result = coffeeService.updateCoffee(updatedCoffee, newImageName);

        // Assert
        assertNotNull(result);
        assertEquals(newImageName, result.getImageFileName());
        verify(coffeeRepo, times(1)).save(any(Coffee.class));
    }

    @Test
    @DisplayName("Should delete coffee successfully")
    void testDeleteCoffeeSuccessfully() {
        // Arrange
        String realPath = "/path/to/images";
        String imageFileName = "espresso.jpg";
        int coffeeId = 1;

        doNothing().when(coffeeRepo).deleteById(anyInt());

        // Act
        Void result = coffeeService.deleteCoffee(realPath, coffeeId, imageFileName);

        // Assert
        assertNull(result);
        verify(coffeeRepo, times(1)).deleteById(coffeeId);
    }

    @Test
    @DisplayName("Should handle delete when image file does not exist")
    void testDeleteCoffeeWithoutImageFile() {
        // Arrange
        String realPath = "/non/existent/path";
        String imageFileName = "non_existent.jpg";
        int coffeeId = 1;

        doNothing().when(coffeeRepo).deleteById(anyInt());

        // Act
        Void result = coffeeService.deleteCoffee(realPath, coffeeId, imageFileName);

        // Assert
        assertNull(result);
        verify(coffeeRepo, times(1)).deleteById(coffeeId);
    }

    @Test
    @DisplayName("Should handle exception during delete gracefully")
    void testDeleteCoffeeWithException() {
        // Arrange
        String realPath = "/path";
        String imageFileName = "image.jpg";
        int coffeeId = 1;

        doThrow(new RuntimeException("Database error")).when(coffeeRepo).deleteById(anyInt());

        // Act & Assert - Should not throw exception
        assertDoesNotThrow(() -> {
            coffeeService.deleteCoffee(realPath, coffeeId, imageFileName);
        });
    }

    @Test
    @DisplayName("Should save multiple coffees in sequence")
    void testSaveMultipleCoffees() {
        // Arrange
        Coffee coffee1 = new Coffee(1, "Espresso", 3.50, "Strong", null, "espresso.jpg");
        Coffee coffee2 = new Coffee(2, "Cappuccino", 4.50, "Creamy", null, "cappuccino.jpg");

        when(coffeeRepo.save(coffee1)).thenReturn(coffee1);
        when(coffeeRepo.save(coffee2)).thenReturn(coffee2);

        // Act
        Coffee saved1 = coffeeService.saveCoffee(coffee1);
        Coffee saved2 = coffeeService.saveCoffee(coffee2);

        // Assert
        assertNotNull(saved1);
        assertNotNull(saved2);
        assertEquals("Espresso", saved1.getName());
        assertEquals("Cappuccino", saved2.getName());
        verify(coffeeRepo, times(2)).save(any(Coffee.class));
    }

    @Test
    @DisplayName("Should verify repository interaction for save operation")
    void testSaveCoffeeVerifyInteraction() {
        // Arrange
        when(coffeeRepo.save(testCoffee)).thenReturn(testCoffee);

        // Act
        coffeeService.saveCoffee(testCoffee);

        // Assert
        verify(coffeeRepo, times(1)).save(testCoffee);
        verifyNoMoreInteractions(coffeeRepo);
    }

    @Test
    @DisplayName("Should handle null coffee in save operation")
    void testSaveNullCoffee() {
        // Arrange
        when(coffeeRepo.save(null)).thenReturn(null);

        // Act
        Coffee result = coffeeService.saveCoffee(null);

        // Assert
        assertNull(result);
        verify(coffeeRepo, times(1)).save(null);
    }

    @Test
    @DisplayName("Should preserve coffee data after update")
    void testUpdateCoffeeDataIntegrity() {
        // Arrange
        Coffee coffeeToUpdate = new Coffee();
        coffeeToUpdate.setId(5);
        coffeeToUpdate.setName("Mocha");
        coffeeToUpdate.setPrice(5.00);
        coffeeToUpdate.setDescription("Chocolate coffee");

        when(coffeeRepo.save(any(Coffee.class))).thenReturn(coffeeToUpdate);

        // Act
        Coffee result = coffeeService.updateCoffee(coffeeToUpdate, "mocha.jpg");

        // Assert
        assertEquals("Mocha", result.getName());
        assertEquals(5.00, result.getPrice());
        assertEquals("mocha.jpg", result.getImageFileName());
    }
}