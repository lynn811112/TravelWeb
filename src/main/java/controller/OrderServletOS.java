package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.OrderDao;
import model.OrderBean;

/**
 * Servlet implementation class OrderServletOS
 */
@WebServlet("/OrderServletOS")
public class OrderServletOS extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDao orderDao;
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		orderDao = new OrderDao();   
    /**
     * @see HttpServlet#HttpServlet()
     */}

	 public OrderServletOS() {
        super();
        // TODO Auto-generated constructor stub
    }
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String looker=request.getParameter("name");
		System.out.println(looker);
		if (looker == null) {
			allQuery(request, response);
		} else if (looker.equals("new")) {
			newOrderForm(request, response);
		} else if (looker.equals("insert")) {
			insertOrder(request, response);
		} else if (looker.equals("edit")) {
			editOrderForm(request, response);
		} else if (looker.equals("update")) {
			updateUser(request, response);
		} else if (looker.equals("delete")) {
			deleteOreder(request, response);
		} 
		
		
		
	}

	public void allQuery(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<OrderBean> orderBeans = orderDao.selectAll();
		request.setAttribute("orderBeans", orderBeans);
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/order.jsp");
		requestDispatcher.forward(request, response);
	}
	
	public void newOrderForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("NewOrderForm.jsp");
	}
	
	public void insertOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			Timestamp timestamp = new Timestamp(new Date().getDate());
			String ordercategory =	request.getParameter("orderCategory");
			int userno = (Integer.parseInt(request.getParameter("userNo")));
			int orderTotal = (Integer.parseInt(request.getParameter("orderTotal")));
			int orderDiscount = (Integer.parseInt(request.getParameter("orderDiscount")));
			int couponId = (Integer.parseInt(request.getParameter("couponId")));
			int orderStatus = (Integer.parseInt(request.getParameter("orderStatus")));
			int orderPaystatus = (Integer.parseInt(request.getParameter("orderPayStatus")));
			OrderBean orderBean= new OrderBean(timestamp,ordercategory,userno,orderTotal,orderDiscount,couponId,orderStatus,orderPaystatus);
			orderDao.insert(orderBean);
			allQuery(request, response);
	}		

	 private void editOrderForm(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
			        int orderid = Integer.parseInt(request.getParameter("orderid"));
			        OrderBean orderBean = orderDao.selectOne(orderid);
			        RequestDispatcher dispatcher = request.getRequestDispatcher("NewOrderForm.jsp");
			        request.setAttribute("order", orderBean);
			        dispatcher.forward(request, response);

			    }
 
	 private void updateUser(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
			        OrderBean orderBean = new OrderBean();
			        orderBean.setOrderId(Integer.parseInt(request.getParameter("orderId")));
			        orderBean.setOrderCategory(request.getParameter("orderCategory"));
		 			orderBean.setUserNo(Integer.parseInt(request.getParameter("userNo")));
			        orderBean.setOrderTotal(Integer.parseInt(request.getParameter("orderTotal")));
			        orderBean.setOrderDiscount(Integer.parseInt(request.getParameter("orderDiscount")));
			        orderBean.setCouponId(Integer.parseInt(request.getParameter("couponId")));
			        orderBean.setOrderStatus(Integer.parseInt(request.getParameter("orderStatus")));
			        orderBean.setOrderPayStatus((Integer.parseInt(request.getParameter("orderPayStatus"))));
			        orderDao.update(orderBean);
			        allQuery(request, response);
			    }
	 private void deleteOreder(HttpServletRequest request, HttpServletResponse response)
			    throws IOException, ServletException {
			        int orderid = Integer.parseInt(request.getParameter("orderid"));
			        orderDao.delete(orderid);
			        allQuery(request, response);
	 }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doGet(request, response);
	}


}
