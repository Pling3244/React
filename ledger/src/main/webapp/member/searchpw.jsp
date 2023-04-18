<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if (!document.newMember.name.value) {
			alert("성명을 입력하세요.");
			return false;
		}		
	}
</script>
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
<!-- 	<div class="jumbotron"> -->
		<div class="container">
		  <h1 class="mb-5"></h1>
			<h1 class="display-5">비밀번호 찾기</h1>
			<h1 class="mb-5"></h1>
		</div>
<!-- 	</div> -->

	<div class="container">
		<form name="newMember" class="form-horizontal"  action="findpwResult.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="name" >
				</div>
			</div>
		
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" >

				</div>
			</div>

			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-dark btn-xl" style="background-color: #9966FF;" value="찾기 " > 
<!-- 					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" > -->
				</div>
			</div>
		</form>
	</div>
</body>
</html>