package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.CommentDAO;
import model.Comment;

@WebServlet("/comment")

@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
				 maxFileSize=1024*1024*10,      // 10MB
				 maxRequestSize=1024*1024*50)   // 50MB

public class CommentServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private CommentDAO commentDAO;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		commentDAO = new CommentDAO();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Optional<Object> token = Optional.ofNullable(session.getAttribute("login"));


        if(token.isPresent()) {
    		request.setCharacterEncoding("UTF-8");
    		String action = request.getParameter("action");
    		if (action == null || action.equals("query")) {
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
		
		} else {
            response.sendRedirect("login.jsp");
        }
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
        comment.setItemTb(request.getParameter("itemTb").trim());
        comment.setItemId(Integer.parseInt(request.getParameter("itemId")));
        comment.setUserId(request.getParameter("userId"));
        comment.setRating(Integer.parseInt(request.getParameter("rating")));
        comment.setContent(request.getParameter("content").trim());

        ArrayList<Part> parts = (ArrayList<Part>) request.getParts();
        ArrayList<InputStream> images = new ArrayList<>();
        
        InputStream is = null;
        for (int i = 0; i < parts.size(); i++) {
        	if (parts.get(i).getContentType() != null && parts.get(i).getContentType().startsWith("image") ) {
            	is = parts.get(i).getInputStream();
            	images.add(is);
        	}
        }
        comment.setImageBytes(images);
        
        commentDAO.insert(comment);
        request.setAttribute("comment", comment);
        response.sendRedirect("comment");        
	}
	
	public void processUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Comment comment = new Comment();
        comment.setComId(Integer.parseInt(request.getParameter("comId")));
		comment.setItemTb(request.getParameter("itemTb"));
        comment.setItemId(Integer.parseInt(request.getParameter("itemId")));
        comment.setUserId(request.getParameter("userId"));
        comment.setRating(Integer.parseInt(request.getParameter("rating")));
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
