package com.example.E_commerce;

import com.example.E_commerce.Admin.Coffee;
import com.example.E_commerce.Admin.Service.CoffeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class Home {

    @Autowired
    private CoffeeService coffeeService;

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
    public String products(){
        return "products";
    }

    @RequestMapping("/Admin")
    @GetMapping("/admin")
    public String admin(){
        return "admin";
    }

    @PostMapping("/saveCoffee")
    public String saveCoffee(@ModelAttribute Coffee coffee, RedirectAttributes redirectAttributes){
        coffeeService.saveCoffee(coffee);
        redirectAttributes.addFlashAttribute("message", "Coffee saved successfully");
        return "redirect:/Admin/admin";
    }


}
