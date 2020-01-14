<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<link href="${pageContext.request.contextPath}/resources/css/list_style.css" rel="stylesheet">
	<script type="text/javascript">
		function formInput(){
			location.href='boardForm';
		}
	</script>
</head>
<body>
	 <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
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
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h2>반려동물 분실등록 게시판</h2>
        <h4>사랑하는 반려동물을 찾습니다. 보호중이거나 목격하신 분은 꼭 제보 부탁드립니다!</h4>
        <c:if test="${not empty sessionScope.vo}">
	        <button class="btn btn-primary btn-sm" onclick="formInput()" id="submitBtn">분실 등록 &raquo;</button>
        </c:if>
      </div>
    </div>

	<div style="margin: 5%">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th width="50%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${paging.totalCount==0 }">
				<tr>
					<td colspan="4" align="center">작성된 글이 없습니다.</td>
                </tr>               
			</c:if>
			<c:if test="${paging.totalCount!=0 }">
			<c:set var="no" value="${paging.totalCount-(paging.currentPage-1)*paging.pageSize }"/>
			<c:forEach var="vo" items="${paging.list }" varStatus="vs">
				<tr align="center">
					<td id="idx${vo.content_idx }">${vo.content_idx }</td>
					<td id='subject${vo.content_idx }'>
						<span onclick='sendPost("boardResult",{"p":${paging.currentPage},"b":${paging.blockSize },"s":${paging.pageSize },"idx":${vo.content_idx }});' style="cursor: pointer;">
							<c:out value="${vo.subject }"/>
						</span>
					</td>
					<td id="u_name${vo.content_idx }">${vo.u_name }</td>
					<td id="content_regdate${vo.content_idx }"><fmt:formatDate value="${vo.content_regdate }" pattern="yy-MM-dd hh:mm:ss"/></td>
				</tr>
			</c:forEach> 
			</c:if> 
		</tbody>
		
	    <tr style="text-align: center;" onmouseover="this.style.backgroundColor='white'">
	      <td colspan="4">
		  <ul class="pagination" >
  
			<c:if test="${paging.startPage>1 }">
				<li class='page-item'>
					<a class='page-link' href='javascript:sendPost("?",{"p":"${paging.startPage-1}","s":"${paging.pageSize}","b":"${paging.blockSize}"});' aria-label='Previous'>
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
		    		<li class='page-item'><a class='page-link' href='javascript:sendPost("?",{"p":"${i}","s":"${paging.pageSize}","b":"${paging.blockSize}"});'>${i}</a></li>
		    	</c:otherwise>
		    	</c:choose>
		    </c:forEach>

			<c:if test="${paging.endPage<paging.totalPage }">
				<li class='page-item'>
				<a class='page-link' href='javascript:sendPost("?",{"p":"${paging.endPage+1}","s":"${paging.pageSize}","b":"${paging.blockSize}"});' aria-label='Next'>
					<span aria-hidden='true'>&raquo;</span>
					<span class='sr-only'>Next</span>
				</a>
				</li>
			</c:if>

		  </ul>
		  </td>
		</tr>
    </table>
    </div>
    
      <hr>

      <footer>
        <p>&copy; Company 2019</p>
      </footer>

	
</body>
</html>