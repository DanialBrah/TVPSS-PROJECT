// UserDao_usingHibernate.java
package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import entity.User;
import java.util.List;
import java.time.LocalDateTime;

@Service
public class UserDao_usingHibernate {
    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public User findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(User.class, id);
    }

    @Transactional
    public void save(User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        user.setCreatedAt(LocalDateTime.now());
        currentSession.saveOrUpdate(user);
    }

    @Transactional
    public void update(int id, User user) {
        Session currentSession = sessionFactory.getCurrentSession();
        User existingUser = currentSession.get(User.class, id);
        if (existingUser != null) {
            existingUser.setUsername(user.getUsername());
            existingUser.setPassword(user.getPassword());
            existingUser.setRole(user.getRole());
            existingUser.setEmail(user.getEmail());
            currentSession.merge(existingUser);
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        User userToDelete = currentSession.get(User.class, id);
        if (userToDelete != null) {
            currentSession.delete(userToDelete);
        }
    }

    @Transactional
    public List<User> findAll() {
        Session session = sessionFactory.getCurrentSession();
        List<User> users = session.createQuery("from User", User.class).getResultList();
        System.out.println("Users found: " + users.size());
        return users;
    }


    @Transactional
    public void updateLastLogin(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        User user = currentSession.get(User.class, id);
        if (user != null) {
            user.setLastLogin(LocalDateTime.now());
            currentSession.merge(user);
        }
    }
    
    @Transactional
    public User findByStaffId(String staffId) {
        Session currentSession = sessionFactory.getCurrentSession();
        String hql = "FROM User WHERE username = :staffId";
        Query<User> query = currentSession.createQuery(hql, User.class);
        query.setParameter("staffId", staffId);
        List<User> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }
}