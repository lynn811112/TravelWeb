package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.sql.DataSource;

import dao.MemberDAO;
import model.JdbcData;
/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberDAO memberDAO;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		memberDAO = new MemberDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		DataSource ds = null;
//	    InitialContext ctxt = null;
//	    Connection conn = null;
//	    HttpSession session = request.getSession(true);
//		String action = request.getParameter("action");
//		String action = request.getServletPath();
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(true);
		String action = request.getParameter("action");
	    
	    
	    
	     	if (action == null) {
				processQuery(request, response);
			} else if (action.equals("cancel")) {
				processQuery(request, response);
			} else if (action.equals("new")) {
				showNewForm(request, response);
			}else if (action.equals("insert")) {
				try {
					processInsert(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (action.equals("edit")) {
				showEditForm(request, response);
			} else if (action.equals("update")) {
				try {
					processUpdate(request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if (action.equals("delete")) {
				processDelete(request, response);
			} 
	   
	    
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		try {
			doGet(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

	public void processQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<JdbcData> memberDatas = memberDAO.selectAll();
		request.setAttribute("memberDatas", memberDatas);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/MemberData.jsp");
		requestDispatcher.forward(request, response);
	}
	
	

	public void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/MemberData-insert.jsp");
		requestDispatcher.forward(request, response);
	}
	
	

	public void processInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
		
		
		String email = request.getParameter("email");
		String ch_name = request.getParameter("ch_name");
		String en_name = request.getParameter("en_name");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String city = request.getParameter("city");
		String location = request.getParameter("location");
		String address = request.getParameter("address");
		
		JdbcData newmember= new JdbcData(email, ch_name, en_name, password, gender, birthday, phone, city, location, address);
		memberDAO.insert(newmember);
		
//		ArrayList<Part> parts = (ArrayList<Part>) request.getParts();
//		ArrayList<InputStream> images = new ArrayList<>();
//		InputStream is = null;
//		for (int i = 0; i < parts.size(); i++) {
//			if (parts.get(i).getContentType() != null) {
//				is = parts.get(i).getInputStream();
//				images.add(is);
//			}
//		}
//		memData.setImage((Blob) images);
//		request.setAttribute("memberDatas", newmember);
		response.sendRedirect("member");
//		request.getRequestDispatcher("/MemberData-insert.jsp").forward(request, response);
		System.out.println("新增成功");
	}
	

	public void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		JdbcData updateData = memberDAO.selectOne(user_no);
//		JdbcData updateData = memberDAO.selectOne(Integer.parseInt(request.getParameter("UpdateNo")));

		request.setAttribute("updateData", updateData);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/MemberData-edit.jsp");
		dispatcher.forward(request, response);
	}
	
	
	
	public void processUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		String email = request.getParameter("email");
		String ch_name = request.getParameter("ch_name");
		String en_name = request.getParameter("en_name");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String birthday = request.getParameter("birthday");
		String phone = request.getParameter("phone");
		String city = request.getParameter("city");
		String location = request.getParameter("location");
		String address = request.getParameter("address");
		
		JdbcData update_member= new JdbcData(user_no, email, ch_name, en_name, password, gender, birthday, phone, city, location, address);

//		ArrayList<Part> parts = (ArrayList<Part>) request.getParts();
//		ArrayList<InputStream> images = new ArrayList<>();
//
//		InputStream is = null;
//		for (int i = 0; i < parts.size(); i++) {
//			if (parts.get(i).getContentType() != null) {
//				is = parts.get(i).getInputStream();
//				images.add(is);
//			}
//		}
//		memData.setImage((Blob) images);
		memberDAO.update(update_member);
//		JdbcData updateData = memberDAO.selectOne(Integer.parseInt(request.getParameter("UpdateNo")));
//		request.setAttribute("updateData", updateData);
		response.sendRedirect("member");    
		System.out.println("Check");
		
	}
	
	
	

	public void processDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		memberDAO.delete(user_no);
		response.sendRedirect("member");
	}
	
	

}
