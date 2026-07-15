package com.example.E_commerce;

import com.example.E_commerce.Admin.Service.CoffeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/admin")
public class adminConfiguratuion {

    @Autowired
    private CoffeeService coffeeService;

    @GetMapping("/adminhome")
    public String admin() {
        return "admin/adminhome";
    }

    @PostMapping("/saveCoffee")
    public String saveCoffee(@ModelAttribute Coffee coffee, RedirectAttributes redirectAttributes){
        coffeeService.saveCoffee(coffee);
        redirectAttributes.addFlashAttribute("message", "Coffee saved successfully");
        return "redirect:/adminhome";
    }

}
