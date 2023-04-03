<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<nav class="navbar navbar-expand  navbar-dark bg-dark">
  <div class="container">
    <div class="navbar-header">
			<a class="navbar-brand" href="/webmarket/welcome.jsp">Login</a>	
	</div>
	<div class="navbar-header">
			<a class="navbar-brand" href="/webmarket/products.jsp">Products</a>
	</div>
	<div class="navbar-header">
			<a class="navbar-brand" href="<c:url value="/BoardListAction.do?pageNum=1"/>">Board</a>
	</div>

   
      <ul class="navbar-nav ml-auto">
      <c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">Login </a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/addMember.jsp"/>'>SignUp</a>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%=sessionId%>]</li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">LogOut </a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/updateMember.jsp"/>'>MyPage</a>
					</c:otherwise>
				</c:choose>
      
      			<li class="nav-item"><a class="nav-link" href="/webmarket/cart.jsp">MyCart</a></li>
				<li class="nav-item"><a class="nav-link" href="/webmarket/addProduct.jsp">Add</a></li>
				<li class="nav-item"><a class="nav-link" href="/webmarket/editProduct.jsp?edit=update">Revise</a></li>
				<li class="nav-item"><a class="nav-link" href="/webmarket/editProduct.jsp?edit=delete">Delete</a></li>
      </ul>
       
       </div>
    
 
</nav>