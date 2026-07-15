package com.example.E_commerce;

import org.springframework.ui.Model;
import com.example.E_commerce.Admin.Service.CoffeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyConfiguration {

    @Autowired
    private CoffeeService coffeeService;

    @GetMapping(path = {"/index", "home"})
    public String home(Model model) {
        model.addAttribute("listOfService", coffeeService.readService());
        return "index";
    }

    @GetMapping("/cart")
    public String cart(){
        return "cart";
    }

    @GetMapping("/checkout")
    public String checkout(){
        return "checkout";
    }

    @GetMapping("/product")
    public String product(Model model){
        model.addAttribute("listOfService", coffeeService.readService());
        return "product";
    }

    @GetMapping("/products")
    public String products(Model model) {
        model.addAttribute("listOfService", coffeeService.readService());
        return "products";
    }
}
