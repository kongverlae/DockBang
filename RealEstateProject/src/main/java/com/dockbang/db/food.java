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
        // MySQL 연결 정보
        String jdbcURL = "jdbc:mysql://localhost:3306/dockbang?useUnicode=true&characterEncoding=UTF-8";
        String username = "root";
        String password = "!123456";

        // CSV 파일 경로
        String csvFilePath = "C://project_dockbang//DockBang//RealEstateProject//src//main//java//com//dockbang//db//서울시 휴게음식점 인허가 정보_v3 (3).csv";

        try (
            // 데이터베이스 연결
            Connection connection = DriverManager.getConnection(jdbcURL, username, password);
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(new FileInputStream(csvFilePath), StandardCharsets.UTF_8));
        ) {
            // CSV 파일의 헤더 라인 스킵
            reader.readLine();

            String line;
            // SQL 쿼리
            String sql = "INSERT INTO food (jibun_address, road_address, business_name, business_type) " +
                    "VALUES (?, ?, ?,?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                while ((line = reader.readLine()) != null) {
                    // CSV 데이터 파싱
                    String[] data = line.split(",");

                    // CSV 컬럼이 적어도 3개 이상이어야 함
                    if (data.length >= 4) {
                        try {
                            // 각 컬럼 값을 설정
                            statement.setString(1, data[0].trim()); // 지번주소
                            statement.setString(2, data[1].trim()); // 도로명주소
                            statement.setString(3, data[2].trim()); // 사업장명
                            statement.setString(4, data[3].trim()); // 사업장 종류

                            // 데이터베이스에 삽입
                            statement.executeUpdate();
                        } catch (Exception e) {
                            System.out.println("Exception occurred: " + e.getMessage());
                            e.printStackTrace();
                        }
                    } else {
                        System.out.println("Invalid data: " + line);
                    }
                }
            }

            System.out.println("데이터베이스로 데이터가 성공적으로 입력되었습니다.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}