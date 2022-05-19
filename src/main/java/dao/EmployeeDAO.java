package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import model.Employee;
import util.DBConnection;

public class EmployeeDAO implements DAO<Employee>{
	
	private static final String SELECT_ONE_SQL = "SELECT * FROM employees WHERE email = ?";

	public Employee selectByEmail(String inputEmail) {
		Employee employee = null;
		try {
			Connection conn = DBConnection.getConnectionObject();
			PreparedStatement pstmt = conn.prepareStatement(SELECT_ONE_SQL);
			pstmt.setString(1, inputEmail);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int empId = rs.getInt("emp_id");
				String email =  rs.getString("email");
				String password = rs.getString("password");
	            employee = new Employee(empId, email, password);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeConnection();
		}
		return employee;
	}
	
	
	@Override
	public List<Employee> selectAll() {

		return null;
	}

	@Override
	public Employee selectOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(Employee t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Employee t) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}
		
}
