package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.view_pro_Dao;
import model.view_pro;


@WebServlet("/View_pro")
public class View_pro extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public View_pro() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //response.setCharacterEncoding("UTF-8");
	        //response.setContentType("text/html;charset=UTF-8");
	        //request.setCharacterEncoding("UTF-8");
	        //PrintWriter out=response.getWriter();
			List<view_pro> listView_pro=view_pro_Dao.selectAll();
			
			StringBuilder sbOpen_week = new  StringBuilder();
			Map <String,String> weekNameMap = new HashMap();
			weekNameMap.put("1", "星期一");
			weekNameMap.put("2", "星期二");
			weekNameMap.put("3", "星期三");
			weekNameMap.put("4", "星期四");
			weekNameMap.put("5", "星期五");
			weekNameMap.put("6", "星期六");
			weekNameMap.put("7", "星期日");
			
			for (view_pro view :listView_pro) { //每筆record
				int i = 1;
				String Open_weekStr= view.getOpen_week()== null ? "" : view.getOpen_week();
				System.out.println("Open_weekStr ->"+ Open_weekStr);
				String [] Open_weekArr = Open_weekStr.split(",");
				for(String Open_week : Open_weekArr) {
					System.out.println("Open_week51 ->"+ Open_week);
					if("".equals(Open_week)) {
						break;
					}
					sbOpen_week.append(weekNameMap.get(Open_week));
					if(i%2==0) {
						sbOpen_week.append("<BR>");
					}else {
						sbOpen_week.append(","); 
					}
					i++;
				}
				String open_week =  sbOpen_week.length() > 0 ? sbOpen_week.substring(0, sbOpen_week.length()-1) : "" ;
				view.setOpen_week(open_week);
				sbOpen_week.setLength(0);
			}

			
			request.setAttribute("list", listView_pro);
		
	        RequestDispatcher dispatcher = request.getRequestDispatcher("View.jsp");
			dispatcher.forward(request, response);
	        
			
			
//			out.println("<a href='insertView.jsp'>添加新商品</a>");  
//	        out.println("<h1>商品列表</h1>");     
//	        out.print("<table border='1' width='100%'");  
//	        out.print("<tr><th>編號</th><th>商品名稱</th><th>商品簡介</th><th>營業日期</th><th>營業起始時間</th><th>營業結束時間</th><th>電話</th><th>國家</th><th>城市</th><th>地區</th><th>地址</th><th>票價</th></tr>");  
//	        <th>圖片檔案</th><th>圖片簡介</th>
//	        for(view_pro p:list){  
//	         out.print("<tr><td>"+p.getProd_no()+"</td><td>"+p.getProd_name()+"</td><td>"+p.getProd_Intro()+"</td><td>"+p.getOpen_week()+"</td><td>"+p.getOpen_time() +"</td><td>"+p.getEnd_time()+"</td><td>"+p.getPhone()+"</td><td>"+ p.getCountry()+"</td><td>"+p.getCity()+"</td><td>"+p.getLocation()+"</td><td>"+p.getAddress()+"</td><td>"+p.getPrice()+"</td><td><a href='Edit_view_pro?prod_no="+p.getProd_no()+"'>編輯</a> | <a href='Delete_view_pro?prod_no="+p.getProd_no()+"' onClick=\"return confirm('確定要刪除嗎？')\">刪除</a></td></tr>"); 
////	         +p.getImage()+"</td><td>"+p.getImage_Intro()+
//	        } 
//	        out.print("</table>");  
//	        out.close();  
//		
	}

}
