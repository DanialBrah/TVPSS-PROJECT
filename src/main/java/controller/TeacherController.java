package controller;

import entity.Teacher;
import entity.Video;
import entity.Activity;
import entity.Equipment;
import entity.Login;
import entity.News;
import entity.School;
import service.TeacherDao_usingHibernate;
import service.ActivityDao_usingHibernate;
import service.EquipmentDao_usingHibernate;
import service.NewsDao_usingHibernate;
import service.SchoolDao_usingHibernate;
import service.VideoDao_usingHibernate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import java.util.List;

@Controller
@RequestMapping("/teachers")
public class TeacherController {

	@Autowired
	private TeacherDao_usingHibernate teacherDao;

	@Autowired
	private SchoolDao_usingHibernate schoolDao;
	@Autowired
	private ActivityDao_usingHibernate activityDao;

	@Autowired
	private EquipmentDao_usingHibernate equipmentDao;

	@Autowired
	private NewsDao_usingHibernate newsDao;

	@Autowired
	private VideoDao_usingHibernate videoDao;

	@GetMapping("")
	public String listTeachers(Model model) {
		model.addAttribute("teachers", teacherDao.findAll());
		return "admin-teacher-list";
	}

	@GetMapping("/dashboard")
	public String showDashboard(HttpSession session, Model model) {
		// Check if the user is logged in and is a teacher
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
			// Add a welcome message
			model.addAttribute("message", "Welcome to Teacher Dashboard");
			return "teacher-dashboard"; // Maps to /WEB-INF/views/teacher-dashboard.jsp
		} else {
			// Redirect to login page if not logged in or not a teacher
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

		model.addAttribute("teacher", new Teacher());
		model.addAttribute("schools", schools);
		return "admin-teacher-form";
	}

	@PostMapping("/add")
	public String addTeacher(@ModelAttribute Teacher teacher) {
		teacherDao.save(teacher);
		return "redirect:/teachers";
	}

	@GetMapping("/edit/{staffId}")
	public String showEditForm(@PathVariable String staffId, Model model) {
		Teacher teacher = teacherDao.findByStaffId(staffId);
		List<School> schools = schoolDao.findAll();

		if (teacher == null) {
			return "redirect:/teachers"; // Redirect if teacher is not found
		}

		if (schools.isEmpty()) {
			model.addAttribute("error", "No schools available. Please add schools first.");
			return "error-page"; // Redirect to an error page if schools are not available
		}

		model.addAttribute("teacher", teacher);
		model.addAttribute("schools", schools);
		return "admin-teacher-edit";
	}

	@PostMapping("/edit/{staffId}")
	public String updateTeacher(@PathVariable String staffId, @ModelAttribute Teacher teacher) {
		teacherDao.save(teacher); // Save updates
		return "redirect:/teachers";
	}

	@GetMapping("/edit2/{staffId}")
	public String showEditForm2(@PathVariable String staffId, Model model) {
		Teacher teacher = teacherDao.findByStaffId(staffId);
		List<School> schools = schoolDao.findAll();

		if (teacher == null) {
			return "redirect:/teachers"; // Redirect if teacher is not found
		}

		if (schools.isEmpty()) {
			model.addAttribute("error", "No schools available. Please add schools first.");
			return "error-page"; // Redirect to an error page if schools are not available
		}

		model.addAttribute("teacher", teacher);
		model.addAttribute("schools", schools);
		return "teacher-teacher-edit";
	}

	@PostMapping("/edit2/{staffId}")
	public String updateProfile(@PathVariable String staffId, @ModelAttribute Teacher updatedTeacher, Model model) {
		// Fetch the teacher using staffId
		Teacher existingTeacher = teacherDao.findByStaffId(staffId);

		if (existingTeacher != null) {
			// Update the existing teacher's details with the new values
			existingTeacher.setName(updatedTeacher.getName());
			existingTeacher.setEmail(updatedTeacher.getEmail());
			existingTeacher.setPhoneNumber(updatedTeacher.getPhoneNumber());
			existingTeacher.setTeachingExperience(updatedTeacher.getTeachingExperience());

			// Save the updated teacher
			teacherDao.save(existingTeacher);

			// Redirect to the profile page with a success message
			model.addAttribute("success", "Profile updated successfully");
			return "redirect:/teachers/profile";
		} else {
			// If no teacher found, return an error page
			model.addAttribute("error", "Teacher not found");
			return "error";
		}
	}

	@GetMapping("/delete/{staffId}")
	public String deleteTeacher(@PathVariable String staffId) {
		teacherDao.delete(staffId);
		return "redirect:/teachers";
	}

	// Version mapping
	@GetMapping("/version")
	public String showVersion(HttpSession session, Model model) {
		return validateSessionAndRespond(session, model, "teacher-version", "Version Information");
	}

	@GetMapping("/equipment")
	public String showEquipment(HttpSession session, Model model) {
		// Validate the session
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
			// Fetch equipment for the teacher's school
			List<Equipment> equipmentList = equipmentDao.findBySchoolId(user.getSchoolId());

			if (equipmentList != null && !equipmentList.isEmpty()) {
				// Add equipment list to the model
				model.addAttribute("equipment", equipmentList);
			} else {
				// Handle case when no equipment is found
				model.addAttribute("message", "No equipment information available for your school.");
			}

			model.addAttribute("username", user.getUsername());
			return "teacher-equipment-list"; // Ensure this JSP exists and works correctly
		} else {
			// Redirect to login if session is invalid
			return "redirect:/login/validate";
		}
	}

	@GetMapping("/activity")
	public String showActivity(HttpSession session, Model model) {
		// Validate the session
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
			// Fetch only approved activities for the teacher's school
			List<Activity> activities = activityDao.findApprovedActivitiesBySchoolId(user.getSchoolId());

			if (activities != null && !activities.isEmpty()) {
				// Add approved activities to the model
				model.addAttribute("activities", activities);
			} else {
				// Handle case when no approved activities are found
				model.addAttribute("message", "No approved activities available for your school.");
			}

			model.addAttribute("username", user.getUsername());
			return "teacher-activity-list"; // Ensure this JSP exists and works correctly
		} else {
			// Redirect to login if session is invalid
			return "redirect:/login/validate";
		}
	}

	// Display the list of news
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
		return "news-page";
	}

	// Video mapping
	@GetMapping("/video")
	public String showVideo(HttpSession session, Model model) {
		// Validate the session
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
			// Fetch only approved activities for the teacher's school
			List<Video> video = videoDao.findApprovedVideosBySchoolId(user.getSchoolId());

			if (video != null && !video.isEmpty()) {
				// Add approved activities to the model
				model.addAttribute("video", video);
			} else {
				// Handle case when no approved activities are found
				model.addAttribute("message", "No approved videos available for your school.");
			}

			model.addAttribute("username", user.getUsername());
			return "teacher-video-list"; // Ensure this JSP exists and works correctly
		} else {
			// Redirect to login if session is invalid
			return "redirect:/login/validate";
		}
	}

	// Channel mapping
	@GetMapping("/channel")
	public String showChannel(HttpSession session, Model model) {
		return validateSessionAndRespond(session, model, "teacher-channel", "Channel Information");
	}

	@GetMapping("/profile")
	public String showProfile(HttpSession session, Model model) {
		// Get logged-in user from session
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
			// Fetch teacher details using staffId
			Teacher teacher = teacherDao.findByStaffId(user.getStaffId());

			if (teacher != null) {
				model.addAttribute("teacher", teacher); // Add teacher to the model
				return "teacher-teacher-profile"; // Maps to teacher-profile.jsp
			} else {
				model.addAttribute("error", "Teacher not found");
				return "error";
			}
		} else {
			return "redirect:/login/validate"; // Redirect to login if not authenticated
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

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
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
