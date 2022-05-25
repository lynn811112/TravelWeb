package dao;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.StringJoiner;

import model.Comment;
import util.DBConnection;

public class CommentDAO implements DAO<Comment> {

	private static final String SELECT_ALL_SQL = "SELECT * FROM comments ORDER BY com_id";
	private static final String SELECT_ONE_SQL = "SELECT * FROM comments WHERE com_id = ?";
	private static final String SELECT_COUNT_SQL = "SELECT count(*) FROM comments;";
	private static final String INSERT_SQL = "INSERT INTO comments VALUES (?,?,?,getdate(),?,?,?,?,?,?)";
	private static final String UPDATE_SQL = "UPDATE comments SET user_id=?, rating=?, content=? WHERE com_id = ?;";
	private static final String DELETE_SQL = "DELETE comments WHERE com_id = ?";

	@Override
	public List<Comment> selectAll() {
		List<Comment> comments = new ArrayList<>(); // new一個ArrayList
		try {
			Connection conn = DBConnection.getConnectionObject(); // 用package util裡的DBConnection得到DB連線物件
			PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL_SQL);
			ResultSet rs = pstmt.executeQuery(); // ResultSet from DB
			String base64Image;
//			List<String> imageList = new ArrayList<>();
			while (rs.next()) {
				Comment comment = new Comment(); // new一個物件(JavaBean)
				comment.setComId(rs.getInt("com_Id")); // set此物件屬性
				comment.setItemTb(rs.getString("item_tb"));
				comment.setItemId(rs.getInt("item_id"));
				comment.setUserId(rs.getString("user_id"));
				comment.setComDate(rs.getDate("com_date"));
				comment.setRating(rs.getInt("rating"));
				comment.setContent(rs.getString("content"));
				if (rs.getBlob("image1") != null) {
					base64Image = toBase64(rs.getBlob("image1"));
					comment.setImage1(base64Image);
				}
				if (rs.getBlob("image2") != null) {
					base64Image = toBase64(rs.getBlob("image2"));
					comment.setImage2(base64Image);
				}
				if (rs.getBlob("image3") != null) {
					base64Image = toBase64(rs.getBlob("image3"));
					comment.setImage3(base64Image);
				}
				comments.add(comment); // 將此物件加到 ArrayList
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return comments;
	}

	@Override
	public Comment selectOne(int id) {
		Comment comment = new Comment();
		try {
			Connection conn = DBConnection.getConnectionObject();
			PreparedStatement pstmt = conn.prepareStatement(SELECT_ONE_SQL);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			String base64Image;
			while (rs.next()) {
				comment.setComId(rs.getInt("com_Id"));
				comment.setItemTb(rs.getString("item_tb"));
				comment.setItemId(rs.getInt("item_id"));
				comment.setUserId(rs.getString("user_id"));
				comment.setComDate(rs.getDate("com_date"));
				comment.setRating(rs.getInt("rating"));
				comment.setContent(rs.getString("content"));
				
				// 以判斷式確認是否為空值以免報錯
				if (rs.getBlob("image1") != null) {		
					// Blob 轉為 Base64 String 以便在 jsp 以 <img> 呈現
					base64Image = toBase64(rs.getBlob("image1"));
					comment.setImage1(base64Image);		
				}
				if (rs.getBlob("image2") != null) {
					base64Image = toBase64(rs.getBlob("image2"));
					comment.setImage2(base64Image);
				}
				if (rs.getBlob("image3") != null) {
					base64Image = toBase64(rs.getBlob("image3"));
					comment.setImage3(base64Image);
				}
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return comment;
	}

	@Override
	public boolean insert(Comment comment) {
		boolean isInserted = false;
		String[] generatedCols = { "comId" }; // 取得auto-generated的ID
		try {
			Connection conn = DBConnection.getConnectionObject();
			PreparedStatement pstmt = conn.prepareStatement(INSERT_SQL, generatedCols);  
			pstmt.setString(1, comment.getItemTb());
			pstmt.setInt(2, comment.getItemId());
			pstmt.setString(3, comment.getUserId());
			pstmt.setInt(4, comment.getRating());
			pstmt.setString(5, comment.getContent());
			for (int i=0; i<=2; i++) {
				if (i <= comment.getImageBytes().size()-1) {
					pstmt.setBlob((6+i), comment.getImageBytes().get(i));	
				} else {
					pstmt.setNull((6+i), java.sql.Types.VARBINARY);	// insert images, insert Null if there's no one
				}
			}
			pstmt.setString(9, "y");
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				comment.setComId(rs.getInt(1)); // 將回傳ID設為comment物件的ComId
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
	public boolean update(Comment comment) {
		boolean isUpdated = false;
		try {
			Connection conn = DBConnection.getConnectionObject();
			PreparedStatement pstmt = conn.prepareStatement(UPDATE_SQL);
			pstmt.setString(1, comment.getUserId());
			pstmt.setInt(2, comment.getRating());
			pstmt.setString(3, comment.getContent());
			pstmt.setInt(4, comment.getComId());
			int count = pstmt.executeUpdate();
			if (count > 0)
				isUpdated = true;
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return isUpdated;
	}


	public boolean updateWithImgs(Comment comment) {
		boolean isUpdated = false;
		int imgDeleSum = 0;
		String imageUdpate = comment.getImage1() + comment.getImage2() + comment.getImage3();
		if (!comment.getImage1().equals("")) imgDeleSum += 1;
		if (!comment.getImage2().equals("")) imgDeleSum += 1;
		if (!comment.getImage3().equals("")) imgDeleSum += 1;
		
		try {
			Connection conn = DBConnection.getConnectionObject();
			// 記住where前需要空格
			String updateImgSql = "UPDATE comments SET user_id=?, rating=?, content=?" + imageUdpate + " WHERE com_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(updateImgSql);
			pstmt.setString(1, comment.getUserId());
			pstmt.setInt(2, comment.getRating());
			pstmt.setString(3, comment.getContent());
			for (int i = 1; i <= imgDeleSum; i++) {
				pstmt.setNull((3+i), java.sql.Types.VARBINARY);
			}
			int whereId = 3 + imgDeleSum + 1;
			pstmt.setInt(whereId, comment.getComId());
			int count = pstmt.executeUpdate();
			
			String selectImgsSql = "SELECT image1, image2, image3 FROM comments WHERE com_id = ?";
			pstmt = conn.prepareStatement(selectImgsSql);
			pstmt.setInt(1, comment.getComId());
			ResultSet rs = pstmt.executeQuery();
			List<String> nullImgArr = new ArrayList<String>();
			int imgInsertSum = 0;
			while (rs.next()) {
				for (int i=1; i<=3; i++) {
					if (rs.getBlob("image"+i) == null) {
						nullImgArr.add("image"+i+"=?");
						imgInsertSum += 1;
					};
				}
			}

		    StringJoiner joiner = new StringJoiner(", ");
		    for (String nullImg : nullImgArr) {
		    	joiner.add(nullImg);
		    }
			String imageInsert = joiner.toString();			
			String insertImgsSql = "UPDATE comments SET "+ imageInsert +" WHERE com_id = ?";
			pstmt = conn.prepareStatement(insertImgsSql);
			for (int i = 0; i < imgInsertSum; i++) {
				if (i <= comment.getImageBytes().size()-1) {
					pstmt.setBlob((i+1), comment.getImageBytes().get(i));	
				} else {
					pstmt.setNull((i+1), java.sql.Types.VARBINARY);	
				}
			}
			pstmt.setInt((imgInsertSum+1), comment.getComId());
			
			count = pstmt.executeUpdate();
			if (count > 0)
				isUpdated = true;
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return isUpdated;
	}
	
	
	@Override
	public boolean delete(int id) {
		boolean isDeleted = false;
		try {
			Connection conn = DBConnection.getConnectionObject();
			PreparedStatement pstmt = conn.prepareStatement(DELETE_SQL);
			pstmt.setInt(1, id);
			int count = pstmt.executeUpdate();
			if (count > 0)
				isDeleted = true;
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
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
	
	
	
	public String toBase64(Blob blob) {
		String base64Image = null;
		try (InputStream is = blob.getBinaryStream();
			 BufferedInputStream bis = new BufferedInputStream(is);
			 ByteArrayOutputStream ops = new ByteArrayOutputStream()){
			byte[] buffer = new byte[4096];
			int length;

			while ((length = bis.read(buffer)) != -1) {
				ops.write(buffer, 0, length);
			}
			
			byte[] imageBytes = ops.toByteArray();
			base64Image = Base64.getEncoder().encodeToString(imageBytes);

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return base64Image;
	}
	
	


}
