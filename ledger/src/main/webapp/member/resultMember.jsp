<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>회원 정보</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	 <header class="masthead d-flex align-items">
            <div class="container px-4 px-lg-5 text-center">
            <h1 class="mb-5"></h1>
           		 <h1 class="mb-5">My Web Finance</h1>
<!-- 	<div class="jumbotron"> -->
<!-- 		<div class="container"> -->
<!-- 			<h1 class="display-3">회원정보</h1> -->
<!-- 		</div> -->
<!-- 	</div> -->
	</div>
	</header>
	<div class="container" align="center">
		<%
			String msg = request.getParameter("msg");

			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
				else if (msg.equals("2")) {
					response.sendRedirect("/ledger/note/list.jsp");
// 					String loginId = (String) session.getAttribute("sessionId");
// 					out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
				}				
			} else {
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
			}
		%>
	</div>	
</body>
</html>