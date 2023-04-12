<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<link rel="stylesheet" href="/ledger/resources/css/bootstrap.min.css" />

<nav class="navbar navbar-expand navbar-dark" style="background-color: #9966FF;">
  <div class="container">
 	   <c:choose>
 	  
 	   	<c:when test="${empty sessionId}">
 	   	<div class="navbar-header">
		<a class="navbar-nav" href="<c:url value="/note/admin.jsp"/>">Admin </a>
		</div>
 	   	<ul class="navbar-nav ml-auto">
			<li><a class="navbar-brand" href="/ledger/welcome.jsp">Login</a></li>
			</ul>
		</c:when>
		
		<c:otherwise>
		<div class="navbar-header">
		<a class="navbar-brand" href="<c:url value="/note/list.jsp"/>">MyNote </a>
		</div>
		<ul class="navbar-nav nav-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" style="color: white" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">[<%=sessionId%>]<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<c:url value="/member/updateMember.jsp"/>"> MyPage </a></li>
							 <li class="divider"></li>
							<li><a class="dropdown-item" href="<c:url value="/member/logoutMember.jsp"/>"> LogOut </a></li>
	
		</ul>
		</li></ul>
	</c:otherwise>
	</c:choose>	      
 </div>
</nav>