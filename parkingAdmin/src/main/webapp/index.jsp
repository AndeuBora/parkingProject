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
<script src="/admin/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/admin/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/admin/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />

<script type="text/javascript">
	$(function() {

		$("#adminCheckBtn").click(function() {

			if ($("#adminId").val() == null || $("#adminId").val() == "") {
				alert("아이디를 입력하세요");
				$("#adminId").focus();
				return false;
			}
			if ($("#adminPwd").val() == null || $("#adminPwd").val() == "") {
				alert("비밀번호를 입력하세요");
				$("#adminPwd").focus();
				return false;
			}

			$("#adminCheckForm").attr({
				"method" : "POST",
				"action" : "/admin/adminLogin/adminLoginCheck.do"
			});
			$("#adminCheckForm").submit()

		});

	})
</script>
<style type="text/css">
#loginIdCheck {
	color: red;
}

#loginPwdCheck {
	color: red;
}

#loginSection {
	padding-top: 10%;
}
</style>
<body id="loginBody">
	<div class="container">
		<section id="loginSection">
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">관리자 로그인</h3>
						</div>
						<div class="panel-body">
							<form role="form" name="adminCheckForm" id="adminCheckForm">
								<div class="form-group">
									<label>아이디</label> <input type="text" id="adminId"
										name="adminId" class="form-control" placeholder="아이디">
								</div>
								<c:if test="${msg=='아이디가 틀렸습니다'}">
									<div>
										<p id="loginIdCheck">존재하지 않는 아이디 입니다</p>
									</div>
								</c:if>
								<div class="form-group">
									<label>비밀번호</label> <input type="password" id="adminPwd"
										name="adminPwd" class="form-control" placeholder="비밀번호">
								</div>
								<c:if test="${msg=='비밀번호가 틀렸습니다'}">
									<div>
										<p id="loginPwdCheck">비밀번호가 틀렸습니다</p>
									</div>
								</c:if>

								<input type="button" id="adminCheckBtn" name="adminCheckBtn"
									value="로그인" class="btn btn-lg btn-success btn-block" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>