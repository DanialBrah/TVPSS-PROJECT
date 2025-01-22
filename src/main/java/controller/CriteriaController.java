package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;

// Utility imports
import java.util.Map;
import java.util.HashMap;
import java.util.List;
import java.util.Arrays;

// Servlet imports
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

// Entity imports
import entity.Criteria;
import entity.Equipment;
import entity.School;
import entity.Login;

// Service imports
import service.CriteriaDao_usingHibernate;
import service.SchoolDao_usingHibernate;
import service.UserDao_usingHibernate;
import service.TeacherDao_usingHibernate;

// Exception handling imports
import java.io.IOException;

@Controller
@RequestMapping("/criteria")
public class CriteriaController {

	@Autowired
	private CriteriaDao_usingHibernate criteriaDao;

	@Autowired
	private SchoolDao_usingHibernate schoolDao;

	@Autowired
	private UserDao_usingHibernate userDao;

	@Autowired
	private TeacherDao_usingHibernate teacherDao;

	@GetMapping("/edit/{id}")
	public String editCriteria(@PathVariable("id") int criteriaId, HttpSession session, Model model) {
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
			// Fetch the criteria by its ID
			Criteria criteria = criteriaDao.findById(criteriaId);
			if (criteria != null && criteria.getSchool().getId() == user.getSchoolId()) {
				model.addAttribute("criteria", criteria);
				return "teacher-criteria-list"; // Redirect to the edit form
			} else {
				return "redirect:/criteria/teacher" + user.getSchoolId(); // Redirect if criteria doesn't exist or
																			// access is unauthorized
			}
		}
		return "redirect:/login/validate";
	}

	@GetMapping("/teacher2")
	public String listCriteriaForTeacher2(HttpSession session, Model model) {
		// Retrieve the logged-in user's details from the session
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
			// Fetch criteria for the teacher's assigned school
			List<Criteria> criteriaList = criteriaDao.findApprovedCriteriaBySchoolId(user.getSchoolId());

			// Add the filtered criteria to the model
			model.addAttribute("criteriaList", criteriaList);
			return "teacher-criteria"; // JSP page for teacher criteria list
		} else {
			return "redirect:/login/validate";
		}
	}

	@PostMapping("/save")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> saveCriteria(@RequestParam Map<String, String> params,
			HttpSession session) {
		Map<String, Object> response = new HashMap<>();
		try {
			System.out.println("Received parameters: " + params);

			Login user = (Login) session.getAttribute("loggedInUser");
			if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
				int criteriaId = Integer.parseInt(params.get("criteriaId"));
				Criteria existingCriteria = criteriaDao.findById(criteriaId);

				if (existingCriteria != null && existingCriteria.getSchool().getId() == user.getSchoolId()) {
					// Update criteria fields
					existingCriteria.setHasName(Boolean.parseBoolean(params.get("hasName")));
					existingCriteria.setHasLogo(Boolean.parseBoolean(params.get("hasLogo")));
					existingCriteria.setHasStudio(Boolean.parseBoolean(params.get("hasStudio")));
					existingCriteria.setHasInSchoolRecording(Boolean.parseBoolean(params.get("hasInSchoolRecording")));
					existingCriteria.setHasYoutubeUpload(Boolean.parseBoolean(params.get("hasYoutubeUpload")));
					existingCriteria.setHasOutsideRecording(Boolean.parseBoolean(params.get("hasOutsideRecording")));
					existingCriteria
							.setHasExternalCollaboration(Boolean.parseBoolean(params.get("hasExternalCollaboration")));
					existingCriteria.setHasGreenScreen(Boolean.parseBoolean(params.get("hasGreenScreen")));

					// Update version
					int version = Integer.parseInt(params.get("version"));
					existingCriteria.setVersion(version);

					System.out.println("Updated criteria: " + existingCriteria);
					criteriaDao.save(existingCriteria);

					response.put("success", true);
					response.put("message", "Criteria and version saved successfully!");
					return ResponseEntity.ok(response);
				} else {
					response.put("success", false);
					response.put("message", "Invalid criteria or unauthorized access");
					return ResponseEntity.badRequest().body(response);
				}
			} else {
				response.put("success", false);
				response.put("message", "User not authorized");
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
			}
		} catch (Exception e) {
			System.err.println("Error saving criteria: " + e.getMessage());
			e.printStackTrace();
			response.put("success", false);
			response.put("message", "Error saving criteria: " + e.getMessage());
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
		}
	}

	@GetMapping("/admin")
	public String listAllCriteria(Model model) {

		model.addAttribute("criteriaList", criteriaDao.findAllWithSchools());
		return "admin-criteria-list";

	}

	@PostMapping("/approve/{id}")
	public String approveCriteria(@PathVariable int id, RedirectAttributes redirectAttributes, HttpSession session) {
		try {
			// Check if user is logged in and has appropriate role
			Login user = (Login) session.getAttribute("loggedInUser");
			if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
				redirectAttributes.addFlashAttribute("error", "Unauthorized access");
				return "redirect:/criteria/admin";
			}

			Criteria criteria = criteriaDao.findById(id);
			if (criteria != null) {
				criteriaDao.approveCriteria(id);
				redirectAttributes.addFlashAttribute("success", "Criteria approved successfully");
			} else {
				redirectAttributes.addFlashAttribute("error", "Criteria not found");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "Error approving equipment: " + e.getMessage());
		}
		return "redirect:/criteria/admin";
	}

	@PostMapping("/disapprove/{id}")
	public String disapproveCriteria(@PathVariable int id, RedirectAttributes redirectAttributes, HttpSession session) {
		try {
			// Check if user is logged in and has appropriate role
			Login user = (Login) session.getAttribute("loggedInUser");
			if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
				redirectAttributes.addFlashAttribute("error", "Unauthorized access");
				return "redirect:/criteria/admin";
			}

			Criteria criteria = criteriaDao.findById(id);
			if (criteria != null) {
				criteriaDao.disapproveCriteria(id);
				redirectAttributes.addFlashAttribute("success", "Criteria disapproved successfully");
			} else {
				redirectAttributes.addFlashAttribute("error", "Criteria not found");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "Error disapproving equipment: " + e.getMessage());
		}
		return "redirect:/criteria/admin";
	}
}
