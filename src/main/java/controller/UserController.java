// UserController.java
package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.UserDao_usingHibernate;
import entity.User;

@Controller
@RequestMapping("/users")
public class UserController {
    
    @Autowired
    private UserDao_usingHibernate userDao;
    
    @GetMapping("")
    public String listUsers(Model model) {
        model.addAttribute("users", userDao.findAll());
        return "user-list";
    }
    
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("user", new User());
        return "user-form";
    }
    
    @PostMapping("/add")
    public String addUser(@ModelAttribute User user) {
        userDao.save(user);
        return "redirect:/users";
    }
    
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        User user = userDao.findById(id);
        model.addAttribute("user", user);
        return "user-form";
    }
    
    @PostMapping("/edit/{id}")
    public String updateUser(@PathVariable int id, @ModelAttribute User user) {
        userDao.update(id, user);
        return "redirect:/users";
    }
    
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable int id) {
        userDao.delete(id);
        return "redirect:/users";
    }
    
    @PostMapping("/{id}/updateLastLogin")
    public String updateLastLogin(@PathVariable int id) {
        userDao.updateLastLogin(id);
        return "redirect:/users";
    }
}