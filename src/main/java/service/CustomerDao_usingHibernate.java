package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import entity.Customer;
import java.util.List;

@Service
public class CustomerDao_usingHibernate {
    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Customer findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Customer.class, id); // Keep the ID type consistent (int)
    }

    @Transactional
    public void save(Customer customer) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(customer);
    }

    @Transactional
    public void detach(Customer customer) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.evict(customer);
    }

    @Transactional
    public void update(int id, Customer customer) {
        Session currentSession = sessionFactory.getCurrentSession();
        // Retrieve the persistent customer from the database using the provided id
        Customer existingCustomer = currentSession.get(Customer.class, id); // Use int for ID
        if (existingCustomer != null) {
            // Update the properties of the existing customer with the new values
            existingCustomer.setName(customer.getName());
            existingCustomer.setAddress(customer.getAddress());
            existingCustomer.setContactNum(customer.getContactNum());
            existingCustomer.setEmail(customer.getEmail());
            // Merge the changes to the session (this will update the existing customer)
            currentSession.merge(existingCustomer);
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        // Retrieve the persistent customer from the database using the provided id
        Customer customerToDelete = currentSession.get(Customer.class, id);

        if (customerToDelete != null) {
            // Delete the customer from the database
            currentSession.delete(customerToDelete);
        }
    }

    @Transactional
    public List<Customer> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Customer", Customer.class).getResultList();
    }
}
