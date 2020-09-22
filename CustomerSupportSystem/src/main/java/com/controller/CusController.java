package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.customerDAO;
import com.bean.Complain;
import com.bean.Customer;

/**
 * Servlet implementation class CusController
 */
public class CusController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("SignUp")) {
			response.sendRedirect("registration.jsp");
		} else if (action.equalsIgnoreCase("Login")) {
			response.sendRedirect("login.jsp");
		} else if (action.equalsIgnoreCase("Register"))// New Customer Registration
		{
			Customer c = new Customer();
			c.setCname(request.getParameter("cname"));
			c.setCemail(request.getParameter("cemail"));
			c.setCcontact(Long.parseLong(request.getParameter("ccontact")));
			c.setCgender(request.getParameter("cgender"));
			c.setCpassword(request.getParameter("cpassword"));
			c.setCcity(request.getParameter("ccity"));
			customerDAO.insertdata(c);
			response.sendRedirect("login.jsp");

		} else if (action.equalsIgnoreCase("SignIn")) // Login of the Application
		{
			String user = request.getParameter("user");
			String email = request.getParameter("cemail");
			String password = request.getParameter("cpassword");

			if (user.equals("Administrator")) {
				if (email.equals("milanbalar2000@gmail.com") && password.equals("admin")) {
					response.sendRedirect("thanks.jsp");
				} else {
					out.println("Admin Credentials are Invalid");
					request.getRequestDispatcher("login.jsp").include(request, response);
				}
			} else if (user.equals("Customer")) {
				Customer c = customerDAO.getDatabyEmail(email);
				String cname = c.getCname();
				Long cid = c.getCid();
				System.out.println(cname);
				if (c.getCpassword().equals(password)) {
					request.setAttribute("cname", cname);
					request.setAttribute("cid", cid);
					request.setAttribute("email", email);
					request.getRequestDispatcher("complain.jsp").forward(request, response);
				} else {
					out.println("Invalid Email or Password");
					request.getRequestDispatcher("login.jsp").include(request, response);
				}
			}
		} else if (action.equalsIgnoreCase("Complain")) // Complain Page
		{
			// Long id = 0L;
			Customer c = new Customer();
			Long id = Long.parseLong(request.getParameter("cid"));
			System.out.println(id);
			request.setAttribute("id", id);
			c.setCid(id);
			Complain com = new Complain();
			String email = request.getParameter("cmemail");
			com.setCdate(request.getParameter("comdate"));
			com.setComptype(request.getParameter("comptype"));
			com.setCompdesc(request.getParameter("compdesc"));
			com.setCmemail(email);
			com.setCustomer(c);
			customerDAO.insertComplainData(com);
			if (id > 0L) {
				// request.setAttribute("id", id);
				request.setAttribute("email", email);
				request.getRequestDispatcher("complainView.jsp").forward(request, response);
			}

		} else if (action.equalsIgnoreCase("ViewAll")) // View all complain from complain.jsp page
		{
			Long id = Long.parseLong(request.getParameter("cid"));
			String email = request.getParameter("email");
			request.setAttribute("id", id);
			request.setAttribute("email", email);
			request.getRequestDispatcher("complainView.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("update")) {
			request.getRequestDispatcher("updateComplain.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("edit")) {
			Customer cu = new Customer();
			cu.setCid(Long.parseLong(request.getParameter("cust_id")));
			Complain c = new Complain();
			c.setCmid(Long.parseLong(request.getParameter("cmid")));
			c.setCustomer(cu);
			c.setCmemail(request.getParameter("cmemail"));
			c.setCdate(request.getParameter("comdate"));
			c.setComptype(request.getParameter("comptype"));
			c.setCompdesc(request.getParameter("compdesc"));
			c.setRemarks(request.getParameter("cremarks"));
			customerDAO.updateComplain(c);
			response.sendRedirect("thanks.jsp");
		} else if (action.equalsIgnoreCase("delete")) {
			Long cmid = Long.parseLong(request.getParameter("cmid"));
			customerDAO.deleteComplainbyId(cmid);
			response.sendRedirect("thanks.jsp");
		} else if (action.equalsIgnoreCase("AddComplain")) {
			out.println("Welcome Back");
			Long id = Long.parseLong(request.getParameter("cid"));
			String email = (String) request.getParameter("cmemail");
			request.setAttribute("cid", id);
			request.setAttribute("email", email);
			request.getRequestDispatcher("complain.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("Remove")) {
			String email = request.getParameter("cmemail");
			Long cmid = Long.parseLong(request.getParameter("cmid"));
			customerDAO.deleteComplainbyId(cmid);
			request.setAttribute("email", email);
			request.getRequestDispatcher("complainView.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("modify")) {

			request.getRequestDispatcher("modifyCustomerComplain.jsp").forward(request, response);
		} else if (action.equalsIgnoreCase("UpdateComplain")) {

			Long cmid = Long.parseLong(request.getParameter("cmid"));
			Long id = Long.parseLong(request.getParameter("cid"));
			String email = (String) request.getParameter("cmemail");
			request.setAttribute("cid", id);
			request.setAttribute("email", email);
			request.setAttribute("cmid", cmid);

			Customer cu = new Customer();
			cu.setCid(id);
			Complain c = new Complain();
			c.setCmid(cmid);
			c.setCustomer(cu);
			c.setCmemail(email);
			c.setCdate(request.getParameter("comdate"));
			c.setComptype(request.getParameter("comptype"));
			c.setCompdesc(request.getParameter("compdesc"));
			c.setRemarks(request.getParameter("cremarks"));
			customerDAO.updateComplain(c);
			request.getRequestDispatcher("complainView.jsp").forward(request, response);
		}
	}
}
