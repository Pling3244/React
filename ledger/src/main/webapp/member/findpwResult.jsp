<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.searchDAO"%>

<%
 request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
    String name = request.getParameter("name");
     String phone = request.getParameter("phone");
     
 searchDAO dao = new searchDAO();
 String password = dao.findpw(id, name, phone); //아이디를 디비에서 가져옴..실패시 널
 
%>

  <form name="idsearch" method="post">
      <%
       if (password != null) {
      %>
      
      <div class = "container">
      	<div class = "found-success">
	      <h4>  회원님의 비밀번호는 </h4>  
	      <div class ="found-id"><%=password%></div>
	      <h4>  입니다 </h4>
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnLogin" value="로그인" onClick = "location.href='loginMember.jsp'"/>
       	</div>
       </div>
      <%
  } else {
 %>
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <input type="button" id="btnjoin" value="회원가입" onClick="location.href='addMember.jsp'"/>
       	</div>
       </div>
       
<!--     <div class = "adcontainer"> -->
<!-- 	<a href="#" ><img src = "../images/casead.png" /></a>                 -->
<!-- </div>    -->
       <%
  }
 %> 
      </form>
   