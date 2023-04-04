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
String discription = request.getParameter("discription");
	
	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="ledger" password="oracle" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO INOUT VALUES (?, ?, ?, ?, ?, ?, ?)
   <sql:param value="<%=time%>" />
	<sql:param value="<%=inout%>" />
	<sql:param value="<%=cashcard%>" />
	<sql:param value="<%=money%>" />
	<sql:param value="<%=discription%>" />
	<sql:param value="<%=sessionId%>" />
	<sql:param value="<%=timestamp%>" />
</sql:update>

<c:if test="${resultSet>=1}">
<script>location.href = "list.jsp"; </script>
<!-- 	response.sendRedirect("/ledger/note/list.jsp"); -->
<%-- 	<c:redirect url="resultMember.jsp?msg=1" /> --%>
</c:if>

