package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ComImageDAO;
import dao.CommentDAO;
import model.Comment;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
	private static CommentDAO commentDAO;
	private static ComImageDAO comImageDAO;
	
	public void init() throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try {
//			InitialContext ctxt = new InitialContext();
//			ds = (DataSource) ctxt.lookup("java:comp/env/jdbc/TravelWebDB");
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}

		try {
			commentDAO = new CommentDAO();
			request.setCharacterEncoding("UTF-8");

			if (request.getParameter("QUERY") != null) {
				processQuery(request, response, commentDAO);
			}

			if (request.getParameter("UPDATE") != null) {
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Database Connection Error");
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doGet(request, response);
	}

//	private void listComment(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		List<Comment> comments = commentDAO.selectAll();
//		request.setAttribute("listUser", comments);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("comment-list.jsp");
//		dispatcher.forward(request, response);
//	}

	private void processQuery(HttpServletRequest request, HttpServletResponse response, CommentDAO commentDAO) throws SQLException, IOException {
		String comId = request.getParameter("comId");
		List<Comment> comments =  commentDAO.selectAll();
		request.setAttribute("comments", comments);

        try {
            String page = "/comment-list.jsp";
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
			requestDispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
