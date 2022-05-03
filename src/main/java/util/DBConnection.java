package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public final class DBConnection {

	private static final String JDBC_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=travel_web";
	private static final String USER = "sa";
	private static final String PASSWORD = "manager";

	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public static void closeConnection(Connection conn) {
		if  (conn != null) {
			try {
				 conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}
}
