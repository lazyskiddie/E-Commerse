package com.example.E_commerce.Admin.Service;

import com.example.E_commerce.Coffee;
import com.example.E_commerce.Admin.Repo.CoffeeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoffeeServiceImpl implements CoffeeService {

    @Autowired
    private CoffeeRepo coffeeRepo;

    @Override
    public Coffee saveCoffee(Coffee coffee) {
        return coffeeRepo.save(coffee);
    }

    @Override
    public Coffee saveCoffee(Coffee coffee, String originalName) {
        coffee.setImageFileName(originalName);
        return coffeeRepo.save(coffee);
    }

    @Override
    public List<Coffee> readService() {
        return coffeeRepo.findAll();
    }

    @Override
    public Void deleteCoffee(String realPath, int id, String imageFileName) {
        try {
            java.io.File imageFile = new java.io.File(realPath, imageFileName);
            if (imageFile.exists()) {
                imageFile.delete();
            }
            coffeeRepo.deleteById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Coffee getCoffeeById(int id) {
        return coffeeRepo.findById(id).orElse(null);
    }

    @Override
    public Coffee updateCoffee(Coffee coffee, String imageFileName) {
        coffee.setImageFileName(imageFileName);
        return coffeeRepo.save(coffee);
    }
}