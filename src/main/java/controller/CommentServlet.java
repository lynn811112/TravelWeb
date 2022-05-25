package controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
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
import dao.Fun_HotelDAO;
import dao.view_pro_Dao;
import model.Comment;
import model.Hotel;
import model.view_pro;

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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {
        HttpSession session = request.getSession();
        Optional<Object> token = Optional.ofNullable(session.getAttribute("login"));

        if(token.isPresent()) { // 判斷client端有無token
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
		Fun_HotelDAO funDAO = new Fun_HotelDAO();
		List<Hotel> hotels = funDAO.selectAll();
		List<view_pro> listView_pro = view_pro_Dao.selectAll();
		request.setAttribute("hotels", hotels);
		request.setAttribute("tickets", listView_pro);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("comment-insert.jsp");
		requestDispatcher.forward(request, response);
	}
	
	public void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int comId = Integer.parseInt(request.getParameter("comId"));
		Comment comment = commentDAO.selectOne(comId);
        request.setAttribute("comment", comment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("comment-update.jsp");
        dispatcher.forward(request, response);
	}
	
	// 呼叫DAO執行Insert
	public void processInsert(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
        Comment comment = new Comment();
        comment.setItemTb(request.getParameter("itemTb").trim());
        comment.setItemId(Integer.parseInt(request.getParameter("itemId")));
        comment.setUserId(request.getParameter("userId").trim());
        comment.setRating(Integer.parseInt(request.getParameter("rating")));
        comment.setContent(request.getParameter("content").trim());
        // 以.getParts()將圖片檔以二進位制放到資料庫
        ArrayList<Part> parts = (ArrayList<Part>) request.getParts();
        ArrayList<InputStream> images = new ArrayList<>();
        InputStream is = null;
        for (int i = 0; i < parts.size(); i++) {
        	// ContentType()為image 
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
        comment.setUserId(request.getParameter("userId").trim());
        comment.setRating(Integer.parseInt(request.getParameter("rating")));
        comment.setContent(request.getParameter("content").trim());
        
		String[] imagesFromDBArr = request.getParameterValues("imagesFromDB");

        ArrayList<Part> parts = (ArrayList<Part>) request.getParts();
        ArrayList<InputStream> images = new ArrayList<>();
        InputStream is = null;
        for (int i = 0; i < parts.size(); i++) {
        	// ContentType()為image 
        	if (parts.get(i).getContentType() != null && parts.get(i).getContentType().startsWith("image") ) {
            	is = parts.get(i).getInputStream();
            	images.add(is);
        	}
        }
        comment.setImageBytes(images);
        
		if (imagesFromDBArr!= null || is != null) {
			if (imagesFromDBArr!= null) {
		        List<String> imagesFromDBList = Arrays.asList(imagesFromDBArr);
		        if (imagesFromDBList.contains("image1")){
		        	comment.setImage1(", image1=?");
		        } else {
		    		comment.setImage1("");
		    	}
		        if (imagesFromDBList.contains("image2")){
		        	comment.setImage2(", image2=?");
		        } else {
		    		comment.setImage2("");
		    	}		        
		        if (imagesFromDBList.contains("image3")){
		        	comment.setImage3(", image3=?");
		        } else {
		    		comment.setImage3("");
		    	}
				
			} else {
				comment.setImage1("");
				comment.setImage2("");
				comment.setImage3("");
			}
	        commentDAO.updateWithImgs(comment);
	        
		} else {
			
			commentDAO.update(comment);
		}
        response.sendRedirect("comment");        
	}
	

	public void processDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int comId = Integer.parseInt(request.getParameter("comId"));
		commentDAO.delete(comId);
		response.sendRedirect("comment");
	}

}
