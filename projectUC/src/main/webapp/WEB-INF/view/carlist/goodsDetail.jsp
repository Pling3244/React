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
					
							<!-- Earnings (Monthly) Card Example -->							
								<div class="col-xl-3 col-md-6 mb-4">
									<div class="card border-left-primary shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xs font-weight-bold text-dark text-uppercase mb-1">
														<div class="image_wrap"
														data-num="${goodsInfo.imageList[0].num}"
														data-path="${goodsInfo.imageList[0].uploadPath}"
														data-uuid="${goodsInfo.imageList[0].uuid}"
														data-filename="${goodsInfo.imageList[0].fileName}"><img></div>													
														<h3 style="display:inline">${goodsInfo.cop_name} ${goodsInfo.br_name} ${goodsInfo.car_name}</h3>
														<h5 style="display:inline">(${goodsInfo.model_year})</h5>&nbsp;
														<a class="btn btn-primary btn-xl">${goodsInfo.owner}</a>
														<hr>
														<h5>${goodsInfo.fuel_type} / ${goodsInfo.color} / ${goodsInfo.number_p}인승</h5>
														<h4>주행거리 : ${goodsInfo.mileage}Km</h4>
														<h4 style="color:blue">판매가격 : ${goodsInfo.price}만원</h4>
														<textarea rows="5" cols="35" wrap="hard" readonly="readonly"><c:out value="${goodsInfo.uc_text}"/></textarea> 
														<hr>
														<h5 style="display:inline">판매자 : ${goodsInfo.seller}</h5>
														<div style="display:inline; font-size:2em" type="button" href="/main">
														<i class="fas fa-envelope fa-fw"></i></div>
														<h5 style="text-align:right; font-size:1em">작성일 : ${goodsInfo.regdate1}</h5>
														<h5 style="text-align:right; font-size:1em">수정일 : ${goodsInfo.updatedate1}</h5>													
														
														
														</div>
														</div>												
													</div>
													<div class="h5 mb-0 font-weight-bold text-gray-800">													
														
													</div>
													<div
														class="text-xs font-weight-bold text-primary text-uppercase mb-1">

													</div>
												</div>
												<div class="col-auto" id="uploadResult">
<!-- 												<i class="fas fa-calendar fa-2x text-gray-300"></i> -->
												</div>
											</div>
										</div>

									</div>
								</div>							
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
$(document).ready(function(){

	/* 이미지 삽입 */
	const bobj = $(".image_wrap");
	
	if(bobj.data("num")){
		const uploadPath = bobj.data("path");
		const uuid = bobj.data("uuid");
		const fileName = bobj.data("filename");
		
		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
		
		bobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
	} else {
		bobj.find("img").attr('src', '/resources/img/noimage.png');
	}
});	
</script>

</html>