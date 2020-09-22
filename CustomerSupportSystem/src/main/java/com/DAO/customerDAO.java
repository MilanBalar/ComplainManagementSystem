package com.DAO;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.bean.Complain;
import com.bean.Customer;

public class customerDAO {

	public static Session createSession() {
		SessionFactory sessionFactory = null;
		Session session = null;
		sessionFactory = new Configuration().configure().buildSessionFactory();
		session = sessionFactory.openSession();
		return session;
	}

	public static void insertdata(Customer c) {
		Session session = customerDAO.createSession();
		session.beginTransaction();
		session.save(c);
		session.getTransaction().commit();
		session.close();
	}

	public static Customer getDatabyEmail(String email) {
		Session session = customerDAO.createSession();
		session.beginTransaction();
		Query q = session.createQuery("from Customer where cemail=:em");
		q.setParameter("em", email);
		Customer c = (Customer) q.getSingleResult();
		return c;
	}

	public static List<Complain> getAllDetails(String email) {
		List<Complain> co = null;
		Session session = customerDAO.createSession();
		session.beginTransaction();
		Query<Complain> q = session.createQuery("from Complain where cmemail=:em", Complain.class);
		q.setParameter("em", email);
		co = q.getResultList();
		return co;
	}

	public static void insertComplainData(Complain c) {
		Session session = customerDAO.createSession();
		session.beginTransaction();
		session.save(c);
		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings("unchecked")
	public static List<Complain> getAllComplainData() {
		Session session = customerDAO.createSession();
		List<Complain> co = session.createQuery("from Complain").list();
		return co;
	}

	// fetch single data base on complain id
	public static Complain getComplainById(Long id) {
		Session session = customerDAO.createSession();
		session.beginTransaction();
		Complain c = session.get(Complain.class, id);
		// session.getTransaction().commit();
		session.flush();
		return c;
	}
	// update of Complain data from Admin Side

	public static void updateComplain(Complain c) {
		Session session = customerDAO.createSession();
		session.beginTransaction();
		session.update(c);

		session.getTransaction().commit();
		session.close();

	}

	public static void deleteComplainbyId(Long cmid) {
		Session session = customerDAO.createSession();
		session.beginTransaction();
		Complain c = session.get(Complain.class, cmid);
		session.delete(c);
		session.getTransaction().commit();
		session.close();

	}
}
