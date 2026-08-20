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

    @GetMapping(path = {"/index", "home", "/"})
    public String home(Model model) {
        model.addAttribute("listOfService", coffeeService.readService());
        return "index";
    }

    // cart value for the checkout procesess
    @GetMapping("/cart")
    public String cart(){
        return "cart";
    }

    // there will the user will enter their details for placing the orders
    @GetMapping("/checkout")
    public String checkout(){
        return "checkout";
    }

    // to list the products form the admin pannels
    @GetMapping("/product")
    public String product(Model model){
        model.addAttribute("listOfService", coffeeService.readService());
        return "product";
    }

    // to show the products on the home page for the multiples user to select and add to the cart for further options
    @GetMapping("/products")
    public String products(Model model) {
        model.addAttribute("listOfService", coffeeService.readService());
        return "products";
    }

    // for when anyone try to login to the admin portal
    @GetMapping("/unauthorized")
    public String unauthorized(){
        return "unauthorized";
    }

    // for the login to the admin
    @GetMapping("/login")
    public String login(){
        return "login";
    }
}
