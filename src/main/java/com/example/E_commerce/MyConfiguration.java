package com.example.E_commerce;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyConfiguration {

    @GetMapping(path = {"/index", "home"})
    public String home(){
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
    public String product(){
        return "product";
    }

    @GetMapping("/products")
    public String products() {
        return "products";
    }
}
