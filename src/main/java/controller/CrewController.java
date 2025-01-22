package controller;

import entity.Login;
import entity.News;
import entity.School;
import entity.Video;
import entity.Activity;
import entity.Crew;
import service.ActivityDao_usingHibernate;
import service.CrewDao_usingHibernate;
import service.NewsDao_usingHibernate;
import service.VideoDao_usingHibernate;
import service.SchoolDao_usingHibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/crew")
public class CrewController {

	 @Autowired
	    private CrewDao_usingHibernate crewDao;
	 @Autowired
	    private SchoolDao_usingHibernate schoolDao;
	    @Autowired
	    private ActivityDao_usingHibernate activityDao;
	    
	    @Autowired
	    private VideoDao_usingHibernate videoDao;
	    
	    @Autowired
	    private NewsDao_usingHibernate newsDao;
	    
	  @GetMapping("")
	    public String listCrew(Model model) {
	        model.addAttribute("crew", crewDao.findAll());
	        return "admin-crew-list";
	    }

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        // Check if the user is logged in and is a crew member
        Login user = (Login) session.getAttribute("loggedInUser");

        if (user != null && "crew".equalsIgnoreCase(user.getRole())) {
            // Add a welcome message
            model.addAttribute("message", "Welcome to Crew Dashboard");
            return "crew-dashboard"; // Maps to /WEB-INF/views/crew-dashboard.jsp
        } else {
            // Redirect to login page if not logged in or not a crew member
            return "redirect:/login/validate";
        }
    }
    
    @GetMapping("/add")
    public String showAddForm(Model model) {
        List<School> schools = schoolDao.findAll();

        if (schools.isEmpty()) {
            model.addAttribute("error", "No schools available. Please add schools first.");
            return "error-page"; // Redirect to an error page if schools are not available
        }

        model.addAttribute("crew", new Crew());
        model.addAttribute("schools", schools);
        return "admin-crew-form";
    }

    @PostMapping("/add")
    public String addCrew(@ModelAttribute Crew crew) {
       crewDao.save(crew);
        return "redirect:/crew";
    }
    
    @GetMapping("/edit/{crewId}")
    public String showEditForm(@PathVariable String crewId, Model model) {
    	Crew crew = crewDao.findByCrewId(crewId);
        List<School> schools = schoolDao.findAll();

        if (crew == null) {
            return "redirect:/crew"; // Redirect if teacher is not found
        }

        if (schools.isEmpty()) {
            model.addAttribute("error", "No schools available. Please add schools first.");
            return "error-page"; // Redirect to an error page if schools are not available
        }

        model.addAttribute("crew", crew);
        model.addAttribute("schools", schools);
        return "admin-crew-edit";
    }

    @PostMapping("/edit/{crewId}")
    public String updateTeacher(@PathVariable String crewId, @ModelAttribute Crew crew) {
    	crewDao.save(crew); // Save updates
        return "redirect:/crew";
    }
    
    @GetMapping("/delete/{crewId}")
    public String deleteCrew(@PathVariable String crewId) {
        crewDao.delete(crewId);
        return "redirect:/crew";
    }
    
	@GetMapping("/news")
	public String listNews(Model model) {
		List<News> newsList = newsDao.findAll();
		newsList.forEach(news -> {
			String content = news.getContent();
			if (content.length() > 100) {
				news.setContent(content.substring(0, 100) + "...");
			} else {
				news.setContent(content);
			}
		});
		model.addAttribute("newsList", newsList);
		return "news-view";
	}
    
//mapping page
    
    @GetMapping("/videos")
    public String showVideo(HttpSession session, Model model) {
        // Validate the session
        Login user = (Login) session.getAttribute("loggedInUser");

        if (user != null && "crew".equalsIgnoreCase(user.getRole())) {
            // Fetch only approved activities for the teacher's school
            List<Video> video = videoDao.findApprovedVideosBySchoolId(user.getSchoolId());

            if (video != null && !video.isEmpty()) {
                // Add approved activities to the model
                model.addAttribute("video", video);
            } else {
                // Handle case when no approved activities are found
                model.addAttribute("message", "No approved activities available for your school.");
            }

            model.addAttribute("username", user.getUsername());
            return "crew-video-list"; // Ensure this JSP exists and works correctly
        } else {
            // Redirect to login if session is invalid
            return "redirect:/login/validate";
        }
    }

    // Logout mapping
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate the session
        return "redirect:/login/validate"; // Redirect to login page
    }

    // Utility method for session validation
    private String validateSessionAndRespond(HttpSession session, Model model, String viewName, String message) {
        // Retrieve the logged-in user from the session
        Login user = (Login) session.getAttribute("loggedInUser");

        if (user != null && "crew".equalsIgnoreCase(user.getRole())) {
            // Pass username and message to the model
            model.addAttribute("username", user.getUsername());
            model.addAttribute("message", message);
            return viewName; // Return the view name (e.g., teacher-dashboard)
        } else {
            // Redirect to login if session is invalid or role doesn't match
            return "redirect:/login/validate";
        }
    }
}