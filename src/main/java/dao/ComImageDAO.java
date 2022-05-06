package dao;

import java.io.FileOutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;

import model.ComImage;
import model.Comment;
import util.DBConnection;

public class ComImageDAO implements DAO<ComImage> {

	private static final String SELECT_ALL_SQL = "SELECT * FROM comment_images";
	private static final String SELECT_ONE_SQL = "SELECT * FROM comment_images WHERE img_id=?";
	private static final String SELECT_MUL_SQL = "SELECT * FROM comment_images WHERE com_id=?";
	private static final String INSERT_SQL = "INSERT INTO comment_images VALUES (?,?)";
	private static final String UPDATE_SQL = "UPDATE comment_images SET com_image=? WHERE img_id=?;";
	private static final String DELETE_SQL = "DELETE comment_images WHERE img_id=?";

//	private DataSource dataSource;
//
//	public ComImageDAO(DataSource dataSource) {
//		this.dataSource = dataSource;
//	}

	@Override
	public List<ComImage> selectAll() {
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		ComImage comImage;
		List<ComImage> comImages = new ArrayList<>();
		try {
			conn = DBConnection.getConnectionObject();
			pstmt = conn.prepareStatement(SELECT_ALL_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				comImage = new ComImage();
				comImage.setImgId(rs.getInt("img_id"));
				comImage.setComId(rs.getInt("com_id"));
//				FileOutputStream fileOutputStream = new FileOutputStream(imgOutputPath);
				Blob blob = rs.getBlob("image");
				byte[] data = blob.getBytes(1, (int) blob.length());
				comImage.setComImage(data);
				comImages.add(comImage);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return comImages;
	}

	@Override
	public ComImage selectOne(int id) {
		Connection conn = null;
		PreparedStatement pstmt;
		ResultSet rs;
		ComImage comImage = new ComImage();
		try {
			conn = DBConnection.getConnectionObject();
			pstmt = conn.prepareStatement(SELECT_ONE_SQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				comImage.setImgId(rs.getInt("img_id"));
				comImage.setComId(rs.getInt("com_id"));
				Blob blob = rs.getBlob("image");
				byte[] data = blob.getBytes(1, (int) blob.length());
				comImage.setComImage(data);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return comImage;
	}

	@Override
	public boolean insert(ComImage comImage) {
		boolean isInserted = false;
		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;
		String[] generatedCols = { "imgId" }; // 取得auto-generated的ID
		try {
			conn = DBConnection.getConnectionObject();
			pstmt = conn.prepareStatement(INSERT_SQL, generatedCols); // 要放進statement，才能回傳ID
			pstmt.setInt(1, comImage.getComId());
			pstmt.setBytes(2, comImage.getComImage());
			pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				comImage.setComId(rs.getInt(1)); // 將回傳ID設為comment物件的ComId
				isInserted = true;
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return isInserted;
	}

	@Override
	public boolean update(ComImage t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int id) {
		boolean isDeleted = false;
		Connection conn;
		PreparedStatement pstmt;
		int count;
		try {
			conn = DBConnection.getConnectionObject();
			pstmt = conn.prepareStatement(DELETE_SQL);
			pstmt.setInt(1, id);
			count = pstmt.executeUpdate();
			if (count > 0) isDeleted = true;
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return isDeleted;
	}

}
