<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/modal.jsp"%>
<%@ include file="../include/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">	
</script>

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
								<div class="col-xl-3 col-md-7 mb-4 align-items-center">
									<div class="card border-left-primary shadow h-100 py-2">
										<div class="card-body">
											<div class="row no-gutters align-items-center">
												<div class="col mr-2">
													<div class="text-xs font-weight-bold text-dark text-uppercase mb-1">
														<div class="image_wrap1"><img></div>
													
														
														<c:forEach items="${goodsInfo.imageList}" var="i">
														<div class="image_wrap"
														data-num="<c:out value="${i.num}"/>"
														data-path="<c:out value="${i.uploadPath}"/>"
														data-uuid="<c:out value="${i.uuid}"/>"
														data-filename="<c:out value="${i.fileName}"/>"><img></div>
														</c:forEach>
														<hr>													
														<h4 style="display:inline"><b>${goodsInfo.cop_name} ${goodsInfo.br_name} ${goodsInfo.car_name}</b></h4>
														<h5 style="display:inline">(${goodsInfo.model_year})</h5>&nbsp;
														<div class ="owncolor"  style="display:inline">
															<c:if test="${goodsInfo.owner eq '실차주'}"> 
																<a class="btn btn-primary btn-xl" style="display:inline; font-size:0.5em">${goodsInfo.owner}</a>
															</c:if>
															<c:if test="${goodsInfo.owner ne '실차주'}"> 
																<a class="btn btn-warning" style="display:inline; font-size:0.5em">${goodsInfo.owner}</a>
															</c:if>
														</div>
														<hr>
														<h5>${goodsInfo.fuel_type} / ${goodsInfo.color} / ${goodsInfo.number_p}인승</h5>
														<h4>주행거리 : ${goodsInfo.mileage}Km</h4>
														<h4 style="color:blue"><b>판매가격 : ${goodsInfo.price}만원</b></h4>
														<textarea rows="5" cols="35" wrap="hard" style="font-size:1.3em" readonly="readonly"><c:out value="${goodsInfo.uc_text}"/></textarea> 
														<hr>
														<h5 style="display:inline">판매자 : <b>${goodsInfo.seller}</b></h5>
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
	
	for(var i = 0; i<bobj.length; i++){		
				
		if( $(bobj[i]).data("num")){
			const uploadPath = $(bobj[i]).data("path");		
			const uuid = $(bobj[i]).data("uuid");
			const fileName = $(bobj[i]).data("filename");
			
	// 		const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			 $(bobj[i]).find("img").attr('src', '/resources/upload/'+ uploadPath + "/s_" + uuid + "_" + fileName);			
		}			
	}
	if(bobj.length ==0 ) {
		$(".image_wrap1").find("img").attr('src', '/resources/img/noimage.png');		
	}
});
</script>

</html>