package controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
				HttpSession session = request.getSession(true);
				session.setAttribute("login", employee);
				request.setAttribute("user", employee);
				request.setAttribute("isLoggedIn", isLoggedIn);
				request.getRequestDispatcher("/index").forward(request, response);
			} else {
				System.out.println("此ID存在但密碼不正確");
				request.setAttribute("isLoggedIn", isLoggedIn);
				request.getRequestDispatcher("/login.jsp").forward(request, response);	
			}
		} else {
			System.out.println("員工資料找不到此ID");
			request.setAttribute("isLoggedIn", isLoggedIn);
			request.getRequestDispatcher("/login.jsp").forward(request, response);	
		}

		
	}

}
