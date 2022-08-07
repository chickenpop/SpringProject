<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<form method="GET" action="/planitshare/city/tour/search">
			<div id="search-box">
				<select name="cityname" class="form-control">
					<c:forEach items="${city}" var="list">
						<c:if test="${search.cityname == list.seq}">
						<option value="${list.seq}" selected>${list.name}</option>
						</c:if>
						<c:if test="${search.cityname != list.seq}">
						<option value="${list.seq}">${list.name}</option>
						</c:if>
					</c:forEach>
				</select> <select name="keywordtype" class="form-control">
					<c:forEach items="${category}" var="name">
						<c:if test="${search.keywordtype == name}">
						<option value="${name}" selected>${name}</option>
						</c:if>
						<c:if test="${search.keywordtype != name}">
						<option value="${name}">${name}</option>
						</c:if>
					</c:forEach>
				</select> <input type="text" name="keyword" class="form-control" value="${search.keyword}" />
				<button type="submit" class="btn btn-secondary">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>
		</form>
		
		<div class="container h-100">
		<ul class="sort-list">
			<li><a href="/planitshare/city/tour/search?cityname=1&keywordtype=전시관&keyword=박물관&sort=likeCnt" id="likeCnt" >인기등록순</a></li>
			<li><a href="/planitshare/city/tour/search?cityname=1&keywordtype=전시관&keyword=박물관&sort=reviewAvg" id="reviewAvg" >별점순</a></li>
			<li><a href="/planitshare/city/tour/search?cityname=1&keywordtype=전시관&keyword=박물관&sort=reviewCnt" id="reviewCnt">리뷰많은순</a></li>
		</ul>
		
		
	<c:forEach items="${tour}" var="dto">
		<a href="/planitshare/city/tour/view?seq=${dto.seq}&cseq=${dto.cseq}">
			<div class="col d-flex justify-content-center align-items-center">
				<div class="card my-2" style="width: 702px;">
					<div class="row no-gutters">
						<span><img src="/planitshare/resources/image/${dto.image}"
							class="img-fluid" alt="숙소이미지"></span>
						<div class="col">
							<div class="card-block px-4">
								<h4 class="card-title">${dto.placeName}</h4>
								<div class="card-text">${dto.category}</div>
								<div class="card-text">
									<i class="fa-solid fa-heart"></i>${dto.likeCnt}<i
										class="fa-solid fa-star"></i>
									<c:if test="${not empty dto.reviewAvg}">${dto.reviewAvg}</c:if>
									<c:if test="${empty dto.reviewAvg}">0</c:if>
									(${dto.reviewCnt})
								</div>
								<div class="card-text">${dto.address}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</a>
	</c:forEach>
		<div style="text-align: center">페이지바</div>
	</div>
	
	<script>
		$(document).ready(function(){
	    	
			$( ${search.sort} ).addClass( 'active-link' );
			
	    });
	</script>


