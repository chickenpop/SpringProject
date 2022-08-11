<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form method="GET" action="/planitshare/admin/search">
	<div id="search-box">
		<select name="user" class="form-control">
				<option value="id" selected>아이디</option>
				<option value="name">이름</option>
				<option value="regdate">등록일</option>
		</select> <input type="text" name="keyword" class="form-control"/>
		<button type="submit" class="btn btn-secondary">
			<i class="fa-solid fa-magnifying-glass"></i>
		</button>
	</div>
</form>
 <div>
      <table class="table table-bordered user">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>성별</th>
		<th>전화번호</th>
		<th>상태</th>
		<th>가입일</th>
		<th></th>
	</tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.id}</td>
		<td>${dto.name}</td>
		<td>${dto.gender}</td>
		<td>${dto.tel}</td>
		<td><c:if test="${dto.active == 'y'}">일반회원</c:if><c:if test="${dto.active == 'n'}">탈퇴회원</c:if></td>
		<td>${dto.regdate}</td>
		<c:if test="${dto.active == 'y'}">
		<td><button type="button" class="btn btn-primary btn-sm" onclick="updateUser('${dto.id}');">탈퇴</button></td>
		</c:if>
		<c:if test="${dto.active == 'n'}">
		<td></td>
		</c:if>
	</tr>
	</c:forEach>
</table>
	<div style="text-align: center;">
		${pagebar}
	</div>
</div>

<script type="text/javascript">

function updateUser(id) {
	
	if(confirm('회원이 탈퇴시킵니다. 계속 진행하시겠습니까?')){
	
		$.ajax({
			type: 'GET',
			url: '/planitshare/admin/userunregister',
			data: 'id=' + id,
			dataType: 'json',
			success: function(result) {
				
				console.log(result);
				
				if (result.result == '1') {
					alert('회원이 탈퇴되었습니다.');
					location.reload();
				} else {
					alert('회원 탈퇴에 실패했습니다.');
				}
				
			}, 
			error: function(result) {
				console.log(result);
			}
		});
		}
		
	}
	
	$("#pagebar").change(function() {
		
		location.href = '/planitshare/admin/userlist?page=' + $(this).val();
		
	});
	
	$('#pagebar').val(${nowPage});

	
	
</script>