package com.dockbang.db;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class movie {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/dockbang?useUnicode=true&characterEncoding=UTF-8";
        String username = "root";
        String password = "!123456";
        String csvFilePath = "C://project_dockbang//DockBang//RealEstateProject//src//main//java//com//dockbang//db//서울시 영화상영관 인허가 정보_v3 (2).csv";

        try (Connection connection = DriverManager.getConnection(jdbcURL, username, password);
             BufferedReader reader = new BufferedReader(
                     new InputStreamReader(new FileInputStream(csvFilePath), StandardCharsets.UTF_8))) {

            // Skip the header line
            reader.readLine();

            String line;
            String sql = "INSERT INTO movie (jibun_address, road_address, business_name, coordinate_x, coordinate_y) " +
                    "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);

            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");

                // Assuming the CSV columns are in the same order as the table columns
                if (data.length >= 5) {
                    statement.setString(1, data[0].trim()); // 지번주소
                    statement.setString(2, data[1].trim()); // 도로명주소
                    statement.setString(3, data[2].trim()); // 사업장명

                    // Convert and set coordinate_x
                    try {
                        double coordinateX = Double.parseDouble(data[3].trim());
                        statement.setDouble(4, coordinateX);
                    } catch (NumberFormatException e) {
                        statement.setDouble(4, 0.0); // Default value if conversion fails
                    }

                    // Convert and set coordinate_y
                    try {
                        double coordinateY = Double.parseDouble(data[4].trim());
                        statement.setDouble(5, coordinateY);
                    } catch (NumberFormatException e) {
                        statement.setDouble(5, 0.0); // Default value if conversion fails
                    }

                    statement.executeUpdate();
                } else {
                    System.out.println("Invalid data: " + line);
                }
            }

            System.out.println("Data imported to the database successfully.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}