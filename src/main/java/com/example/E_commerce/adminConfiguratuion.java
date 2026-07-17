package com.example.E_commerce;

import com.example.E_commerce.Admin.Service.CoffeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.UUID;

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
        return "redirect:/admin/addService";
    }

    @GetMapping("/addService")
    public String addService(){
        return "admin/addService";
    }

    @PostMapping("/addService")
    public String addService(@ModelAttribute Coffee coffee, RedirectAttributes redirectAttributes){
        try {
            MultipartFile image = coffee.getImage();
            File saveDir = new File("src/main/resources/static/images/Services");
            String originalFileName = UUID.randomUUID().toString() + "_" + image.getOriginalFilename();

            File file = new File(saveDir.getAbsolutePath(), originalFileName);
            image.transferTo(file);

            coffeeService.saveCoffee(coffee, originalFileName);
            redirectAttributes.addFlashAttribute("message", "Coffee saved successfully");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Failed to upload image: " + e.getMessage());
        }
        return "redirect:/admin/addService";
    }

    @GetMapping("/readService")
    public String readService(Model model){
        model.addAttribute("listOfServices", coffeeService.readService());
        return "admin/readService";
    }
}
