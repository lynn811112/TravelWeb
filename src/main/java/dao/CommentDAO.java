package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;

import model.Comment;
import util.DBConnection;
import util.DBConnectionFactory;

public class CommentDAO implements DAO<Comment> {

	private static final String SELECT_ALL_SQL = "SELECT * FROM comments";
	private static final String SELECT_ONE_SQL = "SELECT * FROM comments WHERE com_id = ?";
	private static final String INSERT_SQL = "INSERT INTO comments VALUES (?,?,?,getdate(),?,?)";
	private static final String UPDATE_SQL = "UPDATE comments SET item_tb=?, item_id=?, user_id=?, rate=?, content=? WHERE com_id = ?;";
	private static final String DELETE_SQL = "DELETE comments WHERE com_id = ?";

//	private DataSource dataSource;
//
//	public CommentDAO(DataSource dataSource) {
//		this.dataSource = dataSource;
//	}
	
//	private Connection conn;
//
//	public CommentDAO(Connection conn) {
//		this.conn = conn;
//	}

	@Override
	public List<Comment> selectAll() {
		Connection conn = null;
		PreparedStatement pstmt;
		ResultSet rs;
		Comment comment;
		List<Comment> comments = new ArrayList<>();
		try {
//			conn = dataSource.getConnection();
			conn = DBConnection.getConnectionObject();
			pstmt = conn.prepareStatement(SELECT_ALL_SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				comment = new Comment();
				comment.setComId(rs.getInt("com_Id"));
				comment.setItemTb(rs.getString("item_tb"));
				comment.setItemId(rs.getInt("item_id"));
				comment.setUserId(rs.getInt("user_id"));
				comment.setComDate(rs.getDate("com_date"));
				comment.setRate(rs.getInt("rate"));
				comment.setContent(rs.getString("content"));
				comments.add(comment);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return comments;
	}

	@Override
	public Comment selectOne(int id) {
//		Connection conn = null;
//		PreparedStatement pstmt;
//		ResultSet rs;
		Comment comment = new Comment();
////		String imgOutputPath = "C:\\iSpan\\Code\\TravelWeb\\ref\\friends-min2.jpg";
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(SELECT_ONE_SQL);
//			pstmt.setInt(1, id);
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				comment.setComId(rs.getInt("com_Id"));
//				comment.setItemTb(rs.getString("item_tb"));
//				comment.setItemId(rs.getInt("item_id"));
//				comment.setUserId(rs.getInt("user_id"));
//				comment.setComDate(rs.getDate("com_date"));
//				comment.setRate(rs.getInt("rate"));
//				comment.setContent(rs.getString("content"));
//
////				FileOutputStream fileOutputStream = new FileOutputStream(imgOutputPath);
////				Blob blob = resultSet.getBlob("image");
////				byte[] data = blob.getBytes(1, (int) blob.length());
////				comment.setImages(data);
////				fileOutputStream.write(data);
////				fileOutputStream.close();
////				System.out.println("File output is successful!");
//			}
//			rs.close();
//			pstmt.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if (conn != null) {
//				try {
//					conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//		}
		return comment;
	}

	@Override
	public boolean insert(Comment comment) {
		boolean isInserted = false;
//		Connection conn = null;
//		PreparedStatement pstmt;
//		ResultSet rs;
//		String[] generatedCols = { "comId" }; // 取得auto-generated的ID
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(INSERT_SQL, generatedCols); // 要放進statement，才能回傳ID
//			pstmt.setString(1, comment.getItemTb());
//			pstmt.setInt(2, comment.getItemId());
//			pstmt.setInt(3, comment.getUserId());
//			pstmt.setInt(4, comment.getRate());
//			pstmt.setString(5, comment.getContent());
//			pstmt.executeUpdate();
//			rs = pstmt.getGeneratedKeys();
//			if (rs.next()) {
//				comment.setComId(rs.getInt(1)); // 將回傳ID設為comment物件的ComId
//				isInserted = true;
//			}
//			rs.close();
//			pstmt.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if (conn != null) {
//				try {
//					conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//		}
		return isInserted;

	}

	@Override
	public boolean update(Comment comment) {
		boolean isUpdated = false;
//		Connection conn = null;
//		PreparedStatement pstmt;
//		int count;
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(UPDATE_SQL); // 要放進statement，才能回傳ID
//			pstmt.setString(1, comment.getItemTb());
//			pstmt.setInt(2, comment.getItemId());
//			pstmt.setInt(3, comment.getUserId());
//			pstmt.setInt(4, comment.getRate());
//			pstmt.setString(5, comment.getContent());
//			pstmt.setInt(6, comment.getComId());
//			count = pstmt.executeUpdate();
//			if (count > 0) isUpdated = true;
//			pstmt.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if (conn != null) {
//				try {
//					conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//		}
		return isUpdated;
	}

	@Override
	public boolean delete(int id) {
		boolean isDeleted = false;
//		Connection conn = null;
//		PreparedStatement pstmt;
//		int count;
//		try {
//			conn = dataSource.getConnection();
//			pstmt = conn.prepareStatement(DELETE_SQL);
//			pstmt.setInt(1, id);
//			count = pstmt.executeUpdate();
//			if (count > 0) isDeleted = true;
//			pstmt.close();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if (conn != null) {
//				try {
//					conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
//		}
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
