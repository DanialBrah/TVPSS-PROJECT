package controller;

import java.util.List;
import java.util.ArrayList;
import util.FileUploadUtil;
import java.io.File;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;

import service.EquipmentDao_usingHibernate;
import service.SchoolDao_usingHibernate;
import service.UserDao_usingHibernate;
import service.TeacherDao_usingHibernate;

import entity.Equipment;
import entity.School;
import entity.Teacher;
import entity.User;
import entity.Login;

@Controller
@RequestMapping("/equipment")
public class EquipmentController {

	@Autowired
	private EquipmentDao_usingHibernate equipmentDao;

	@Autowired
	private SchoolDao_usingHibernate schoolDao;

	@Autowired
	private UserDao_usingHibernate userDao;

	@Autowired
	private TeacherDao_usingHibernate teacherDao;

	private HttpSession request;

	// Your existing GetMapping methods remain the same
	@GetMapping("")
	public String listEquipment(Model model) {
		model.addAttribute("equipmentList", equipmentDao.findAll());
		return "admin-equipment-list";
	}

	@GetMapping("/teacher")
	public String listEquipmentForTeacher(HttpSession session, Model model) {
		// Retrieve the logged-in user's details from the session
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
			// Fetch equipment for the teacher's assigned school
			List<Equipment> equipmentList = equipmentDao.findApprovedEquipmentBySchoolId(user.getSchoolId());

			// Add the filtered equipment to the model
			model.addAttribute("equipmentList", equipmentList);
			return "teacher-equipment-list"; // JSP page for teacher equipment
		} else {
			return "redirect:/login/validate";
		}
	}

	@GetMapping("/add")
	public String showAddEquipmentForm(Model model) {
		// Get list of all schools for the dropdown
		List<School> schools = schoolDao.findAll();
		model.addAttribute("schools", schools);
		model.addAttribute("equipment", new Equipment());
		return "admin-equipment-form";
	}

	@PostMapping("/add")
	public String addEquipment(@RequestParam("equipmentName") String equipmentName,
			@RequestParam("quantity") int quantity, @RequestParam("lastMaintenanceDate") String lastMaintenanceDate,
			@RequestParam("school.id") int schoolId, @RequestParam("imageFile") MultipartFile imageFile,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {

		try {
			// Create new Equipment object
			Equipment equipment = new Equipment();
			equipment.setEquipmentName(equipmentName);
			equipment.setQuantity(quantity);

			// Convert string date to LocalDate
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = dateFormat.parse(lastMaintenanceDate);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			equipment.setLastMaintenanceDate(sqlDate.toLocalDate());

			// Set school
			School school = schoolDao.findById(schoolId);
			if (school == null) {
				redirectAttributes.addFlashAttribute("error", "Invalid school selected");
				return "redirect:/equipment/add";
			}
			equipment.setSchool(school);

			// Set status as approved since admin is adding it
			equipment.setStatus("Approved");

			// Handle image upload
			if (!imageFile.isEmpty()) {
				String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
				String uploadDir = request.getServletContext().getRealPath("/equipment-images/");

				File dir = new File(uploadDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				File file = new File(dir, fileName);
				imageFile.transferTo(file);

				equipment.setImageUrl("equipment-images/" + fileName);
			}

			// Save equipment
			equipmentDao.save(equipment);

			redirectAttributes.addFlashAttribute("successMessage", "Equipment added successfully!");
			return "redirect:/equipment";

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "Failed to add equipment: " + e.getMessage());
			return "redirect:/equipment/add";
		}
	}

	@GetMapping("/add2")
	public String showOrAddEquipment2(@RequestParam(required = false) String error, HttpSession session, Model model) {
		// Get the logged-in user's details from the session
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
			// Fetch the teacher's school using the staffId
			Teacher teacher = teacherDao.findByStaffId(user.getStaffId());
			if (teacher == null || teacher.getSchool() == null) {
				model.addAttribute("error", "Unable to retrieve your school details.");
				return "error-page";
			}

			// Create a new equipment object and set the teacher's school automatically
			Equipment equipment = new Equipment();
			equipment.setSchool(teacher.getSchool()); // Set the teacher's school

			model.addAttribute("equipment", equipment);
			model.addAttribute("username", user.getUsername());

			// Handle error messages
			if (error != null) {
				model.addAttribute("error", "Error occurred while saving the equipment. Please try again.");
			}

			return "teacher-equipment-form"; // Show the equipment form for the teacher
		} else {
			return "redirect:/login/validate"; // Redirect to login if session is invalid
		}
	}

	@PostMapping("/add2")
	public String addEquipmentWithImage2(@RequestParam("equipmentName") String equipmentName,
			@RequestParam("quantity") int quantity, @RequestParam("lastMaintenanceDate") String lastMaintenanceDate,
			@RequestParam("imageFile") MultipartFile imageFile, HttpSession session, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {

		try {
			// Create new Equipment object
			Equipment equipment = new Equipment();
			equipment.setEquipmentName(equipmentName);
			equipment.setQuantity(quantity);

			// Convert string date to LocalDate object
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = dateFormat.parse(lastMaintenanceDate);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			equipment.setLastMaintenanceDate(sqlDate.toLocalDate());

			// Get logged in user
			Login user = (Login) session.getAttribute("loggedInUser");
			if (user == null) {
				redirectAttributes.addFlashAttribute("error", "Session expired. Please login again.");
				return "redirect:/login/validate";
			}

			// Get teacher and school
			Teacher teacher = teacherDao.findByStaffId(user.getStaffId());
			if (teacher == null || teacher.getSchool() == null) {
				redirectAttributes.addFlashAttribute("error", "Unable to retrieve school information.");
				return "redirect:/equipment/add2";
			}

			// Set school and status
			equipment.setSchool(teacher.getSchool());
			equipment.setStatus("Pending");

			// Handle image upload
			if (!imageFile.isEmpty()) {
				String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
				String uploadDir = request.getServletContext().getRealPath("/equipment-images/");

				File dir = new File(uploadDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				File file = new File(dir, fileName);
				imageFile.transferTo(file);

				equipment.setImageUrl("equipment-images/" + fileName);
			}

			// Save equipment
			equipmentDao.save(equipment);

			redirectAttributes.addFlashAttribute("successMessage", "Equipment added successfully!");
			return "redirect:/equipment/teacher";

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "Failed to add equipment: " + e.getMessage());
			return "redirect:/equipment/add2";
		}
	}

	@GetMapping("/edit/{equipmentId}")
	public String showEditForm(@PathVariable int equipmentId, Model model) {
		Equipment equipment = equipmentDao.findById(equipmentId);
		List<School> schools = schoolDao.findAll();
		List<User> users = userDao.findAll();

		model.addAttribute("users", users);
		model.addAttribute("equipment", equipment);
		model.addAttribute("schools", schools);
		return "admin-equipment-edit";
	}

	@PostMapping("/edit/{equipmentId}")
	public String updateEquipment(@PathVariable int equipmentId, @ModelAttribute Equipment equipment) {

		equipmentDao.update(equipmentId, equipment);

		return "redirect:/equipment";
	}

	@GetMapping("/edit2/{equipmentId}")
	public String showEditForm2(@PathVariable int equipmentId, HttpSession session, Model model) {
		// Check user authentication
		Login user = (Login) session.getAttribute("loggedInUser");
		if (user == null || !"teacher".equalsIgnoreCase(user.getRole())) {
			return "redirect:/login/validate";
		}

		// Fetch the equipment
		Equipment equipment = equipmentDao.findById(equipmentId);
		if (equipment == null) {
			return "redirect:/equipment/teacher?error=equipment_not_found";
		}

		// Check if the equipment belongs to the teacher's school
		Teacher teacher = teacherDao.findByStaffId(user.getStaffId());
		if (teacher == null || teacher.getSchool() == null
				|| equipment.getSchool().getId() != teacher.getSchool().getId()) {
			return "redirect:/equipment/teacher?error=unauthorized";
		}

		model.addAttribute("equipment", equipment);
		return "teacher-equipment-edit"; // Make sure this JSP exists
	}

	@PostMapping("/edit2/{equipmentId}")
	public String updateEquipmentWithImage(@PathVariable int equipmentId,
			@RequestParam("equipmentName") String equipmentName, @RequestParam("quantity") int quantity,
			@RequestParam("lastMaintenanceDate") String lastMaintenanceDate,
			@RequestParam(value = "imageFile", required = false) MultipartFile imageFile, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttributes) {
		try {
			// Validate user
			Login user = (Login) session.getAttribute("loggedInUser");
			if (user == null || !"teacher".equalsIgnoreCase(user.getRole())) {
				return "redirect:/login/validate";
			}

			// Fetch existing equipment
			Equipment existingEquipment = equipmentDao.findById(equipmentId);
			if (existingEquipment == null) {
				redirectAttributes.addFlashAttribute("error", "Equipment not found");
				return "redirect:/equipment/teacher";
			}

			// Update equipment details
			existingEquipment.setEquipmentName(equipmentName);
			existingEquipment.setQuantity(quantity);

			// Handle date conversion
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate = dateFormat.parse(lastMaintenanceDate);
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			existingEquipment.setLastMaintenanceDate(sqlDate.toLocalDate());

			// Handle image upload if provided
			if (imageFile != null && !imageFile.isEmpty()) {
				String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
				String uploadDir = request.getServletContext().getRealPath("/equipment-images/");

				File dir = new File(uploadDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				File file = new File(dir, fileName);
				imageFile.transferTo(file);

				existingEquipment.setImageUrl("equipment-images/" + fileName);
			}

			// Save updates
			equipmentDao.update(equipmentId, existingEquipment);
			redirectAttributes.addFlashAttribute("success", "Equipment updated successfully");
			return "redirect:/equipment/teacher";

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "Failed to update equipment: " + e.getMessage());
			return "redirect:/equipment/edit2/" + equipmentId;
		}
	}

	// Your existing delete and listEquipmentBySchool methods remain the same
	@GetMapping("/delete/{id}")
	public String deleteEquipment(@PathVariable int id) {
		equipmentDao.delete(id);
		return "redirect:/equipment/teacher";
	}

	@GetMapping("/delete2/{equipmentId}")
	public String deleteEquipment2(@PathVariable int equipmentId) {
		equipmentDao.delete(equipmentId);
		return "redirect:/equipment/teacher";
	}

	@GetMapping("/school/{schoolId}")
	public String listEquipmentBySchool(@PathVariable int schoolId, Model model) {
		model.addAttribute("equipmentList", equipmentDao.findBySchoolId(schoolId));
		return "teacher-equipment-list";
	}

	@PostMapping("/approve/{id}")
	public String approveEquipment(@PathVariable int id, RedirectAttributes redirectAttributes, HttpSession session) {
		try {
			// Check if user is logged in and has appropriate role
			Login user = (Login) session.getAttribute("loggedInUser");
			if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
				redirectAttributes.addFlashAttribute("error", "Unauthorized access");
				return "redirect:/equipment";
			}

			Equipment equipment = equipmentDao.findById(id);
			if (equipment != null) {
				equipmentDao.approveEquipment(id);
				redirectAttributes.addFlashAttribute("success", "Equipment approved successfully");
			} else {
				redirectAttributes.addFlashAttribute("error", "Equipment not found");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "Error approving equipment: " + e.getMessage());
		}
		return "redirect:/equipment";
	}

	@PostMapping("/disapprove/{id}")
	public String disapproveEquipment(@PathVariable int id, RedirectAttributes redirectAttributes,
			HttpSession session) {
		try {
			// Check if user is logged in and has appropriate role
			Login user = (Login) session.getAttribute("loggedInUser");
			if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
				redirectAttributes.addFlashAttribute("error", "Unauthorized access");
				return "redirect:/login/validate";
			}

			Equipment equipment = equipmentDao.findById(id);
			if (equipment != null) {
				equipmentDao.disapproveEquipment(id);
				redirectAttributes.addFlashAttribute("success", "Equipment disapproved successfully");
			} else {
				redirectAttributes.addFlashAttribute("error", "Equipment not found");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "Error disapproving equipment: " + e.getMessage());
		}
		return "redirect:/equipment";
	}

	// Set equipment to pending
	@PostMapping("/pending/{equipmentId}")
	public String setPendingEquipment(@PathVariable int id) {
		equipmentDao.setPendingEquipment(id); // Call the DAO method to set pending
		return "redirect:/equipment"; // Redirect to the activities list
	}

//	@GetMapping("/status/{status}")
//	public String filterEquipmentByStatus(@PathVariable String status, Model model) {
//		List<Equipment> equipment = equipmentDao.findByStatus(status); // Fetch activities by status
//		model.addAttribute("equipment", equipment);
//		model.addAttribute("status", status); // Pass the status for display
//		return "activity-list"; // JSP page for displaying activities
//	}

	@GetMapping("/filter")
	public String filterEquipment(@RequestParam(required = false) Integer schoolId,
			@RequestParam(required = false) String status, Model model) {

		List<Equipment> filteredEquipment;

		if (schoolId != null && status != null && !status.isEmpty()) {
			// Filter by both school and status
			filteredEquipment = equipmentDao.findBySchoolAndStatus(schoolId, status);
		} else if (schoolId != null) {
			// Filter by school only
			filteredEquipment = equipmentDao.findBySchoolId(schoolId);
		} else if (status != null && !status.isEmpty()) {
			// Filter by status only
			filteredEquipment = equipmentDao.findByStatus(status);
		} else {
			// No filters, return all equipment
			filteredEquipment = equipmentDao.findAll();
		}

		// Get all schools for the dropdown
		List<School> schools = schoolDao.findAll();

		// Add all necessary attributes to the model
		model.addAttribute("equipmentList", filteredEquipment);
		model.addAttribute("schools", schools);
		model.addAttribute("selectedSchool", schoolId);
		model.addAttribute("selectedStatus", status);
		// model.addAttribute("statuses", z("Pending", "Approved", "Disapproved"));

		return "admin-equipment-list";
	}

}