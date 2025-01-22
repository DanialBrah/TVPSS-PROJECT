package service;

import entity.Activity;
import entity.Teacher;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TeacherDao_usingHibernate {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public List<Teacher> findAll() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("SELECT t FROM Teacher t JOIN FETCH t.school", Teacher.class).getResultList();
    }

    @Transactional
    public Teacher findByStaffId(String staffId) {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Teacher WHERE staffId = :staffId", Teacher.class)
                .setParameter("staffId", staffId)
                .uniqueResult();
    }


    @Transactional
    public void save(Teacher teacher) {
        Session session = sessionFactory.getCurrentSession();
        
        // Generate Staff ID if it's a new teacher
        if (teacher.getStaffId() == null || teacher.getStaffId().isEmpty()) {
            String newStaffId = generateStaffId();
            teacher.setStaffId(newStaffId);
        }
        
        session.saveOrUpdate(teacher);
    }

    // Generate the Staff ID with "STF" prefix
    private String generateStaffId() {
        Session session = sessionFactory.getCurrentSession();
        
        // Query the max Staff ID
        String lastStaffId = session.createQuery("SELECT t.staffId FROM Teacher t ORDER BY t.staffId DESC", String.class)
                                    .setMaxResults(1)
                                    .uniqueResult();
        
        int nextNumber = 1;
        if (lastStaffId != null && lastStaffId.startsWith("STF")) {
            nextNumber = Integer.parseInt(lastStaffId.substring(3)) + 1;
        }
        
        return "STF" + String.format("%03d", nextNumber); // Example: STF001, STF002
    }

    @Transactional
    public void delete(String staffId) { // Using staffId
        Session session = sessionFactory.getCurrentSession();
        Teacher teacher = session.get(Teacher.class, staffId);
        if (teacher != null) {
            session.delete(teacher);
        }
    }
    
    @Transactional
    public List<Activity> findBySchool(int schoolId) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.createQuery("from Activity where school_id = :schoolId")
            .setParameter("schoolId", schoolId)
            .getResultList();
    }
    
}
