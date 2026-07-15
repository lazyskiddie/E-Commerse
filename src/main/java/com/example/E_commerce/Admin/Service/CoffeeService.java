package com.example.E_commerce.Admin.Service;

import com.example.E_commerce.Coffee;

import java.util.List;

public interface CoffeeService {

    Coffee saveCoffee(Coffee coffee);

    Coffee saveCoffee(Coffee coffee, String originalName);

    List<Coffee> readService();
}
