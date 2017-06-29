<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		  <%
	   request.setCharacterEncoding("utf-8");
	   String pagefile = request.getParameter("page"); 
	   
	   if(pagefile == null){
		 
		  pagefile ="/WEB-INF/views/main";   
	   }
	    String jsp = ".jsp";
	   %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/resources/css/index.css" />
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div id="all">
		<header>
            
			<a href="http://localhost/"><img id="logo" alt="로고" src="resources/img/booking/calendar.png"></a>
		  
<a class="headerLogin" href="http://localhost/?page=/WEB-INF/views/join/memberJoin">회원가입</a>
<a class="headerLogin" href="#">로그인</a> 

<a class="mainManu" href="http://localhost/?page=/WEB-INF/views/info/parkingInfo">주차장 정보</a> 
<a class="mainManu" href="http://localhost/?page=/WEB-INF/views/booking/bookingSpot">주차장 예약</a> 
<a class="mainManu" href="#">자리현황</a> 
<a class="mainManu" href="#">공지사항</a>
<a class="mainManu" href="#">QnA</a>
<a class="mainManu" href="#">예약가이드</a>

			
		</header>
		<section>
		
	   <jsp:include page="<%=pagefile+jsp %>" />
	   
		</section>
		<footer>
			<div id="info"> 


				<p>04704 서울시 성동구 청계천로540 서울시설공단 / 대표자명 : 최일현 / Tel : 02)
					2290-6316 / Fax : 02) 416-6163 / webmaster@sisul.or.kr / 개인정보 보호
					책임자 : 최일현 / Copyright(c) 2017 일현이와 아이들 All Rights Reserved</p>
			</div>

		</footer>
	</div>

</body>
</html>