<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/modal.jsp"%>
<%@ include file="../include/header.jsp"%>

<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}	
</style>

<c:if test="${member == null }">
	<script>
	 	alert("로그인 하신 후에 사용해주세요");
	 	location.href="/member/login";
	</script>
</c:if>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">  </script>

<body class="bg-gradient-dark">

	<%@ include file="../include/content_topbar.jsp"%>

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h1 text-gray-900 mb-4">중고차 판매등록</h1>
							</div>
							<form name='form' id="regist_form" method="post"
								enctype="multipart/form-data">
								<input name="seller" type="hidden" value="${member.id}">
								<div class="form-group row">
									<b>회사명</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<select name="cop_name" class="form-control form-control-user cate1">
											<option selected value="none">--회사명--</option> 											
										</select>
									</div>
									<!--                                    <span class="id_input_re_1">사용 가능한 아이디입니다.</span> -->
									<!-- 									<span class="id_input_re_2">중복된 아이디입니다.</span> -->
									<!-- 									<span class="final_id_ck">아이디를 입력해주세요.</span>   -->
								</div>
								<div class="form-group row">
									<b>브랜드명</b>
									<div class="col-sm-6 mb-3 mb-sm-0 ">
										<select name="br_name" class="form-control form-control-user cate2">
											<option selected value="none">--브랜드명--</option>
										</select>
									</div>
									<!--                                     <span class="final_name_ck">이름을 입력해주세요.</span>   -->
								</div>
								<div class="form-group  row">
									<b>차량모델명</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input name="car_name" type="text"
											class="form-control form-control-user"
											placeholder="--차량모델명--">
									</div>
									<!--                                	 <span class="final_phone_ck">휴대폰 번호를 입력해주세요.</span>   -->
								</div>
								<div class="form-group  row">
									<b>차량연식(년)</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input name="model_year" type="text"
											class="form-control form-control-user" placeholder="ex: 2022">
									</div>
									<!--                                   <span class="final_region_ck">사는 지역을 입력해주세요.</span>   -->
								</div>
								<div class="form-group  row">
									<b>주행거리(Km)</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input name="mileage" type="text"
											class="form-control form-control-user"
											placeholder="ex: 13500">
									</div>
									<!--                                   <span class="final_region_ck">사는 지역을 입력해주세요.</span>   -->
								</div>
								<div class="form-group  row">
									<b>승차정원(인)</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input name="number_p" type="text"
											class="form-control form-control-user" placeholder="ex: 5">
									</div>
									<!--                                   <span class="final_region_ck">사는 지역을 입력해주세요.</span>   -->
								</div>
								<div class="form-group  row">
									<b>연료타입</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<select name="fuel_type"
											class="form-control form-control-user">
											<option value="">--연료타입--</option>
											<option value="가솔린">가솔린</option>
											<option value="디젤">디젤</option>
											<option value="LPG">LPG</option>
											<option value="하이브리드">하이브리드</option>
											<option value="전기">전기</option>
											<option value="기타">기타</option>
										</select>
									</div>
									<!--                                   <span class="final_region_ck">사는 지역을 입력해주세요.</span>   -->
								</div>
								<div class="form-group  row">
									<b>차량색상</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<select name="color" class="form-control form-control-user">
											<option value="">--차량색상--</option>
											<option value="검정색">검정색</option>
											<option value="흰색">흰색</option>
											<option value="은색">은색</option>
											<option value="회색">회색</option>
											<option value="빨간색">빨간색</option>
											<option value="파란색">파란색</option>
											<option value="주황색">주황색</option>
											<option value="갈색">갈색</option>
											<option value="초록색">초록색</option>
											<option value="노란색">노란색</option>
											<option value="보라색">보라색</option>
											<option value="기타">기타</option>
										</select>
									</div>
									<!--                                   <span class="final_region_ck">사는 지역을 입력해주세요.</span>   -->
								</div>
								<div class="form-group  row">
									<b>매매지역</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<select name="region" class="form-control form-control-user">
											<option value="">--매매지역--</option>
											<option value="서울">서울</option>
											<option value="인천">인천</option>
											<option value="대전">대전</option>
											<option value="대구">대구</option>
											<option value="광주">광주</option>
											<option value="부산">부산</option>
											<option value="울산">울산</option>
											<option value="세종">세종</option>
											<option value="경기">경기</option>
											<option value="강원">강원</option>
											<option value="경남">경남</option>
											<option value="경북">경북</option>
											<option value="전남">전남</option>
											<option value="전북">전북</option>
											<option value="충남">충남</option>
											<option value="충북">충북</option>
											<option value="제주">제주</option>
											<option value="기타">기타</option>
										</select>
									</div>
									<!--                                   <span class="final_region_ck">사는 지역을 입력해주세요.</span>   -->
								</div>
								<div class="form-group  row">
									<b>실차주 여부</b>
									<div class="col-sm-10">
										<input name="owner" type="radio" value="실차주" /> 실차주 <input
											name="owner" type="radio" value="실차주 아님" /> 실차주아님
									</div>
									<!-- 									<span class="final_gender_ck">성별을 체크해주세요.</span>   -->
								</div>
								<div class="form-group  row">
									<b>판매가격(만원)</b>
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input name="price" type="text"
											class="form-control form-control-user" placeholder="ex: 2500">
									</div>
									<!--                                   <span class="final_region_ck">사는 지역을 입력해주세요.</span>   -->
								</div>
								<div class="form-group row">
									<b>차량사진첨부</b> <input type="file" multiple="multiple"
										id="fileItem" name="car_img" style="height: 30px;">
									<div id="uploadResult"></div>
								</div>
								<div class="form-group row">
									<b>알림사항</b>
									<div class="col-sm-8">
										<textarea name="uc_text" cols="50" rows="5"
											class="form-control" placeholder="구매 문의는 쪽지를 보내주세요"></textarea>
									</div>
								</div>

								<a class="regist_button">
									<button class="btn btn-primary btn-user btn-block">판매등록</button>
								</a>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>

	<script>
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {
			
			/* 이미지 존재시 삭제 */
			if($(".imgDeleteBtn").length > 0){
				deleteFile();
			}

			let formData = new FormData();
			let fileInput = $('input[name="car_img"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			// 		if(!fileCheck(fileObj.name, fileObj.size)){
			// 			return false;
			// 		}

			// 		alert("파일 확인완료")
			for (let i = 0; i < fileList.length; i++) {
				formData.append("car_img", fileList[i]);
			}

			$.ajax({
				url : '/carlist/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadImage(result);
				},
				error : function(result) {
					alert("이미지 파일이 아닙니다.");
				}
			});
		});

		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	

		function fileCheck(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;

		}

		/* 이미지 출력 */
		function showUploadImage(uploadResultArr) {			

			/* 전달받은 데이터 검증 */
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return
			}
			
			let uploadResult = $("#uploadResult");

			for (let i = 0; i < uploadResultArr.length; i++) {
			
			let obj = uploadResultArr[i];

			let str = "";

			let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

			str += "<div id='result_card'>";
			str += "<img src='/carlist/display?fileName=" + fileCallPath + "'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList["+i+"].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList["+i+"].uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";
						
			uploadResult.append(str); 
			}
		}
		
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
			
			deleteFile();
			
		});		
		
		/* 파일 삭제 메서드 */
		function deleteFile(){
			
			let targetFile = $(".imgDeleteBtn").data("file");
			
			let targetDiv = $("#result_card");
			
			$.ajax({
				url: '/carlist/deleteFile',
				data : {fileName : targetFile},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					
					targetDiv.remove();
					$("input[type='file']").val("");
					
				},
				error : function(result){
					console.log(result);
					
					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
		
		/* 상품 등록 버튼 */
		$(".regist_button").on("click", function() {

			$("#regist_form").attr("action", "/carlist/carRegist");
			$("#regist_form").submit();

		});
		
		/* 카테고리 */
		let cateList = JSON.parse('${cateList}');
		
		let cate1Array = new Array();
		let cate2Array = new Array();		
		let cate1Obj = new Object();
		let cate2Obj = new Object();
		
		let cateSelect1 = $(".cate1");		
		let cateSelect2 = $(".cate2");
		
		/* 카테고리 배열 초기화 메서드 */
		function makeCateArray(obj,array,cateList, tier){
			for(let i = 0; i < cateList.length; i++){
				if(cateList[i].tier === tier){
					obj = new Object();
					
					obj.cateName = cateList[i].cateName;
					obj.cateCode = cateList[i].cateCode;
					obj.cateParent = cateList[i].cateParent;
					
					array.push(obj);				
					
				}
			}
		}	
		
		/* 배열 초기화 */
		makeCateArray(cate1Obj,cate1Array,cateList,1);
		makeCateArray(cate2Obj,cate2Array,cateList,2);
		
		for(let i = 0; i < cate1Array.length; i++){
			cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
		}
		
		/* 중분류 <option> 태그 */
		$(cateSelect1).on("change",function(){
			
			let selectVal1 = $(this).find("option:selected").val();	
			
			cateSelect2.children().remove();
			
			cateSelect2.append("<option value='none'>--브랜드명--</option>");
			
			for(let i = 0; i < cate2Array.length; i++){
				if(selectVal1 === cate2Array[i].cateParent){
					cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
				}
			}// for
		});
	</script>	
</html>