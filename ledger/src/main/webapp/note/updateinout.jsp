<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<%-- <% --%>
<!-- 	String sessionId = (String) session.getAttribute("sessionId"); -->
<%-- %> --%>
<%-- <sql:setDataSource var="dataSource" --%>
<%-- 	url="jdbc:oracle:thin:@localhost:1521:xe" --%>
<%-- 	driver="oracle.jdbc.driver.OracleDriver" user="ledger" password="oracle" /> --%>


<%-- <sql:query dataSource="${dataSource}" var="resultSet"> --%>
<!--    SELECT * FROM INOUT WHERE ID=? -->
<%--    <sql:param value="<%=sessionId%>" /> --%>
<%-- </sql:query> --%>

	
	<title>항목 수정</title>
</head>
<body onload="init()">
	<jsp:include page="/menu.jsp" />
<!-- 	<div class="jumbotron"> -->
			<div class="container">
		  <h1 class="mb-5"></h1>
			<h1 class="display-5">항목 수정</h1>
			<h1 class="mb-5"></h1>
		</div>
	<%@ include file="dbconn.jsp"%>
	<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="ledger" password="oracle" />

<%
		String num = request.getParameter("num");
	
		String sql = "select * from inout where num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, num);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>

	<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM INOUT WHERE NUM=<%=rs.getString("num")%>
<%--    <sql:param value="<%=rs.getString("num")%>" /> --%>
	</sql:query>

	<c:forEach var="row" items="${resultSet.rows}">
	<c:set var="time" value="${row.day }" />
	<c:set var="year" value="${time.split('/')[0]}" />
	<c:set var="month" value="${time.split('/')[1]}" />
	<c:set var="day" value="${time.split('/')[2]}" />
	
	<div class="container">
		<div class="row">
			<div class="col-md-7">
				<form name="newnote" class="form-horizontal"
			action="processupdateinout.jsp?num=<%=rs.getString("num")%>" method="post"
			onsubmit="return checkForm()">
				<div class="form-group row">
				<label class="col-sm-2">거래 날짜</label>
				<div class="col-sm-4  ">
					<input type="text" name="dayyy" maxlength="4" placeholder="년(4자)" size="6" value="${year}"> 
					<select name="daymm" id="daymm">
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
					</select> <input type="text" name="daydd" maxlength="2" placeholder="일" size="4" value="${day}">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">수입/지출</label>
				<div class="col-sm-10">
				<c:set var="inout" value="${row.in_or_out }" />
					<input name="inout" type="radio" value="수입" <c:if test="${inout.equals('수입')}"> <c:out value="checked" /> </c:if> /> 수입
					<input name="inout" type="radio" value="지출" <c:if test="${inout.equals('지출')}"> <c:out value="checked" /> </c:if> /> 지출
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">카드/현금</label>
				<div class="col-sm-10">
				<c:set var="cashcard" value="${row.cashcard }" />
					<input name="cashcard" type="radio" value="카드" <c:if test="${cashcard.equals('카드')}"> <c:out value="checked" /> </c:if> /> 카드
					<input name="cashcard" type="radio" value="현금" <c:if test="${cashcard.equals('현금')}"> <c:out value="checked" /> </c:if> /> 현금
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">거래 금액</label>
				<div class="col-sm-3">
					<input name="money" type="text" class="form-control" placeholder="money" value="<c:out value='${row.money}'/>">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">상세 내역</label>
				<div class="col-sm-3">
					<input name="description" type="text" class="form-control" placeholder="description" value="<c:out value='${row.description}'/>">
				</div>
			</div>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-dark btn-xl" style="background-color: #9933FF;" value="수정" > 
<!-- 					<input type="reset" class="btn btn-primary " value="취소 " onclick="reset()" > -->
				</div>
			</div>
				</form>

			</div>
		</div>
	</div>
	</c:forEach>
	<%
		}
		if (rs != null)
			rs.close();
 		if (pstmt != null)
 			pstmt.close();
 		if (conn != null)
			conn.close();
 	%>
 	
</body>
</html>
<script type="text/javascript">
	function init() {
// 		setComboMailValue("${mail2}");
		setComboDayValue("${month}");
	}

// 	function setComboMailValue(val) {
// 		var selectMail = document.getElementById('mail2');
// 		for (i = 0, j = selectMail.length; i < j; i++) {
// 			if (selectMail.options[i].value == val) {
// 				selectMail.options[i].selected = true; 
// 				break;
// 			}
// 		}
// 	}
	function setComboDayValue(val) {
		var selectDay = document.getElementById('daymm'); 
		for (i = 0, j = selectDay.length; i < j; i++){
			if (selectDay.options[i].value == val){
				selectDay.options[i].selected = true; 
				break;
			}
		}
	}

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