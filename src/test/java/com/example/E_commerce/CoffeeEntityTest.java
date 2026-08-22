package com.example.E_commerce;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Unit tests for Coffee Entity
 * Tests constructor, getters, setters, and data validation
 */
@DisplayName("Coffee Entity Tests")
class CoffeeEntityTest {

    private Coffee coffee;

    @BeforeEach
    void setUp() {
        coffee = new Coffee();
    }

    @Test
    @DisplayName("Should create Coffee entity with all arguments constructor")
    void testCoffeeAllArgsConstructor() {
        // Arrange
        int expectedId = 1;
        String expectedName = "Espresso";
        double expectedPrice = 3.50;
        String expectedDescription = "Strong and bold coffee";
        String expectedImageFileName = "espresso.jpg";

        // Act
        Coffee newCoffee = new Coffee(expectedId, expectedName, expectedPrice, 
                                      expectedDescription, null, expectedImageFileName);

        // Assert
        assertEquals(expectedId, newCoffee.getId());
        assertEquals(expectedName, newCoffee.getName());
        assertEquals(expectedPrice, newCoffee.getPrice());
        assertEquals(expectedDescription, newCoffee.getDescription());
        assertEquals(expectedImageFileName, newCoffee.getImageFileName());
    }

    @Test
    @DisplayName("Should create Coffee entity with no-args constructor")
    void testCoffeeNoArgsConstructor() {
        // Act & Assert
        assertNotNull(coffee);
        assertEquals(0, coffee.getId());
        assertNull(coffee.getName());
        assertEquals(0.0, coffee.getPrice());
        assertNull(coffee.getDescription());
        assertNull(coffee.getImageFileName());
    }

    @Test
    @DisplayName("Should set and get Coffee id")
    void testCoffeeIdSetterGetter() {
        // Arrange
        int expectedId = 5;

        // Act
        coffee.setId(expectedId);

        // Assert
        assertEquals(expectedId, coffee.getId());
    }

    @Test
    @DisplayName("Should set and get Coffee name")
    void testCoffeeNameSetterGetter() {
        // Arrange
        String expectedName = "Cappuccino";

        // Act
        coffee.setName(expectedName);

        // Assert
        assertEquals(expectedName, coffee.getName());
    }

    @Test
    @DisplayName("Should set and get Coffee price")
    void testCoffeePriceSetterGetter() {
        // Arrange
        double expectedPrice = 4.75;

        // Act
        coffee.setPrice(expectedPrice);

        // Assert
        assertEquals(expectedPrice, coffee.getPrice());
    }

    @Test
    @DisplayName("Should set and get Coffee description")
    void testCoffeeDescriptionSetterGetter() {
        // Arrange
        String expectedDescription = "Smooth and creamy";

        // Act
        coffee.setDescription(expectedDescription);

        // Assert
        assertEquals(expectedDescription, coffee.getDescription());
    }

    @Test
    @DisplayName("Should set and get Coffee image file name")
    void testCoffeeImageFileNameSetterGetter() {
        // Arrange
        String expectedFileName = "cappuccino.jpg";

        // Act
        coffee.setImageFileName(expectedFileName);

        // Assert
        assertEquals(expectedFileName, coffee.getImageFileName());
    }

    @ParameterizedTest
    @ValueSource(doubles = {1.0, 2.5, 5.99, 10.0})
    @DisplayName("Should accept various valid prices")
    void testCoffeeWithVariousPrices(double price) {
        // Act
        coffee.setPrice(price);

        // Assert
        assertEquals(price, coffee.getPrice());
    }

    @Test
    @DisplayName("Should handle negative price")
    void testCoffeeWithNegativePrice() {
        // Arrange
        double negativePrice = -5.00;

        // Act
        coffee.setPrice(negativePrice);

        // Assert - Note: In production, validation should prevent this
        assertEquals(negativePrice, coffee.getPrice());
    }

    @Test
    @DisplayName("Should handle null name")
    void testCoffeeWithNullName() {
        // Act
        coffee.setName(null);

        // Assert
        assertNull(coffee.getName());
    }

    @Test
    @DisplayName("Should handle empty string name")
    void testCoffeeWithEmptyName() {
        // Arrange
        String emptyName = "";

        // Act
        coffee.setName(emptyName);

        // Assert
        assertEquals("", coffee.getName());
    }

    @Test
    @DisplayName("Should have different ids for different instances")
    void testMultipleCoffeeInstances() {
        // Arrange
        Coffee coffee1 = new Coffee();
        Coffee coffee2 = new Coffee();
        
        // Act
        coffee1.setId(1);
        coffee2.setId(2);

        // Assert
        assertNotEquals(coffee1.getId(), coffee2.getId());
    }

    @Test
    @DisplayName("Should maintain data integrity across multiple operations")
    void testCoffeeDataIntegrity() {
        // Arrange
        String name = "Latte";
        double price = 4.50;
        String description = "Espresso with steamed milk";
        String fileName = "latte.jpg";
        int id = 10;

        // Act
        coffee.setId(id);
        coffee.setName(name);
        coffee.setPrice(price);
        coffee.setDescription(description);
        coffee.setImageFileName(fileName);

        // Assert
        assertEquals(id, coffee.getId());
        assertEquals(name, coffee.getName());
        assertEquals(price, coffee.getPrice());
        assertEquals(description, coffee.getDescription());
        assertEquals(fileName, coffee.getImageFileName());
    }

    @Test
    @DisplayName("Should allow null image file name initially")
    void testCoffeeImageFileNameNull() {
        // Assert
        assertNull(coffee.getImageFileName());
    }

    @Test
    @DisplayName("Should update name multiple times")
    void testCoffeeNameUpdate() {
        // Act
        coffee.setName("Espresso");
        assertEquals("Espresso", coffee.getName());
        
        coffee.setName("Americano");
        assertEquals("Americano", coffee.getName());

        // Assert
        assertEquals("Americano", coffee.getName());
    }
}