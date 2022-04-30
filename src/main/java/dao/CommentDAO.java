package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import model.Comment;
import util.DBConnection;

public class CommentDAO implements DAO<Comment> {

	private static final String SELECT_ALL_SQL = "SELECT * FROM travel_web";
	private static final String SELECT_ONE_SQL = "SELECT * FROM travel_web WHERE com_id = ?";
//	private static final String INSERT_SQL = "INSERT INTO travel_web VALUES (?,?,?,?,?,?,?,?,?,?,?)";
//	private static final String UPDATE_SQL = "UPDATE travel_web SET district=?, address=?, land_area=?, total_area=?,inter_area=?, park_area=?, type=?, usage=?, structure=?, complete_date=?   WHERE re_id = ?;";
//	private static final String DELETE_SQL = "DELETE travel_web WHERE com_id = ?";

	@Override
	public List<Comment> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Comment getOne(int id) {
		Connection connection = null;
		Comment comment = null;
		try {
			connection = DBConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ONE_SQL);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				comment.setComId(resultSet.getInt("com_id"));
				comment.setObjectTb(resultSet.getString("object_tb"));
				comment.setObjectId(resultSet.getInt("object_id"));
				comment.setUserId(resultSet.getInt("user_id"));
				comment.setCom_date(resultSet.getDate("com_date"));
				comment.setRate(resultSet.getInt("rate"));
				comment.setContent(resultSet.getString("content"));
				comment.setImages(resultSet.getBytes("images"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection(connection);
		}
		return comment;
	}

	@Override
	public boolean insert(Comment comment) {
		// TODO Auto-generated method stub
		Connection connection = null;
		return false;
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
