<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/booking.css" type="text/css" rel="stylesheet">
<title>예약 재차확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		long coad = System.currentTimeMillis();
	%>
	<form action="booking/booking" method="post">
		<div id="bookingCheckInfo">
			<h3>7.예약정보확인</h3>
			<table>
				<colgroup>
					<col width="200" align="center">
					<col width="500" align="center">
				</colgroup>
				<tr>
					<td>예약 코드번호</td>
					<td><%=coad%></td>
				</tr>
				<c:forEach var="vo" items="${bookingInfo}">
					<tr>
						<td>예약자 이름</td>
						<td>${vo.bookingName}</td>
					</tr>
					<tr>
						<td>예약자 전화번호</td>
						<td>${vo.bookingPhone}</td>
					</tr>
				</c:forEach>
			</table>
			<label>위 약관에 동의합니다.<input type="checkbox"
				name="selectBookingPolicy" value="7" required
				class="selectBookingPolicy"></label>
		</div>
		<div id="nextPayment1">
			<input type="submit" value="다음"> <input type="button"
				value="이전">
		</div>
	</form>
</body>
</html>