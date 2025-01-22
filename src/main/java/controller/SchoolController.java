package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.SchoolDao_usingHibernate;
import entity.School;

@Controller
@RequestMapping("/schools")
public class SchoolController {

    @Autowired
    private SchoolDao_usingHibernate schoolDao;

    // List all schools
    @GetMapping("")
    public String listSchools(Model model) {
        model.addAttribute("schools", schoolDao.findAll());
        return "school-list";
    }

    // Show the form to add a new school
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("school", new School());
        return "school-add"; // Route to school-add.jsp
    }

    // Handle form submission to add a new school
    @PostMapping("/add")
    public String addSchool(@ModelAttribute School school) {
        schoolDao.save(school);
        return "redirect:/schools";
    }

    // Show the form to edit an existing school
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        School school = schoolDao.findById(id);
        if (school == null) {
            return "redirect:/schools";
        }
        model.addAttribute("school", school);
        return "school-form"; // Route to school-form.jsp
    }

    // Handle form submission to update an existing school
    @PostMapping("/edit/{id}")
    public String updateSchool(@PathVariable int id, @ModelAttribute School school) {
        schoolDao.update(id, school);
        return "redirect:/schools";
    }

    // Delete a school by its ID
    @GetMapping("/delete/{id}")
    public String deleteSchool(@PathVariable int id) {
        schoolDao.delete(id);
        return "redirect:/schools";
    }
}
