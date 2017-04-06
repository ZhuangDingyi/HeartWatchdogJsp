package com.zyf.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/xingou?useUnicode=true&characterEncoding=UTF-8";
            conn = DriverManager.getConnection(url, "root", "exchangeaa");
            System.out.println("连接成功！");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("连接失败！");
        }
        return conn;
    }
    public static void closeConnection(Connection conn) {

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}