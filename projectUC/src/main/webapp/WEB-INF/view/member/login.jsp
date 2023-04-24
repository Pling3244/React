<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Login</title>

	<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
	
    <!-- Custom fonts for this template-->
    <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
	

</head>

<body class="bg-gradient-dark">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-10 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h1 text-gray-900 mb-4">Login</h1>
                                    </div>
                                    <form id="login_form" method="post">
                                        <div class="form-group">
                                            <input type="id" class="form-control form-control-user"
                                                name="id" placeholder="아이디를 입력하세요">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                name="Password" placeholder="비밀번호를 입력하세요">
                                        </div>
<!--                                         <div class="form-group"> -->
<!--                                             <div class="custom-control custom-checkbox small"> -->
<!--                                                 <input type="checkbox" class="custom-control-input" id="customCheck"> -->
<!--                                                 <label class="custom-control-label" for="customCheck">Remember -->
<!--                                                     Me</label> -->
<!--                                             </div> -->
<!--                                         </div> -->
										<c:if test = "${result == 0 }">
											<div class = "Login_warn" style="color:red">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
 											<h1 class="mb-3"></h1>
 										</c:if>
 										
										<a class="login_button">
											<button class="btn btn-primary btn-user btn-block">로그인</button>
										</a>
<!--                                         <a href="index.html" class="btn btn-dark btn-user btn-block"> -->
<!--                                             로그인 -->
<!--                                         </a> -->
                                        <hr>
<!--                                         <a href="index.html" class="btn btn-google btn-user btn-block"> -->
<!--                                             <i class="fab fa-google fa-fw"></i> Login with Google -->
<!--                                         </a> -->
<!--                                         <a href="index.html" class="btn btn-facebook btn-user btn-block"> -->
<!--                                             <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook -->
<!--                                         </a> -->
                                    </form>
<!--                                     <hr> -->
                                    <div class="text-center">
                                    	<a class="small" href="forgot-password.html">아이디 찾기</a>
                                        <a class="small" href="forgot-password.html">비밀번호 찾기</a>
                                    </div>
                                    <div class="text-center">
                                        <a class="small" href="join">회원가입</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

	<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        
//         alert("로그인 버튼 작동");
        
        // 로그인 메서드 서버 요청
    	$("#login_form").attr("action", "/member/login");
        $("#login_form").submit();
        
        
    });
 
</script>

</body>

</html>