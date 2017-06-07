<<<<<<< HEAD
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
<title>회원가입 페이지</title>
</head>
<body>
<div id="wrapper">
<section id="joinFormSection">



</section>
</div>
</body>
=======
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
<title>회원가입 페이지</title>
</head>
<body>
		<section id="joinFormSection">
			<div>회원가입</div>
			<label>이름</label> <input type="text" name="memberName"
				id="memberName" size="6" maxlength="6" required="required">
			<label>
			<br>
			아이디</label> <input type="text" name="memberId" id="memberId"
				size="13" maxlength="13" required="required"> <input
				type="button" id="idCheck" value="중복 체크">
				
		</section>
	
</body>
>>>>>>> origin/taejun
</html>