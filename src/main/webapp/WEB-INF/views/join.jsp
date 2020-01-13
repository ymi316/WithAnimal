<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>회원관리 - 회원가입</title>
	<!-- Custom CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/join_style.css" />
	<!-- Google Font -->
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- datepicker -->
	<script src="${pageContext.request.contextPath }/resources/vendor/datepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/datepicker/ko.js"></script>
	<script src="${pageContext.request.contextPath }/resources/vendor/datepicker/daterangepicker.js"></script>
	<link href="${pageContext.request.contextPath }/resources/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
	<!-- 다음 우편번호 API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <script type="text/javascript">
  //-----------------------------------------------------------------------------------------
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                
            	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }              
           
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('u_zipcode').value = data.zonecode;
                document.getElementById("u_addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("u_addr2").focus();
                       
            }
        }).open();
     }
	//-----------------------------------------------------------------------------------------
	
	// 생년월일 폼에서 달력 출력
	$(function(){
		$('input[name="u_birth"]').daterangepicker({
    			singleDatePicker: true,
    			showDropdowns: true,
    			locale: {
    			      format: 'YYYY/MM/DD'
    			}
    		  });
    		
    	});
	
    // 폼 검증하는 함수
    function fromCheck(){
    	if($("#idCheck").css('color')=='rgb(255, 0, 0)'){
			alert('가입 불가능한 아이디입니다.');
			$("#u_id").val("");
			$("#u_id").focus();
			return false;
		}
    	
    	var data=$("#u_name").val();
    	if(!data || data.trim().length==0){
    		alert("이름을 반드시 입력해야합니다.");
    		$("#u_name").val("");
    		$("#u_name").focus();
    		return false;
    	}
    	
    	var data=$("#u_id").val();
    	if(!data || data.trim().length==0){
    		alert("아이디를 반드시 입력해야합니다.");
    		$("#u_id").val("");
    		$("#u_id").focus();
    		return false;
    	}
    	if(!checkEmail(data)){
    		alert("아이디가 이메일 형식이 아닙니다.");
    		$("#u_id").val("");
    		$("#idCheck").html("");
    		$("#u_id").focus();
    		return false;
    	}
    	
    	var data=$("#u_pw").val();
    	if(!data || data.trim().length==0){
    		alert("비밀번호를 반드시 입력해야합니다.");
    		$("#u_pw").val("");
    		$("#u_pw").focus();
    		return false;
    	}
    	
    	var data=$("#confirm_password").val();
    	if(!data || data.trim().length==0){
    		alert("비밀번호 확인는 반드시 입력해야합니다.");
    		$("#confirm_password").val("");
    		$("#confirm_password").focus();
    		return false;
    	}
    	
    	if($("#u_pw").val() != $("#confirm_password").val()){
    		alert("비밀번호가 일치하지 않습니다.");
    		$("#u_pw").val("");
    		$("#confirm_password").val("");
    		$("#u_pw").focus();
    		return false;
    	}
    	
    	var data=$("#u_birth").val();
    	if(!data || data.trim().length==0){
    		alert("생일을 반드시 입력해야합니다.");
    		$("#u_birth").val("");
    		$("#u_birth").focus();
    		return false;
    	}
    	
    	var data=$("#u_phone").val();
    	if(!data || data.trim().length==0){
    		alert("전화번호를 반드시 입력해야합니다.");
    		$("#u_phone").val("");
    		$("#u_phone").focus();
    		return false;
    	}
    	
    	if(!checkPhone(data)){
    		alert("전화번호 형식은 000-0000-0000입니다.");
    		$("#u_phone").val("");
    		$("#u_phone").focus();
    		return false;
    	}
    	
    	var data=$("#u_zipcode").val();
    	if(!data || data.trim().length==0){
    		alert("우편번호를 반드시 입력해야합니다.");
    		$("#u_zipcode").val("");
    		$("#u_zipcode").focus();
    		return false;
    	}
    	
    	var data=$("#u_addr2").val();
    	if(!data || data.trim().length==0){
    		alert("상세주소를 반드시 입력해야합니다.");
    		$("#u_addr2").val("");
    		$("#u_addr2").focus();
    		return false;
    	}
    	return true;
    }
	function idCheck(){
		var value = $("#u_id").val();
		if(value.length>5){
			$.ajax('idCheck',{
				type:'GET',
				data:{'u_id': value},
				dataType:'json',
				error : function(){
					alert('실패!!!');
				},
				success:function(data){
					if(data==1)
						$("#idCheck").css('color','red').html("사용 불가능한 아이디입니다.");
					else 
						$("#idCheck").css('color','green').html("사용 가능한 아이디입니다.");
				}
			});
		}else{
			$("#idCheck").html("");
		}
	}
    
    function checkEmail(email){
    	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		return re.test(email);
    }
    function checkPhone(phone){
		var re = /^\d{2,3}-\d{3,4}-\d{4}$/;
		return re.test(phone);
    }
    
    </script>     
</head>
<body>
<div class="signup-form">
    <form method="post" action="${pageContext.request.contextPath }/joinOk" onsubmit="return fromCheck();">
		<h2>회원가입</h2>
		<p>With Animal 가입을 환영합니다.</p>
		<hr>
        <div class="form-group">
        	<input type="text" class="form-control" name="u_name" id="u_name" placeholder="이름을 입력해주세요." required="required">
        </div>
        <div><span id="idCheck"></span></div>
        <div class="form-group">
        	<input type="email" class="form-control" name="u_id" id="u_id" placeholder="Email을 입력해주세요." required="required" onkeyup="idCheck();">
        	<span id="idCheck"></span> 
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="u_pw" id="u_pw" placeholder="비밀번호를 입력해주세요." required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="confirm_password" id="confirm_password" placeholder="비밀번호를 한번더 입력해주세요." required="required">
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="u_birth" id="u_birth" placeholder="생년월일를 입력해주세요." required="required">
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="u_phone" id="u_phone" placeholder="전화번호를 입력해주세요." required="required">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="u_zipcode" id="u_zipcode" placeholder="우편번호를 입력해주세요." required="required" readonly="readonly" onclick="execDaumPostcode();">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="u_addr1"  id="u_addr1" placeholder="주소를 입력해주세요." required="required" readonly="readonly">
        </div>
		<div class="form-group">
            <input type="text" class="form-control" name="u_addr2" id="u_addr2" placeholder="상세주소를 입력해주세요." required="required">
        </div>        
		<p class="small text-center" style="margin-top: 40px">※ 가입 전 가입정보를 한번더 확인하시고 가입해주세요.<br></p>
		<div class="p-t-30" style="margin-top: 15px">
            <button type="button" class="btn btn-primary btn--green btn-lg" onclick="location.href='login'">취    소</button>
            <button type="submit" class="btn btn-primary btn--green btn-lg" style="margin-left: 8px">회원가입</button>
        </div>
    </form>
</div>
</body>
</html>      
                