package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import entity.Login;

@Service
public class LoginDao_usingHibernate {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Login validateLogin(String username, String password) {
        try {
            return sessionFactory.getCurrentSession()
                    .createQuery("FROM Login WHERE username = :username AND password = :password", Login.class)
                    .setParameter("username", username)
                    .setParameter("password", password)
                    .uniqueResult();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


}
