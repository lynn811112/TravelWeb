package controller;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CommentDAO;
import dao.Fun_HotelDAO;
import dao.MemberDAO;
import dao.view_pro_Dao;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IndexServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		HttpSession session = request.getSession();
		Optional<Object> token = Optional.ofNullable(session.getAttribute("login"));

		if (token.isPresent()) {
			CommentDAO commentDAO = new CommentDAO();
			Fun_HotelDAO hotelDAO = new Fun_HotelDAO();
			MemberDAO memberDAO = new MemberDAO();
			view_pro_Dao productDAO = new view_pro_Dao();
			request.setAttribute("commentCount", commentDAO.selectCount());
			request.setAttribute("hotelCount", hotelDAO.selectCount());
			request.setAttribute("memberCount", memberDAO.selectCount());
			request.setAttribute("productCount", productDAO.selectCount());

			RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
			requestDispatcher.forward(request, response);
		} else {
            response.sendRedirect("login.jsp");
        }

	}

}
