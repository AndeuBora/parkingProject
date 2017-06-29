<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/custom_tag.tld"%>
<%
	long coad = System.currentTimeMillis();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/resources/css/booking.css" type="text/css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="/admin/resources/css/adminBooking.css?var=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
/* 주차이미지 */
/* 각 주차자리버튼효과 */
button {
	float: left;
	width: 35px;
	height: 50px;
	margin: 10px;
	border: 1px solid #404040;
	background-color: white;
}
</style>
<script>
	$(function() {
		spot2click();
		//date함수
		Date.prototype.format = function(f) {
		    if (!this.valueOf()) return " ";
		 
		    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
		    var d = this;
		     
		    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
		        switch ($1) {
		            case "yyyy": return d.getFullYear();
		            case "yy": return (d.getFullYear() % 1000).zf(2);
		            case "MM": return (d.getMonth() + 1).zf(2);
		            case "dd": return d.getDate().zf(2);
		            case "E": return weekName[d.getDay()];
		            case "HH": return d.getHours().zf(2);
		            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
		            case "mm": return d.getMinutes().zf(2);
		            case "ss": return d.getSeconds().zf(2);
		            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
		            default: return $1;
		        }
		    });
		};
		 
		String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
		String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
		Number.prototype.zf = function(len){return this.toString().zf(len);};
		
		//현재시간(동적) 1초
		setInterval(function() {
			$("#date_now").text(new Date().format("yyyy년 MM월 dd일 a/p hh시 mm분 ss초"));
		}, 1000);

		//현재 예약자리조회
		ajaxspot();
		//현재 현장자리조회
		ajaxofflinespot();
		//총자리개수
		ajaxSpotCount();
		
		//info창 히든
		$("#penaltyInsert").hide();
		$("#bookingHover").hide();
		$("#bookingClick").hide();
		$("#noneClick").hide();
		$("#offlineClick").hide();
		$("#offlineHover").hide();
		$("#offlineClick").hide();
		$("#offlineOutClick").hide();
		
		//빈좌석 클릭 시 (즉, 현장추가)
		$("button").click(function(){
			var spot = $(this).val();
			var date = new Date().format("a/p hh시 mm분 ss초");
			//예약/현장 좌석일경우 히든
			$("#bookingClick").hide();
			$("#offlineClick").hide();
			$("#offlineOutClick").hide();
			$("#noneClick").show();
			//초기값(자리,입차시간)
			$("#off_spot").html(spot);
			$("#off_inTime").html(date);
		});
		
		//할인콤보박스값 변경
		$("#selectDiscount").change(function() {
			var selectDiscount = $("#selectDiscount").val();
			var discount = "";
			var percent = 0;
			if (selectDiscount == "0") {
				discount = "없음";
				percent = 0;
			}
			if (selectDiscount == "1") {
				discount = "2자녀(다둥이)";
				percent = 30;
			}
			if (selectDiscount == "2") {
				discount = "경형,저공해 자동차";
				percent = 50;
			}
			if (selectDiscount == "3") {
				discount = "3자녀(다둥이)";
				percent = 50;
			}
			if (selectDiscount == "4") {
				discount = "5.18 민주유공자";
				percent = 50;
			}
			if (selectDiscount == "5") {
				discount = "장애인";
				percent = 80;
			}
			if (selectDiscount == "6") {
				discount = "국가유공자(상이자만 해당)";
				percent = 80;
			}
			if (selectDiscount == "7") {
				discount = "성실납세표지 부착차량(1년간)";
				percent = 100;
			}
			if (selectDiscount == "8") {
				discount = "긴급자동차";
				percent = 100;
			}
			$("#off_dis").val(discount);
			$("#off_discountpercent").html(percent+"%");
		});
	});

	//ajax 예약자리조회 -> click hover
	function ajaxspot() {
		//보낼값 저장
		var Data = {
			"selectDate" : new Date()
		}
		$.ajax({
			url : "selectBookingSpot.do",
			type : 'get',
			data : Data,
			success : function(list) {
				$.each(list, function(idx, val) {
					var spot = val.bookingSpot;
					var bookingNum = val.bookingNum;
					var bookingState = val.bookingState;
					var bookingName = val.bookingName;
					var bookingPhone = val.bookingPhone;
					var bookingDiscount = val.bookingDiscount;
					var bookingMoney = val.bookingMoney;
					var applicationDate = val.applicationDate;
					var bookingDate = val.bookingDate;

					$("#" + spot).css("background-color", "#9bbf6f");
					//자리hover
					$("#" + spot).mouseover(function() {
						$("#bookingHover").show();
						$("#b_hoverSpot").html(spot);
						$("#b_hoverCode").html(bookingNum);
					});
					//자리hoverout
					$("#" + spot).mouseout(function() {
						$("#bookingHover").hide();
					});
					//자리click
					$("#" + spot).click(function() {
						$("#noneClick").hide();
						$("#bookingClick").show();
						$("#bookingNum").html(bookingNum);
						$("#bookingState").html(bookingState);
						$("#bookingName").html(bookingName);
						$("#bookingPhone").html(bookingPhone);
						$("#bookingDiscount").html(bookingDiscount);
						$("#bookingMoney").html(bookingMoney);
						$("#applicationDate").html(applicationDate);
						$("#bookingDate").html(bookingDate);
						$("#bookingSpot").html(spot);
						
						//예약상황
						$(".bookingState:contains(0)").html("미사용  <input type='button' class='bookingParking' value='입차확인'>");
						$(".bookingState:contains(1)").html("사용");
						
						//사용일경우 감면혜택체크란 없애기
						if($(".bookingState").html()!="사용"){
							//예약혜택
							$(".bookingDiscount").not(".bookingDiscount:contains('없음')").append("<br><span class='redtext'><label>감면혜택 체크<input type='checkbox' id='discountcheck' class='d_ck'></label></span>"); 
						}
						
						
						//예약입차확인 클릭시
						$(".bookingParking").click(function(){
							
							//감면혜택체크
							var discount=$(".bookingDiscount").html();
							if(discount!="없음"){
								if ($("#discountcheck").is(":checked") == false) {
									alert("감면혜택이있는 예약자입니다.\n 감면혜택체크 후 입차확인바랍니다.");
									$("#discountcheck").focus();
									return
								}
							}
							if(confirm("확인버튼을 누르시면, 입차확인이 완료됩니다.")){
							//예약 update ajax
							//보낼값 저장
							var Data = {
								"bookingNum":$("#bookingNum").html()
							}
							$.ajax({
								url : "/admin/nowOffline/bookingParkingInsert.do",
								type : 'get',
								data : Data,
								success : function(result) {
									if (result == 1) {
										alert("예약입차확인이 정상적으로 완료됬습니다.")
									} else {
										alert("추가실패")
									}
									$("#bookingClick").hide();
									location.reload();
								},
								error : function(request, status, error) {
									alert("code :" + request.status + "\n" + "message :"
											+ request.responseText + "\n" + "error:" + error);
								}
							});
							}
						});
						//예약입차확인 클릭시 끝
					});
				});
			},
			error : function(request, status, error) {
				alert("code :" + request.status + "\n" + "message :"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
	//ajax 현장자리조회 -> click hover
	function ajaxofflinespot() {
		//보낼값 저장
		var Data = {
			"selectDate" : new Date()
		}
		$.ajax({
			url : "selectofflineSpot.do",
			type : 'get',
			data : Data,
			success : function(list) {
				$.each(list, function(idx, val) {
					//데이터가져옴
					var offlineNum = val.offlineNum;
					var offlineSpot = val.offlineSpot;
					var offlineName = val.offlineName;
					var offlinePhone = val.offlinePhone;
					var offlineCarNum = val.offlineCarNum;
					var offlineInTime = val.offlineInTime;
					var offlineDiscount = val.offlineDiscount;
					var offlineState = val.offlineState;
					$("#" + offlineSpot).css("background-color", "#8b8b8b");
					//자리hover
					$("#" + offlineSpot).mouseover(function() {
						$("#offlineHover").show();
						$("#o_hoverSpot").html(offlineSpot);
						$("#o_hoverCode").html(offlineNum);
					});
					//자리hoverout
					$("#" + offlineSpot).mouseout(function() {
						$("#offlineHover").hide();
					});
					//자리click
					$("#" + offlineSpot).click(function() {
						//히든 쇼
						$("#noneClick").hide();
						$("#offlineClick").show();
						//값넣기
						$("#offlineNum").html(offlineNum);
						$("#out_num").html(offlineNum);
						$("#offlineSpot").html(offlineSpot);
						$("#offlineName").html(offlineName);
						$("#offlinePhone").html(offlinePhone);
						$("#offlineCarNum").html(offlineCarNum);
						$("#offlineInTime").html(offlineInTime);
						$("#out_inTime").html(offlineInTime);
						$("#offlineDiscount").html(offlineDiscount);
						$("#out_discount").html(offlineDiscount);
						$("#offlineState").html(offlineState);
					});
				});
			},
			error : function(request, status, error) {
				alert("code :" + request.status + "\n" + "message :"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
	
	//ajax 자리수 조회
	function ajaxSpotCount() {
		//보낼값 저장
		var Data = {
			"selectDate" : new Date()
		}
		$.ajax({
			url : "spotCount.do",
			type : 'get',
			data : Data,
			success : function(spot) {
				$.each(spot, function(idx, val) {
					//list값
					var bookingSpot = val.bookingSpotCnt;
					var offlineSpot = val.offlineSpotCnt;
					var totalSpot = val.totalSpotCnt;
					console.log("bo="+bookingSpot);
					console.log("off="+offlineSpot);
					console.log("total="+totalSpot);
					var spot = 100-totalSpot;
						$("#spotCnt").html(spot);
					$("#b_spotCnt").html(bookingSpot);
					$("#o_spotCnt").html(offlineSpot);
				});
			},
			error : function(request, status, error) {
				alert("code :" + request.status + "\n" + "message :"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
	}
	
	//ajax 차액부과금 추가 결과값
	function ajaxpenaltyInsert() {
		// 값
		var paymentNum = $("#paymentNum").val();
		var penalty = $("#penalty").val();

		// paymentNum 미입력인 경우
		if (paymentNum == "" || paymentNum == null) {
			alert("결제코드번호를 입력해주세요.");
			$("#paymentNum").focus();
			return;
		}
		// penalty 미입력인 경우
		if (penalty == "" || penalty == null) {
			alert("차액부과금액을 입력해주세요.");
			$("#penalty").focus();
			return;
		}
		if(confirm("확인버튼을 누르시면, 차액부과금추가가 완료됩니다.")){
		//보낼값 저장
		var Data = {
			"paymentNum" : paymentNum,
			"penalty" : penalty
		}
		$.ajax({
			url : "/admin/nowOffline/penaltyInsert.do",
			type : 'get',
			data : Data,
			success : function(result) {
				if (result == 1) {
					alert("차액부과금추가가 정상적으로 완료됬습니다.")
				} else {
					alert("추가실패 \n 결제코드번호와 차액부과금을 정상적으로 입력하세요")
				}
				$("#penaltyInsert").hide();
			},
			error : function(request, status, error) {
				alert("code :" + request.status + "\n" + "message :"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
		}
	}
	
	//현장 입차확인 버튼클릭 시
	function offlineInsert() {
	//필드
		var name = $("#off_name").val();
		var phone = $("#off_phone").val();
		var carNum = $("#off_carNum").val();
		//정규식
		var regname = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,5}/;
		var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		
		// 이름 미입력인 경우
		if (name == "" || name == null) {
			alert("성명을 입력하세요.");
			$("#off_name").focus();
			return;
		} else {
			//이름 정규식 어긋날경우
			if (!regname.test(name)) {
				alert("이름을 제대로 입력하세요\n ex)홍길동");
				$("#off_name").focus();
				return;
			}
		}
		
		// 전화번호 미입력인 경우
		if (phone == "" || phone == null) {
			alert("전화번호를 입력하세요.");
			$("#off_phone").focus();
			return;
		} else {
			//전화번호 정규식 어긋날경우
			if (!regPhone.test(phone)) {
				alert("전화번호를 제대로 입력하세요\n ex)010-1234-5678");
				$("#off_phone").focus();
				return;
			}
		}
		
		// 차량번호 미입력인 경우
		if (carNum == "" || carNum == null) {
			alert("차량번호를 입력하세요.");
			$("#off_carNum").focus();
			return;
		}
		
		//ajax추가
		if(confirm("확인버튼을 누르시면, 현장손님 입차완료 됩니다.")){
			ajaxOfflineInsert();
		}
	}
	
	//현장 퇴차확인 클릭시
	function outButtonClick (){
		$("#offlineOutClick").show();
		
		//값넣기
		$("#out_outTime").html(new Date().format("yyyy-MM-dd HH:mm:ss"))
		//할인
		var discount = $("#out_discount").html();
		var percent = 0;
		if (discount == "없음") {
			percent = 0;
		}
		if (discount == "2자녀(다둥이)") {
			percent = 30;
		}
		if (discount == "경형,저공해 자동차") {
			percent = 50;
		}
		if (discount == "3자녀(다둥이)") {
			percent = 50;
		}
		if (discount == "5.18 민주유공자") { 
			percent = 50;
		}
		if (discount == "장애인") {
			percent = 80;
		}
		if (discount ==  "국가유공자(상이자만 해당)") {
			percent = 80;
		}
		if (discount == "성실납세표지 부착차량(1년간)") {
			percent = 100;
		}
		if (discount == "긴급자동차") {
			percent = 100;
		}
		$("#out_percent").html(percent+"%");
		//이용시간
		var inTime = $("#out_inTime").html();
		var outTime = $("#out_outTime").html();
		//계산
		var i = inTime.split(":");
		var o = outTime.split(":");
		var intime_d = new Date(i[0].substr(0,4),i[0].substr(5,2),i[0].substr(8,2),i[0].substr(-2),i[1],i[2]);
		var outtime_d = new Date(o[0].substr(0,4),o[0].substr(5,2),o[0].substr(8,2),o[0].substr(-2),o[1],o[2]);
		var betweenTime = (outtime_d.getTime()-intime_d.getTime())/60000;
		//이용시간
		$("#out_time").html(Math.round(betweenTime)+"분");
		//이용금액 = 이용시간/5*400
		//5분단위로계산
		var time = Math.round(betweenTime)/5;
		var out_money=Math.ceil(time)*400;
		$("#out_price").html(out_money + "원");
		//할인금액 = 이용금액 * (할인율/100)
		var out_sale = out_money * (percent/100);
		$("#out_sale").html(out_sale + "원");
		//총결제금액
		var out_total = out_money - out_sale;
		$("#out_total").html(out_total + "원");
	};
	//ajax 현장insert
	function ajaxOfflineInsert() {
		//현장 보낼값
		var Data = {
			"offlineNum" : $("#off_num").html(),
			"offlineSpot" : $("#off_spot").html(),
			"offlineName" : $("#off_name").val(),
			"offlinePhone" : $("#off_phone").val(),
			"offlineCarNum" : $("#off_carNum").val(),
			"offlineDiscount" : $("#off_dis").val()
		}
		$.ajax({
			url : "/admin/nowOffline/offlineInsert.do",
			type : 'GET',
			data : Data,
			success : function(result) {
				if (result == 1) {
					alert("현장손님 추가완료")
				} else {
					alert("현장손님 추가실패 \n 다시 시도해주세요.")
				}
				$("#noneClick").hide();
				location.reload();
			},
			error : function(request, status, error) {
				alert("code :" + request.status + "\n" + "message :"
						+ request.responseText + "\n" + "error:" + error);
			}
		});
		
	}
	//퇴차->결제완료ajax
	function out_paymentButton(){
		 if(confirm("확인버튼을 누르시면, 퇴차처리가 완료됩니다. \n계산은 현장에서 결제 해주세요")){
		      //현장 퇴차 update ajax
		      alert("현장번호 ="+$("#offlineNum").html());
		      var Data = {
		         "offlineOutTime":$("#out_outTime").html(),
		         "offlineTime":$("#out_time").html(),
		         "out_price":$("#out_price").html(),
		         "offlineNum":$("#offlineNum").html()
		      }
		      $.ajax({
		         url : "/admin/nowOffline/offlineOut.do",
		         type : 'get',
		         data : Data,
		         success : function(result) {
		            if (result == 1) {
		               alert("예약입차확인이 정상적으로 완료됬습니다.")
		            } else {
		               alert("추가실패")
		            }
		            $("#bookingClick").hide();
		            location.reload();
		         },
		         error : function(request, status, error) {
		            alert("code :" + request.status + "\n" + "message :"
		                  + request.responseText + "\n" + "error:" + error);
		         }
		      });
		      }
	}
	
	//현장form보내기
	function offline_form_insert(){
		$("#f_offline").submit();
	}

	//차액부과금 버튼클릭 시
	function penaltyButton() {
		//info창 히든풀기
		$("#penaltyInsert").show();
	}
	//차액부과금 버튼더블클릭 시
	function penaltyButtondb() {
		//info창 히든풀기
		$("#penaltyInsert").hide();
	}
	//현장단순취소
	function offcancleButton(){
		 if(confirm("확인버튼을 누르시면, 단순취소처리 됩니다. \n단순취소 시,데이터가 남지않습니다.")){
		      var Data = {
		         "offlineNum":$("#offlineNum").html()
		      }
		      $.ajax({
		         url : "/admin/nowOffline/offlineCancle.do",
		         type : 'get',
		         data : Data,
		         success : function(result) {
		            if (result == 1) {
		               alert("현장주차 단순취소 완료")
		            } else {
		               alert("추가실패")
		            }
		            $("#bookingClick").hide();
		            location.reload();
		         },
		         error : function(request, status, error) {
		            alert("code :" + request.status + "\n" + "message :"
		                  + request.responseText + "\n" + "error:" + error);
		         }
		      });
		      }
	}
	//마감 버튼클릭 시
	function endButton() {
		if(confirm("확인버튼을 누르시면, 마감처리 됩니다. \n 모든 예약자들이 사용으로 바뀌므로 신중히 확인 후 눌러주세요")){
		      var Data = {
		         "offlineNum":$("#offlineNum").html()
		      }
		      $.ajax({
		         url : "/admin/nowOffline/offlineCancle.do",
		         type : 'get',
		         data : Data,
		         success : function(result) {
		            if (result == 1) {
		               alert("현장주차 단순취소 완료")
		            } else {
		               alert("추가실패")
		            }
		            $("#bookingClick").hide();
		            location.reload();
		         },
		         error : function(request, status, error) {
		            alert("code :" + request.status + "\n" + "message :"
		                  + request.responseText + "\n" + "error:" + error);
		         }
		      });
		      }
	}
	function spot2click() {
		//2층 show(), 3층 hide()
		$("#2Fspot").show();
		$("#3Fspot").hide();
	}  
	function spot3click() {
		//3층 show(), 2층 hide()
		$("#3Fspot").show();
		$("#2Fspot").hide();
	}
</script>
<title>관리자) 현장현황관리</title>
</head>
<body>
	<header><jsp:include page="../header.jsp" /></header>
	<hr>
	<div class="container">
		<div id="myBooking_1">
			<h3>현장현황관리</h3>
		</div>
		<!-- "현재시간(동적)" -->
		<div id="date_now"></div>
		<!-- "choiceSpot" -->
		<div id="choiceSpot">
			<div id="discript">
				<div id="description">
					<span class="bookingtext">■</span> 예약 <span class="offlinetext">■</span>
					현장발매 □ 빈자리 <span class="redtext">■</span> 선택불가<br>
					<p>
						남은 자리수: <span id="spotCnt" class="redtext"></span>/100
					</p>
					<p>
						현장이용고객: <span id="o_spotCnt" class="redtext"></span>/100
					</p>
					<p>
						예약이용고객: <span id="b_spotCnt" class="redtext"></span>/100
					</p>
				</div>
			</div>
			<!-- 자리선택 -->
			<div class="col-sm-8" style="background-color: lavenderblush;">
				<div style="background-color: lavender;">
					<input type="button" value="2F" onclick="spot2click()"> <input
						type="button" value="3F" onclick="spot3click()">
				</div>
				<!-- 2층 -->
				<div id="2Fspot" style="background-color: lavender;" class="spotF">
					<%
						for (int i = 1; i <= 9; i++) {
					%>
					<div id="limit<%=i%>" class="spotLimit">
						<%
							for (int j = ((i - 1) * 4 + 1); j <= (4 * i); j++) {
						%>
						<button id="<%=j%>" value="<%=j%>"><%=j%></button>
						<%
							}
						%>
					</div>
					<%
						}
					%>
					<div id="limit10">
						<%
							for (int i = 37; i <= 50; i++) {
						%>
						<button id="<%=i%>" value="<%=i%>"><%=i%></button>
						<%
							}
						%>
					</div>
				</div>
				<!-- 3층 -->
				<div id="3Fspot" style="background-color: lavender;" class="spotF">
					<%
						for (int i = 1; i <= 9; i++) {
					%>
					<div id="limit<%=i%>" class="spotLimit">
						<%
							for (int j = ((i - 1) * 4 + 1) + 50; j <= (4 * i) + 50; j++) {
						%>
						<button id="<%=j%>" value="<%=j%>"><%=j%></button>
						<%
							}
						%>
					</div>
					<%
						}
					%>
					<div id="limit10">
						<%
							for (int i = 37 + 50; i <= 50 + 50; i++) {
						%>
						<button id="<%=i%>" value="<%=i%>"><%=i%></button>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
		<!-- "choiceSpot" -->
		<aside>
			<div id="offlineMain">
				<!-- ==============차액부과금==============-->
				<div id="penaltyInsert">
					<table>
						<tr>
							<td>결제코드번호</td>
							<td><input type="text" id="paymentNum" name="paymentNum"></td>
						</tr>
						<tr>
							<td>차액 부과금</td>
							<td><input type="text" id="penalty" name="penalty"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="추가"
								onclick="ajaxpenaltyInsert()"></td>
						</tr>
					</table>
				</div>
				<!-- ==============예약============== -->
				<div id="bookingHover">
					자리: <span id="b_hoverSpot"></span> <br> 코드번호: <span
						id="b_hoverCode"></span>
				</div>
				<div id="bookingClick">
					<table>
						<tr>
							<td colspan="2">예약손님 no. <span id="bookingNum"></span></td>
						</tr>
						<tr>
							<td>예약 상황</td>
							<td id="bookingState" class="bookingState"></td>
						</tr>
						<tr>
							<td>예약자 이름</td>
							<td id="bookingName"></td>
						</tr>
						<tr>
							<td>예약자 전화번호</td>
							<td id="bookingPhone"></td>
						</tr>
						<tr>
							<td>예약 자리</td>
							<td id="bookingSpot"></td>
						</tr>
						<tr>
							<td>감면 종류</td>
							<td id="bookingDiscount" class="bookingDiscount"></td>
						</tr>
						<tr>
							<td>결제금액</td>
							<td id="bookingMoney"></td>
						</tr>
						<tr>
							<td>신청일자</td>
							<td id="applicationDate"></td>
						</tr>
						<tr>
							<td>예약일자</td>
							<td id="bookingDate"></td>
						</tr>
					</table>
				</div>
				<!-- ==============현장============== -->
				<!-- 빈좌석>현장추가 -->
				<div id="noneClick">
					<table>
						<tr>
							<td colspan="2">현장손님 no. <span id="off_num"><%=coad%></span></td>
						</tr>
						<tr>
							<td>주차 자리</td>
							<td id="off_spot"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="off_name" id="off_name"
								maxlength="5"></td>
						</tr>
						<tr>
							<td>전화 번호</td>
							<td><input type="text" name="off_phone" id="off_phone"
								placeholder="010-****-****"></td>
						</tr>
						<tr>
							<td>차량 번호</td>
							<td><input type="text" name="off_carNum" id="off_carNum"
								placeholder="공백없이 기입"></td>
						</tr>
						<tr>
							<td>입차시간</td>
							<td id="off_inTime"></td>
						</tr>
						<tr>
							<td>감면혜택종류</td>
							<td><select name="selectDiscount" id="selectDiscount">
									<option value="0">없음</option>
									<option value="1">2자녀(다둥이)</option>
									<option value="2">경형,저공해 자동차</option>
									<option value="3">3자녀(다둥이)</option>
									<option value="4">5.18 민주유공자</option>
									<option value="5">장애인</option>
									<option value="6">국가유공자(상이자만 해당)</option>
									<option value="7">성실납세표지 부착차량(1년간)</option>
									<option value="8">긴급자동차</option>
							</select></td>
						</tr>
						<tr>
							<td>할인율</td>
							<td id="off_discountpercent">0%</td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="입차확인"
								onclick="offlineInsert()"></td>
						</tr>
					</table>
					<input type="hidden" id="off_dis" name="off_dis" value="없음">
				</div>
				<!-- ==============현장조회============== -->
				<div id="offlineHover">
					자리: <span id="o_hoverSpot"></span> <br> 코드번호: <span
						id="o_hoverCode"></span>
				</div>
				<div id="offlineClick">
					<table>
						<tr>
							<td colspan="2">현장손님 no. <span id="offlineNum"></span></td>
						</tr>
						<tr>
							<td>주차자리</td>
							<td id="offlineSpot"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td id="offlineName"></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td id="offlinePhone"></td>
						</tr>
						<tr>
							<td>차량번호</td>
							<td id="offlineCarNum"></td>
						</tr>
						<tr>
							<td>입차시간</td>
							<td id="offlineInTime"></td>
						</tr>
						<tr>
							<td>감면혜택종류</td>
							<td id="offlineDiscount"></td>
						</tr>
						<tr>
							<td>현장 상황</td>
							<td id="offlineState">주차중</td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="퇴차"
								onclick="outButtonClick()"><input type="button"
								value="취소" onclick="offcancleButton()"></td>
						</tr>
					</table>
				</div>
				<!-- 현장퇴차 -->
				<div id="offlineOutClick">
					<table>
						<tr>
							<td>현장손님</td>
							<td id="out_num"></td>
						</tr>
						<tr>
							<td>입차시간</td>
							<td id="out_inTime"></td>
						</tr>
						<tr>
							<td>퇴차시간</td>
							<td id="out_outTime"></td>
						</tr>
						<tr>
							<td>이용시간</td>
							<td id="out_time"></td>
						</tr>
						<tr>
							<td>감면혜택종류</td>
							<td id="out_discount"></td>
						</tr>
						<tr>
							<td>할인율</td>
							<td id="out_percent"></td>
						</tr>
						<tr>
							<td>이용금액</td>
							<td id="out_price"></td>
						</tr>
						<tr>
							<td>할인금액</td>
							<td id="out_sale" class="redtext"></td>
						</tr>
						<tr>
							<td>총결제금액</td>
							<td id="out_total"></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="결제완료"
								onclick="out_paymentButton()"></td>
						</tr>
					</table>
				</div>
				<!-- 차액부과금 버튼 -->
				<div id="penaltyButton">
					<input type="button" value="차액부과금" onclick="penaltyButton()"
						ondblclick="penaltyButtondb()"> <input type="button"
						value="마감" onclick="endButton()">
				</div>
			</div>
		</aside>
	</div>
	<hr>
	<footer><jsp:include page="../footer.jsp" />
	</footer>
</body>
</html>