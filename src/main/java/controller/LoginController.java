package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.LoginDao_usingHibernate;
import entity.Login;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private LoginDao_usingHibernate loginDao;

    @GetMapping("/validate")
    public String handleGetRequests() {
        return "redirect:/index.jsp"; // Redirects to index.jsp
    }

    @PostMapping("/validate")
    public String validateLogin(@RequestParam("username") String username,
                                @RequestParam("password") String password,
                                Model model,
                                HttpSession session) { // Inject HttpSession
        Login login = loginDao.validateLogin(username, password);

        if (login != null) {
            // Store user details in the session
            session.setAttribute("loggedInUser", login);
            session.setAttribute("userRole", login.getRole());

            switch (login.getRole().toLowerCase()) {
                case "admin":
                    return "redirect:/admin/dashboard";
                case "teacher":
                    return "redirect:/teachers/dashboard";
                case "student":
                    return "redirect:/student/dashboard";
                case "crew":
                    return "redirect:/crew/dashboard";
                default:
                    model.addAttribute("error", "Invalid role");
                    return "login";
            }
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate session
        return "redirect:/index.jsp";
    }
}
