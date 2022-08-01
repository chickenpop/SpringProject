<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<div id="box">
            <h2>로그인</h2>
            <form action="/planitshare/member/loginok" method="post">
            <div id="login-box">
	            <div id="login-mode">
					 <span>
				      <input type="radio" id="admin" name="loginmode" value="admin">
				      <label for="admin">관리자</label>
				    </span>
				    <span>
				      <input type="radio" id="user" name="loginmode" value="user" checked>
				      <label for="user">일반 회원</label>
				    </span>
		
				</div>
                <input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력해주세요." required>
                <input type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호를 입력해주세요." required>
                <input type="submit" value="로그인" id="login-btn" class="btn btn-primary btn-block">
            </div>
            </form>
            <div id="labels">
                <span><a href="/planitshare/idsearch.do">아이디 찾기</a></span>
                <span><a href="/planitshare/pwsearch.do">비밀번호 찾기</a></span>
                <span><a href="/planitshare/register.do">회원가입</a></span>
            </div>
        </div>