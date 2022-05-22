package dao;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controller.View_pro;
import model.view_pro;
import util.DBConnection;

public class view_pro_Dao {

	private static String tbName = "view_pro";

	public static Connection getConnection() {
		Connection con = null;
		try {
			con = DBConnection.getConnection();
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;

	}

	public static int save(view_pro p) {
		int status = 0;
		try {
			Connection con = DBConnection.getConnection();
			String sql = "INSERT INTO " + tbName
					+ "(prod_name,prod_Intro,open_week,open_time,end_time,phone,Country,City,Location,address,price) values (?,?,?,?,?,?,?,?,?,?,?)";
//			,image,image_Intro ,?,?
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, p.getProd_name());
			ps.setString(2, p.getProd_Intro());
			ps.setString(3, p.getOpen_week());
			ps.setString(4, p.getOpen_time());
			ps.setString(5, p.getEnd_time());
			ps.setString(6, p.getPhone());
			ps.setString(7, p.getCountry());
			ps.setString(8, p.getCity());
			ps.setString(9, p.getLocation());
			ps.setString(10, p.getAddress());
			ps.setInt(11, p.getPrice());
//			ps.setBytes(12, p.getImage());
//			ps.setString(13, p.getImage_Intro());

			status = ps.executeUpdate();
			
			ps.close();
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return status;
	}

	public static int update(view_pro p) {
		int status = 0;
		try {
			String sql = "UPDATE " + tbName
					+ " SET prod_name=?,prod_Intro=?,open_week=?,open_time=?,end_time=?,phone=?,City=?,Location=?,address=?,price=? where prod_no=?";
//			,image=?,image_Intro=?
			Connection con = view_pro_Dao.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, p.getProd_name());
			ps.setString(2, p.getProd_Intro());
			ps.setString(3, p.getOpen_week());
			ps.setString(4, p.getOpen_time());
			ps.setString(5, p.getEnd_time());
			ps.setString(6, p.getPhone());
			ps.setString(7, p.getCity());
			ps.setString(8, p.getLocation());
			ps.setString(9, p.getAddress());
			ps.setInt(10, p.getPrice());
			ps.setString(11, p.getProd_no());
//			ps.setBytes(11, p.getImage());
//			ps.setString(12, p.getImage_Intro());

			status = ps.executeUpdate();

			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return status;
	}

	public static int delete(int prod_no) {
		int status = 0;
		try {
			String sql = "DELETE FROM " + tbName + " WHERE prod_no=?";
			Connection con = view_pro_Dao.getConnection();
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, prod_no);
			status = ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public static view_pro selectOne(int prod_no) {
		view_pro p = new view_pro();
		try {
			Connection con = view_pro_Dao.getConnection();
			String sql = "SELECT * FROM " + tbName + " WHERE prod_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, prod_no);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setProd_no(rs.getString("prod_no"));
				p.setProd_name(rs.getString("prod_name"));
				p.setProd_Intro(rs.getString("prod_Intro"));
				p.setOpen_week(rs.getString("open_week"));
				p.setOpen_time(rs.getString("open_time"));
				p.setEnd_time(rs.getString("end_time"));
				p.setPhone(rs.getString("phone"));
				p.setCountry(rs.getString("Country"));
				p.setCity(rs.getString("City"));
				p.setLocation(rs.getString("Location"));
				p.setAddress(rs.getString("address"));
				p.setPrice(rs.getInt("price"));
//				Blob blob = rs.getBlob("image");
//				byte[] data = blob.getBytes(1, (int) blob.length());
//				p.setImage(data);
//				p.setImage_Intro(rs.getString("image_Intro"));
//				comImage.setComImage(data);
//				p.setNew_date(rs.getDate("new_date"));
//				p.setImg_id(rs.getString("prod_Intro"));
//				p.setEmp_id(rs.getString("emp_id"));
//				p.setEmp_name(rs.getString("emp_name"));
//				p.setTag_no(rs.getString("tag_no"));
//				p.setTag_name(rs.getString("tag_name"));
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return p;
	}

	public static List<view_pro> selectAll() {
		List<view_pro> list = new ArrayList<view_pro>();
		
		try {
			Connection con = view_pro_Dao.getConnection();
			String sql = "SELECT * FROM " + tbName +" ORDER BY prod_no";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				view_pro p = new view_pro();
				p.setProd_no(rs.getString("prod_no"));
				p.setProd_name(rs.getString("prod_name"));
				p.setProd_Intro(rs.getString("prod_Intro"));
				p.setImg_id(rs.getString("prod_Intro"));
				p.setOpen_week(rs.getString("open_week"));
				p.setOpen_time(rs.getString("open_time"));
				p.setEnd_time(rs.getString("end_time"));
				p.setPhone(rs.getString("phone"));
				p.setCountry(rs.getString("Country"));
				p.setCity(rs.getString("City"));
				p.setLocation(rs.getString("Location"));
				p.setAddress(rs.getString("address"));
//目前無值，直接放商品列表會報錯
//				Blob blob = rs.getBlob("image");
//				byte[] data = blob.getBytes(1, (int) blob.length());
//				p.setImage(data);
//				p.setImage_Intro(rs.getString("image_Intro"));
				p.setPrice(rs.getInt("price"));
				list.add(p);
//				p.setImage(rs.getBlob("image"));
//				p.setNew_date(rs.getDate("new_date"));
//				p.setEmp_id(rs.getString("emp_id"));
//				p.setEmp_name(rs.getString("emp_name"));
//				p.setTag_no(rs.getString("tag_no"));
//				p.setTag_name(rs.getString("tag_name"));
			}
			con.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}

		return list;
	}
	
	public int selectCount() {
		int count = 0;
		try {
			String SELECT_COUNT_SQL = "SELECT count(*) FROM " + tbName ;
			Connection conn = DBConnection.getConnectionObject();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(SELECT_COUNT_SQL);
			while (rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return count;
		
	}


}
