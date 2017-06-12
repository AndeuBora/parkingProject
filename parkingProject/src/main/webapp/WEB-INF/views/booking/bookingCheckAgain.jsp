<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.catalina.connector.Request"%>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		long bookingNum = System.currentTimeMillis();
		String bookingName = request.getParameter("s_bookingName");
		String bookingPhone = request.getParameter("s_bookingPhone");
		/* String memberId = request.getParameter("bookingDate");
		String memberName = request.getParameter("bookingDate"); 회원 세션에서 select----!!*/
		//신청일자설정
		SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String applicationDate = format.format(date);
		String bookingDate = request.getParameter("bookingDate");
		String bookingSpot = request.getParameter("bookingSpot");
		String bookingDiscountMoney = request.getParameter("bookingDiscountMoney");
		String bookingDiscount = request.getParameter("discountState");
		String TotalMoney = request.getParameter("totalBookingMoney");
	%>
	<form action="payment.do" method="post">
		<div id="bookingCheckInfo">
			<h3>7.예약정보확인</h3>
			<table>
				<colgroup>
					<col width="200" align="center">
					<col width="500" align="center">
				</colgroup>
				<tr>
					<td>예약 코드번호</td>
					<td><input type="text" value="<%=bookingNum%>" id="bookingNum"
						name="bookingNum" readonly></td>
				</tr>
				<tr>
					<td>예약자 이름</td>
					<td><input type="text" value="<%=bookingName%>"
						id="bookingName" name="bookingName" readonly></td>
				</tr>
				<tr>
					<td>예약자 전화번호</td>
					<td><input type="text" value="<%=bookingPhone%>"
						id="bookingPhone" name="bookingPhone" readonly></td>

				</tr>
				<tr>
					<td>회원 아이디</td>
					<td><input type="text" value="dksemqh97" id="memberID"
						name="memberID" readonly></td>
				</tr>
				<tr>
					<td>회원 이름</td>
					<td><input type="text" value="안드보라" id="memberName"
						name="memberName" readonly></td>
				</tr>
				<tr>
					<td>신청 일자</td>
					<td><input type="text" value="<%=applicationDate%>"
						id="applicationDate" name="applicationDate" readonly></td>
				</tr>
				<tr>
					<td>예약 일자</td>
					<td><input type="text" value="<%=bookingDate%>"
						id="bookingDate" name="bookingDate" readonly></td>
				</tr>
				<tr>
					<td>예약 자리번호</td>
					<td><input type="text" value="<%=bookingSpot%>"
						id="bookingSpot" name="bookingSpot" readonly></td>
				</tr>
				<tr>
					<td>주차금액</td>
					<td><input type="text" value="30,000" readonly></td>
				</tr>
				<tr>
					<td>주차감면혜택 금액</td>
					<td><input type="text" value="<%=bookingDiscountMoney%>"
						id="bookingDiscountMoney" name="bookingDiscountMoney" readonly></td>
				</tr>
				<tr>
					<td>주차감면혜택 종류</td>
					<td><input type="text" value="<%=bookingDiscount%>"
						id="bookingDiscount" name="bookingDiscount" readonly></td>

				</tr>
				<tr>
					<td>총 결제금액</td>
					<td><input type="text" value="<%=TotalMoney%>" id="TotalMoney"
						name="BookingMoney" readonly></td>
				</tr>
			</table>
			<label>위 기입사항이 정보와 일치합니다.<input type="checkbox"
				name="selectBookingPolicy" value="7" required
				class="selectBookingPolicy"></label>
		</div>
		<div id="nextPayment1">
			<input type="button" value="이전"><input type="submit"
				value="다음">
		</div>
	</form>
</body>
</html>