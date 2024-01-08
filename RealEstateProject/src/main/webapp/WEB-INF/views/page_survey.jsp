<%@page import="java.util.Map"%>
<%@page import="com.dockbang.model.SaleTO"%>
<%@page import="com.dockbang.model.SubwayStationTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Map<String, List<SaleTO>> salesNearStationMap = (Map)request.getAttribute("salesNearStationMap");

	// 테스트 출력용
	out.println("<table border='1' width='800' cellspacing='0' style='text-align: center'>");
	out.println("<tr>");
	out.println("<td>역 이름</td>");
	out.println("<td>매물 이름</td>");
	out.println("<td>매물 타입</td>");
	out.println("<td>역과 매물간의 거리(m)</td>");
	out.println("</tr>");

	for(Map.Entry<String, List<SaleTO>> entry:salesNearStationMap.entrySet()) {
		String stationName = entry.getKey();
		
		for(SaleTO saleTO:entry.getValue()){
		out.println("<tr>");
			out.println("<td>" + stationName + "</td>");
			out.println("<td>" + saleTO.getTitle() + "</td>");
			out.println("<td>" + saleTO.getSale_type() + "</td>");
			out.println("<td>" + saleTO.getAddress() + "</td>");
		out.println("</tr>");
		}
	}
		
	out.println("</table>");
	
%>
