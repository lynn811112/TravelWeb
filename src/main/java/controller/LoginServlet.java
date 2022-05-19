package controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EmployeeDAO;
import model.Employee;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public LoginServlet() {
        super();
        
    }

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("email").trim();
		String password = request.getParameter("password");		
		EmployeeDAO emplyeeDAO = new EmployeeDAO();
		Employee employee = emplyeeDAO.selectByEmail(userId);
		Boolean isLoggedIn = false;
		if (employee != null) {
			if (userId != null && password != null && password.equals(employee.getPassword())) {
				isLoggedIn = true;
				request.setAttribute("user", employee);
				request.setAttribute("isLoggedIn", isLoggedIn);
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} else {
				System.out.println("Id is found but incorrect password");
				request.setAttribute("isLoggedIn", isLoggedIn);
				request.getRequestDispatcher("/login.jsp").forward(request, response);	
			}
		} else {
			System.out.println("Can not find this Id");
			request.setAttribute("isLoggedIn", isLoggedIn);
			request.getRequestDispatcher("/login.jsp").forward(request, response);	
		}

		
	}

}
