package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import entity.School;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class SchoolDao_usingHibernate {

    @Autowired
    private SessionFactory sessionFactory;

    // Find a school by its ID
    @Transactional
    public School findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(School.class, id);
    }

    // Save a new school
    @Transactional
    public void save(School school) {
        Session currentSession = sessionFactory.getCurrentSession();
        if (school.getEquipmentUpdatedAt() == null) {
            school.setEquipmentUpdatedAt(LocalDateTime.now()); // Set default equipment update time
        }
        currentSession.save(school); // Save the new school
    }

    // Update an existing school
    @Transactional
    public void update(int id, School school) {
        Session currentSession = sessionFactory.getCurrentSession();
        School existingSchool = currentSession.get(School.class, id);
        if (existingSchool != null) {
            existingSchool.setName(school.getName());
            existingSchool.setAddress(school.getAddress());
            existingSchool.setContact(school.getContact());
            existingSchool.setVersion(school.getVersion());
            existingSchool.setEquipmentUpdatedAt(school.getEquipmentUpdatedAt() != null 
                ? school.getEquipmentUpdatedAt() 
                : LocalDateTime.now()); // Update or set default equipment time
            currentSession.merge(existingSchool);
        }
    }

    // Delete a school by its ID
    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        School schoolToDelete = currentSession.get(School.class, id);
        if (schoolToDelete != null) {
            currentSession.delete(schoolToDelete);
        }
    }

    // Retrieve all schools
    @Transactional
    public List<School> findAll() {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("FROM School", School.class).getResultList();
    }

    // Retrieve schools by a specific version (example of a filtered query)
    @Transactional
    public List<School> findByVersion(String version) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("FROM School WHERE version = :version", School.class)
                .setParameter("version", version)
                .getResultList();
    }
}
