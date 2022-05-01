package dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import model.Comment;
import util.DBConnection;

public class CommentDAO implements DAO<Comment> {

	private static final String SELECT_ALL_SQL = "SELECT * FROM comments";
	private static final String SELECT_ONE_SQL = "SELECT * FROM comments WHERE com_id = ?";
	private static final String INSERT_SQL = "INSERT INTO comments VALUES (?,?,?,?,?,?)";
	private static final String UPDATE_SQL = "UPDATE travel_web SET district=?, address=?, land_area=?, total_area=?,inter_area=?, park_area=?, type=?, usage=?, structure=?, complete_date=?   WHERE re_id = ?;";
	private static final String DELETE_SQL = "DELETE travel_web WHERE com_id = ?";

	@Override
	public List<Comment> getAll() {

		return null;
	}

	@Override
	public Comment getOne(int id) {
		Connection connection = null;
		Comment comment = new Comment();
		try {
			connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ONE_SQL);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				comment.setComId(resultSet.getInt("com_id"));
				comment.setObjectTb(resultSet.getString("object_tb"));
				System.out.println(comment.getObjectTb());
				comment.setObjectId(resultSet.getInt("object_id"));
				comment.setUserId(resultSet.getInt("user_id"));
				comment.setCom_date(resultSet.getDate("com_date"));
				comment.setRate(resultSet.getInt("rate"));
				comment.setContent(resultSet.getString("content"));
				FileOutputStream fos = new FileOutputStream("C:\\iSpan\\Code\\TravelWeb\\ref\\friends-min2.jpg");

				Blob blob = resultSet.getBlob("image");
				byte[] data = blob.getBytes(1, (int) blob.length());
				comment.setImages(data);
				fos.write(data);
				fos.close();
				System.out.println("File output is successful!");


			}
			resultSet.close();
			preparedStatement.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection(connection);
		}
		return comment;
	}

	@Override
	public boolean insert(Comment comment) {
		Connection connection = null;
		boolean dataInserted = false; // 資料尚未insert前，此布林值為false
		try {
			connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_SQL);

			// 未設定Comment Model，直接給予值的方式
			preparedStatement.setString(1, "Hotel");
			preparedStatement.setInt(2, 2);
			preparedStatement.setInt(3, 3);
			preparedStatement.setString(4, "2022/6/6");
			preparedStatement.setInt(5, 5);
			preparedStatement.setString(6, "Amazing Place to stay!");

			// 前端
//			preparedStatement.setString(1, comment.getObjectTb());
//			preparedStatement.setInt(2, comment.getObjectId());
//			preparedStatement.setInt(3, comment.getUserId());
//			preparedStatement.setDate(4, (Date) comment.getCom_date());
//			preparedStatement.setInt(5, comment.getRate());
//			preparedStatement.setString(6, comment.getContent());
//			preparedStatement.setBinaryStream(7, comment.getImages());	

//			FileInputStream fileInputStream = new FileInputStream("C:\\iSpan\\Code\\TravelWeb\\ref\\friends-min.jpg");
//			preparedStatement.setBinaryStream(7, fileInputStream);
			int count = preparedStatement.executeUpdate();
			if (count > 0) {
				System.out.println("Insert blob is successful!");
				dataInserted = true;
			}
			preparedStatement.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection(connection);
		}

		return dataInserted;
	}

	@Override
	public boolean update(Comment comment) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
