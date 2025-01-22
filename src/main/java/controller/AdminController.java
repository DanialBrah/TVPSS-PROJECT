package controller;

import entity.Login;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        // Check if the user is logged in
        Login user = (Login) session.getAttribute("loggedInUser");

        if (user != null && "admin".equalsIgnoreCase(user.getRole())) {
            // Add a welcome message
            model.addAttribute("message", "Welcome to Admin Dashboard");
            return "admin-dashboard"; // Maps to /WEB-INF/views/admin-dashboard.jsp
        } else {
            // Redirect to login page if not logged in or not an admin
            return "redirect:/login/validate";
        }
    }
}
