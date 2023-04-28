<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>

<%@ include file="../include/modal.jsp"%>
<%@ include file="../include/header.jsp"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">	
</script>
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>

<body id="page-top">

	<%@ include file="../include/content_topbar.jsp"%>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">Cards</h1>
					</div>

					<div class="row">
						<c:if test="${listcheck != 'empty'}">
							<!-- Earnings (Monthly) Card Example -->
							<c:forEach items="${list}" var="list">
								<div class="col-xl-3 col-md-6 mb-4">
									<a class="card border-left-primary shadow h-100 py-2" id="move" href="/carlist/goodsDetail/<c:out value="${list.num}"/>">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div
														class="text-xs font-weight-bold text-dark text-uppercase mb-1">
														<c:out value="${list.cop_name}"></c:out>
														<c:out value="${list.br_name}"></c:out>
														<c:out value="${list.car_name}"></c:out>
													</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">
														<c:out value="${list.price}"></c:out>
														만원
													</div>
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">
														<c:out value="${list.seller}"></c:out>
													</div>
												</div>
												<div class="col-auto" id="uploadResult">
<!--  												<i class="fas fa-calendar fa-2x text-gray-300"></i>  -->
												</div>
											</div>
										</div>

									</a>
								</div>
							</c:forEach>
						</c:if>					
					</div>
					<!-- End of Main Content -->

					<%@ include file="../include/footer.jsp"%>

				</div>
				<!-- End of Content Wrapper -->

			</div>
			<!-- End of Page Wrapper -->

			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>
</body>

<script>
	/* 이미지 정보 호출 */
			
	let uploadReslut = $("#uploadResult");
	let num = 17;

	$.getJSON("/carlist/getAttachList", {num : num}, function(arr) {		
	
		if(arr.length === 0){		
			
			let str = "";
			str += "<div id='result_card'>";
			str += "<img src='/resources/img/noimage.png'>";
			str += "</div>";
			
			uploadResult.html(str);	
			
			return;
		}
						
			let str = "";
			let obj = arr[0];

			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath + "'>";
			str += "</div>";

			uploadResult.html(str);

	});
</script>

</html>