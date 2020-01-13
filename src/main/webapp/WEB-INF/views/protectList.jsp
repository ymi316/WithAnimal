<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<title>반려동물 분실등록 게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/comm.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/protectlist_style.css" rel="stylesheet">
<script type="text/javascript">
	function formInput(){
		location.href='boardForm';
	}

	<%-- 
	$(function(){
		$('#btn_search').on('click',function(){
			$.ajax({
				type : 'post',
				url : '${pageContext.request.contextPath}/board/protectList',
				data: {"bgnde",bgnde},
				 	  {"endde",endde}
				success:function(data){
					console.log('요청완료');
				}				
			});
		});
	});
	function startSearch(){
		var bgnde = $("#bgnde").val();
		var endde = $("#endde").val();
		$.ajax({
			url : 'protectList',
			type: 'post',
			data: {bgnde,endde},
			success: function(data){
				alert("요청완료");
			}
		}); 
	}// 성공했다는 알람창은 뜨는데 검색되지 않음
	
	function startSearch(){
		var bgnde = $("#bgnde").val();
		var endde = $("#endde").val();
		location.href='protectList';
	} // controller로 가지 않음
	
	function startSearch(){
		var bgnde = $("#bgnde").val();
		var endde = $("#endde").val();
		location.href='protectList?bgnde=' + encodeURI(bgnde) + '&endde=' + encodeURI(endde);
	} // 첫페이지는 검색되지만 페이징이 되지 않음!!
	
	
	 --%>
</script>
</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> <span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${pageContext.request.contextPath }">With Animal</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<form class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" placeholder="Email" class="form-control">
				</div>
				<div class="form-group">
					<input type="password" placeholder="Password" class="form-control">
				</div>
				<button type="button" class="btn btn-success">Sign in</button>
			</form>
		</div>
	</div>
</nav>
<div class="jumbotron">
	<div class="container">
		<h2>보호동물 현황 게시판</h2>
		<h4>보호중인 유기동물들의 자료를 확인할 수 있습니다.</h4>
	</div>
</div>

<div style="margin: 2%">
	<table style="margin: 30px;">
		<div class="row">
			<div class=""> <!-- <div class="col-7 col-sm-6"> -->
				<ul class="list-inline">
					<li class="list-li-left">
						<a href="/record/index?status=" class="g-text-underline-hover">전체</a>
					</li>
					<li class="list-li-left">|</li>
					<li class="list-li-left">
						<a href="/record/index?species=%ea%b0%9c&status=" class="g-text-underline-hover">개</a></li>
					<li class="list-li-left">|</li>
					<li class="list-li-left">
						<a href="/record/index?species=%ea%b3%a0%ec%96%91%ec%9d%b4&status=" class="g-text-underline-hover">고양이</a>
					</li>	
					<li class="list-li-left">|</li>
					<li class="list-li-left">
						<a href="/record/index?species=%ea%b8%b0%ed%83%80&status=" class="g-text-underline-hover">기타</a>
					</li>	
				</ul>
			</div>
			<div class="">
				<ul class="list-inline">
					<li class="list-li-right">
						<a href="/record/index?status=" class="g-text-underline-hover">종료</a></li>
					<li class="list-li-right">|</li>
					<li class="list-li-right">
						<a href="/record/index?species=%ea%b0%9c&status=" class="g-text-underline-hover">보호중</a>
					</li>
					<li class="list-li-right">|</li>
					<li class="list-li-right">
						<a href="/record/index?species=%ea%b0%9c&status=" class="g-text-underline-hover">공고중</a>
					</li>
					<li class="list-li-right">|</li>
					<li class="list-li-right">
						<a href="/record/index?species=%ea%b0%9c&status=" class="g-text-underline-hover">전체</a>
					</li>
				</ul>
			</div>	
		</div>
		<div class="row">
			<div class="list-inline">
			<form action="protectList">
				<span>공고 시작일 : </span>
				<input type="text" id="bgnde" name="bgnde" placeholder="검색시작일(20200101)">
				<input type="text" id="endde" name="endde" placeholder="검색종료일(20200131)">
				<button type="submit" id="btn_search">검색</button>
			</form>
			</div>
		</div>
		<tbody>
		<div class="row_content">
		<c:if test="${paging.list==null }">
			<ul class="sub_photo">
				<li class="li-photo">
					<p class="thmb">게시된 글이 없습니다.</p>
				</li>
			</ul>
		</c:if>
		<c:if test="${paging.list!=null }">
			<div class="">
				<c:forEach var="vo" items="${paging.list }" varStatus="vs">
					<ul class="sub_photo">
						<li class="li-photo">
						<c:if test="${vo.desertionNo!=null&&vo.popfile!=null }">
							<p class="thmb">
								<img id="popfile${vo.content_idx }" src="${vo.popfile}" alt="${vo.kindCd }" onclick='sendPost("protectResult",{"p":${paging.currentPage},"b":${paging.blockSize },"s":${paging.pageSize }
								,"vo":${vo }});'>
							</p>
							<p class="thmb_span" style="cursor: pointer;">
								<a href="#" class="btn btn-md u-btn-primary k-btn-hover g-rounded-50" style="background-color: #f36f20">${vo.processState }</a>
								<c:set var="noticeNo" value="${vo.noticeNo }"/>
									${fn:substring(noticeNo,3,5)} | 
								<c:set var="kindCd" value="${vo.kindCd }"/>
									${fn:substringAfter(kindCd," ")}
							</p>
						</c:if>	
						</li>
					</ul>
				</c:forEach>
			</div>
		</c:if>
		</div>
		</tbody>
	</table>
	
	<table style=" margin: auto;">	
	<div style="margin: 5%">
		<div class="row">
			<tr style="text-align: center;" onmouseover="this.style.backgroundColor='white'">
				<td colspan="4">
					<ul class="pagination">
						<c:if test="${paging.startPage>1 }">
							<li class='page-item'>
							<a class='page-link' href='javascript:sendPost("?",{"p":"${paging.startPage-1}","s":"${paging.pageSize}","b":"${paging.blockSize}","bgnde":"${bgnde}","endde":"${endde}"});' aria-label='Previous'> 
								<span aria-hidden='true'>&laquo;</span>
								<span class='sr-only'>Previous</span>
							</a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
							<c:choose>
								<c:when test="${i==paging.currentPage }">
									<li class='page-item active'><span class='page-link'>${i}</span></li>
								</c:when>
								<c:otherwise>
									<li class='page-item'>
										<a class='page-link'href='javascript:sendPost("?",{"p":"${i}","s":"${paging.pageSize}","b":"${paging.blockSize}","bgnde":"${bgnde}","endde":"${endde}"});'>${i}</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
	
						<c:if test="${paging.endPage<paging.totalPage }">
							<li class='page-item'>
								<a class='page-link' href='javascript:sendPost("?",{"p":"${paging.endPage+1}","s":"${paging.pageSize}","b":"${paging.blockSize}","bgnde":"${bgnde}","endde":"${endde}"});' aria-label='Next'> 
									<span aria-hidden='true'>&raquo;</span> 
									<span class='sr-only'>Next</span>
								</a>
							</li>
						</c:if>	
					</ul>
				</td>
			</tr>
		</div>
	</div>
	</table>	
</div>
		
	<hr>
	<footer>
		<p>&copy; Company 2019</p>
	</footer>
				
</body>
</html>
	