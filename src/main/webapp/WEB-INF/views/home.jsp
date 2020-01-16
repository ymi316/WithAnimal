<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>동물보호사이트</title>

  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="${pageContext.request.contextPath }/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Oleo+Script+Swash+Caps&display=swap" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/resources/css/agency.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="${pageContext.request.contextPath }/">With Animal</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav text-uppercase ml-auto">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/">HOME</a>
          </li>
          <li class="nav-item">
            <c:if test="${empty sessionScope.vo }">
              <a class="nav-link js-scroll-trigger"onclick="location.href='/member/login'">로그인</a>
            </c:if>
            <c:if test="${not empty sessionScope.vo }">
              <a class="nav-link js-scroll-trigger"onclick="location.href='/member/logout'">로그아웃</a>
            </c:if>
          </li>
          <c:if test="${empty sessionScope.vo }">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/join">회원가입</a>
          </li>
          </c:if>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/board/protectList">보호동물 공고</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="${pageContext.request.contextPath }/board/boardList">반려동물 분실등록</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Header -->
  <header class="homehead">
    <div class="container">
      <div class="intro-text">
        <div class="intro-lead-in">2020년에도 사랑과 관심은 계속됩니다</div>
        <div class="intro-heading text-uppercase">소중한 생명, 당신이 필요합니다</div>
      </div>
    </div>
  </header>

  <!-- Portfolio Grid -->
  <section class="bg-light page-section" id="portfolio">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase">보호중인 동물들</h2>
          <h3 class="section-subheading text-muted">구조된 동물의 가족이 되어주세요.</h3>
        </div>
      </div>
      <div class="row">
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/portfolio/01-thumbnail.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>까미</h4>
            <p class="text-muted">프렌치불독</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/portfolio/02-thumbnail.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>봄이</h4>
            <p class="text-muted">블랙 리트리버</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#portfolioModal3">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/portfolio/03-thumbnail.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>웅이</h4>
            <p class="text-muted">닥스훈트</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#portfolioModal4">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/portfolio/04-thumbnail.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>아깽</h4>
            <p class="text-muted">러시안블루</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#portfolioModal5">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/portfolio/05-thumbnail.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>동그리</h4>
            <p class="text-muted">브리티쉬숏헤어</p>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 portfolio-item">
          <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
            <div class="portfolio-hover">
              <div class="portfolio-hover-content">
                <i class="fas fa-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" src="${pageContext.request.contextPath}/resources/images/portfolio/06-thumbnail.jpg" alt="">
          </a>
          <div class="portfolio-caption">
            <h4>모라</h4>
            <p class="text-muted">아비시니안</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="footer">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-4">
          <span class="copyright">Copyright &copy; With Animal 2020</span>
        </div>
        <div class="col-md-4">
          <ul class="list-inline social-buttons">
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-twitter"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-facebook-f"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-4">
          <ul class="list-inline quicklinks">
            <li class="list-inline-item">
              <a href="http://act.animals.or.kr/cagefree/" target="_blank">케이지 프리 코리아</a>
            </li>
            <li class="list-inline-item">
              <a href="http://www.animal.go.kr/portal_rnl/index.jsp" target="_blank">동물보호관리시스템</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  <!-- Portfolio Modals -->

  <!-- Modal 1 -->
  <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <div class="modal-body">
                <!-- Project Details Go Here -->
                <h2 class="text-uppercase">까미</h2>
                <p class="item-intro text-muted">귀염둥이 "까미"의 새로운 식구를 찾습니다.</p>
                <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resources/images/portfolio/01-cami.jpg" alt="">
                <p>애교 많고 목욕을 너~무 좋아하는 "까미"</p>
				<p>사람을 졸졸 따라다니는 모습이 너무 귀여워요~</p>
                <ul class="list-inline">
                  <li>품종 : 프렌치불독</li>
                  <li>이름 : 까미(4살)</li>
                  <li>성별 : 남아</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 2 -->
  <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
       <div class="container">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <div class="modal-body">
                <!-- Project Details Go Here -->
                <h2 class="text-uppercase">봄이</h2>
                <p class="item-intro text-muted">천사견 "봄이"의 새로운 식구를 찾습니다.</p>
                <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resources/images/portfolio/02-bomi.jpg" alt="">
                <p>웃는 모습이 너무 예쁜 "봄이"</p>
				<p>친구들과 잘 어울리고 사람을 너무 좋아하는 아이에요~</p>
                <ul class="list-inline">
                  <li>품종 : 블랙 리트리버</li>
                  <li>이름 : 봄이(2살)</li>
                  <li>성별 : 여아</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 3 -->
  <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <div class="modal-body">
                <!-- Project Details Go Here -->
                <h2 class="text-uppercase">웅이</h2>
                <p class="item-intro text-muted">순둥이 "웅이"의 새로운 식구를 찾습니다.</p>
                <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resources/images/portfolio/03-ungi.jpg" alt="">
                <p>얌전하고 순둥이 "웅이"</p>
				<p>친구들과 잘 어울리고 배변훈련도 완변하게 되어있어요~</p>
                <ul class="list-inline">
                  <li>품종 : 닥스훈트</li>
                  <li>이름 : 웅이(1살)</li>
                  <li>성별 : 남아</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 4 -->
  <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <div class="modal-body">
                <!-- Project Details Go Here -->
                <h2 class="text-uppercase">아깽</h2>
                <p class="item-intro text-muted">초롱초롱 눈망울이 매력인 "아깽"의 새로운 식구를 찾습니다.</p>
                <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resources/images/portfolio/04-akkaeng.jpg" alt="">
                <p>놀기 좋아하고 장난치는걸 좋아하는 "아깽"</p>
				<p>러시안블루의 특징인 블루빛 모색과 초롱초롱한 눈망울이 매력적인 아이에요~</p>
                <ul class="list-inline">
                  <li>품종 : 러시안블루</li>
                  <li>이름 : 아깽(2살)</li>
                  <li>성별 : 남아</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 5 -->
  <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <div class="modal-body">
                <!-- Project Details Go Here -->
                <h2 class="text-uppercase">동그리</h2>
                <p class="item-intro text-muted">순둥이 "동그리"의 새로운 식구를 찾습니다.</p>
                <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resources/images/portfolio/05-donggri.jpg" alt="">
                <p>동글동글한 매력인 "동그리"</p>
				<p>눈도, 얼굴도 동글한 매력과 사랑스러움까지 더한 아이에요~</p>
                <ul class="list-inline">
                  <li>품종 : 브리티쉬숏헤어</li>
                  <li>이름 : 동그리(1살)</li>
                  <li>성별 : 남아</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal 6 -->
  <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="close-modal" data-dismiss="modal">
          <div class="lr">
            <div class="rl"></div>
          </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-lg-8 mx-auto">
              <div class="modal-body">
                <!-- Project Details Go Here -->
                <h2 class="text-uppercase">모라</h2>
                <p class="item-intro text-muted">예쁨을 자랑하는 "모라"의 새로운 식구를 찾습니다.</p>
                <img class="img-fluid d-block mx-auto" src="${pageContext.request.contextPath}/resources/images/portfolio/06-mara.jpg" alt="">
                <p>함께 어울리는 것을 좋아하는 "모라"</p>
				<p>사회성이 뛰어나서 어울리는것을 좋아하는 귀엽고 예쁜 아이에요~</p>
                <ul class="list-inline">
                  <li>품종 : 아비시니안</li>
                  <li>이름 : 모라(1살)</li>
                  <li>성별 : 여아</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Contact form JavaScript -->
  <script src="${pageContext.request.contextPath }/resources/js/jqBootstrapValidation.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/contact_me.js"></script>

  <!-- Custom scripts for this template -->
  <script src="${pageContext.request.contextPath }/resources/js/agency.min.js"></script>

</body>

</html>
