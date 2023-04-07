<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function checkForm() {
// 		if (!document.newMember.id.value) {
// 			alert("아이디를 입력하세요.");
// 			return false;
// 		}

		if (!document.newnote.money.value) {
			alert("금액을 입력하세요.");
			return false;
		}

// 		if (document.newMember.password.value != document.newMember.password_confirm.value) {
// 			alert("비밀번호를 동일하게 입력하세요.");
// 			return false;
// 		}
	}
</script>

<title>가계부</title>
</head>
<jsp:include page="/menu.jsp" />
<!-- 	<div class="jumbotron"> -->
			<div class="container">
		  <h1 class="mb-5"></h1>
			<h1 class="display-5" align="center">가계부 작성</h1>
			<h1 class="mb-5"></h1>
		</div>
		
<body>
<div class="container">
		<form name="newnote" class="form-horizontal"  action="addinout.jsp" method="post" onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">거래 날짜</label>
				<div class="col-sm-4  ">
					<input type="text" name="dayyy" maxlength="4" placeholder="년(4자)" size="6"> 
					<select name="daymm">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input type="text" name="daydd" maxlength="2" placeholder="일" size="4">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">수입/지출</label>
				<div class="col-sm-10">
					<input name="inout" type="radio" value="수입" /> 수입 
					<input name="inout" type="radio" value="지출" /> 지출
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">카드/현금</label>
				<div class="col-sm-10">
					<input name="cashcard" type="radio" value="카드" /> 카드
					<input name="cashcard" type="radio" value="현금" /> 현금
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">거래 금액</label>
				<div class="col-sm-3">
					<input name="money" type="text" class="form-control" placeholder="money" >
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">상세 내역</label>
				<div class="col-sm-3">
					<input name="description" type="text" class="form-control" placeholder="description" >
				</div>
			</div>
		
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 " > 
<!-- 					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" > -->
				</div>
			</div>
		</form>
	</div>
		
		
</body>		
</html>