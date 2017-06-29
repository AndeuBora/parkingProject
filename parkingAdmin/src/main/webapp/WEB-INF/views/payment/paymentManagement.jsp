<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/payment_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="../resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css?var=32" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 부트스트랩 -->
<script src="../resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- 부트스트랩 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		// 데이터 피커
		$("#pickerDate").datepicker({
			dateFormat : "yy-mm-dd"
		});

		//결제 종류 (전체,예약,현장) 콤보박스 선택시 컨트롤러로 값 보내기

		$("#p_Type").change(function() {

			var paymentType = $("#p_Type").val();
			$("#paymentType").val(paymentType);
			// 날짜 조회 유지
			var pickerDate = $("#pickerDate").val();
			$("#paymentDate").val(pickerDate);
			/* 	$("#manageMentForm").attr("action",
						"/admin/payment/paymentList.do");
				$("#manageMentForm").submit(); */
			goPage(1);

		});

		// 날짜 조회
		$("#pickerDate").change(function() {

			var pickerDate = $("#pickerDate").val();
			$("#paymentDate").val(pickerDate);

			paymentTypeMainTain();

			/* $("#manageMentForm").attr("action",
					"/admin/payment/paymentList.do");
			$("#manageMentForm").submit(); */
			goPage(1);

		});

		//번호 검색 클릭 시
		$("#searchButton").click(function() {
			var searchNumber = $("#searchNumber").val();
			var numberValue = $("#numberValue").val();
			$("#s_Number").val(searchNumber);
			$("#justNumber").val(numberValue);
			//날짜 조회 유지
			var pickerDate = $("#pickerDate").val();
			$("#paymentDate").val(pickerDate);

			paymentTypeMainTain();
			/* $("#manageMentForm").attr("action",
					"/admin/payment/paymentList.do");
			$("#manageMentForm").submit(); */
			goPage(1);

		});
		/* 한페이지에 보여줄 레코드 수를 변경될 때마다 처리 이벤트 */
		$("#s_pageSize").change(function() {
			var s_pageSize = $("#s_pageSize").val();
			$("#pageSize").val(s_pageSize);

			goPage(1);
		});

		// paymentType 1= 예약 , 2= 현장
		$(".type:contains(1)").html("예약");
		$(".type:contains(2)").html("현장");
		// paymentState 0= 환불, 1= 결제
		$(".state:contains(0)").html("환불");
		$(".state:contains(1)").html("결제");

	});

	/* 정렬 및 검색 시 실질적인 처리 함수 */
	function goPage(page) {
		alert("실행됌");

		$("#page").val(page);
		$("#pagingForm").prop("action", "/admin/payment/paymentList.do");
		$("#pagingForm").prop("method", "GET");
		$("#pagingForm").submit()

		$("#manageMentForm").attr("action", "/admin/payment/paymentList.do");
		$("#manageMentForm").submit();

	}

	// paymentType 콤보박스 유지 
	function paymentTypeMainTain() {
		var paymentType = $("#p_Type").val();
		$("#paymentType").val(paymentType);
		$("#manageMentForm").attr("action", "/admin/payment/paymentList.do");
		$("#manageMentForm").submit();

	}
</script>
<style type="text/css">
</style>

</head>
<body>
	<div id="wrapper">
		<section>

			<div id="pageTitle">
				<h2>결제 관리 페이지</h2>
			</div>


			<form id="pagingForm"></form>


			<form id="manageMentForm">
				<input type="hidden" id="page" name="page" value="${data.page}">
				<input type="hidden" id="pageSize" name="pageSize"
					value="${data.pageSize}">


				<!--사용자 리스트 전체, 예약, 현장 -->
				<div id="selectBoxRow" class="col-xs-2">
					<select id="s_pageSize" name="s_pageSize"
						class="form-control input-sm">
						<option value="5" ${data.pageSize eq "5"  ? "selected" : ""}>5줄</option>
						<option value="10" ${data.pageSize eq "10" ? "selected" : ""}>10줄</option>
						<option value="20" ${data.pageSize eq "20" ? "selected" : ""}>20줄</option>
						<option value="30" ${data.pageSize eq "30" ? "selected" : ""}>30줄</option>
					</select>
				</div>
				<div id="selectPakage">
					<div id="selectBoxType" class="col-xs-2">
						결제 종류 : <select id="p_Type" name="p_Type"
							class="form-control input-sm">
							<option value="0" ${data.paymentType eq "0" ? "selected" : "" }>전체</option>
							<option value="1" ${data.paymentType eq "1" ? "selected" : "" }>예약</option>
							<option value="2" ${data.paymentType eq "2" ? "selected" : "" }>현장</option>
						</select> <input type="hidden" id="paymentType" name="paymentType"
							value="${data.paymentType}">
					</div>


					<!--날짜로 조회-->
					<div id="searchingDate" class="col-xs-2">
						날짜 조회 :<input type="text" id="pickerDate" name="pickerDate"
							class="form-control input-sm" value="${data.paymentDate}">
					</div>
					<input type="hidden" id="paymentDate" name="paymentDate"
						value="${data.paymentDate}">
				</div>


				<div id="referencePakage">
					<div id="selectBoxNumber" class="col-xs-2">
						<select id="searchNumber" name="searchNumber"
							class="form-control input-sm">
							<option value="1" ${data.s_Number eq "1" ? "selected" : "" }>결제번호</option>
							<option value="2" ${data.s_Number eq "2" ? "selected" : "" }>예약번호</option>
							<option value="3" ${data.s_Number eq "3" ? "selected" : "" }>현장번호</option>
						</select>
					</div>

					<div id="searchingNumber" class="col-xs-2">
						<input type="text" id="numberValue" name="numberValue"
							class="form-control input-sm" value="${data.justNumber}">
					</div>

					<input type="button" value="검색" class="btn btn-info"
						id="searchButton" name="searchButton"> <input
						type="hidden" id="s_Number" name="s_Number"> <input
						type="hidden" id="justNumber" name="justNumber">

				</div>
			</form>

			<table class="table table-bordered table-hover">
				<tr>
					<th id="paymentMenu" style="text-align: center;">번호</th>
					<th id="paymentMenu" style="text-align: center;">결제 종류</th>
					<th id="paymentMenu" style="text-align: center;">결제 번호</th>
					<th id="paymentMenu" style="text-align: center;">예약 번호</th>
					<th id="paymentMenu" style="text-align: center;">현장 번호</th>

					<th id="paymentMenu" style="text-align: center;">결제 가격</th>
					<th id="paymentMenu" style="text-align: center;">결제 날짜</th>
					<th id="paymentMenu" style="text-align: center;">카드사</th>
					<th id="paymentMenu" style="text-align: center;">결제 상황</th>
					<th id="paymentMenu" style="text-align: center;">차액 부과금</th>
					<th id="paymentMenu" style="text-align: center;">감면 혜택</th>
				</tr>
				<c:choose>
					<c:when test="${not empty paymentList}">
						<c:forEach var="list" items="${paymentList}">
							<tr>
								<td id="paymentContent" style="text-align: center;">${list.rnum}</td>
								<td class="type" id="paymentContent" style="text-align: center;">${list.paymentType}</td>
								<td id="paymentContent" style="text-align: center;">${list.paymentNum}</td>
								<td id="paymentContent" style="text-align: center;">${list.bookingNum}</td>
								<td id="paymentContent" style="text-align: center;">${list.offlineNum}</td>

								<td id="paymentContent" style="text-align: center;">${list.paymentMoney}</td>
								<td id="paymentContent" style="text-align: center;">${list.paymentDate}</td>
								<td id="paymentContent" style="text-align: center;">${list.cardCompany}</td>
								<td class="state" id="paymentContent"
									style="text-align: center;">${list.paymentState}</td>
								<td id="paymentContent" style="text-align: center;">${list.paymentPenalty}</td>
								<td id="paymentContent" style="text-align: center;"></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="12" align="center">등록된 정보가 존재하지 않습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<!-- 페이지네비게이션 시작  -->
			<div id="NaviPage">
				<tag:paging page="${data.page }" total="${total}"
					list_size="${data.pageSize }" />
			</div>

		</section>
	</div>
</body>
</html>