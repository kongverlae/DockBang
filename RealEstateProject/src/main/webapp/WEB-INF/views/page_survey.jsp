<%@page import="com.dockbang.model.SaleNearStationTO"%>
<%@page import="com.dockbang.model.SaleTO"%>
<%@page import="com.dockbang.model.SubwayStationTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<SaleNearStationTO> salesNearStation = (List)request.getAttribute("salesNearStation");

	// 테스트 출력용
	out.println("<table border='1' width='800' cellspacing='0' style='text-align: center'>");
	out.println("<tr>");
	out.println("<td>역 이름</td>");
	out.println("<td>역 호선</td>");
	out.println("<td>매물 이름</td>");
	out.println("<td>역과 매물간의 거리(km)</td>");
	out.println("</tr>");

	for(SaleNearStationTO sto:salesNearStation) {
		out.println("<tr>");
			out.println("<td>" + sto.getStation_name() + "</td>");
			out.println("<td>" + sto.getStation_line() + "</td>");
			out.println("<td>" + sto.getSale_name() + "</td>");
			out.println("<td>" + sto.getDistance() + " km</td>");
		out.println("</tr>");
	}
		
	out.println("</table>");
	
%>
