<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/note/dbconn.jsp"%>

<%

	String name = request.getParameter("name");
	String phone = request.getParameter("phone");

	
	public String findId(String name, String phone) {
	String serachid = null;
	
	try {
		String sql = "select id from member2 where name=? and phone=? ";
		ps = conn.prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, phone);
		
		rs = ps.executeQuery();
		
		if(rs.next()) {
			serachid = rs.getString("id");
		}
			
	} catch (Exception e) {
		e.printStackTrace();
	}
	return mid;
}

%>