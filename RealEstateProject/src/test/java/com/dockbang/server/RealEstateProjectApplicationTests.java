package com.dockbang.server;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.dockbang.controller.SaleController;
import com.dockbang.mapper.SqlMapperInter;
import com.dockbang.model.SaleDAO;

@SpringBootApplication
@MapperScan(basePackageClasses = {SqlMapperInter.class})
@ComponentScan(basePackageClasses = {SaleDAO.class, SaleController.class})
public class RealEstateProjectApplicationTests {

	public static void main(String[] args) {
		SpringApplication.run(RealEstateProjectApplicationTests.class, args);
	}

}
