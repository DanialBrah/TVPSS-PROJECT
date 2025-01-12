package com.example.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.springboot.entity.User;
import com.example.springboot.service.UserService;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // Corresponds to login.jsp
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password, Model model) {
        User user = userService.validateUser(username, password);
        if (user != null) {
            model.addAttribute("username", username);
            return "welcome"; // Corresponds to welcome.jsp
        } else {
            model.addAttribute("error", "Invalid username or password!");
            return "error"; // Corresponds to error.jsp
        }
    }
}
