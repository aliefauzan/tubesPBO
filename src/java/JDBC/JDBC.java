/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author raiha
 */
package JDBC;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBC {
    private static final String URL = "jdbc:mysql://34.128.85.190:3306/singgung"; 
    private static final String USER = "root";
    private static final String PASS = "singgung";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static ResultSet getBarang() {
        try {
            Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM barang");
            return stmt.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

