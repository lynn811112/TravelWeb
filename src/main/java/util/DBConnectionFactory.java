package util;

import java.sql.Connection;
import java.sql.SQLException;

import com.microsoft.sqlserver.jdbc.SQLServerDataSource;

public class DBConnectionFactory {

	public static Connection getDSConnection() {
		
        SQLServerDataSource ds = new SQLServerDataSource();
        ds.setServerName("localhost");
//        ds.setInstanceName("sql2012");
        ds.setDatabaseName("travel_web");
        ds.setPortNumber(1433);
        ds.setUser("sa");
        ds.setPassword("manager");

		Connection conn = null;
		
		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

}
