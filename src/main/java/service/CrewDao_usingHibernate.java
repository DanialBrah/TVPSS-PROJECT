package service;

import entity.Activity;
import entity.Crew;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class CrewDao_usingHibernate {

	@Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public List<Crew> findAll() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("SELECT c FROM Crew c JOIN FETCH c.school", Crew.class).getResultList();
    }

    @Transactional
    public Crew findByCrewId(String crewId) {
        return sessionFactory.getCurrentSession()
                .createQuery("FROM Crew WHERE crewId = :crewId", Crew.class)
                .setParameter("crewId", crewId)
                .uniqueResult();
    }


    @Transactional
    public void save(Crew crew) {
        Session session = sessionFactory.getCurrentSession();
        
        // Generate Staff ID if it's a new teacher
        if (crew.getCrewId() == null || crew.getCrewId().isEmpty()) {
            String newCrewId = generateCrewId();
            crew.setCrewId(newCrewId);
        }
        
        session.saveOrUpdate(crew);
    }

    // Generate the Staff ID with "STF" prefix
    private String generateCrewId() {
        Session session = sessionFactory.getCurrentSession();
        
        // Query the max Staff ID
        String lastCrewId = session.createQuery("SELECT c.crewId FROM Crew c ORDER BY c.crewId DESC", String.class)
                                    .setMaxResults(1)
                                    .uniqueResult();
        
        int nextNumber = 1;
        if (lastCrewId != null && lastCrewId.startsWith("CRW")) {
            nextNumber = Integer.parseInt(lastCrewId.substring(3)) + 1;
        }
        
        return "CRW" + String.format("%03d", nextNumber); // Example: STF001, STF002
    }

    @Transactional
    public void delete(String crewId) { // Using staffId
        Session session = sessionFactory.getCurrentSession();
        Crew crew = session.get(Crew.class, crewId);
        if (crew != null) {
            session.delete(crew);
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
