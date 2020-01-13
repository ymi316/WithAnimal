<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" />
	<title>회원관리 - 아이디 찾기</title>
	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/viewform_style.css">
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet" type="text/css">
	<!--<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css">-->
    <!-- Bootstrap Core CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<!-- jQuery Library -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.0/jquery.min.js"></script>
    <!-- Bootstrap Core JS -->
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
		<section class="container">
	    <section class="password-form">
		<form role="login">
			<div style="margin-bottom: 20px;">
				<span>아이디를 찾았습니다.</span>
			</div>	
			
			<div>
				" ${vo.u_name } "님의 아이디는 <br>
				" ${vo.u_id } " 입니다.
			</div>
			<div class="p-t-30" style="margin-top: 5px">
				<button type="button" class="btn btn-primary btn--green btn-lg" onclick="location.href='login'">로그인 하기</button>
			</div>		
		</form>
		</section>
	</section>
</body>
</html>