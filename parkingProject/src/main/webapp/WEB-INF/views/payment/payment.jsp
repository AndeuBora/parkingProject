<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/payment.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		var name = /[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; //사용자 이름
		var cardNumber = /[^0-9]/; //카드 숫자
		var validDateM = /[^0-9]/; //유효기간 -월
		var validDateY = /[^0-9]/; //유효기간 -년
		var cvcNumber = /[^0-9]/; //cvc
		// 이름 입력
		$("#paymentName").focusout(function() {

			var val = $(this).val();

			if (name.test(val)) {

				alert("한글 이름을 입력하시오.");

			}

		});
		//  카드 번호
		$("#cardNumber1").focusout(function() {
			var val = $(this).val();
			if (cardNumber.test(val)) {
				alert("정확한 카드숫자를 입력하시오.");
			}

		});
		$("#cardNumber2").focusout(function() {

			var val = $(this).val();
			if (cardNumber.test(val)) {
				alert("정확한 카드숫자를 입력하시오.");
			}

		});
		$("#cardNumber3").focusout(function() {

			var val = $(this).val();
			if (cardNumber.test(val)) {
				alert("정확한 카드숫자를 입력하시오.");
			}

		});
		$("#cardNumber4").focusout(function() {

			var val = $(this).val();
			if (cardNumber.test(val)) {
				alert("정확한 카드숫자를 입력하시오.");
			}

		});

		// 유효기간 
		$("#month").focusout(function() {

			var val = $(this).val();
			if (validDateM.test(val)) {
				alert("정확한 달을 입력하시오.");
			}

		});

		$("#years").focusout(function() {

			var val = $(this).val();
			if (validDateY.test(val)) {
				alert(" 정확한 연도를 입력하시오.");
			}

		});
		// cvc 
		$("#cvc").focusout(function() {

			var val = $(this).val();
			if (cvcNumber.test(val)) {
				alert("정확한 cvc 숫자를 입력하시오.");
			}

		});
<<<<<<< HEAD
	});
	/* 
	$(function() 종료 ㅋ
	 */		
=======

	});//$(function() 종료 ㅋ
>>>>>>> 4ef2230717081363ea509a22ab80c5e37c77aeca
</script>
<script type="text/javascript">
	$(function() {
		$("#cancleButton").click(function() {
			location.href = "/booking/bookingCheckAgain.do";
		});

	});
</script>
</head>
<body>

	<form action="paymentComplete.do" method="get">
<<<<<<< HEAD
		<div>
			<h3>결제 페이지</h3>
			<div id="paymentTable">
				<table>
					<colgroup>
						<col width="300">
						<col width="400">
					</colgroup>
					<tr>
						<th><label>카드사</label></th><td><select id=cardCompany
								name="cardCompany">
									<option value="gookminBank" label="국민은행"></option>
									<option value="sinhanBank" label="신한은행"></option>
									<option value="ooriBank" label="우리은행"></option>
									<option value="giupBank" label="기업은행"></option>
									<option value="nonghyubBank" label="농협은행"></option>
									<option value="soohyubBank" label="수협은행"></option>
									<option value="seamaeulBank" label="새마을은행"></option>
									<option value="oneBank" label="하나은행"></option>

							</select></td>
					</tr>

					<tr>
						<th><label for="paymentName">이름 </label></th> <td><input
								name="paymentName" id="paymentName" type="text"
								required="required"></td>
					</tr>

					<tr>
						<th><label for="cardNum1">카드 번호</label></th><td> <input id="cardNum1"
								name="cardNum1" type="text" size="4" maxlength="4" min="4"
								required="required">- <input id="cardNum2"
								name="cardNum2" type="text" size="4" maxlength="4" min="4"
								required="required">- <input id="cardNum3"
								name="cardNum3" type="password" size="4" maxlength="4" min="4"
								required="required">- <input id="cardNum4"
								name="cardNum4" type="password" size="4" maxlength="4" min="4"
								required="required"></td>
					</tr>

					<tr>
						<th><label for="cardValid1">유효기간(월/년)</label></th>
						<td><input id="cardValid1" name="cardValid1" type="text"
							maxlength="2" min="2" required="required"> / <input
							id="cardValid2" name="cardValid2" type="text" maxlength="2"
							min="2" required="required"></td>
					</tr>

					<tr>
						<th><label for="cardCvc">cvc번호</label></th>
						<td><input id="cardCvc" name="cardCvc" type="text" min="3"
							maxlength="3" required="required"></td>
					</tr>
					<tr>
						<th><label>결제 금액 </label></th>
						<td></td>
					</tr>

					<tr>
						<td colspan="2" ><label>　　　　　　　　　　　　　　　　　　카드 결제 이용약관</label> <br /> 
						<textarea rows="10" cols="100" disabled="disabled" style ="resize: none;">제 1조 회원
회원이란 이 약관을 승인하고 삼성카드주식회사(이하 "카드사"라 함)에 체크카드(이하 "카드"라 함)의 발급을 신청하여 카드사의 심사를 거쳐 카드사로부터 카드를 발급받은 분을 말합니다.
제 2조 카드의 관리
1. 회원은 카드를 발급받은 즉시 카드 서명란에 직접 서명하여야 하며, 회원 본인외 제3자로 하여금 카드를 보관 또는 소지하게 하거나 이용하게 하여서는 안됩니다.
2. 카드의 소유권은 카드사에 있으므로 회원은 카드를 타인에게 대여하거나 양도 또는 담보의 목적으로 이용할 수 없고, 카드 비밀번호가 제3자에게 유출되지 않도록 하는 등 선량한 관리자로서의 주의를 다하여 카드를 이용, 관리하여야 합니다.
3. 회원은 유효기한이 경과한 카드 및 재발급에 따른 기존의 카드를 카드의 유효기한 경과 및 새로운 카드 수령 즉시 잘게 절단하여 분리 폐기하는 등 이용이 불가능하도 록 조치하여야 합니다.
4. 제①항 내지 제③항을 위반하거나 이행을 게을리 하여 발생하는 모든 책임은 회원이 집니다.
제 3조 카드의 유효기간 및 재발급
1. 카드의 유효기한은 카드 앞면에 표시됩니다.
2. 카드의 유효 기한이 도래된 경우 카드사는 회원으로서 적당하다고 인정되는 회원에 게 갱신발급 예정일로부터 1개월 이전에 회원에게 발급 예정사실을 통보한 후 20일 이내에 회원으로부터 
이의제기가 없는 경우 새로운 유효기한이 표시된 카드를 갱신 발급하여 드립니다. 다만, 갱신발급 예정일로부터 6개월 이내에 카드를 사용하지 않은 회원에 대해서는 사전에 회원의 서면동의가 
있는 경우에 한하여 갱신 발급하여 드리며, 카드의 유효기간 만료 또는 기타의 사유에 의해 카드가 갱신, 교체, 대체 발급 된 경우에도 계속하여 이 약관이 적용됩니다.
</textarea> <br /> <label>　　　　　　　　　　　　　　　　　　　약관에 동의</label><input
							value="1" id="paymentPolicy" name="paymentPolicy" type="checkbox"
							required="required"></td>
					</tr>

					<tr>
						<th colspan="2">
							<button type="submit">결제</button>
							<button id="cancleButton">취소</button>
						</th>
						
					</tr>
				</table>
			</div>
		</div>
=======
		<table>
			<tr>
				<td><label>카드사<select id=cardCompany name="cardCompany">
							<option value="gookminBank" label="국민은행"></option>
							<option value="sinhanBank" label="신한은행"></option>
							<option value="ooriBank" label="우리은행"></option>
							<option value="giupBank" label="기업은행"></option>
							<option value="nonghyubBank" label="농협은행"></option>
							<option value="soohyubBank" label="수협은행"></option>
							<option value="seamaeulBank" label="새마을은행"></option>
							<option value="oneBank" label="하나은행"></option>
							<option value="matherBank" label="엄마은행"></option>
					</select></label></td>
			</tr>

			<tr>
				<td><label for="paymentName">이름 <input
						name="paymentName" id="paymentName" type="text"
						required="required"></label></td>
			</tr>

			<tr>
				<td><label for="cardNum1">카드 번호 <input id="cardNum1"
						name="cardNum1" type="text" size="4" maxlength="4" min="4"
						required="required">- <input id="cardNum2" name="cardNum2"
						type="text" size="4" maxlength="4" min="4" required="required">-
						<input id="cardNum3" name="cardNum3" type="password" size="4"
						maxlength="4" min="4" required="required">- <input
						id="cardNum4" name="cardNum4" type="password" size="4"
						maxlength="4" min="4" required="required"></label></td>
			</tr>

			<tr>
				<td><label for="cardValid1">유효기간(월/년) <input
						id="cardValid1" name="cardValid1" type="text" maxlength="2"
						min="2" required="required"> / <input id="cardValid2"
						name="cardValid2" type="text" maxlength="2" min="2"
						required="required"></label></td>
			</tr>

			<tr>
				<td><label for="cardCvc">cvc번호 <input id="cardCvc"
						name="cardCvc" type="text" min="3" maxlength="3"
						required="required"></label></td>
			</tr>

			<tr>
				<td><label>카드 결제 이용약관</label> <br /> <textarea rows="10"
						cols="20"></textarea> <br /> <label>약관에 동의</label><input
					value="1" id="paymentPolicy" name="paymentPolicy" type="checkbox"
					required="required"></td>
			</tr>

			<tr>
				<td>
					<button type="submit">결제</button>
					<button id="cancleButton">취소</button>
				</td>
			</tr>
		</table>
		<%-- <input type="hidden" id="paymentNum" name="paymentNum" value="${paymentNum}"> --%>
>>>>>>> 4ef2230717081363ea509a22ab80c5e37c77aeca

	</form>

</body>
</html>