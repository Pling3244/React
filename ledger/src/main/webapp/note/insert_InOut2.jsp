<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR" %>
<% request.setCharacterEncoding("EUC_KR"); %>
<% response.setHeader("Pragma","no-cache"); %>
<html>
<head>
<style type="text/css">
<!--
.style1 {
font-family: "돋움";
font-size: 14px;
}
-->

</style>
</head>
<BODY>
<div align="center">
<%
try {
Class.forName("org.gjt.mm.mysql.Driver"); //DB연결 객체 생성
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/cashbook","root","root");

int user_ID=0;
String in_or_out=null;
String cash_or_not=null;
int amount=0;
String event_day=null;
String description=null;

user_ID= Integer.parseInt(request.getParameter("user_ID"));
in_or_out = new String(request.getParameter("in_or_out"));
cash_or_not= new String(request.getParameter("cash_or_not"));
amount= Integer.parseInt(request.getParameter("amount"));
event_day= new String(request.getParameter("event_day"));
description= new String(request.getParameter("description"));


Statement stmt = conn.createStatement();
ResultSet rs=stmt.executeQuery("select user_ID from PersonInfo where user_ID='"+user_ID+"'");
//데이터베이스에 동일한 번호가 있는지 확인
if(rs.next()) {
	stmt.executeUpdate("insert into In_Out values ('"+user_ID+"','"+in_or_out+"','"+cash_or_not+"','"+amount+"','"+event_day+"','"+description+"')");
	%>
<span class="style1">거래내역이 입력되었습니다.</span>
	<%
}
else{
%>

	<script>
	alert("존재하지 않는 ID입니다."); // 
	history.go(-1);
	</script>

<%
}
stmt.close();
conn.close();
} catch (Exception e) {
out.println(e);
}
%>
</div>
</body>
</html>
