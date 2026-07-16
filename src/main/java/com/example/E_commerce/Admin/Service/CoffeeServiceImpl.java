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
}
