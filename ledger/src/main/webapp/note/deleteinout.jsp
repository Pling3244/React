<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String num = request.getParameter("num");	

	String sql = "select * from INOUT";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "delete from INOUT where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		pstmt.executeUpdate();
	} else
		out.println("에러");
	
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	response.sendRedirect("list.jsp");
%>