package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.view_pro_Dao;


@WebServlet("/Delete_view_pro")
public class Delete_view_pro extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String prod_noStr = request.getParameter("prod_no");
		for (String key : request.getParameterMap().keySet()) {
			System.out.println("KEY:"+key+",VALUE:"+request.getParameter(key));
		}
        int prod_no = Integer.parseInt(prod_noStr);
        view_pro_Dao.delete(prod_no);
        response.sendRedirect("View_pro");
	}
}
