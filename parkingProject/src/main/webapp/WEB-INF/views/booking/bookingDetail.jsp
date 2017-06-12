<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/booking.css" type="text/css" rel="stylesheet">
<title>예약하기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(document).ready(function() {
		$("input[type='radio']").click(function() {
			var selectDiscount = $(this).val();
			var discount = "";
			var discountPrice = 0;
			var result = 30000;
			if (selectDiscount == "0") {
				discount = "없음";
				discountPrice = 0;
			}
			if (selectDiscount == "1") {
				discount = "2자녀(다둥이)";
				discountPrice = 9000;
			}
			if (selectDiscount == "2") {
				discount = "경형,저공해 자동차";
				discountPrice = 15000;
			}
			if (selectDiscount == "3") {
				discount = "3자녀(다둥이)";
				discountPrice = 15000;
			}
			if (selectDiscount == "4") {
				discount = "5.18 민주유공자";
				discountPrice = 15000;
			}
			if (selectDiscount == "5") {
				discount = "장애인";
				discountPrice = 24000;
			}
			if (selectDiscount == "6") {
				discount = "국가유공자(상이자만 해당)";
				discountPrice = 24000;
			}
			if (selectDiscount == "7") {
				discount = "성실납세표지 부착차량(1년간)";
				discountPrice = 30000;
			}
			if (selectDiscount == "8") {
				discount = "긴급자동차";
				discountPrice = 30000;
			}
			result = result - discountPrice;
			$("#bookingDiscountMoney").val(discountPrice);
			$("#discountState").val(discount);
			$("#totalBookingMoney").val(result);
		});
	});
	//팝업창띄우기
	function popup_bookingCheckAgain() {
		var name = $("#s_bookingName").val();
		var phone = $("#s_bookingPhone").val();
		//정규식
		var regname = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,5}/;
		var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

		// 예약자이름 미입력인 경우
		if (name == "" || name == null) {
			alert("예약자 성명을 입력하세요.");
			$("#s_bookingName").focus();
			return;
		} else {
			//예약자이름 정규식 어긋날경우
			if (!regname.test(name)) {
				alert("예약자 이름을 제대로 입력하세요\n ex)홍길동");
				$("#s_bookingName").focus();
				return;
			}
		}
		// 예약자연락처 미입력인 경우
		if (phone == "" || phone == null) {
			alert("예약자 연락처를 입력하세요.");
			$("#s_bookingPhone").focus();
			return;
		} else {
			// 예약자연락처 정규식 어긋날경우
			if (!regPhone.test(phone)) {
				alert("예약자 연락처를 제대로 입력하세요\n ex)010-1234-5678");
				$("#s_bookingPhone").focus();
				return;
			}
		}
		if ($("#bookingPolicy1").is(":checked") == false) {
			alert("약관동의는 필수입니다.");
			$("#bookingPolicy1").focus();
			return
		}
		if ($("#bookingPolicy2").is(":checked") == false) {
			alert("약관동의는 필수입니다.");
			$("#bookingPolicy2").focus();
			return
		}
		goData();
	}
	function ajaxExample() {
        //예약자
        var bookingName = $("#s_bookingName").val();
        var bookingPhone = $("#s_bookingPhone").val();
        var discountState = $("#discountState").html();
        var totalBookingMoney = $("#totalBookingMoney").html();
       var bookingDate = $("#bookingDate").val();
       var bookingSpot = $("#bookingSpot").val();
        //보낼값 저장
        var Data = {
              "bookingName":bookingName,
              "bookingPhone":bookingPhone,
              "bookingDiscount":discountState,
              "bookingMoney":totalBookingMoney,
              "bookingDate":bookingDate,
              "bookingSpot":bookingSpot
        }
        $.ajax({
             url:"bookingInsert.do",
                type:'get',
                data: Data,
                success:function(data){
                   alert("성공!!!");
                },
                error:function(request,status,error){
                    alert("code :"+request.status+"\n"+"message :"+request.responseText+"\n"+"error:"+error);
                }
        });
     } 
	//값보내기
	function goData() {
		window.open("","pop","width=700,height=500 resizable=no")
	      $("#f_booking").attr("action","bookingCheckAgain.do");
		  $("#f_booking").attr("target","pop");
	      $("#f_booking").submit();
	   } 
	//뒤로가기
	function backBookingSpot() {
		history.go(-1);
	}
</script>
</head>
<body>
	<form id="f_booking">
		<div id="bookingDetail_1">
			<h3>3.예약정보</h3>
			<table>
				<colgroup>
					<col width="200" align="center">
					<col width="500" align="center">
				</colgroup>
				<tr>
					<td>예약자 성명</td>
					<td><input type="text" value="${memberInfo[0] }"
						name="s_bookingName" id="s_bookingName" required maxlength="6"></td>
				</tr>
				<tr>
					<td>예약자 연락처</td>
					<td><input type="text" value="${memberInfo[1] }"
						name="s_bookingPhone" id="s_bookingPhone" required></td>
				</tr>
			</table>
		</div>
		<div id="bookingDetail_2">
			<h3>4.요금감면혜택</h3>
			<table border="1">
				<colgroup>
					<col width="200" align="center">
					<col width="500" align="center">
				</colgroup>
				<tr>
					<td>30%</td>
					<td><label>2자녀(다둥이)<input type="radio"
							name="selectBookingDiscount" value="1"></label></td>
				</tr>
				<tr>
					<td>50%</td>
					<td><label>경형,저공해 자동차<input type="radio"
							name="selectBookingDiscount" value="2"></label><br> <label>3자녀(다둥이)<input
							type="radio" name="selectBookingDiscount" value="3"></label><br>
						<label>5.18 민주유공자<input type="radio"
							name="selectBookingDiscount" value="4">
					</label></td>

				</tr>
				<tr>
					<td>80%</td>
					<td><label>장애인<input type="radio"
							name="selectBookingDiscount" value="5"></label><br> <label>국가유공자(상이자만
							해당)<input type="radio" name="selectBookingDiscount" value="6">
					</label></td>
				</tr>
				<tr>
					<td>면제</td>
					<td><label>성실납세표지 부착차량(1년간)<input type="radio"
							name="selectBookingDiscount" value="7"></label><br> <label>긴급자동차<input
							type="radio" name="selectBookingDiscount" value="8"></label></td>
				</tr>
			</table>
			<div id="booking_caution">
				<label>감면혜택없음<input type="radio"
					name="selectBookingDiscount" value="0" checked></label>
				<p>*요금감면혜택 선택한 경우, 예약당일 첫입차 시 현장확인</p>
				<p>*중복체크불가</p>
			</div>
		</div>
		<div id="bookingDetail_3">
			<h3>5.결제정보</h3>
			<table border="1">
				<colgroup>
					<col width="200" align="center">
					<col width="500" align="center">
				</colgroup>
				<tr>
					<td>주차금액</td>
					<td><span id="bookingMoney" class="bookingMoneyInfo">30000</span>원</td>
				</tr>
				<tr>
					<td>요금감면혜택 금액</td>
					<td><input id="bookingDiscountMoney"
						name="bookingDiscountMoney" class="bookingMoneyInfo redtext"
						value="0" readonly>원</td>
				</tr>
				<tr>
					<td>요금감면혜택 종류</td>
					<td><input id="discountState" name="discountState"
						class="bookingMoneyInfo redtext" value="없음" readonly></td>
				</tr>
				<tr>
					<td>총 결제금액</td>
					<td><input id="totalBookingMoney" name="totalBookingMoney"
						class="bookingMoneyInfo boldfont" value="30000" readonly>
						원</td>
				</tr>
			</table>
		</div>
		<div id="bookingDetail_4">
			<h3>6. 이용약관동의</h3>
			<table border="1">
				<colgroup>
					<col width="700" align="center">
				</colgroup>
				<tr>
					<td>가산금&amp;견인 동의</td>
				</tr>
				<tr>
					<td><p>
							1. 혜택감면 서류 불참 또는 혜택감면대상이 아닌 차량 혜택감면 시,<br> 차액부과 또는 입장불가에
							동의합니다.
						</p>
						<p>
							2. 주차 예약 지정석이 아닌 다른 지정석을 이용했을 경우<br> 견인에 대해 동의합니다.
						</p>
						<p>
							3. 예약구매금액은 종일권 기준으로 입 출차가 자유로우나,<br> 예약일자가 지난 후에도 출차를 안 했을
							경우 견인에 대해 동의합니다
						</p> <label>위 약관에 동의합니다.<input type="checkbox"
							name="selectBookingPolicy" value="bookingPolicy1"
							class="selectBookingPolicy" id="bookingPolicy1"></label></td>
				</tr>
			</table>
			<table border="1">
				<colgroup>
					<col width="700" align="center">
				</colgroup>
				<tr>
					<td>취소규정 및 이용약관</td>
				</tr>
				<tr>
					<td><p>예약주차 당일 취소 불가
						<p>예약주차 1일전 취소 시 50% 수수료 부과
						<p>예약주차 2일전 취소 시 30% 수수료 부과
						<p>예약주차 3일전 이후 취소 시 수수료 없음 (100%환불)
						<p>신청일자기준 당일 취소 시 수수료 없음 (100 %환불)</p> <label>위 약관에 동의합니다.<input
							type="checkbox" name="selectBookingPolicy" value="bookingPolicy2"
							class="selectBookingPolicy" id="bookingPolicy2"></label></td>
				</tr>
			</table>
		</div>
		<div id="nextBooking3">
			<input type="button" value="이전" onclick="backBookingSpot()">
			<input type="button" value="다음" onclick="popup_bookingCheckAgain()">
		</div>

		<!-- 날짜/자리 -->
		<input type="hidden" name="bookingDate" id="bookingDate"
			value="${ bookingInfo[0]}"> <input type="hidden"
			name="bookingSpot" id="bookingSpot" value="${ bookingInfo[1]}">
	</form>
</body>
</html>