package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.CustomerDao_usingHibernate;
import entity.Customer;

@Controller
@RequestMapping("/customers")
public class CustomerController {

    @Autowired
    private CustomerDao_usingHibernate customerDao;

    @GetMapping("")
    public String listCustomers(Model model) {
        model.addAttribute("customers", customerDao.findAll());
        return "customer-list";
    }

    @RequestMapping("/add1")
    @ResponseBody()
    public String add1(@ModelAttribute("customer") Customer customer) {
        customerDao.save(customer);
        return "adding .. " + customer.toString();
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("customer", new Customer());
        return "customer-form";
    }

    @PostMapping("/add")
    public String addCustomerAlt(@ModelAttribute Customer customer) {
        System.out.println("Saving customer: " + customer);
        customerDao.save(customer);
        return "redirect:/customers";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        // Ensure the user has the "ADMIN" role before accessing the edit form
        Customer customer = customerDao.findById(id);
        if (customer != null) {
            model.addAttribute("customer", customer);
            return "customer-edit";
        }
        return "redirect:/customers"; // Redirect if customer not found
    }

    @PostMapping("/edit/{id}")
    public String updateCustomer(@PathVariable int id, @ModelAttribute Customer customer) {
        // Ensure the user has the "ADMIN" role before updating the customer
        customerDao.update(id, customer);
        return "redirect:/customers"; // Redirect to the customer list after saving
    }

    @GetMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable int id) {
        // Ensure the user has the "ADMIN" role before deleting the customer
        customerDao.delete(id);
        return "redirect:/customers"; // Redirect to the customer list after deleting
    }
}
