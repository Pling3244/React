<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />


<nav class="navbar navbar-expand navbar-dark" style="background-color: #9933FF;">
  <div class="container">
 	   <c:choose>
 	  
 	   	<c:when test="${empty sessionId}">
 	   	<ul class="navbar-nav ml-auto">
			<li><a class="navbar-brand" href="/ledger/welcome.jsp">Login</a></li>
			</ul>
		</c:when>
		
		<c:otherwise>
		<div class="navbar-header">
		<a class="navbar-brand" href="<c:url value="/note/mynote.jsp"/>">MyNote </a>
		</div>
		<ul class="navbar-nav ml-auto">
			<li><a class="navbar-item" style="padding-right: 7px; color: white">[<%=sessionId%>]</a></li>
			<li><a class="navbar-item" style="padding-right: 10px; color: white" href="<c:url value="/member/logoutMember.jsp"/>">LogOut </a></li>
			<li><a class="navbar-item" style="padding-right: 7px; color: white" href="<c:url value="/member/updateMember.jsp"/>">MyPage </a></li>			
		</ul>
		</c:otherwise>

		</c:choose>	
	
<!-- 	<div class="navbar-header"> -->
<!-- 			<a class="navbar-brand" href="/webmarket/products.jsp">Products</a> -->
<!-- 	</div> -->
<!-- 	<div class="navbar-header"> -->
<%-- 			<a class="navbar-brand" href="<c:url value="/BoardListAction.do?pageNum=1"/>">Board</a> --%>
<!-- 	</div> -->

   
<!--       <ul class="navbar-nav ml-auto"> -->
<%--       <c:choose> --%>
<%-- 					<c:when test="${empty sessionId}"> --%>
<!-- 						<li class="nav-item"><a class="nav-link" href="/ledger/welcome.jsp"/>Login </a></li> -->
<%-- 						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/addMember.jsp"/>'>SignUp</a> --%> 
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<%-- 						<li style="padding-top: 7px; color: white">[<%=sessionId%>]</li> --%>
<%-- 						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">LogOut </a></li> --%>
<%-- 						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/updateMember.jsp"/>'>MyPage</a> --%>
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
      
<!--       			<li class="nav-item"><a class="nav-link" href="/webmarket/cart.jsp">MyCart</a></li> -->
<!-- 				<li class="nav-item"><a class="nav-link" href="/webmarket/addProduct.jsp">Add</a></li> -->
<!-- 				<li class="nav-item"><a class="nav-link" href="/webmarket/editProduct.jsp?edit=update">Revise</a></li> -->
<!-- 				<li class="nav-item"><a class="nav-link" href="/webmarket/editProduct.jsp?edit=delete">Delete</a></li> -->
<!--       </ul> -->
       
       </div>
    
 
</nav>