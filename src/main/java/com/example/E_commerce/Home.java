package com.example.E_commerce;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Home {

    @GetMapping(path = {"index","home"})
    public String home(){
        return "index";
    }
}
