package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.JdbcData;
import util.DBConnection;

public class MemberDAO implements DAO<JdbcData> {
	
	
	
	private static final String select_all = "SELECT * FROM member_data";
	private static final String select_one = "SELECT * FROM member_data WHERE user_no = ? ";
	private static final String SELECT_COUNT_SQL = "SELECT count(*) FROM member_data;";
	private static final String insert = "INSERT INTO member_data VALUES (?,?,?,?,?,?,?,?,?,?)";
	private static final String update = "UPDATE member_data SET email=?, ch_name=?, en_name=?, password=?, gender=?, birthday=?, phone=?, city=?, location=?, address=? WHERE user_no = ?";
	private static final String delete = "DELETE member_data WHERE user_no = ?";

	
	@Override
	public List<JdbcData> selectAll() {
//		Connection conn = DBconnection.getConnection();
		List<JdbcData> memData = new ArrayList<JdbcData>();
		  try {
			Connection conn = DBConnection.getConnection(); 
			PreparedStatement pstmt = conn.prepareStatement(select_all);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				int user_no = rs.getInt("user_no");
				String email = rs.getString("email");
				String ch_name = rs.getString("ch_name");
				String en_name = rs.getString("en_name");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				String birthday = rs.getString("birthday");
				String phone = rs.getString("phone");
				String city = rs.getString("city");
				String location = rs.getString("location");
				String address = rs.getString("address");
//		        Blob image = rs.getBlob(1);
//		        InputStream in = image.getBinaryStream();
//		        byte[] buf = new byte[1024];
//		        int len = 0;
//		        while ((len = in.read(buf)) != -1) {
//		        	System.out.println("成功執行");
//		            }
//		            in.close();
				memData.add(new JdbcData(user_no, email, ch_name, en_name, password, gender, birthday, phone, city, location, address));
			}
			rs.close();
			pstmt.close();
//			
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return memData;
	}

	
	
	@Override
	public JdbcData selectOne(int user_no) {
//		Connection conn = DBconnection.getConnection();
		JdbcData memData = null;
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(select_one);
			pstmt.setInt(1, user_no);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
//				JdbcData = new JdbcData(user_no, null, null, null, null, null, null, null, null, null, null, null);
//				memData.setUser_no(rs.getInt("user_no"));
				String email = rs.getString("email");
				String ch_name = rs.getString("ch_name");
				String en_name = rs.getString("en_name");
				String password = rs.getString("password");
				String gender = rs.getString("gender");
				String birthday = rs.getString("birthday");
				String phone = rs.getString("phone");
				String city = rs.getString("city");
				String location = rs.getString("location");
				String address = rs.getString("address");
//		        Blob image = rs.getBlob(1);
//		        InputStream in = image.getBinaryStream();
//		        byte[] buf = new byte[1024];
//		        int len = 0;
//		        while ((len = in.read(buf)) != -1) {
//		        	System.out.println("成功執行");
//		            }
//		            in.close();
				memData = new JdbcData(user_no, email, ch_name, en_name, password, gender, birthday, phone, city, location, address);
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return memData;
	}
	


	@Override
	public boolean insert(JdbcData J) {
		Connection conn = DBConnection.getConnection();
		boolean isInserted = false;
//		ResultSet rs;
//		String[] generatedCols = { "user_no" }; // 取得auto-generated的ID
		try {
//			conn = DBconnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(insert); // 要放進statement，才能回傳ID
			pstmt.setString(1, J.getEmail());
			pstmt.setString(2, J.getCh_name());
			pstmt.setString(3, J.getEn_name());
			pstmt.setString(4, J.getPassword());
			pstmt.setString(5, J.getGender());
			pstmt.setString(6, J.getBirthday());
			pstmt.setString(7, J.getPhone());
			pstmt.setString(8, J.getCity());
			pstmt.setString(9, J.getLocation());
			pstmt.setString(10, J.getAddress());
//			pstmt.setBlob(12, J.getImage());
			pstmt.executeUpdate();
//			rs = pstmt.getGeneratedKeys();
//			if (rs.next()) {
//				J.setUser_no(rs.getInt(1)); // 將回傳ID設為comment物件的ComId
//				isInserted = true;
//			}
//			rs.close();
//			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isInserted;
	}

	@Override
	public boolean update(JdbcData J) {
		Connection conn = DBConnection.getConnection();
		boolean isUpdated = false;
		try {
//			conn = DBconnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(update);
			pstmt.setString(1, J.getEmail());
			pstmt.setString(2, J.getCh_name());
			pstmt.setString(3, J.getEn_name());
			pstmt.setString(4, J.getPassword());
			pstmt.setString(5, J.getGender());
			pstmt.setString(6, J.getBirthday());
			pstmt.setString(7, J.getPhone());
			pstmt.setString(8, J.getCity());
			pstmt.setString(9, J.getLocation());
			pstmt.setString(10, J.getAddress());
			pstmt.setInt(11, J.getUser_no());
			isUpdated = pstmt.executeUpdate() >0;
			
//			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isUpdated;
	}
	
	@Override
	public boolean delete(int user_no) {
		Connection conn = DBConnection.getConnection();
		boolean isDeleted = false;
		PreparedStatement pstmt;
		int count;
		try {
//			conn = DBconnection.getConnection();
			pstmt = conn.prepareStatement(delete);
			pstmt.setInt(1, user_no);
			count = pstmt.executeUpdate();
			if (count > 0) isDeleted = true;
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isDeleted;
	}

	
	public int selectCount() {
		int count = 0;
		try {
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
