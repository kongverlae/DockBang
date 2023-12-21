package com.dockbang.db;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class police {
    public static void main(String[] args) {
    	String jdbcURL = "jdbc:mysql://localhost:3306/dockbang?useUnicode=true&characterEncoding=UTF-8";
        String username = "root";
        String password = "!123456";
        String csvFilePath = "C://java//Spring//album01 (3)//src//main//java//경찰청_경찰관서 위치 주소 현황_v2_20230811 (1).csv";

        try (Connection connection = DriverManager.getConnection(jdbcURL, username, password);
        		BufferedReader reader = new BufferedReader(
        				new InputStreamReader(new FileInputStream(csvFilePath), "UTF-8"))) {

            String line;
            String sql = "INSERT INTO police (division, address) VALUES (?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);

            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");

                // Assuming the CSV columns are in the same order as the table columns
                statement.setString(1, data[0].trim());
                statement.setString(2, data[1].trim());

                statement.executeUpdate();
            }

            System.out.println("Data imported to the database successfully.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}