package controller;

import service.ActivityDao_usingHibernate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentController {

    private final ActivityDao_usingHibernate activityDao;

    // Constructor for dependency injection
    public StudentController(ActivityDao_usingHibernate activityDao) {
        this.activityDao = activityDao;
    }

    @GetMapping("/dashboard")
    public String showDashboard(Model model) {
        // Fetch all activities
        model.addAttribute("activities", activityDao.findAll());

        // Add a welcome message
        model.addAttribute("message", "Welcome to Student Dashboard");
        
        return "student-dashboard"; // Maps to /WEB-INF/views/student-dashboard.jsp
    }
}
