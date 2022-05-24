package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.json.simple.JSONObject;

import com.google.gson.Gson;

import dao.Fun_HotelDAO;
import dao.view_pro_Dao;
import model.Hotel;
import model.view_pro;
import net.sf.json.JSONArray;

@WebServlet("/findItem")
public class FindItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindItemServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String select = request.getParameter("select");
		String itemTb = request.getParameter("itemTb");
		int itemId = 0;
		if (itemTb!=null && request.getParameter("itemId")!= null) {
			itemId = Integer.parseInt(request.getParameter("itemId"));
			JSONObject jsonObj = null;
			switch (itemTb) {
			case "hotel": case "住宿":
				jsonObj = queryHotel(itemId);
				break;
			case "ticket": case "行程":
				jsonObj = queryTicket(itemId);
				break;
			default:
				break;
			}
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().print(jsonObj);
		}

		if (select != null) {
			JSONArray jsonArray = null;
			switch (select) {
			case "tickets":
				jsonArray = queryTickets();
				break;
			case "hotels":
				jsonArray = queryHotels();
				break;
			default:
				break;
			}
			response.setContentType("application/json;charset=UTF-8");
			response.getWriter().print(jsonArray);
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	public JSONObject queryHotel(int itemId) {
		Fun_HotelDAO hotelDAO = new Fun_HotelDAO();
		Hotel hotel = hotelDAO.findOrderByid(itemId);
		JSONObject jsonObj = null;
		if (hotel != null) {
			HashMap<String,Object> hotelInfo = new HashMap<String,Object>();
			hotelInfo.put("tableName", "住宿");
			hotelInfo.put("itemId", hotel.getId());
			hotelInfo.put("itemName", hotel.getHotel_name());
			hotelInfo.put("price", hotel.getPrice());
			hotelInfo.put("owner", hotel.getBoss_name());
			hotelInfo.put("phone", hotel.getPhone());
			jsonObj = new JSONObject(hotelInfo);
		}
		return jsonObj;
	}

	public JSONObject queryTicket(int itemId) {
		view_pro ticket = view_pro_Dao.selectOne(itemId);
		JSONObject jsonObj = null;
		if (ticket != null) {
			HashMap<String,Object> ticketInfo = new HashMap<String,Object>();
			ticketInfo.put("tableName", "行程");
			ticketInfo.put("itemId", ticket.getProd_no());
			ticketInfo.put("itemName", ticket.getProd_name());
			ticketInfo.put("price", ticket.getPrice());
			ticketInfo.put("phone", ticket.getPhone());
			ticketInfo.put("city", ticket.getCity());
			ticketInfo.put("district", ticket.getLocation());
			ticketInfo.put("address", ticket.getAddress());
			ticketInfo.put("info", ticket.getProd_Intro());
			jsonObj = new JSONObject(ticketInfo);
		}
		return jsonObj;
	}
	
	public JSONArray queryTickets() {
		List<view_pro> view_pros = view_pro_Dao.selectAll();
		JSONArray jsonArray = JSONArray.fromObject(view_pros);
		return jsonArray;
	}
	
	public JSONArray queryHotels() {
		Fun_HotelDAO hotelDAO = new Fun_HotelDAO();
		List<Hotel> hotels = hotelDAO.selectAll();
		JSONArray jsonArray = JSONArray.fromObject(hotels);
		return jsonArray;
	}
	
}
