package T_Luxury_dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
            	    "jdbc:mysql://localhost:3306/banhoa?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
            	    "root",
            	    "123456"
            );

            System.out.println("KET NOI THANH CONG MYSQL");
        } catch (Exception e) {
            System.out.println("LOI KET NOI MYSQL");
            e.printStackTrace();
        }
        return conn;
    }
}