<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css?var=2" />
<!-- 부트스트랩 -->
<title>Insert title here</title>
<style type="text/css">
/* 화면 채우기 */
html, body {
	margin: 0;
	padding: 10px;
	height: 100%;
}

.headerAll {
	
}

#headerImg {
	padding-left: 70px;
	padding-top: 10px;
}

.mainManu {
	margin-top: 20px;
}

.mainManu ul li a {
	font-size: 18px;
}

.noneborder {
	border: 0px;
}

.manu {
	padding: 10px;
	border: 1px solid black;
}

.member {
	font-weight: bold;
	color: black;
}
</style>
</head>
<body>
	<header>
		<!-- 	테스트 -->
		<nav class="navbar navbar-default headerAll row menu"
			role="navigation">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header " id="headerImg">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar-collapse-1">
						<span class="sr-only">아아아아아아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ아</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a href="../index.jsp" class="navbar-brand"><img id="logo"
						alt="로고" src="../resources/img/logo.png" class="logoimg"></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="navbar-collapse collapse row" id="navbar-collapse-1">
					<div class="row pa">
						<!-- 회원목록 -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="headerLogin" href="#">관리자 로그인중</a></li>
						</ul>
					</div>
					<!-- 메인메뉴바 -->
					<div class="row mainManu">
						<ul class="nav navbar-nav navbar-right">
							<!-- 내꺼 -->
							<li><a href="/admin/booking/bookingManagement.do">예약관리</a></li>
							<li><a href="/admin/nowOffline/nowOfflineManagement.do">자리현황
									관리</a></li>
							<li><a href="/admin/noticeBoard/adminNoticeBoardMain.do">공지사항</a></li>
							<li><a href="/admin/adminQnaBoard/qnaBoardAdminReplyMain.do">QnA</a></li>
							<li><a href="/admin/payment/paymentList.do">결제관리</a></li>
							<li><a href="/admin/memberListBoard/memberList.do">회원관리</a></li>
						</ul>
					</div>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</header>
</body>
</html>