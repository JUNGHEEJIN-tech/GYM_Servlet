package space.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataSource {
	
	private static final String DRIVER = "oracle.jdbc.driver.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "system";
    private static final String PASSWORD = "a1234";

   
    public static Connection getDataSource() {
        // JDBC 드라이버 로드
		Connection connection = null;

		try {
			
			Class.forName(DRIVER);
			connection = DriverManager.getConnection(URL, USER, PASSWORD);
			
		} catch (SQLException e) {
			System.out.println("SQLException 발생");
			//e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("ClassNotFoundException 발생");
			//e.printStackTrace();
		}
		
		return connection;
    }
}

