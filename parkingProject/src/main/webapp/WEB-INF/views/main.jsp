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
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<link rel="stylesheet" href="/resources/css/index.css" />
<title>Insert title here</title>

</head>
<body>
	
	<section id="main">
		<div class="cycle-slideshow" id="parkingImage">
			<img alt="주차장" src="resources/img/main/주차장.jpg"> <img alt="출구"
				src="resources/img/main/출구.jpg"> <img alt="내부"
				src="resources/img/main/내부.jpg">
		</div>
		<div id="offline"></div>
	</section>
</body>
</html>