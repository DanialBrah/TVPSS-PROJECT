// VideoController.java
package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import service.SchoolDao_usingHibernate; // Assuming you have a School DAO
import service.TeacherDao_usingHibernate;
import service.UserDao_usingHibernate; // Assuming you have a User DAO
import service.CrewDao_usingHibernate;
import service.VideoDao_usingHibernate;
import util.FileUploadUtil;

import entity.Login;
import entity.School;
import entity.Teacher;
import entity.User;
import entity.Activity;
import entity.Crew;
import entity.Video;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/videos")
public class VideoController {

	@Autowired
	private VideoDao_usingHibernate videoDao;

	@Autowired
	private SchoolDao_usingHibernate schoolDao;

	@Autowired
	private UserDao_usingHibernate userDao;

	@Autowired
	private TeacherDao_usingHibernate teacherDao;

	@Autowired
	private CrewDao_usingHibernate crewDao;

	@GetMapping("")
	public String listVideos(Model model) {
		model.addAttribute("video", videoDao.findAll());
		return "admin-video-list";
	}

	@GetMapping("crew")
	public String listVideos(HttpSession session, Model model) {
		// Retrieve the logged-in user's details from the session
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "crew".equalsIgnoreCase(user.getRole())) {
			// Fetch activities for the user's assigned school
			List<Video> videos = videoDao.findApprovedVideosBySchoolId(user.getSchoolId());

			// Add the filtered activities to the model
			model.addAttribute("video", videos);
			return "crew-video-list"; // Name of the JSP file for crew activities
		} else {
			// Redirect to login if the session is invalid or the role is not "crew"
			return "redirect:/login/validate";
		}
	}
	
	@GetMapping("teacher")
	public String listVideosForTeacher(HttpSession session, Model model) {
		// Retrieve the logged-in user's details from the session
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
			// Fetch activities for the user's assigned school
			List<Video> videos = videoDao.findApprovedVideosBySchoolId(user.getSchoolId());

			// Add the filtered activities to the model
			model.addAttribute("video", videos);
			return "teacher-video-list"; // Name of the JSP file for crew activities
		} else {
			// Redirect to login if the session is invalid or the role is not "crew"
			return "redirect:/login/validate";
		}
	}
	  @GetMapping("guest")
	    public String listApprovedVideosForGuest(Model model) {
	        // Fetch only approved 
	        List<Video> approvedVideos = videoDao.findApprovedVideos();

	        // Add the approved activities to the model
	        model.addAttribute("videos", approvedVideos);

	        return "guest-video-list"; // Name of the JSP file for guest activities
	    }
	// Admin add video
	@GetMapping("/add")
	public String showAddForm(Model model) {
		List<School> schools = schoolDao.findAll();
		List<User> users = userDao.findAll();

		if (schools.isEmpty() || users.isEmpty()) {
			model.addAttribute("error", "Error loading schools or users. Please check the data.");
			return "error-page"; // Redirect to an error page if schools or users are not found
		}

		model.addAttribute("video", new Video());
		model.addAttribute("schools", schools);
		model.addAttribute("users", users);
		return "admin-video-form";
	}

	@PostMapping("/add")
	public String addVideo(@ModelAttribute Video video) {
		videoDao.save(video);
		return "redirect:/videos";
	}

	// Crew add video
	@GetMapping("/add2")
	public String showOrAddVideo(@RequestParam(required = false) String error, HttpSession session, Model model) {
		// Get the logged-in user's details from the session
		Login user = (Login) session.getAttribute("loggedInUser");

		if (user != null && "crew".equalsIgnoreCase(user.getRole())) {
			// Fetch the teacher's school using the staffId
			Crew crew = crewDao.findByCrewId(user.getCrewId());
			if (crew  == null || crew.getSchool() == null) {
				model.addAttribute("error", "Unable to retrieve your school details.");
				return "error-page";
			}

			// Create a new activity and set the teacher's school automatically
			Video video = new Video();
			video.setSchool(crew.getSchool()); // Set the teacher's school

			model.addAttribute("video", video);
			model.addAttribute("username", user.getUsername());

			// Handle error messages
			if (error != null) {
				model.addAttribute("error", "Error occurred while saving the activity. Please try again.");
			}

			return "crew-video-form"; // Show the activity form for the teacher
		} else {
			return "redirect:/login/validate"; // Redirect to login if session is invalid
		}
	}

	@PostMapping("/add2")
	public String addVideo(@ModelAttribute Video video, HttpServletRequest request, HttpSession session) {
	    try {
	        // Get the logged-in user's details from the session
	        Login user = (Login) session.getAttribute("loggedInUser");
	        if (user != null && "crew".equalsIgnoreCase(user.getRole())) {
	            // Fetch the crew and set their school on the video
	            Crew crew = crewDao.findByCrewId(user.getCrewId());
	            if (crew != null && crew.getSchool() != null) {
	                video.setSchool(crew.getSchool());
	            }
	        }

	        // Set the status of the video to "Pending" by default
	        video.setStatus("Pending");

	        // Save the new video
	        videoDao.save(video);

	        // Redirect to the crew's video list page
	        return "redirect:/crew/videos";

	    } catch (Exception e) {
	        e.printStackTrace();
	        // Redirect back to the add form with an error parameter
	        return "redirect:/videos/add2?error=true";
	    }
	}

	// Teacher add Video
	@GetMapping("/add3")
	public String showOrAddVideoTeacher(@RequestParam(required = false) String error, HttpSession session, Model model) {
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
			Video video = new Video();
			video.setSchool(teacher.getSchool()); // Set the teacher's school

			model.addAttribute("video", video);
			model.addAttribute("username", user.getUsername());

			// Handle error messages
			if (error != null) {
				model.addAttribute("error", "Error occurred while saving the activity. Please try again.");
			}

			return "teacher-video-form"; // Show the activity form for the teacher
		} else {
			return "redirect:/login/validate"; // Redirect to login if session is invalid
		}
	}

	@PostMapping("/add3")
	public String addVideoTeacher(@ModelAttribute Video video, HttpServletRequest request, HttpSession session) {
	    try {
	        // Get the logged-in user's details from the session
	        Login user = (Login) session.getAttribute("loggedInUser");
	        if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
	            // Fetch the teacher and set their school on the video
	            Teacher teacher = teacherDao.findByStaffId(user.getStaffId());
	            if (teacher != null && teacher.getSchool() != null) {
	                video.setSchool(teacher.getSchool());
	            }
	        }

	        // Set the status of the video to "Pending" by default
	        video.setStatus("Pending");

	        // Save the new video
	        videoDao.save(video);

	        // Redirect to the teacher's video list page
	        return "redirect:/teachers/video";

	    } catch (Exception e) {
	        e.printStackTrace();
	        // Redirect back to the add form with an error parameter
	        return "redirect:/videos/add3?error=true";
	    }
	}


	//Approve for admin
	@GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        Video video = videoDao.findById(id);
        List<School> schools = schoolDao.findAll();
        List<User> users = userDao.findAll();

        if (video == null) {
            return "redirect:/videos"; // Redirect if activity not found
        }

        if (schools.isEmpty() || users.isEmpty()) {
            model.addAttribute("error", "Error loading schools or users. Please check the data.");
            return "error-page"; // Redirect to an error page if schools or users are not found
        }

        model.addAttribute("video", video);
        model.addAttribute("schools", schools);
        model.addAttribute("users", users);
        return "admin-video-edit";
    }

	@PostMapping("/edit/{id}")
	public String updateVideo(@PathVariable int id, @ModelAttribute Video video) {
		videoDao.update(id, video);
		return "redirect:/videos";
	}
	
	//edit for crew
	 @GetMapping("/edit2/{id}")
	    public String showEditForm2(@PathVariable int id, Model model) {
	        Video video = videoDao.findById(id);
	        List<School> schools = schoolDao.findAll();
	        List<User> users = userDao.findAll();

	        if (video == null) {
	            return "redirect:/videos"; // Redirect if activity not found
	        }

	        if (schools.isEmpty() || users.isEmpty()) {
	            model.addAttribute("error", "Error loading schools or users. Please check the data.");
	            return "error-page"; // Redirect to an error page if schools or users are not found
	        }

	        model.addAttribute("video", video);
	        model.addAttribute("schools", schools);
	        model.addAttribute("users", users);
	        return "crew-video-edit";
	    }

	 @PostMapping("/edit2/{id}")
	 public String updateVideo(@PathVariable int id,
	                           @ModelAttribute Video video,
	                           HttpSession session) {
	     try {
	         // Fetch the existing video from the database
	         Video existingVideo = videoDao.findById(id);
	         if (existingVideo == null) {
	             return "redirect:/video?error=not_found";
	         }

	         // Update the video details
	         existingVideo.setTitle(video.getTitle());
	         existingVideo.setDescription(video.getDescription());
	         existingVideo.setDate(video.getDate());

	         // Keep the school information unchanged
	         existingVideo.setSchool(existingVideo.getSchool());

	         // Save the updated video
	         videoDao.update(id, existingVideo);

	         // Redirect to the teacher's video list page
	         return "redirect:/crew/videos";

	     } catch (Exception e) {
	         e.printStackTrace();
	         // Redirect back to the edit form with an error parameter
	         return "redirect:/edit2/" + id + "?error=true";
	     }
	 }

	    
//Edit for teacher
	 @GetMapping("/edit3/{id}")
	    public String showEditFormTeacher(@PathVariable int id, Model model) {
	        Video video = videoDao.findById(id);
	        List<School> schools = schoolDao.findAll();
	        List<User> users = userDao.findAll();

	        if (video == null) {
	            return "redirect:/videos"; // Redirect if activity not found
	        }

	        if (schools.isEmpty() || users.isEmpty()) {
	            model.addAttribute("error", "Error loading schools or users. Please check the data.");
	            return "error-page"; // Redirect to an error page if schools or users are not found
	        }

	        model.addAttribute("video", video);
	        model.addAttribute("schools", schools);
	        model.addAttribute("users", users);
	        return "teacher-video-edit";
	    }
	 @PostMapping("/edit3/{id}")
	 public String updateVideoTeacher(@PathVariable int id,
	                                   @ModelAttribute Video video,
	                                   HttpSession session) {
	     try {
	         // Check if the user is logged in and is a teacher
	         Login user = (Login) session.getAttribute("loggedInUser");
	         if (user == null || !"teacher".equalsIgnoreCase(user.getRole())) {
	             return "redirect:/login"; // Redirect to login if not authenticated or not a teacher
	         }

	         // Fetch the existing video from the database
	         Video existingVideo = videoDao.findById(id);
	         if (existingVideo == null) {
	             return "redirect:/video?error=not_found";
	         }

	         // Update the video details
	         existingVideo.setTitle(video.getTitle());
	         existingVideo.setDescription(video.getDescription());
	         existingVideo.setDate(video.getDate());

	         // Keep the school information unchanged
	         existingVideo.setSchool(existingVideo.getSchool());

	         // Save the updated video
	         videoDao.update(id, existingVideo);

	         // Redirect to the teacher's video list page
	         return "redirect:/teachers/video";

	     } catch (Exception e) {
	         e.printStackTrace();
	         // Redirect back to the edit form with an error parameter
	         return "redirect:/edit3/" + id + "?error=true";
	     }
	 }


	@GetMapping("/delete/{id}")
	public String deleteVideo(@PathVariable int id) {
		videoDao.delete(id);
		return "redirect:/videos";
	}
	
	@GetMapping("/delete2/{id}")
	public String deleteVideo2(@PathVariable int id) {
		videoDao.delete(id);
		return "redirect:/crew/videos";
	}
	@GetMapping("/delete3/{id}")
	public String deleteVideo3(@PathVariable int id) {
		videoDao.delete(id);
		return "redirect:/teachers/video";
	}

	//Approval
	   @PostMapping("/approve/{id}")
	    public String approveVideo(@PathVariable int id) {
	       videoDao.approveVideo(id); // Call the DAO method to approve
	        return "redirect:/videos"; // Redirect to the activities list
	    }

	    // Disapprove 
	    @PostMapping("/disapprove/{id}")
	    public String disapproveVideo(@PathVariable int id) {
	       videoDao.disapproveVideo(id); // Call the DAO method to disapprove
	        return "redirect:/videos"; // Redirect to the activities list
	    }

	
	    @PostMapping("/pending/{id}")
	    public String setPendingActivity(@PathVariable int id) {
	        videoDao.setPendingVideo(id); // Call the DAO method to set pending
	        return "redirect:/videos"; // Redirect to the activities list
	    }


	    @GetMapping("/status/{status}")
	    public String filterVideosByStatus(@PathVariable String status, Model model) {
	        List<Video> videos = videoDao.findByStatus(status); // Fetch activities by status
	        model.addAttribute("video",videos);
	        model.addAttribute("status", status); // Pass the status for display
	        return "video-list"; // JSP page for displaying activities
	    }
}