package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Comment;
import util.DBConnection;

public class CommentDAO implements DAO<Comment> {

	private static final String SELECT_ALL_SQL = "SELECT * FROM comments";
	private static final String SELECT_ONE_SQL = "SELECT * FROM comments WHERE com_id = ?";
	private static final String INSERT_SQL = "INSERT INTO comments VALUES (?,?,?,getdate(),?,?)";
	private static final String UPDATE_SQL = "UPDATE comments SET item_tb=?, item_id=?, user_id=?, rate=?, content=? WHERE com_id = ?;";
	private static final String DELETE_SQL = "DELETE comments WHERE com_id = ?";

	@Override
	public List<Comment> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt;
		ResultSet rs;
		List<Comment> comments = new ArrayList<>();
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(SELECT_ALL_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Comment comment = new Comment();
				comment.setComId(rs.getInt(1));
				comment.setItemTb(rs.getString(2));
				comment.setItemId(rs.getInt(3));
				comment.setUserId(rs.getInt(4));
				comment.setComDate(rs.getDate(5));
				comment.setRate(rs.getInt(6));
				comment.setContent(rs.getString(7));
				comments.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection(conn);
		}
		return comments;
	}

	@Override
	public Comment selectOne(int id) {
		Connection conn = null;
		PreparedStatement pstmt;
		ResultSet rs;
		Comment comment = new Comment();
//		String imgOutputPath = "C:\\iSpan\\Code\\TravelWeb\\ref\\friends-min2.jpg";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(SELECT_ONE_SQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				comment.setComId(rs.getInt(1));
				comment.setItemTb(rs.getString(2));
				comment.setItemId(rs.getInt(3));
				comment.setUserId(rs.getInt(4));
				comment.setComDate(rs.getDate(5));
				comment.setRate(rs.getInt(6));
				comment.setContent(rs.getString(7));
//				FileOutputStream fileOutputStream = new FileOutputStream(imgOutputPath);
//				Blob blob = resultSet.getBlob("image");
//				byte[] data = blob.getBytes(1, (int) blob.length());
//				comment.setImages(data);
//				fileOutputStream.write(data);
//				fileOutputStream.close();
//				System.out.println("File output is successful!");
				rs.close();
				pstmt.close();
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection(conn);
		}
		return comment;
	}

	@Override
	public boolean insert(Comment comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String[] generatedCols = { "comId" }; // 取得auto-generated的ID
		boolean isInserted = false;
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(INSERT_SQL, generatedCols); // 要放進statement，才能回傳ID
			pstmt.setString(1, comment.getItemTb());
			pstmt.setInt(2, comment.getItemId());
			pstmt.setInt(3, comment.getUserId());
			pstmt.setInt(4, comment.getRate());
			pstmt.setString(5, comment.getContent());
//			pstmt.setBytes(7, comment.getImages());
			pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				comment.setComId(rs.getInt(1)); // 將回傳ID設為comment物件的ComId
				isInserted = true;
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection(conn);
		}
		return isInserted;

	}

	@Override
	public boolean update(Comment comment) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int id) {
		Connection conn = null;
		boolean isDeleted = false;
		try {
			conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(DELETE_SQL);
			pstmt.setInt(1, id);
			int count = pstmt.executeUpdate();
			if (count > 0) isDeleted = true;
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection(conn);
		}
		return isDeleted;
	}
	

//	public static byte[] readAllBytes(FileInputStream fileInputStream) throws IOException {
//		final int bufLen = 4 * 0x400; // 4KB
//		byte[] buf = new byte[bufLen];
//		int readLen;
//		IOException exception = null;
//
//		try {
//			try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
//				while ((readLen = fileInputStream.read(buf, 0, bufLen)) != -1)
//					outputStream.write(buf, 0, readLen);
//
//				return outputStream.toByteArray();
//			}
//		} catch (IOException e) {
//			exception = e;
//			throw e;
//		} finally {
//			if (exception == null)
//				fileInputStream.close();
//			else
//				try {
//					fileInputStream.close();
//				} catch (IOException e) {
//					exception.addSuppressed(e);
//				}
//		}
//	}

}
