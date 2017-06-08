<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>주차장 정보</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="/resources/css/parkingInfo.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<section>
		<div id="parkingInfoTotal">
			<div id="parkingInfoTitle">
				<h2>주차장 정보</h2>
			</div>
			<div id="parkingInfoContent">
				<table>
					<tr>
						<th>정보 종류</th>
						<th>정보</th>
					</tr>
					<tr>
						<td>주차 가능 대수</td>
						<td>* 100대</td>
					</tr>
					<tr>
						<td>주소</td>
						<td>* 서울시 성동구 청계천로540</td>
					</tr>
					<tr>
						<td>연락처</td>
						<td>* 02) 2290 - 6316</td>
					</tr>
					<tr>
						<td>운영 시간</td>
						<td>* 09:00 ~ 21:00</td>
					</tr>
					<tr>
						<td rowspan="2">이용 요금</td>
						<td>* 오프라인 : 5분당 400원</td>
					</tr>
					<tr>
						<td>* 온라인 : 종일권 3만원</td>
					</tr>
					<tr>
						<td rowspan="4">요금 감면</td>
						<td>* 30% : 2자녀(다둥이)</td>
					</tr>
					<tr>
						<td>* 50% : 경형, 저공해 차량, 3자녀(다둥이), 5.18 민주유공자</td>
					</tr>
					<tr>
						<td>* 80% : 장애인, 국가유공자(상이자만 해당)</td>
					</tr>
					<tr>
						<td>* 면제 : 성실납세표지 부착차량(1년간), 긴급자동차</td>
					</tr>
					<tr>
						<td rowspan="5">환불 규정</td>
						<td>* 예약주차 당일 주차 불가</td>
					</tr>
					<tr>
						<td>* 예약주차 1일 전 취소 시 50% 수수료 부과</td>
					</tr>
					<tr>
						<td>* 예약주차 2일 전 취소 시 30% 수수료 부과</td>
					</tr>
					<tr>
						<td>* 예약주차 3일 전 이후 취소 시 수수료 없음 (100% 환불)</td>
					</tr>
					<tr>
						<td>* 신청일자 기준 당일 취소 시 수수료 없음 (100% 환불)</td>
					</tr>
					<tr>
						<td rowspan="5">제외 차량</td>
						<td>* 공사 차량 (트럭, 중장비)</td>
					</tr>
					<tr>
						<td>* 이륜차</td>
					</tr>
					<tr>
						<td>* 버스</td>
					</tr>
					<tr>
						<td>* 높이 2.1m 이상 차량</td>
					</tr>
					<tr>
						<td>* 적재 차량</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
</body>
</html>