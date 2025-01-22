package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import service.ActivityDao_usingHibernate;
import service.SchoolDao_usingHibernate; // Assuming you have a School DAO
import service.TeacherDao_usingHibernate;
import service.UserDao_usingHibernate; // Assuming you have a User DAO
import util.FileUploadUtil;
import entity.Activity;
import entity.Login;
import entity.School;
import entity.Teacher;
import entity.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/activities")
public class ActivityController {

    @Autowired
    private ActivityDao_usingHibernate activityDao;

    @Autowired
    private SchoolDao_usingHibernate schoolDao;

    @Autowired
    private UserDao_usingHibernate userDao;
    
    @Autowired
    private TeacherDao_usingHibernate teacherDao;

	private HttpSession request;

    @GetMapping("")
    public String listActivities(Model model) {
        model.addAttribute("activities", activityDao.findAll());
        return "admin-activity-list";
    }
    
    @GetMapping("teacher")
    public String listActivitiesForTeacher(HttpSession session, Model model) {
        // Retrieve the logged-in teacher's details from the session
        Login user = (Login) session.getAttribute("loggedInUser");

        if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
            // Fetch only approved activities for the teacher's assigned school
            List<Activity> activities = activityDao.findApprovedActivitiesBySchoolId(user.getSchoolId());

            // Add the filtered activities to the model
            model.addAttribute("activities", activities);
            return "teacher-activity-list"; // Name of the JSP file for teacher activities
        } else {
            // Redirect to login if the session is invalid or the role is not "teacher"
            return "redirect:/login/validate";
        }
    }
    
    @GetMapping("crew")
    public String listActivitiesForCrew(HttpSession session, Model model) {
        // Retrieve the logged-in user's details from the session
        Login user = (Login) session.getAttribute("loggedInUser");

        if (user != null && "crew".equalsIgnoreCase(user.getRole())) {
            // Fetch activities for the user's assigned school
            List<Activity> activities = activityDao.findApprovedActivitiesBySchoolId(user.getSchoolId());

            // Add the filtered activities to the model
            model.addAttribute("activities", activities);
            return "crew-activity-list"; // Name of the JSP file for crew activities
        } else {
            // Redirect to login if the session is invalid or the role is not "crew"
            return "redirect:/login/validate";
        }
    }
    
    @GetMapping("guest")
    public String listApprovedActivitiesForGuest(Model model) {
        // Fetch only approved activities
        List<Activity> approvedActivities = activityDao.findApprovedActivities();

        // Add the approved activities to the model
        model.addAttribute("activities", approvedActivities);

        return "guest-activity-list"; // Name of the JSP file for guest activities
    }



    @GetMapping("/add")
    public String showAddForm(Model model) {
        List<School> schools = schoolDao.findAll();
        List<User> users = userDao.findAll();

        if (schools.isEmpty() || users.isEmpty()) {
            model.addAttribute("error", "Error loading schools or users. Please check the data.");
            return "error-page"; // Redirect to an error page if schools or users are not found
        }

        model.addAttribute("activity", new Activity());
        model.addAttribute("schools", schools);
        model.addAttribute("users", users);
        return "admin-activity-form";
    }

    @PostMapping("/add")
    public String addActivity(@ModelAttribute Activity activity) {
        activityDao.save(activity);
        return "redirect:/activities";
    }
    
    @GetMapping("/activities/filter")
    public String filterActivities(@RequestParam(required = false) Integer schoolId,
                                   @RequestParam(required = false) String date,
                                   Model model) {
        List<Activity> activities = activityDao.filterActivities(schoolId, date);
        List<School> schools = schoolDao.findAll();
        model.addAttribute("activities", activities);
        model.addAttribute("schools", schools);
        return "activity-list";
    }
    
    @GetMapping("/add2")
    public String showOrAddActivity(@RequestParam(required = false) String error,
                                     HttpSession session, Model model) {
        // Get the logged-in user's details from the session
        Login user = (Login) session.getAttribute("loggedInUser");

        if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
            // Fetch the teacher's school using the staffId
            Teacher teacher = teacherDao.findByStaffId(user.getStaffId());
            if (teacher == null || teacher.getSchool() == null) {
                model.addAttribute("error", "Unable to retrieve your school details.");
                return "error-page";
            }

            // Create a new activity and set the teacher's school automatically
            Activity activity = new Activity();
            activity.setSchool(teacher.getSchool()); // Set the teacher's school

            model.addAttribute("activity", activity);
            model.addAttribute("username", user.getUsername());

            // Handle error messages
            if (error != null) {
                model.addAttribute("error", "Error occurred while saving the activity. Please try again.");
            }

            return "teacher-activity-form"; // Show the activity form for the teacher
        } else {
            return "redirect:/login/validate"; // Redirect to login if session is invalid
        }
    }

    @PostMapping("/add2")
    public String addActivityWithImage(@ModelAttribute Activity activity,
                                       @RequestParam("imageFile") MultipartFile imageFile,
                                       HttpServletRequest request,
                                       HttpSession session) {
        try {
            // Handle file upload
            if (!imageFile.isEmpty()) {
                String fileName = imageFile.getOriginalFilename();
                String uploadDir = request.getServletContext().getRealPath("/activity-images/");

                // Ensure the upload directory exists
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs(); // Create the directory if it does not exist
                }

                // Save the file to the directory
                File fileToSave = new File(uploadDir, fileName);
                imageFile.transferTo(fileToSave);

                // Set the relative path to the image in the database
                activity.setImageProof("activity-images/" + fileName);
            }

            // Get the logged-in user's details from the session
            Login user = (Login) session.getAttribute("loggedInUser");
            if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
                // Fetch the teacher and set their school on the activity
                Teacher teacher = teacherDao.findByStaffId(user.getStaffId());
                if (teacher != null && teacher.getSchool() != null) {
                    activity.setSchool(teacher.getSchool());
                }
            }

            // Set the status of the activity to "Pending" by default
            activity.setStatus("Pending");

            // Save the new activity
            activityDao.save(activity);

            // Redirect to the teacher's activity list page
            return "redirect:/teachers/activity";
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect back to the add form with an error parameter
            return "redirect:/activities/add2?error=true";
        }
    }




    
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        Activity activity = activityDao.findById(id);
        List<School> schools = schoolDao.findAll();
        List<User> users = userDao.findAll();

        if (activity == null) {
            return "redirect:/activities"; // Redirect if activity not found
        }

        if (schools.isEmpty() || users.isEmpty()) {
            model.addAttribute("error", "Error loading schools or users. Please check the data.");
            return "error-page"; // Redirect to an error page if schools or users are not found
        }

        model.addAttribute("activity", activity);
        model.addAttribute("schools", schools);
        model.addAttribute("users", users);
        return "admin-activity-edit";
    }

    @PostMapping("/edit/{id}")
    public String updateActivity(@PathVariable int id, @ModelAttribute Activity activity) {
        activityDao.update(id, activity);
        return "redirect:/activities";
    }
    
    @GetMapping("/edit2/{id}")
    public String showEditForm2(@PathVariable int id, Model model) {
        Activity activity = activityDao.findById(id);
        List<School> schools = schoolDao.findAll();
        List<User> users = userDao.findAll();

        if (activity == null) {
            return "redirect:/activities"; // Redirect if activity not found
        }

        if (schools.isEmpty() || users.isEmpty()) {
            model.addAttribute("error", "Error loading schools or users. Please check the data.");
            return "error-page"; // Redirect to an error page if schools or users are not found
        }

        model.addAttribute("activity", activity);
        model.addAttribute("schools", schools);
        model.addAttribute("users", users);
        return "teacher-activity-edit";
    }

    @PostMapping("/edit2/{id}")
    public String updateActivityWithImage(@PathVariable int id,
                                          @ModelAttribute Activity activity,
                                          @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                          HttpServletRequest request,
                                          HttpSession session) {
        try {
            // Fetch the existing activity from the database
            Activity existingActivity = activityDao.findById(id);
            if (existingActivity == null) {
                return "redirect:/activities?error=not_found";
            }

            // Handle file upload (if a new image is uploaded)
            if (imageFile != null && !imageFile.isEmpty()) {
                String fileName = imageFile.getOriginalFilename();
                String uploadDir = request.getServletContext().getRealPath("/activity-images/");

                // Ensure the upload directory exists
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs(); // Create the directory if it does not exist
                }

                // Save the file to the directory
                File fileToSave = new File(uploadDir, fileName);
                imageFile.transferTo(fileToSave);

                // Update the imageProof field with the new image path
                existingActivity.setImageProof("activity-images/" + fileName);
            }

            // Update the activity details
            existingActivity.setActivityName(activity.getActivityName());
            existingActivity.setDescription(activity.getDescription());
            existingActivity.setDate(activity.getDate());

            // Keep the school information unchanged (if required)
            existingActivity.setSchool(existingActivity.getSchool());

            // Save the updated activity
            activityDao.update(id, existingActivity);

            // Redirect to the teacher's activity list page
            return "redirect:/teachers/activity";
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect back to the edit form with an error parameter
            return "redirect:/edit2/" + id + "?error=true";
        }
    }


    @GetMapping("/delete/{id}")
    public String deleteActivity(@PathVariable int id) {
        activityDao.delete(id);
        return "redirect:/activities";
    }
    
    @GetMapping("/delete2/{id}")
    public String deleteActivity2(@PathVariable int id) {
        activityDao.delete(id);
        return "redirect:/teachers/activity";
    }

    @RequestMapping("/add1")
    @ResponseBody()
    public String add1(@ModelAttribute("activity") Activity activity) {
        activityDao.save(activity);
        return "adding .. " + activity.toString();
    }
    
 // Approve activity
    @PostMapping("/approve/{id}")
    public String approveActivity(@PathVariable int id) {
        activityDao.approveActivity(id); // Call the DAO method to approve
        return "redirect:/activities"; // Redirect to the activities list
    }

    // Disapprove activity
    @PostMapping("/disapprove/{id}")
    public String disapproveActivity(@PathVariable int id) {
        activityDao.disapproveActivity(id); // Call the DAO method to disapprove
        return "redirect:/activities"; // Redirect to the activities list
    }

    // Set activity to pending
    @PostMapping("/pending/{id}")
    public String setPendingActivity(@PathVariable int id) {
        activityDao.setPendingActivity(id); // Call the DAO method to set pending
        return "redirect:/activities"; // Redirect to the activities list
    }

    // Filter activities by status (optional, if you want to list activities by status)
    @GetMapping("/status/{status}")
    public String filterActivitiesByStatus(@PathVariable String status, Model model) {
        List<Activity> activities = activityDao.findByStatus(status); // Fetch activities by status
        model.addAttribute("activities", activities);
        model.addAttribute("status", status); // Pass the status for display
        return "activity-list"; // JSP page for displaying activities
    }
}
