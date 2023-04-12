<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<!-- <link rel="stylesheet" href="../resources/css/table.css" /> -->

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<title>가계부</title>
<script type="text/javascript">
	function deleteConfirm(num) {
		if (confirm("해당 항목을 삭제합니다!!") == true)
			location.href = "./deleteinout.jsp?num=" +num;
		else
			return;
	}
</script>
</head>
<jsp:include page="/menu.jsp" />
<!-- 	<div class="jumbotron"> -->
			<div class="container">
		  <h1 class="mb-5"></h1>
<%-- 			<h1 class="display-5" align="center">[<%=sessionId%>]님의 가계부</h1> --%>
			<h1 class="mb-5"></h1>
		</div>

<body>
<!-- <div style="padding-top: 50px">	 -->
<table class="table-hover" align="center">
<thead class="table table-hover">
<tr style="color: white; background-color: #9966FF" align="center">
<td><span class="style5">아이디 </span></td>
<td><span class="style5">업로드일 </span></td>
<td><span class="style5">거래 날짜 </span></td>
<td><span class="style5"> 수입/지출 </span></td>
<td><span class="style5"> 카드/현금 </span></td>
<td><span class="style5"> 거래 금액</span></td>
<td><span class="style5"> 상세 내역</span></td>
<td><span class="style5"> </span></td>

</tr>
</thead>
<%-- <%@ include file="dbconn.jsp"%> --%>
<% 
 Class.forName("oracle.jdbc.driver.OracleDriver"); 

Connection conn = null; // DBMS와 Java연결객체
PreparedStatement  pstmt = null; // SQL구문을 실행 
ResultSet rs = null; // SQL구문의 실행결과를 저장 
 try 
{ 
	 String url = "jdbc:oracle:thin:@localhost:1521:xe";
     String user = "ledger"; 
      String password = "oracle";

      String query = "select * from INOUT";

 conn = DriverManager.getConnection(url, user, password);
pstmt = conn.prepareStatement(query);
// pstmt.setString(1, sessionId);
// pstmt.clearParameters();
 rs = pstmt.executeQuery();

 while(rs.next())
 {
	 boolean bInout = rs.getString("in_or_out").equals("수입");
	 boolean rInout = rs.getString("in_or_out").equals("지출");
 %>
<tbody>
<tr>
<td class="text-center" width="100"><%= rs.getString("id") %></td>
<td class="text-center" width="100"><%= rs.getString("updatedate") %></td>
<td class="text-center" width="100"><%= rs.getString("day") %></td>
<td class="text-center" width="95">
<c:if test="<%= bInout%>"><font color="blue"><%= rs.getString("in_or_out") %></font></c:if>
<c:if test="<%= rInout%>"><font color="red"><%= rs.getString("in_or_out") %></font></c:if>
</td>
<td class="text-center" width="95"><%= rs.getString("cashcard") %></td>
<td class="text-center" width="150">
<c:if test="<%= bInout%>"><font color="blue"><%= rs.getString("money") %></font></c:if>
<c:if test="<%= rInout%>"><font color="red"><%= rs.getString("money") %></font></c:if>
</td>
<td class="text-center" width="130"><%= rs.getString("description") %></td>
<td width="50">
<a class="btn-primary" href="./updateinout.jsp?num=<%=rs.getString("num")%>">수정</a> 
<a class="btn-danger" href="#" onclick="deleteConfirm('<%=rs.getString("num")%>')">삭제</a>
</td>
<% 	 
}

}
catch(SQLException ex){
    out.println(ex.getMessage());
    ex.printStackTrace();
}finally{
    // 6. 사용한 Statement 종료
    if(rs != null) try { rs.close(); } catch(SQLException ex) {}
    if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
}
%>
</tbody>
</table>
<!-- </div> -->
  <h1 class="mb-3"></h1>
<div class="container text-left">
<% 
try {
	String query = "";

	query += " select ";
	query += " 			sum(Decode(in_or_out,'수입',money,(money*-1))) sum1 , ";
	query += " 			sum(Decode(in_or_out,'수입',money,(money*0))) plus1 , ";
	query += " 			sum(Decode(in_or_out,'지출',-money,(money*0))) minus1 ";
	query += " from ";
	query += " 			inout ";
	query += " where ";
	query += " 			id =? ";
	 
	System.out.println(query);
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, sessionId);
	 rs = pstmt.executeQuery();

	 while(rs.next())
	 {
%>
<%-- <a>총 수입 : <%=rs.getString("plus1")%> / 총 지출 : <%=rs.getString("minus1")%></a> --%>
<%-- <h5>잔액 : <%=rs.getString("sum1")%></h5> --%>
<%
}
}
catch(SQLException ex){
    out.println(ex.getMessage());
    ex.printStackTrace();
}finally{
    // 6. 사용한 Statement 종료
    if(rs != null) try { rs.close(); } catch(SQLException ex) {}
    if(pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
    // 7. 커넥션 종료
    if(conn != null) try { conn.close(); } catch(SQLException ex) {}
}%>
<!-- </div> -->
<!--  <div class="container px-4 px-lg-5 text-center"> -->
<!--             <h1 class="mb-4"></h1> -->
<%--                 <a class="btn btn-dark btn-xl" href="<c:url value="/note/inout.jsp"/>" style="background-color: #9966FF;">작성</a> --%>
<!--             </div> -->
<div class="container">
<a href="/ledger/logout.jsp" class="btn btn=sm btn-success">Logout</a>

</div>

</body>
</html>