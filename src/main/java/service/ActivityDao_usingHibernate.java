// ActivityDao_usingHibernate.java
package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import entity.Activity;
import java.util.List;

@Service
public class ActivityDao_usingHibernate {
    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Activity findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Activity.class, id);
    }

    @Transactional
    public void save(Activity activity) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(activity);
    }

    @Transactional
    public void update(int id, Activity activity) {
        Session currentSession = sessionFactory.getCurrentSession();
        Activity existingActivity = currentSession.get(Activity.class, id);
        if (existingActivity != null) {
            existingActivity.setActivityName(activity.getActivityName());
            existingActivity.setDescription(activity.getDescription());
            existingActivity.setDate(activity.getDate());

            // Check if a new imageProof is provided
            if (activity.getImageProof() != null && !activity.getImageProof().isEmpty()) {
                existingActivity.setImageProof(activity.getImageProof()); // Update the imageProof field
            }

            currentSession.merge(existingActivity);
        }
    }



    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Activity activityToDelete = currentSession.get(Activity.class, id);
        if (activityToDelete != null) {
            currentSession.delete(activityToDelete);
        }
    }

    @Transactional
    public List<Activity> findAll() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Activity", Activity.class).getResultList();
    }


    public List<Activity> filterActivities(Integer schoolId, String date) {
        String hql = "FROM Activity WHERE 1=1";
        if (schoolId != null) {
            hql += " AND school.id = :schoolId";
        }
        if (date != null && !date.isEmpty()) {
            hql += " AND date = :date";
        }

        Session session = sessionFactory.getCurrentSession();
        Query<Activity> query = session.createQuery(hql, Activity.class);

        if (schoolId != null) {
            query.setParameter("schoolId", schoolId);
        }
        if (date != null && !date.isEmpty()) {
            query.setParameter("date", date);
        }

        return query.getResultList();
    }

    @Transactional
    public List<Activity> findBySchoolId(int schoolId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Activity WHERE school.id = :schoolId", Activity.class)
                    .setParameter("schoolId", schoolId)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Transactional
    public void approveActivity(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Activity activity = currentSession.get(Activity.class, id);
        if (activity != null) {
            activity.setStatus("Approved"); // Use "Approved" as a string
            currentSession.saveOrUpdate(activity);
        }
    }

    @Transactional
    public void disapproveActivity(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Activity activity = currentSession.get(Activity.class, id);
        if (activity != null) {
            activity.setStatus("Disapproved"); // Use "Disapproved" as a string
            currentSession.saveOrUpdate(activity);
        }
    }

    @Transactional
    public void setPendingActivity(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Activity activity = currentSession.get(Activity.class, id);
        if (activity != null) {
            activity.setStatus("Pending"); // Use "Pending" as a string
            currentSession.saveOrUpdate(activity);
        }
    }

    @Transactional
    public List<Activity> findByStatus(String status) {
        Session currentSession = sessionFactory.getCurrentSession();
        String hql = "FROM Activity WHERE status = :status";
        Query<Activity> query = currentSession.createQuery(hql, Activity.class);
        query.setParameter("status", status);
        return query.getResultList();
    }

    @Transactional
    public List<Activity> findApprovedActivitiesBySchoolId(int schoolId) {
        String hql = "FROM Activity WHERE status = 'Approved' AND school.id = :schoolId";
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Activity> query = currentSession.createQuery(hql, Activity.class);
        query.setParameter("schoolId", schoolId);
        return query.getResultList();
    }

    @Transactional
    public List<Activity> findApprovedActivities() {
        String hql = "FROM Activity WHERE status = 'Approved'";
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Activity> query = currentSession.createQuery(hql, Activity.class);
        return query.getResultList();
    }



}