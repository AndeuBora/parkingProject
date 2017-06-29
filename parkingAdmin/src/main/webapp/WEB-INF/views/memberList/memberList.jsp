<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tag" uri="/WEB-INF/tld/member_tag.tld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css?var=22" />
<link rel="stylesheet"
	href="/resources/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
<script type="text/javascript">
	$(function() {

		//콤보박스 값 변경
		$("#selectMemberType").change(function() {

			var memberType = $("#selectMemberType").val();

			$("#memberType").val(memberType);

			goPage(1);

		});

		//페이지 사이즈 선택값 변경
		$("#selectSize").change(function() {

			var pageSize = $("#selectSize").val();

			$("#pageSize").val(pageSize);

			goPage(1);

		});

		//검색 버튼 클릭시
		$("#searchMemberBtn").click(function() {

			if ($("#memberName").val() == null, $("#memberName").val() == "") {
				alert("검색어를 입력하세요");
				$("#memberName").focus();
				return false;
			}
			alert("memberName=" + $("#memberName").val())
			goPage(1);

		});

		//가입상태 = 1일경우(회원)
		$(".state:contains(1)").html("회원");
		//가입여부 = 2일경우(탈퇴)
		$(".state:contains(2)").html("탈퇴");

	});

	//멤버 타입  검색 시 실질적인 처리 함수
	function goPage(page) {
		$("#page").val(page);

		$("#memberManagementForm").attr({
			"method" : "GET",
			"action" : "/admin/memberListBoard/memberList.do"
		});
		$("#memberManagementForm").submit();
	}
</script>
<style type="text/css">
#selectMemberType {
	
}

#selectSize {

}

#memberBoardPage {
	text-align: center;
}

th {
	text-align: center;
	background-color: #BFBFBF;
}

#memberNameField{
margin-bottom: 2%;
}
</style>
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
	<div class="container">
		<section>
			<div class="page-header">
				<h1>회원관리 페이지</h1>
			</div>

			<form class="form-inline" id="memberManagementForm"
				name="memberManagementForm">
				<div class="form-group">
					<select class="form-control" id="selectMemberType"
						name="selectMemberType">
						<option value="0" ${data.memberType eq "0" ? "selected" : ""}>전체</option>
						<option value="1" ${data.memberType eq "1" ? "selected" : ""}>가입회원</option>
						<option value="2" ${data.memberType eq "2" ? "selected" : ""}>탈퇴회원</option>
					</select> <input type="hidden" id="pageSize" name="pageSize"
						value="${data.pageSize}">
						<select class="form-control" id="selectSize" name="selectSize">
						<option value="10" ${data.pageSize eq "10" ? "selected" : ""}>10개씩
							보기</option>
						<option value="20" ${data.pageSize eq "20" ? "selected" : ""}>20개씩
							보기</option>
						<option value="50" ${data.pageSize eq "50" ? "selected" : ""}>50개씩
							보기</option>
					</select>
				</div>
				
				<input type="hidden" id="memberType" name="memberType"
					value="${data.memberType }"> <input type="hidden" id="page"
					name="page" value="${data.page}">

<br><br>
				<div id="memberNameField" class="form-group">
					<label>회원찾기:</label> <input class="form-control" type="text"
						id="memberName" name="memberName">

				<input type="button" value="검색" class="btn  btn-success" id="searchMemberBtn"
					name="searchMemberBtn">
				</div>

			</form>



			<div>
				<table class="table table-bordered table-hover">
					<tr>
						<th>글번호</th>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>가입날짜</th>
						<th>회원상태</th>
					</tr>

					<c:choose>
						<c:when test="${not empty memberList }">
							<c:forEach var="memberList" items="${memberList }"
								varStatus="status">
								<tr align="center">
									<td>${memberList.rnum }</td>
									<td>${memberList.memberNum }</td>
									<td>${memberList.memberId }</td>
									<td>${memberList.memberName }</td>
									<td>${memberList.memberPhone }</td>
									<td>${memberList.memberEmail }</td>
									<td>${memberList.memberDate }</td>
									<td class="state">${memberList.memberType }</td>

								</tr>

							</c:forEach>

						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="8" align="center">등록된 게시물이 존재하지 않습니다</td>
							</tr>
						</c:otherwise>

					</c:choose>


				</table>

			</div>
		</section>

	</div>
	<!-- 페이지 네비게이션 -->
	<div id="memberBoardPage">
		<tag:paging page="${param.page }" total="${memberTotal }"
			list_size="${data.pageSize }"></tag:paging>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>