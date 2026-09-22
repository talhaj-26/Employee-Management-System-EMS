package com.employee.ems;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    // PostgreSQL Database URL
    private static final String URL
            = "jdbc:postgresql://localhost:5432/jsp_crud";

    // Database Username
    private static final String USER
            = "postgres";

    // Database Password
    private static final String PASSWORD
            = "root123";

    public static Connection getConnection() {

        try {

            // Load PostgreSQL JDBC Driver
            Class.forName("org.postgresql.Driver");

            // Create Database Connection
            Connection connection = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("Connected Successfully");

            return connection;

        } catch (Exception e) {

            System.out.println("Connection Failed!");
            e.printStackTrace();

        }

        return null;
    }
}
