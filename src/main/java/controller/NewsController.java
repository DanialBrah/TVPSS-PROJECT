package controller;

import entity.Login;
import entity.News;
import entity.School;
import entity.Teacher;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.NewsDao_usingHibernate;
import service.SchoolDao_usingHibernate;
import service.TeacherDao_usingHibernate;
import service.UserDao_usingHibernate;
import util.FileUploadUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/news")
public class NewsController {

    @Autowired
    private NewsDao_usingHibernate newsDao;

    @Autowired
    private SchoolDao_usingHibernate schoolDao;
    
    @Autowired
    private TeacherDao_usingHibernate teacherDao;
    
    @Autowired
    private UserDao_usingHibernate userDao;

    // Display the list of news
    @GetMapping("")
    public String listNews(Model model) {
        List<News> newsList = newsDao.findAll();
        newsList.forEach(news -> {
            String content = news.getContent();
            if (content.length() > 100) {
                news.setContent(content.substring(0, 100) + "...");
            }
        });
        model.addAttribute("newsList", newsList);
        return "news-list";
    }

    @GetMapping("/teacher")
    public String listNewsForTeacher(HttpSession session, Model model) {
    	Login user = (Login) session.getAttribute("loggedInUser");
        if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
            List<News> newsList = newsDao.findBySchoolId(user.getSchoolId());
            model.addAttribute("newsList", newsList);
            return "teacher-news-list";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/add")
    public String showAddForm(HttpSession session, Model model) {
        Login user = (Login) session.getAttribute("loggedInUser");
        if (user != null && "teacher".equalsIgnoreCase(user.getRole())) {
            // Fetch the teacher's school using the staffId
            Teacher teacher = teacherDao.findByStaffId(user.getStaffId());
            if (teacher == null || teacher.getSchool() == null) {
                model.addAttribute("error", "Unable to retrieve your school details.");
                return "error-page";
            }
            
            // Initialize a new News object
            News news = new News();
            // Pre-set the teacher's school
            news.setSchool(teacher.getSchool());
            
            // Add single school to model instead of all schools
            List<School> schools = new ArrayList<>();
            schools.add(teacher.getSchool());
            
            
            model.addAttribute("news", news);
            model.addAttribute("schools", schools);
            return "news-add"; // Changed to match your JSP name
        } else {
            return "redirect:/login/validate";
        }
    }
    
    @PostMapping("/add")
    public String addNews(@ModelAttribute News news,
                         @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                         HttpServletRequest request,
                         HttpSession session,
                         RedirectAttributes redirectAttributes) {
        try {
            // Validate session
            Login user = (Login) session.getAttribute("loggedInUser");
            if (user == null || !"teacher".equalsIgnoreCase(user.getRole())) {
                return "redirect:/login/validate";
            }

            // Validate required fields
            if (news.getTitle() == null || news.getTitle().trim().isEmpty() ||
                news.getContent() == null || news.getContent().trim().isEmpty()) {
                redirectAttributes.addFlashAttribute("error", "Title and content are required");
                return "redirect:/news/add";
            }

            // Handle image upload
            if (imageFile != null && !imageFile.isEmpty()) {
                String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
                String uploadDir = request.getServletContext().getRealPath("/news-images/");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                File fileToSave = new File(uploadDir, fileName);
                imageFile.transferTo(fileToSave);
                news.setImage("news-images/" + fileName);
            }
            
            if (imageFile != null && !imageFile.isEmpty()) {
                String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
                String uploadDir = request.getServletContext().getRealPath("/news-images/");
				Path uploadPath = Paths.get(uploadDir);
                
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }
                
                Path filePath = uploadPath.resolve(fileName);
                Files.copy(imageFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
                
                // Store the relative path in database
            }
            

            // Set teacher's school
            Teacher teacher = teacherDao.findByStaffId(user.getStaffId());
            if (teacher != null && teacher.getSchool() != null) {
                news.setSchool(teacher.getSchool());
            } else {
                redirectAttributes.addFlashAttribute("error", "Unable to retrieve school details");
                return "redirect:/news/add";
            }

            // Set additional fields
            news.setPostedAt(LocalDateTime.now());
            news.setStatus("Pending"); // Add status if you have this field

            // Save the news
            newsDao.save(news);
            redirectAttributes.addFlashAttribute("success", "News added successfully");
            return "redirect:/teachers/news";
           
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Failed to add news: " + e.getMessage());
            return "redirect:/news/add";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        News news = newsDao.findById(id);
        List<School> schools = schoolDao.findAll();
        List<User> users = userDao.findAll();
        if (news == null || schools.isEmpty()) {
            return "redirect:/news";
        }
        model.addAttribute("news", news);
        model.addAttribute("schools", schools);
        model.addAttribute("users", users);
        return "news-form";
    }

    @PostMapping("/edit/{id}")
    public String updateNews(@PathVariable int id, 
                            @ModelAttribute News news, 
                            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                            HttpServletRequest request) {
        try {
            if (imageFile != null && !imageFile.isEmpty()) {
                String fileName = imageFile.getOriginalFilename();
                String uploadDir = request.getServletContext().getRealPath("/news-images/");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                FileUploadUtil.saveFile(uploadDir, fileName, imageFile);
                news.setImage("/news-images/" + fileName);
            }
            newsDao.update(id, news);
            news.setStatus("Approved");
            return "redirect:/teachers/news";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/news/edit/" + id + "?error=true";
        }
    }
    
    @GetMapping("/edit1/{id}")
    public String showEditForm1(@PathVariable int id, Model model) {
        News news = newsDao.findById(id);
        List<School> schools = schoolDao.findAll();
        List<User> users = userDao.findAll();
        if (news == null || schools.isEmpty()) {
            return "redirect:/news";
        }
        model.addAttribute("news", news);
        model.addAttribute("schools", schools);
        model.addAttribute("users", users);
        return "news-form2";
    }

    @PostMapping("/edit1/{id}")
    public String updateNews1(@PathVariable int id, 
                            @ModelAttribute News news, 
                            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                            HttpServletRequest request) {
        try {
            if (imageFile != null && !imageFile.isEmpty()) {
                String fileName = imageFile.getOriginalFilename();
                String uploadDir = request.getServletContext().getRealPath("/news-images/");
                File uploadDirFile = new File(uploadDir);
                if (!uploadDirFile.exists()) {
                    uploadDirFile.mkdirs();
                }
                FileUploadUtil.saveFile(uploadDir, fileName, imageFile);
                news.setImage("/news-images/" + fileName);
            }
            newsDao.update(id, news);
            news.setStatus("Approved");
            return "redirect:/news";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/news/edit1/" + id + "?error=true";
        }
    }
    

    @GetMapping("/delete/{id}")
    public String deleteNews(@PathVariable int id) {
        newsDao.delete(id);
        return "redirect:/news";
    }
    
    @GetMapping("/approvedlist")
    public String listApprovedNews(Model model) {
        List<News> approvedNews = newsDao.findByStatus("Approved");
        model.addAttribute("newsList", approvedNews);
        return "news-page"; // Maps to news-page.jsp
    }

    @PostMapping("/approve/{id}")
    public String approveNews(@PathVariable int id) {
        newsDao.approveNews(id);
        return "redirect:/news";
    }

    @PostMapping("/disapprove/{id}")
    public String disapproveNews(@PathVariable int id) {
        newsDao.disapproveNews(id);
        return "redirect:/news";
    }

    @PostMapping("/pending/{id}")
    public String setPendingNews(@PathVariable int id) {
        newsDao.setPendingNews(id);
        return "redirect:/news";
    }

    @GetMapping("/filter")
    public String filterNews(@RequestParam(required = false) Integer schoolId,
                             @RequestParam(required = false) String status, Model model) {
        List<News> filteredNews = newsDao.filterNews(schoolId, status);
        List<School> schools = schoolDao.findAll();
        model.addAttribute("newsList", filteredNews);
        model.addAttribute("schools", schools);
        return "news-list";
    }
}
