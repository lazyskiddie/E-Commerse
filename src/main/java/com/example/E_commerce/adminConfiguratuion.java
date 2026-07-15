package com.example.E_commerce;

import com.example.E_commerce.Admin.Service.CoffeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

            // 1. Define your target folder
            File saveDir = new File("src/main/resources/static/images/Services");

            // 2. Generate the unique filename
            String originalFileName = UUID.randomUUID().toString() + "_" + image.getOriginalFilename();

            // 3. FIX: Combine the ABSOLUTE path of the folder with the filename
            File file = new File(saveDir.getAbsolutePath(), originalFileName);

            // 4. Try to save the file
            image.transferTo(file);

            coffeeService.saveCoffee(coffee, originalFileName);
            redirectAttributes.addFlashAttribute("message", "Coffee saved successfully");

        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Failed to upload image: " + e.getMessage());
        }

        return "redirect:/admin/addService";
    }
}
