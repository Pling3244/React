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
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="ledger" password="oracle" />


<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM INOUT WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>

<title>가계부</title>
</head>
<jsp:include page="/menu.jsp" />
<!-- 	<div class="jumbotron"> -->
			<div class="container">
		  <h1 class="mb-5"></h1>
			<h1 class="display-5" align="center">[<%=sessionId%>]님의 가계부</h1>
			<h1 class="mb-5"></h1>
		</div>

<body>	
<table width="500" border ="0" align="center" cellpadding="0" cellspacing="1">
<tr align="center" bgcolor="gray" class="style1">
<td><span class="style5">거래 날짜 </span></td>
<td><span class="style5"> 수입/지출 </span></td>
<td><span class="style5"> 카드/현금 </span></td>
<td><span class="style5"> 거래 금액</span></td>
<td><span class="style5"> 상세 내역</span></td>

</tr>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection conn = null; // DBMS와 Java연결객체
PreparedStatement  pstmt = null; // SQL구문을 실행
ResultSet rs = null; // SQL구문의 실행결과를 저장
 try
      {
	 String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:xe";
     String dbUser = "ledger";
     String dbPass = "oracle";

//     String query = "select * from INOUT order by ID";
     String query = "select * from INOUT where id=?";

 conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
pstmt = conn.prepareStatement(query);
pstmt.setString(1, sessionId);
 rs = pstmt.executeQuery();

 while(rs.next())
 {
 %>
<tr class="style1">
<td class="text-center" width="90"><%= rs.getString("day") %></td>
<td class="text-center" width="90"><%= rs.getString("in_or_out") %></td>
<td class="text-center" width="90"><%= rs.getString("cashcard") %></td>
<td class="text-center" width="150"><%= rs.getString("money") %></td>
<td class="text-center" width="130"><%= rs.getString("description") %></td>

<%-- <td><a value='${row.day }'></a></td> --%>
<%-- <td><a value='${row.in_or_out }'></a></td> --%>
<%-- <td><a value='${row.cashcard }'></a></td> --%>
<%-- <td><a value='${row.money }'></a></td> --%>
<%-- <td><a value='${row.description }'></a></td> --%>
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
}
%>
</table>

 <div class="container px-4 px-lg-5 text-center">
            <h1 class="mb-5"></h1>
                <a class="btn btn-dark btn-xl" href="<c:url value="/note/inout.jsp"/>" style="background-color: #9933FF;">작성</a>
<%--                 <a class="btn btn-dark btn-xl" href="<c:url value="/member/addMember.jsp"/>" style="background-color: #9933FF;">수정</a> --%>
            </div>

</body>
</html>