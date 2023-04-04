<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR" %>
<% request.setCharacterEncoding("euc-kr"); %>
<% response.setHeader("Pragma","no-cache"); %>
<!--사용자 정보 개인페이지-->
<html>
<head>
<style type="text/css">

<!--
.style1 {font-family: "바탕"; font-size: 13; }
.style5 {font-family: "바탕"; font-size: 15; }
-->
</style>
</head>
<BODY>
<div align="center">
<span class="style5">거래 내역을 입력하세요.</span></div>
<form action="./insert_InOut.jsp" method="get">
<table width="250" border ="0" align="center" cellpadding="0" cellspacing="1">

<tr class="style5" >
<td align="right" bgcolor="blue"><div align="center"><span
class="style1"> ID</span></div></td>
<td><input name ="user_ID" type="text" size ="20"> </input>
</td>
</tr>
<tr class="style5" >
<td align="right" bgcolor="BLUE"><div align="center"><span
class="style1"> 수입/지출 </span></div></td>
<td><input type="radio" name="in_or_out" value="In" checked>수입 </input>
<input type="radio" name="in_or_out" value="Out">지출 </input>
</td>
</tr>
<tr class="style5" >
<td align="right" bgcolor="BLUE"><div align="center"><span
class="style1"> 신용카드/현금</span></div></td>
<td><input type="radio" name="cash_or_not" value="card" checked>신용카드 </input>
<input type="radio" name="cash_or_not" value="cash">현금</input>
</td>
</tr>
<tr class="style5" >
<td align="right" bgcolor="blue"><div align="center"><span
class="style1"> 거래금액 </span></div></td>
<td><input name ="amount" type="text" size ="20"> </input>
</td>
</tr>
<tr class="style5" >
<td align="right" bgcolor="blue"><div align="center"><span
class="style1"> 거래날짜 </span></div></td>
<td><input name ="event_day" type="text" size ="20"> </input><br>
ex)YY-MM-DD
</td>
</tr>
<tr class="style5" >
<td align="right" bgcolor="blue"><div align="center"><span
class="style1"> 상세내용 </span></div></td>
<td><input name ="description" type="text" size ="20" > </input>
</td>
</tr>

<tr><tr height="5">
<td></td><td></td></tr>
<tr>
<td align="right"colspan="2"><input type="submit" value=" 저장"
onClick ="true"></td></tr>
</tr>
</table>
</form>
</BODY>
</html>