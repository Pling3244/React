<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<%
	request.setCharacterEncoding("UTF-8");

String year = request.getParameter("dayyy");
String month = request.getParameterValues("daymm")[0];
String day = request.getParameter("daydd");
String time = year + "/" + month + "/" + day;
String inout = request.getParameter("inout");
String cashcard = request.getParameter("cashcard");
String money = request.getParameter("money");
String description = request.getParameter("description");
	
// 	Date currentDatetime = new Date(System.currentTimeMillis());
// 	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
// 	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<%@ include file="dbconn.jsp"%>
<%
	String num = request.getParameter("num");	

	String sql = "select * from INOUT";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	
	if(rs.next()) {
		sql = "UPDATE INOUT SET DAY='"+time+"', IN_OR_OUT='"+inout+"', CASHCARD='"+cashcard+"', MONEY='"+money+"', DESCRIPTION='"+description+"', UPDATEDATE=sysdate WHERE NUM = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		pstmt.executeUpdate();
	}
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	%>

<script>location.href = "list.jsp"; </script>