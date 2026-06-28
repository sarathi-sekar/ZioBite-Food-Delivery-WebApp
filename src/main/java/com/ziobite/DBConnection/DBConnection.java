package com.ziobite.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/ziobite";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "9080";

    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
          
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getconnection() {

        try {

            if (connection == null) {

                connection = DriverManager.getConnection(
                        URL,
                        USERNAME,
                        PASSWORD);
            }

        } catch  (SQLException e) {

	        e.printStackTrace();
	    }

	    return connection;
	}
	
	}
	

