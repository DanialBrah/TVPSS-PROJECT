package service;

import entity.News;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NewsDao_usingHibernate {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public News findById(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return currentSession.get(News.class, id);
    }

    @Transactional
    public void save(News news) {
        Session session = sessionFactory.getCurrentSession();
        session.save(news);
        session.flush(); // Ensure changes are written to DB
    }


    @Transactional
    public void update(int id, News news) {
        Session session = sessionFactory.getCurrentSession();
        News existingNews = session.get(News.class, id);
        if (existingNews != null) {
            existingNews.setTitle(news.getTitle());
            existingNews.setContent(news.getContent());
            existingNews.setSchool(news.getSchool());
            existingNews.setStatus(news.getStatus());
            if (news.getImage() != null) {
                existingNews.setImage(news.getImage());
            }
            session.update(existingNews);
            session.flush();
        }
    }

    @Transactional
    public void delete(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        News newsToDelete = currentSession.get(News.class, id);
        if (newsToDelete != null) {
            currentSession.delete(newsToDelete);
        }
    }

    @Transactional
    public List<News> findAll() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM News", News.class).getResultList();
    }

    @Transactional
    public List<News> filterNews(Integer schoolId, String status) {
        String hql = "FROM News WHERE 1=1";
        if (schoolId != null) {
            hql += " AND school.id = :schoolId";
        }
        if (status != null && !status.isEmpty()) {
            hql += " AND status = :status";
        }

        Session session = sessionFactory.getCurrentSession();
        Query<News> query = session.createQuery(hql, News.class);

        if (schoolId != null) {
            query.setParameter("schoolId", schoolId);
        }
        if (status != null && !status.isEmpty()) {
            query.setParameter("status", status);
        }

        return query.getResultList();
    }

    @Transactional
    public List<News> findBySchoolId(int schoolId) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM News WHERE school.id = :schoolId", News.class)
                .setParameter("schoolId", schoolId)
                .getResultList();
    }

    @Transactional
    public void approveNews(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        News news = currentSession.get(News.class, id);
        if (news != null) {
            news.setStatus("Approved");
            currentSession.saveOrUpdate(news);
        }
    }

    @Transactional
    public void disapproveNews(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        News news = currentSession.get(News.class, id);
        if (news != null) {
            news.setStatus("Disapproved");
            currentSession.saveOrUpdate(news);
        }
    }

    @Transactional
    public void setPendingNews(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        News news = currentSession.get(News.class, id);
        if (news != null) {
            news.setStatus("Pending");
            currentSession.saveOrUpdate(news);
        }
    }

    @Transactional
    public List<News> findByStatus(String status) {
        Session currentSession = sessionFactory.getCurrentSession();
        String hql = "FROM News WHERE status = :status";
        Query<News> query = currentSession.createQuery(hql, News.class);
        query.setParameter("status", status);
        return query.getResultList();
    }

    @Transactional
    public List<News> findApprovedNewsBySchoolId(int schoolId) {
        String hql = "FROM News WHERE status = 'Approved' AND school.id = :schoolId";
        Session currentSession = sessionFactory.getCurrentSession();
        Query<News> query = currentSession.createQuery(hql, News.class);
        query.setParameter("schoolId", schoolId);
        return query.getResultList();
    }
}
