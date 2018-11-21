<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <script src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3-min.js"></script> <!-- 네이버 스크립트 -->
  
</head>
<body>
<h1>NAVER LOGIN POP</h1>
 <!-- 로그인 안한 경우 -->
 <div id="naver_id_login" style="display: none;"></div>
 <!-- 로그인 한 경우 -->
 <div id="naver_id_logout" style="display: none;">
  <ul></ul>
  <a href="javascript:window.close();">창닫기</a>
 </div>
 <script type="text/javascript">
  // 네이버로그인 초기화 스크립트
  var naver_id_login = new naver_id_login("TfHlys8UXtXWSe2Ru7Wb",
    "http://localhost:8080/web/bootstrap02/pops/naverlogin_pop.jsp");
  var state = naver_id_login.getUniqState();
  naver_id_login.setButton("white", 2, 40);
  naver_id_login.setDomain("localhost:8080");
  naver_id_login.setState(state);
  naver_id_login.setPopup();
  naver_id_login.init_naver_id_login();

  // 콜백 페이지 처리 스크립트
  function naverSignIncallback() {
   //  로그인 처리
   $("#naver_id_logout").show();
   $(opener.document).find("#naver_id_login").hide();
   $(opener.document).find("#naver_id_logout").show();

   // 네이버 사용자 프로필 조회
   var ul = $("#naver_id_logout ul");
   ul.empty();
   ul.append("<li>닉네임 : " + naver_id_login.getProfileData('nickname') + "</li>" + "<li>연령대 : " + naver_id_login.getProfileData('age') + "</li>");
  }
  
  // 네이버 사용자 프로필 조회 설정
  naver_id_login.get_naver_userprofile("naverSignIncallback()");
  
 </script>
</body>
</html>