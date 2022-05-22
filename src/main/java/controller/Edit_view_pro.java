package controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.view_pro_Dao;

@WebServlet("/Edit_view_pro")
public class Edit_view_pro extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>更新商品資訊</h1>");
		String sid = request.getParameter("prod_no");
		int prod_no = Integer.parseInt(sid);
		
		model.view_pro p = view_pro_Dao.selectOne(prod_no);

		RequestDispatcher dispatcher = request.getRequestDispatcher("insertView.jsp");
		request.setAttribute("view_pro", p);

		//取得營業日勾選狀態
		dispatcher.forward(request, response);

	}

	// 收集表單信息並將修改更新到數據庫
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();

		String prod_no = request.getParameter("prod_no");
		String prod_name = request.getParameter("prod_name");
		String prod_Intro = request.getParameter("prod_Intro");
		String open_time = request.getParameter("open_time");
		String end_time = request.getParameter("end_time");
		String phone = request.getParameter("phone");
		String Country = request.getParameter("Country");
		String City = request.getParameter("City");
		String Location = request.getParameter("Location");
		String address = request.getParameter("address");
		String priceStr = request.getParameter("price");
		//	String add = request.getParameter("price");
		//	int price = Integer.parseInt(add);
		//	String image = request.getParameter("image");
		//	String image_Intro = request.getParameter("image_Intro");
		
		StringBuilder sb = new StringBuilder();
		for(String key : request.getParameterMap().keySet()) {
			if(key.contains("week")) {
				sb.append(key.substring(4)).append(',');
			}
		}
		String open_week =  sb.length() > 0 ? sb.substring(0, sb.length()-1) : "" ;
		System.out.println("open_week->"+open_week);
//		轉碼問題	debug	
		for (String key : request.getParameterMap().keySet()) {
			System.out.println("KEY:"+key+",VALUE:"+request.getParameter(key));
		} 
		int price = Integer.parseInt(priceStr);
//		byte[] image = request.getParameter("image").getBytes("UTF-8");
//		String image_Intro = request.getParameter("image_Intro");
		
		
		model.view_pro p = new model.view_pro();
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		p.setProd_no(prod_no);
		p.setProd_name(prod_name);
		p.setProd_Intro(prod_Intro);
//		p.setOpen_week(rs.getString("open_week"));
		p.setOpen_week(open_week);
		p.setOpen_time(open_time);
		p.setEnd_time(end_time);
//		p.setOpen_time(rs.getString("open_time"));
//		p.setEnd_time(rs.getString("end_time"));
//		p.setOpen_date(formatter.parse( (open_date));
//		p.setEnd_time(Time.parse(request.getParameter(phone_no)));
		p.setPhone(phone);
		p.setCountry(Country);
		p.setCity(City);
		p.setLocation(Location);
		p.setAddress(address);
		p.setPrice(price);
//		p.setImage(image);
//		p.setImage_Intro(image_Intro);

		int status = view_pro_Dao.update(p);
		if (status > 0) {
			response.sendRedirect("View_pro");
//			request.getRequestDispatcher("Travel_web.jsp").include(request, response);
		} else {
			out.println("對不起更新信息失敗！");
		}
		out.close();
	}
}
