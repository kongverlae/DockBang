package com.dockbang.db;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class food {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/dockbang?useUnicode=true&characterEncoding=UTF-8";
        String username = "root";
        String password = "!123456";
        String csvFilePath = "C://project_dockbang//DockBang//RealEstateProject//src//main//java//com//dockbang//db//서울시 휴게음식점 인허가 정보_v3 (3).csv";

        try (Connection connection = DriverManager.getConnection(jdbcURL, username, password);
             BufferedReader reader = new BufferedReader(
                     new InputStreamReader(new FileInputStream(csvFilePath), StandardCharsets.UTF_8))) {

            // Skip the header line
            reader.readLine();

            String line;
            String sql = "INSERT INTO food (business_name, business_type, jibun_address, road_address, coordinate_x, coordinate_y) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);

            int cnt = 0;
            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");

                // Assuming the CSV columns are in the same order as the table columns
                if (data.length >= 6) {
                    statement.setString(1, data[2].trim()); // 사업장명
                    statement.setString(2, data[3].trim()); // 업태구분명
                    statement.setString(3, data[0].trim()); // 지번주소
                    statement.setString(4, data[1].trim()); // 도로명주소

                    try {
                        statement.setDouble(5, Double.parseDouble(data[4].trim())); // 좌표정보(X)
                        statement.setDouble(6, Double.parseDouble(data[5].trim())); // 좌표정보(Y)

                    } catch (NumberFormatException e) {
                    	statement.setNull(5, 0); // 좌표정보(X)
                    	statement.setNull(6, 0); // 좌표정보(Y)
                       // System.out.println("Invalid numeric values for coordinates in line: " + line);
                    }
                    System.out.println(cnt++);
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