package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;

import dao.CommentDAO;
import model.Comment;

@WebServlet("/comment")
public class CommentServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private CommentDAO commentDAO;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		commentDAO = new CommentDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		String action = request.getParameter("action");
		System.out.println(action);
		if (action == null) {
			processQuery(request, response);
		} else if (action.equals("new")) {
			showNewForm(request, response);
		} else if (action.equals("insert")) {
			processInsert(request, response);
		} else if (action.equals("edit")) {
			showEditForm(request, response);
		} else if (action.equals("update")) {
			processUpdate(request, response);
		} else if (action.equals("delete")) {
			processDelete(request, response);
		} 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doGet(request, response);
	}
	
	

	public void processQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Comment> comments = commentDAO.selectAll();
		request.setAttribute("comments", comments);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/comment.jsp");
		requestDispatcher.forward(request, response);
	}

	public void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("comment-insert.jsp");
	}
	
	public void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comId = Integer.parseInt(request.getParameter("comId"));
		Comment comment = commentDAO.selectOne(comId);
        request.setAttribute("comment", comment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment-update.jsp");
        dispatcher.forward(request, response);
	}
	
	public void processInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Comment comment = new Comment();
        comment.setItemTb(request.getParameter("itemTb"));
        comment.setItemId(Integer.parseInt(request.getParameter("itemId")));
        // comment.setOrderId();
        comment.setUserId(Integer.parseInt(request.getParameter("userId")));
        comment.setRate(Integer.parseInt(request.getParameter("rate")));
        comment.setContent(request.getParameter("content"));
        
        commentDAO.insert(comment);
        request.setAttribute("comment", comment);
        response.sendRedirect("comment");        
	}
	
	public void processUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Comment comment = new Comment();
        comment.setComId(Integer.parseInt(request.getParameter("comId")));
		comment.setItemTb(request.getParameter("itemTb"));
        comment.setItemId(Integer.parseInt(request.getParameter("itemId")));
        comment.setUserId(Integer.parseInt(request.getParameter("userId")));
        comment.setRate(Integer.parseInt(request.getParameter("rate")));
        comment.setContent(request.getParameter("content"));
        
        commentDAO.update(comment);
        request.setAttribute("comment", comment);
        response.sendRedirect("comment");        
	}
	

	public void processDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int comId = Integer.parseInt(request.getParameter("comId"));
		commentDAO.delete(comId);
		response.sendRedirect("comment");
	}

}
