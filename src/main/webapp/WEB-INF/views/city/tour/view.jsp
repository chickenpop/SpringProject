<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="container">
		<div class="col d-flex justify-content-center align-items-center">
			<div class="card my-2" style="width: 702px; border-color: white;">
				<div class="row no-gutters">
					<img src="/planitshare/resources/image/${dto.image}" class="img-fluid"
						alt="숙소이미지">
					<div class="col">
						<div class="card-block px-4">
							<h4 class="card-title">${dto.placeName}</h4>
							<div class="card-text">${dto.category}</div>
							<div class="card-text">${dto.address}</div>
							<div class="card-text">영업시작시간: ${dto.open} 영업종료시간:
								${dto.close}</div>
							<div class="card-text">
								<i class="fa-solid fa-heart"></i>${dto.likeCnt}<i
									class="fa-solid fa-star"></i>
								<c:if test="${not empty dto.reviewAvg}">${dto.reviewAvg}</c:if>
								<c:if test="${empty dto.reviewAvg}">0</c:if>
								(${dto.reviewCnt})
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<form id="likeform">
    	<button type="button" class="btn float-right" onclick="like(${dto.seq});"><i id="like" class="fa-solid fa-heart"></i></button> 
    </form>
    </div>

	       
      <!-- 리뷰 등록 -->
    <form method="POST" action="/planitshare/city/tourreviewadd" enctype="multipart/form-data">
	<table class="table table-borderless" style="margin-top: 50px;">
		<tr>
			<td>
				<div class="rateit" data-rateit-resetable="false" data-rateit-mode="font" data-rateit-icon="" style="font-family:fontawesome"></div>
				<input type="file" name="attach">
			</td>
		</tr>
		<tr>
			<td><textarea class="form-control" name="content" required placeholder="리뷰를 입력해주세요"></textarea></td>
			<td>
				<input type="submit" value="리뷰등록" class="btn btn-secondary">
			</td>
		</tr>
	</table>
	<input type="hidden" name="star">
	<input type="hidden" name="seq"  value="${sdto.seq}">
	<input type="hidden" name="cseq" value="${sdto.cseq}">
	</form>

	<table class="table table-bordered" style="width: 1000px; margin-left: auto; margin-right: auto;">
		<c:forEach items="${rlist}" var="rdto">
			<c:if test="${empty rdto.image}">
				<tr>
					<td>
						<div>
							<span class="rateit" data-rateit-resetable="false" data-rateit-mode="font" data-rateit-icon="" style="font-family: fontawesome"></span>
						</div> ${rdto.id} ${rdto.regdate}
						<div>${rdto.content}</div> 
						<c:if test="${auth.id == rdto.id}">
							<div>
								<span class="btnspan"><a href="#!" onclick="delTourReview(${rdto.seq});">[삭제]</a></span> 
								<span class="btnspan"><a href="#!" onclick="editTourReview(${rdto.seq});">[수정]</a></span>
							</div>
						</c:if>
					</td>
				</tr>
			</c:if>
			<c:if test="${not empty rdto.image}">
				<tr>
					<td>
						<div>
							<span class="rateit" data-rateit-resetable="false"
								data-rateit-mode="font" data-rateit-icon=""
								style="font-family: fontawesome"></span>
						</div> ${rdto.id} ${rdto.regdate}
						<div>
							<img src="/planitshare/resources/userimage/tour/${rdto.image}" alt="리뷰사진" style="height: 200px;">
						</div>
						<div>${rdto.content}</div>
						<c:if test="${auth.id == rdto.id}">
							<div>
								<span class="btnspan"><a href="#!" onclick="delTourReview(${rdto.seq});">[삭제]</a></span> 
								<span class="btnspan"><a href="#!" onclick="editTourReview(${rdto.seq});">[수정]</a></span>
							</div>
						</c:if>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	
	<div id="map" style="width:70%;height:500px; margin : 0 auto;"></div>
	
	<script>
		
		$(document).ready(function(){
	
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(${dto.lat}, ${dto.lng}), // 지도의 중심좌표
			        level: 8 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(${dto.lat}, ${dto.lng}); 
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			

			// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:5px;">${dto.placeName}</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    content : iwContent
			});

			// 마커에 마우스오버 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'mouseover', function() {
			  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
			    infowindow.open(map, marker);
			});

			// 마커에 마우스아웃 이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'mouseout', function() {
			    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
			    infowindow.close();
			});
			

		});
	</script>


