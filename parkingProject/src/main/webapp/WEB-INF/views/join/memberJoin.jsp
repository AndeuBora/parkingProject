<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	
	$("#memberName").focusout(function () {
		var nameVal=$(this).val(),
		nameRegex=  /^[가-힣]+$/;
		
		
		if(nameVal==""||nameVal==null){
			alert("이름을 입력하세요");
			$("#memberName").focus();
			return false;
		}else if (nameRegex.test(val)) {
			alert("한글만 입력 하세요")
			$("#memberName").focus();
			return false;
		}
		
	
	});
	
	
	$("#memberId").focusout(function () {
		var idVal=$(this).val(),
		idRegex= /^[A-za-z0-9+]{8,13}$/g; //숫자+영문 8~13자
		if(idVal==""||idVal==null){
			alert("아이디를 입력하세요");
			$("#memberId").focus();
			return false;
		}else if (!idRegex.test(val)) {
			alert("영문+숫자 조합 8~13자리 입력하세요")
			$("#memberId").focus();
			return false;
		}
		
		
	});
	
})


</script>
<title>회원가입 페이지</title>
</head>
<body>
	<section id="joinFormSection">
		<h1>회원가입</h1>
		<label>이름</label> <input type="text" name="memberName" id="memberName"
			size="6" maxlength="6" required="required"> <label> <br>
			아이디
		</label> <input type="text" name="memberId" id="memberId" size="13"
			maxlength="13" required="required"> <input type="button"
			id="idCheck" value="중복 체크" onclick=""> 
			<br>
			<label>비밀번호</label><input
			type="password" id="memberPwd" name="memberPwd" required="required"
			size="13" maxlength="13"> <label>재입력</label><input
			type="password" id="memberPwd2" name="memberPwd2" required="required"
			size="13" maxlength="13"> <br> <label>이메일</label><input
			type="email">
			<input type="button" id="sendEnumber" 
			name="sendEnumber" value="메일인증" onclick="">
			<br>
			<label>인증번호</label> <input type="text" id="writeEnumber" name="writeEnumber" 
			required="required" size="5" maxlength="5" >
			<input type="button" id="checkEnum" value="확인" onclick="">
			<input type="button" id="AgainEnumber" value="재발송" onclick="">
			<br>
			<label>연락처</label>
			<select id="firstTel" name="firstTel">
			<option value="010">010</option>
			<option value="011">011</option>
			</select>
			- <input type="text" id="middleTel" name="memberTel1" required="required" maxlength="4" size="4">
			- <input type="text" id="lastTel" name="memberTel2" required="required" maxlength="4" size="4">
	<div>
신규회원 등록 안내
<br>
1.아이디는 영문+숫자 조합 8자리 이상만 가능 <br>
2.비밀번호는 영문+숫자+특수문자조합  8자리 이상만 가능<br>
3.아이디 중복체크와 메일인증을 받아야지만 회원등록<br>
4.약관동의 사항에 모두 체크를 해야 회원등록

	</div>
	<h2>약관 및 개인 정보 수집 동의</h2>
	
	<h4>이용 약관</h4>
	<textarea class="" rows="10" cols="100"></textarea>
	<br>
	<input type="radio" value="" name="memberPolicy">위 약관에 동의합니다
	<h4>개인정보 수집 이용 동의</h4>
	<textarea rows="10" cols="100"></textarea>
	<br>
	<input type="radio" value="" name="memberPolicy">위 약관에 동의합니다
	<h4>전자 금융거래 약관</h4>
	<textarea rows="10" cols="100"></textarea>
	<br>
	<input type="radio" value="" name="memberPolicy">위 약관에 동의합니다
	
	<br>
	<input type="button" id="joinBtn" name="joinBtn" value="가입" onclick="">
<input type="button" id="cancelBtn" name="cancelBtn" value="취소" onclick="">
		</section>

</body>
</html>