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
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">
#infoDetailMenu {
	background-color: #F7F7F7;
}

#infoDetailMenuContent {
	background-color: #F7F7F7;
}
</style>
</head>
<body>
	<header><jsp:include page="../header.jsp" /></header>
	<div class="container">
		<section style="margin-left: 25%; margin-right: 25%;">
			<div id="parkingInfoTotal">
				<div id="parkingInfoTitle" class="page-header">
					<h1 style="font-weight: bold;">주차장 정보</h1>
				</div>
				<div id="parkingInfoContent">
					<table class="table table-bordered table-hover table-responsive">
						<tr>
							<th id="infoMenu"
								style="text-align: center; font-size: 13pt; font-family: serif; background-color: #8FD3E8;">정보
								종류</th>
							<th id="infoMenu"
								style="text-align: center; font-size: 13pt; font-family: serif; background-color: #8FD3E8;">정보</th>
						</tr>
						<tr>
							<td id="infoDetailMenu"
								style="text-align: center; font-size: 11pt; font-family: monospace; font-weight: bold;">주차
								가능 대수</td>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								100대</td>
						</tr>
						<tr>
							<td id="infoDetailMenu"
								style="text-align: center; font-size: 11pt; font-family: monospace; font-weight: bold;">주소</td>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								서울시 성동구 청계천로540</td>
						</tr>
						<tr>
							<td id="infoDetailMenu"
								style="text-align: center; font-size: 11pt; font-family: monospace; font-weight: bold;">연락처</td>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								02) 2290 <b>-</b> 6316</td>
						</tr>
						<tr>
							<td id="infoDetailMenu"
								style="text-align: center; font-size: 11pt; font-family: monospace; font-weight: bold;">운영
								시간</td>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								09 <b>:</b> 00 ~ 21 <b>:</b> 00</td>
						</tr>
						<tr>
							<td rowspan="2" id="infoDetailMenu"
								style="text-align: center; vertical-align: middle; font-size: 11pt; font-family: monospace; font-weight: bold;">이용
								요금</td>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								오프라인 <b>:</b> 5분당 400원</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								온라인 <b>:</b> 종일권 3만원</td>
						</tr>
						<tr>
							<td rowspan="4" id="infoDetailMenu"
								style="text-align: center; vertical-align: middle; font-size: 11pt; font-family: monospace; font-weight: bold;">요금
								감면</td>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								30% <b>:</b> 2자녀(다둥이)</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								50% <b>:</b> 경형, 저공해 차량, 3자녀(다둥이), 5.18 민주유공자</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								80% <b>:</b> 장애인, 국가유공자(상이자만 해당)</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								면제 <b>:</b> 성실납세표지 부착차량(1년간), 긴급자동차</td>
						</tr>
						<tr>
							<td rowspan="5" id="infoDetailMenu"
								style="text-align: center; vertical-align: middle; font-size: 11pt; font-family: monospace; font-weight: bold;">환불
								규정</td>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								예약주차 당일 주차 불가</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								예약주차 1일 전 취소 시 50% 수수료 부과</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								예약주차 2일 전 취소 시 30% 수수료 부과</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								예약주차 3일 전 이후 취소 시 수수료 없음 (100% 환불)</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								신청일자 기준 당일 취소 시 수수료 없음 (100% 환불)</td>
						</tr>
						<tr>
							<td rowspan="5" id="infoDetailMenu"
								style="text-align: center; vertical-align: middle; font-size: 11pt; font-family: monospace; font-weight: bold;">제외
								차량</td>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								공사 차량 (트럭, 중장비)</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								이륜차</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								버스</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								높이 2.1m 이상 차량</td>
						</tr>
						<tr>
							<td id="infoDetailMenuContent"><span style="color: red;"><b>*</b></span>
								적재 차량</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
	</div>
	<footer><jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>