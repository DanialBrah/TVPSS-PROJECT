// VideoDao_usingHibernate.java
package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entity.Video;
import java.util.List;

@Service
public class VideoDao_usingHibernate {
    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Video findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(Video.class, id);
    }

    
    @Transactional
    public void save(Video video) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(video);
    }
    
    @Transactional
    public void update(int id, Video video) {
        Session currentSession = sessionFactory.getCurrentSession();
        Video existingVideo = currentSession.get(Video.class, id);
        if (existingVideo != null) {
            existingVideo.setTitle(video.getTitle());
         
            existingVideo.setUrl(video.getUrl());
            existingVideo.setDescription(video.getDescription());
            existingVideo.setDate(video.getDate());
            currentSession.merge(existingVideo);
          
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Video videoToDelete = currentSession.get(Video.class, id);
        if (videoToDelete != null) {
            currentSession.delete(videoToDelete);
        }
    }

    @Transactional
    public List<Video> findAll() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Video", Video.class).getResultList();
    }
    public List<Video> filterVideos(Integer schoolId, String date) {
        String hql = "FROM Video WHERE 1=1";
        if (schoolId != null) {
            hql += " AND school.id = :schoolId";
        }
        if (date != null && !date.isEmpty()) {
            hql += " AND date = :date";
        }

        Session session = sessionFactory.getCurrentSession();
        Query<Video> query = session.createQuery(hql, Video.class);

        if (schoolId != null) {
            query.setParameter("schoolId", schoolId);
        }
        if (date != null && !date.isEmpty()) {
            query.setParameter("date", date);
        }

        return query.getResultList();
    }


    @Transactional
    public List<Video> findBySchoolId(int schoolId) {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("FROM Video WHERE school.id = :schoolId", Video.class)
                    .setParameter("schoolId", schoolId)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    @Transactional
    public void approveVideo(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Video video = currentSession.get(Video.class, id);
        if (video != null) {
            video.setStatus("Approved"); // Use "Approved" as a string
            currentSession.saveOrUpdate(video);
        }
    }
    
    @Transactional
    public void disapproveVideo(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Video video = currentSession.get(Video.class, id);
        if (video != null) {
            video.setStatus("Disapproved"); // Use "Disapproved" as a string
            currentSession.saveOrUpdate(video);
        }
    }
    @Transactional
    public void setPendingVideo(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
       Video video = currentSession.get(Video.class, id);
        if (video != null) {
            video.setStatus("Pending"); // Use "Pending" as a string
            currentSession.saveOrUpdate(video);
        }
    }
    
    @Transactional
    public List<Video> findByStatus(String status) {
        Session currentSession = sessionFactory.getCurrentSession();
        String hql = "FROM Video WHERE status = :status";
        Query<Video> query = currentSession.createQuery(hql, Video.class);
        query.setParameter("status", status);
        return query.getResultList();
    }
    
    @Transactional
    public List<Video> findApprovedVideosBySchoolId(int schoolId) {
        String hql = "FROM Video WHERE status = 'Approved' AND school.id = :schoolId";
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Video> query = currentSession.createQuery(hql, Video.class);
        query.setParameter("schoolId", schoolId);
        return query.getResultList();
    }
    
    @Transactional
    public List<Video> findApprovedVideos() {
        String hql = "FROM Video WHERE status = 'Approved'";
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Video> query = currentSession.createQuery(hql, Video.class);
        return query.getResultList();
    }
}