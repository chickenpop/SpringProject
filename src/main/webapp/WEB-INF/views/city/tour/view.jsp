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
							<h4 class="card-title">
								<a href="/planitshare/city/tourview.do?seq=${dto.seq}&cseq=${dto.cseq}">${dto.placeName}</a>
							</h4>
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
    </div>

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


