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

import dao.CommentDAO;
import model.Comment;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init() throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			CommentDAO commentDAO = new CommentDAO();
			request.setCharacterEncoding("UTF-8");
			
			switch (request.getParameter("action")) {
			case "query":
				processQuery(request, response, commentDAO);
				break;
			case "insert":
				processInsert(request, response, commentDAO);
				break;
				
			case "update":
//				processUpdate(request, response, commentDAO);
				break;
				
			default:
				break;
			}

//			if (request.getParameter("QUERY") != null) {
//				processQuery(request, response, commentDAO);
//			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Database Connection Error");
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doGet(request, response);
	}

	
	private void processQuery(HttpServletRequest request, HttpServletResponse response, CommentDAO commentDAO) throws SQLException, IOException {
		request.getParameter("comId");
		List<Comment> comments =  commentDAO.selectAll();
		request.setAttribute("comments", comments);
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/comment-list.jsp");
			requestDispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	private void processInsert(HttpServletRequest request, HttpServletResponse response, CommentDAO commentDAO) throws SQLException, IOException {
		request.getParameter("comId");
		List<Comment> comments =  commentDAO.selectAll();
		request.setAttribute("comments", comments);
        try {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/comment-insert.jsp");
			requestDispatcher.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
