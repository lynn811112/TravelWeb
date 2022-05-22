package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.Fun_HotelDAO;
import model.Hotel;

@WebServlet("/findItem")
public class FindItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FindItemServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String itemTb = request.getParameter("itemTb");
		int itemId = Integer.parseInt(request.getParameter("itemId"));
		JSONObject jsonObj = null;
		
		switch (itemTb) {
		case "hotel":
			jsonObj = queryHotel(itemId);
			break;
		case "ticket":
//			jsonObj = queryTicket(itemId);
				
		default:
			break;
		}

		response.setContentType("application/json;charset=UTF-8");
		response.getWriter().print(jsonObj);
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
			hotelInfo.put("itemName", hotel.getHotel_name());
			hotelInfo.put("price", hotel.getPrice());
			hotelInfo.put("owner", hotel.getBoss_name());
			hotelInfo.put("phone", hotel.getPhone());
			jsonObj = new JSONObject(hotelInfo);
		}
		return jsonObj;

	}

}
