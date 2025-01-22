// EquipmentDao_usingHibernate.java
package service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import entity.Equipment;

import java.util.ArrayList;
import java.util.List;

@Service
public class EquipmentDao_usingHibernate {
	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public Equipment findById(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		return currentSession.get(Equipment.class, id);
	}

	@Transactional
	public void save(Equipment equipment) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(equipment);
	}

	@Transactional
	public void update(int id, Equipment equipment) {
		Session currentSession = sessionFactory.getCurrentSession();
		Equipment existingEquipment = currentSession.get(Equipment.class, id);
		if (existingEquipment != null) {
			existingEquipment.setEquipmentName(equipment.getEquipmentName());
			existingEquipment.setQuantity(equipment.getQuantity());
			existingEquipment.setLastMaintenanceDate(equipment.getLastMaintenanceDate());
			existingEquipment.setImageUrl(equipment.getImageUrl());

			currentSession.merge(existingEquipment);
		}
	}

	@Transactional
	public void delete(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Equipment equipmentToDelete = currentSession.get(Equipment.class, id);
		if (equipmentToDelete != null) {
			currentSession.delete(equipmentToDelete);
		}
	}

	@Transactional
	public List<Equipment> findAll() {
		Session currentSession = sessionFactory.getCurrentSession();
		return currentSession.createQuery("from Equipment", Equipment.class).getResultList();

	}

	@Transactional
	public List<Equipment> findBySchoolId(int schoolId) {
		try (Session session = sessionFactory.openSession()) {
			return session.createQuery("FROM Equipment WHERE school.id = :schoolId", Equipment.class)
					.setParameter("schoolId", schoolId).list();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Transactional
	public void approveEquipment(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Equipment equipment = currentSession.get(Equipment.class, id);
		if (equipment != null) {
			equipment.setStatus("Approved"); // Set status to "Approved"
			currentSession.saveOrUpdate(equipment);
		}
	}

	@Transactional
	public void disapproveEquipment(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Equipment equipment = currentSession.get(Equipment.class, id);
		if (equipment != null) {
			equipment.setStatus("Disapproved"); // Set status to "Disapproved"
			currentSession.saveOrUpdate(equipment);
		}
	}

	@Transactional
	public void setPendingEquipment(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Equipment equipment = currentSession.get(Equipment.class, id);
		if (equipment != null) {
			equipment.setStatus("Pending"); // Set status to "Pending"
			currentSession.saveOrUpdate(equipment);
		}
	}

	@Transactional
	public List<Equipment> findApprovedEquipmentBySchoolId(int schoolId) {
		String hql = "FROM Equipment WHERE status = 'Approved' AND school.id = :schoolId";
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Equipment> query = currentSession.createQuery(hql, Equipment.class);
		query.setParameter("schoolId", schoolId);
		return query.getResultList();
	}

	// Add these methods to your EquipmentDao_usingHibernate class
	public List<Equipment> findBySchoolAndStatus(Integer schoolId, String status) {
		Session session = sessionFactory.getCurrentSession();
		try {
			String hql = "FROM Equipment e WHERE e.school.id = :schoolId AND e.status = :status";
			return session.createQuery(hql, Equipment.class).setParameter("schoolId", schoolId)
					.setParameter("status", status).list();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
	}

	public List<Equipment> findByStatus(String status) {
		Session session = sessionFactory.getCurrentSession();
		try {
			String hql = "FROM Equipment e WHERE e.status = :status";
			return session.createQuery(hql, Equipment.class).setParameter("status", status).list();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
	}

}
