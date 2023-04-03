<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>

	<%@ include file="menu.jsp"%>

	<body>
	 <header class="masthead d-flex align-items">
            <div class="container px-4 px-lg-5 text-center">
            <h1 class="mb-5"></h1>
           		 <h1 class="mb-5">My Web Finance</h1>
                <h4 class="mb-5"><em>당신의 지출을 관리하세요</em></h4>
                <a class="btn btn-dark btn-xl" href="<c:url value="/member/loginMember.jsp"/>" style="background-color: #9933FF;">로그인</a>
                <a class="btn btn-dark btn-xl" href="<c:url value="/member/addMember.jsp"/>" style="background-color: #9933FF;">회원가입</a>
            </div>
      </header>
		<h1 class="mb-5"></h1>
        <%@ include file="footer.jsp"%>
        
    </body>
</html>
