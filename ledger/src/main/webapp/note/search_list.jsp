<%@ page import="java.sql.*" contentType="text/html;charset=euc-kr" %>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setHeader("Pragma","no-cache"); %>
<!--사용자 정보 개인페이지-->
<html>
<head>
<style type="text/css">
<!--
.style1 {font-family: "바탕"; font-size: 13; }
.style5 {font-family: "바탕"; font-size: 15; }
-->
</style>
</head>
<BODY>
<div align="center">
<%
try {
///////////////////////////////// 데이터베이스 연결
Class.forName("org.gjt.mm.mysql.Driver"); 
Connection conn =
DriverManager.getConnection("jdbc:mysql://localhost:3307/cashbook","root","root"); //데이터베이스 커넥션 생성
Statement stmt = conn.createStatement();
///////////////////////////////// 테이블에서 가져온 값들을 저장할 변수 선언
int user_ID = 0;
String in_or_out= null;
String cash_or_not = null;
int amount = 0;
String event_day= null;
String description = null;


///////////////////////////////// 변수 선언끝
%>
<span class="style1"> 전체 거래내역 조회입니다.</span>
</div>

<form action="./search.jsp" method="get">
<table width="500" border ="0" align="center" cellpadding="0" cellspacing="1">
<tr align="center" bgcolor="blue" class="style1">
<td><span class="style5"> ID </span></td>
<td><span class="style5"> 수입/지출 </span></td>
<td><span class="style5"> 카드/현금 </span></td>
<td><span class="style5"> 거래 금액</span></td>
<td><span class="style5">거래 날짜 </span></td>
<td><span class="style5"> 상세 내역</span></td>

</tr></p><br><br>
<%
ResultSet rs=stmt.executeQuery("select * from In_Out");
while(rs.next()) { 
user_ID = Integer.parseInt(rs.getString("user_ID"));
in_or_out = new String(rs.getString("in_or_out"));
cash_or_not = new String(rs.getString("cash_or_not"));
amount = Integer.parseInt(rs.getString("amount"));
event_day = new String(rs.getString("event_day"));
description=new String(rs.getString("description"));

%>
<trclass="style1">
<td><%=user_ID%></td>
<td><%=in_or_out%></td>
<td><%=cash_or_not%></td>
<td><%= amount%></td>
<td><%= event_day%></td>
<td><%=description%></td></tr>

<%
}
%>




<tr><tr height="5">
<td></td><td></td></tr>
<tr>
<td align="center"colspan="6"><input type="submit" value="ID로 검색하기"
onClick ="true"></td></tr>
</table>
</from>
<%}
catch (Exception e) {
out.println(e); // 위 내용을 진행하는 과정에서 에러 발생 시 에러 메세지 출력
}%>

</BODY></html>