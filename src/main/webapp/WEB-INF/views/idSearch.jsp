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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/login_style.css">
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
	<script type="text/javascript">
	function fromCheck() {
		var data=$("#u_name").val();
		if(data==null || data.trim().length==0){
			alert("사용자 이름은 반드시 입력해주세요.");
			$("#u_name").val("");
			$("#u_name").focus();
			return false;
		}
		
		var data = $("#u_phone").val();
		if(data==null || data.trim().length==0){
			alert("전화번호는 반드시 입력해주세요.");
				$("#u_phone").val("");
				$("#u_phone").focus();
				return false;
			}
		if(!checkPhone(date)){
			alert("전화번호 형식은 000-0000-0000입니다.");
				$("#phone").val("");
				$("#phone").focus();
				return false;
			}
			return true;
		}
    function checkPhone(phone){
		var re = /^\d{2,3}-\d{3,4}-\d{4}$/;
		return re.test(phone);
    }


	</script>
</head>
<body>
		<section class="container">
	    <section class="login-form">
		<form method="post" role="login" action="${pageContext.request.contextPath }/idSearchOk" onsubmit="return fromCheck()">
			<div style="margin-bottom: 20px;">
				<span>아이디 찾기</span>
			</div>	
			
			<div>
				<label>사용자 이름</label>			
				<input type="text" name="u_name" required class="form-control" placeholder="입력 필수" id="u_name" value="${u_name}"/>
			</div>
			
			<div>
				<label>전화번호</label>
				<input type="text" name="u_phone" required class="form-control" placeholder="입력 필수" id="u_phone" value="${u_phone }"/>
			</div>
			
			<div class="p-t-30" style="margin-top: 5px">
    		      <button type="button" class="btn btn-primary btn--green btn-lg" onclick="location.href='login'">취&nbsp;&nbsp;&nbsp;&nbsp;소</button>
   	       		  <button type="submit" class="btn btn-primary btn--green btn-lg" style="margin-left: 8px">아이디 찾기</button>
    	    </div>
				
		<!-- <button type="submit" name="login" class="btn btn-success btn-block">아이디 찾기</button>  -->	
			
			

		</form>
		</section>
	</section>
</body>
</html>