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
<<<<<<< HEAD
	//한글 입력 정규식 찾기
	//영문+숫자 조합 정규식 찾기
	//아이디 정규식 

	$(function() {
		var memberName = $("#memberName");
		var memberId = $("#memberId");
		var memberPwd = $("#memberPwd");
		var memberPwd2 = $("#memberPwd2");
		var writeEnumber = $("#writeEnumber");
		var memberPhone = $("#memberPhone");
		var idCheckBtn = $("#idCheckBtn");

		var regMemberName = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,6}/; //한글만 입력
		var regMemberId = /[^a-z0-9]+|^([a-z]+|[0-9]+).{8,13}$/i; //숫자 영문조합 8~13
		var regMemberPwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,13}$/; //숫자 영문 특수문자 조합 8~13자리
		var regMemberPwd2 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,13}$/;
		var regWriteEnumber = /[0-9]{5}/; //숫자만 입력
		var regMemberPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

		//이름 유효성 검사
		memberName.keyup(function() {

			if (regMemberName.test(memberName.val()) != true) {
				$("#namecheck").html("한글이름 2~6자리를 입력해주세요");
				$("#namecheck").css("color", "red");
				memberName.focus();
				return false;
			} else {
				$("#namecheck").html("사용가능");
				$("#namecheck").css("color", "blue");
				return true;
			}

		});

		//아이디 유효성 검사
		memberId.keyup(function() {

			if (regMemberId.test(memberId.val()) != true) {
				$("#idCheck").html("숫자+영문 8~13입력 해주세요");
				$("#idCheck").css("color", "red");
				memberId.focus();
				return false;
			} else {
				$("#idCheck").html("사용 가능한 아이디입니다 중복체크해주세요");
				$("#idCheck").css("color", "blue");
				return true;
			}

		});
		//비밀번호 유효성 검사
		memberPwd.keyup(function() {
			if (regMemberPwd.test(memberPwd.val()) != true) {
				$("#passwdcheck").html("영문+숫자+특수문자 8~13자리 입력하세요 ");
				$("#passwdcheck").css("color", "red");
				memberPwd.focus();
				return false;
			} else {
				$("#passwdcheck").html("사용 가능한 비밀번호 입니다 ");
				$("#passwdcheck").css("color", "blue");
				return true;
			}

		});
		//비밀번호 재검사 유효성 검사
		memberPwd2.keyup(function() {
			if (memberPwd.val() == memberPwd2.val()) {
				$("#passwdcheck2").html("비밀번호 일치 ");
				$("#passwdcheck2").css("color", "blue");
				return true;
			} else {
				$("#passwdcheck2").html("비밀번호 불일치 ");
				$("#passwdcheck2").css("color", "red");
				memberPwd2.focus();
				return false;
			}

		});
		//전화번호 유효성 검사
		memberPhone.keyup(function() {
			if (regMemberPhone.test(memberPhone.val()) != true) {
				$("#memberPhoneCheck").html("010-XXXX-XXXX 형식에 맞게 입력하세요");
				$("#memberPhoneCheck").css("color", "red");
				memberPhone.focus();
				return false;
			} else {
				$("#memberPhoneCheck").html("사용가능");
				$("#memberPhoneCheck").css("color", "blue");
				return true;
			}

		});

		//아이디 중복체크
		idCheckBtn.click(function() {
	

		 	if (memberId.val()) {
				//아이디값이 있는 경우
				//ajax이용
				$.ajax({
					type : "post",
					url : "idCheck.do",
					data : {
						memberId:memberId
					},
					success : function(data) {
						if (data = 1) {
							//사용할수 없음
							alert("사용할 수 없는 아이디입니다");
							memberId.val("");
						} else {
							//사용할 수  있는 아이디
							alert("사용 할 수 있는 아이디입니다")
						}
					}

				});

			} else {//아이디 입력하지 않고 버튼클릭시
				alert("아이디를 입력하세요");
				memberId.focus();
			}
		})
=======
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

>>>>>>> origin/ilhyun

	});
</script>
<title>회원가입 페이지</title>
</head>
<body>
	<section id="joinFormSection">
<<<<<<< HEAD
		<form action="insertMember.do" method="post" id="memberJoinForm">
			<h1>회원가입</h1>
			<label>이름</label> <input type="text" name="memberName"
				id="memberName" size="6" maxlength="6" required="required"
				autofocus="autofocus"> <label><span id="namecheck"></span>
				<br> 아이디 </label> <input type="text" name="memberId" id="memberId"
				size="13" maxlength="13" required="required"> <input
				type="button" id="idCheckBtn" value="중복 체크"><span
				id="idCheck"></span> <br> <label>비밀번호</label><input
				type="password" id="memberPwd" name="memberPwd" required="required"
				size="13" maxlength="13"> <span id="passwdcheck"></span><br>
			<label>비밀번호 확인</label><input type="password" id="memberPwd2"
				name="memberPwd2" required="required" size="13" maxlength="13"><span
				id="passwdcheck2"></span> <br> <label>이메일</label><input
				type="email" id="memberEmail" name="memberEmail"> <input
				type="button" id="sendEnumber" name="sendEnumber" value="메일인증">
			<br> <label>인증번호</label> <input type="text" id="writeEnumber"
				name="writeEnumber" required="required" size="5" maxlength="5">
			<input type="button" id="checkEnum" value="확인" onclick=""> <input
				type="button" id="AgainEnumber" value="재발송" onclick=""> <br>
			<label>연락처</label> <input type="text" id="memberPhone"
				name="memberPhone" required="required" placeholder="010-XXXX-XXXX">
			<span id="memberPhoneCheck"></span>
			<div>
				신규회원 등록 안내 <br> 1.아이디는 영문+숫자 조합 8자리 이상만 가능 <br> 2.비밀번호는
				영문+숫자+특수문자조합 8자리 이상만 가능<br> 3.아이디 중복체크와 메일인증을 받아야지만 회원등록<br>
				4.약관동의 사항에 모두 체크를 해야 회원등록

			</div>
			<h2>약관 및 개인 정보 수집 동의</h2>

			<h4>이용 약관</h4>
			<textarea class="" rows="10" cols="100" readonly="readonly"></textarea>
			<br> <input type="checkbox" value="0" name="memberPolicy"
				id="memberPolicy1" required="required">위 약관에 동의합니다
			<h4>개인정보 수집 이용 동의</h4>
			<textarea rows="10" cols="100" readonly="readonly"></textarea>
			<br> <input type="checkbox" value="0	" name="memberPolicy"
				id="memberPolicy2" required>위 약관에 동의합니다
			<h4>전자 금융거래 약관</h4>
			<textarea rows="10" cols="100"></textarea>
			<br> <input type="checkbox" value="0" name="memberPolicy"
				id="memberPolicy3" readonly="readonly" required>위 약관에 동의합니다
			<br> <input type="submit" id="joinBtn" name="joinBtn" value="가입">
			<input type="button" id="cancelBtn" name="cancelBtn" value="취소"
				onclick="">
		</form>
	</section>
=======
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
>>>>>>> origin/ilhyun

</body>
</html>