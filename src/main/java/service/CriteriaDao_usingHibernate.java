package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import entity.Criteria;
import java.util.List;
import java.util.ArrayList;
import org.hibernate.query.Query;

@Service
public class CriteriaDao_usingHibernate {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public Criteria findById(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		return currentSession.get(Criteria.class, id);
	}

	@Transactional
	public void save(Criteria criteria) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(criteria);
		currentSession.flush(); // Ensure the changes are immediately persisted
	}

	@Transactional
	public List<Criteria> findApprovedCriteriaBySchoolId(int schoolId) {
		Session currentSession = sessionFactory.getCurrentSession();
		try {
			return currentSession.createQuery("from Criteria where school.id = :schoolId", Criteria.class)
					.setParameter("schoolId", schoolId).getResultList();
		} catch (Exception e) {
			throw new RuntimeException("Error finding criteria by school ID: " + e.getMessage(), e);
		}
	}

	@Transactional
	public void update(int id, Criteria criteria) {
		Session currentSession = sessionFactory.getCurrentSession();
		Criteria existingCriteria = currentSession.get(Criteria.class, id);
		if (existingCriteria != null) {
			// Update fields
			existingCriteria.setHasName(criteria.isHasName());
			existingCriteria.setHasLogo(criteria.isHasLogo());
			existingCriteria.setHasStudio(criteria.isHasStudio());
			existingCriteria.setHasInSchoolRecording(criteria.isHasInSchoolRecording());
			existingCriteria.setHasYoutubeUpload(criteria.isHasYoutubeUpload());
			existingCriteria.setHasOutsideRecording(criteria.isHasOutsideRecording());
			existingCriteria.setHasExternalCollaboration(criteria.isHasExternalCollaboration());
			existingCriteria.setHasGreenScreen(criteria.isHasGreenScreen());
			existingCriteria.setVersion(criteria.getVersion());
			currentSession.merge(existingCriteria);
		} else {
			throw new RuntimeException("Criteria with ID " + id + " not found.");
		}
	}

	@Transactional
	public List<Criteria> findAll() {
		Session currentSession = sessionFactory.getCurrentSession();
		return currentSession.createQuery("from Criteria", Criteria.class).getResultList();
	}

	@Transactional
	public List<Criteria> findBySchool(int schoolId) {
		Session currentSession = sessionFactory.getCurrentSession();
		return currentSession.createQuery("from Criteria where school_id = :schoolId", Criteria.class)
				.setParameter("schoolId", schoolId).getResultList();
	}

	@Transactional
	public List<Criteria> findAllWithSchools() {
		Session currentSession = sessionFactory.getCurrentSession();
		return currentSession.createQuery("from Criteria", Criteria.class).getResultList();
	}

	@Transactional
	public void approveCriteria(int id) {
		Session currentSession = sessionFactory.getCurrentSession();

		Criteria criteria = currentSession.get(Criteria.class, id);

		if (criteria != null) {
			criteria.setStatus("Approved"); // Set status to "Disapproved"
			currentSession.saveOrUpdate(criteria); // Save the updated entity
		}
	}

	@Transactional
	public void disapproveCriteria(int id) {
		Session currentSession = sessionFactory.getCurrentSession();

		Criteria criteria = currentSession.get(Criteria.class, id);

		if (criteria != null) {
			criteria.setStatus("Disapproved"); // Set status to "Disapproved"
			currentSession.saveOrUpdate(criteria); // Save the updated entity
		}
	}

	@Transactional
	public void setPendingCriteria(int id) {
		Session currentSession = sessionFactory.getCurrentSession();

		Criteria criteria = currentSession.get(Criteria.class, id);

		if (criteria != null) {
			criteria.setStatus("Pending"); // Set status to "Disapproved"
			currentSession.saveOrUpdate(criteria); // Save the updated entity
		}
	}

}
