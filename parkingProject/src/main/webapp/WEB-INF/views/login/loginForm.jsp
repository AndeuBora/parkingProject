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
	$(function() {

	

	})
</script>
<body>
	<section>
		<div>
			<h3>로그인</h3>
			<form action="loginCheck.do" name="idCheck" id="idCheck">
				<div>
					<label>아이디</label> <input type="text" id="memberId" name="memberId"
						required="required">
				</div>
				<div>
					<label>비밀번호</label> <input type="password" id="memberPwd"
						name="memberPwd" required="required">
				</div>
				<div>
					<input type="submit" id="idCheckBtn" name="idCheckBtn" value="로그인" />
				</div>
				<c:if test="${msg=='아이디가 틀렸습니다'}">
				<div>
				<p>아이디가 틀렸습니다</p>
				</div>
				</c:if>
				<c:if test="${msg=='비밀번호가 틀렸습니다'}">
				<div>
				<p>비밀번호가 틀렸습니다</p>
				</div>
				</c:if>
				
			</form>
		</div>

	</section>
</body>
</html>