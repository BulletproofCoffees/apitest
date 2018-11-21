<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en"><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



  <title>Bootstrap 4 Website Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="/web_dh/project_dh/css/global.css">
  <style>
  .fakeimg {
      height: 200px;
      background: #aaa;
  }
  </style>


<!-- TOP -->
<div class="jumbotron text-center" style="margin-bottom:0">
  <h1>Dohyung Web</h1>
  <p>네이버 : 뉴스, 블로그, 지식인, 파파고 / 다음 : 카페글, 지도 / 공공DB 中 1개 / 기타 1개 예정 </p> 
</div>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="/web_dh/project_dh/view/index.jsp">HOME</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/web_dh/project_dh/view/search_naver.jsp">N통합검색(뉴스,블로그,지식인)</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/web_dh/project_dh/view/map_daum.jsp">다음지도</a>
      </li> 
      <li class="nav-item">
        <a class="nav-link" href="/web_dh/project_dh/view/papago.jsp">파파고</a>
      </li> 
      <li class="nav-item">
        <a class="nav-link" href="/web_dh/project_dh/view/youtube.jsp">유튜브</a>
      </li>  
    </ul>
  </div>  
</nav>



    <meta charset="utf-8">
    <title>키워드로 장소검색하고 목록으로 표출하기</title>
    <style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>


<div class="map_wrap">
    <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden; background: url(&quot;http://i1.daumcdn.net/dmaps/apis/loading_n.png&quot;);"><div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none; cursor: url(&quot;http://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;) 7 5, url(&quot;http://i1.daumcdn.net/dmaps/apis/cursor/openhand.cur.ico&quot;), default;"><div style="position: absolute; left: 448px; top: -971px;"><div style="position: absolute; z-index: 0;"></div><div style="position: absolute; z-index: 1; left: 0px; top: 0px;"><img src="http://map0.daumcdn.net/map_2d/1808qgh/L5/495/220.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -468px; top: 1441px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map1.daumcdn.net/map_2d/1808qgh/L5/495/221.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -212px; top: 1441px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d/1808qgh/L5/495/222.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 44px; top: 1441px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/1808qgh/L5/495/223.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 300px; top: 1441px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/1808qgh/L5/495/224.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 556px; top: 1441px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map1.daumcdn.net/map_2d/1808qgh/L5/495/225.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 812px; top: 1441px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d/1808qgh/L5/495/226.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1068px; top: 1441px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/1808qgh/L5/495/227.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1324px; top: 1441px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/1808qgh/L5/495/228.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1580px; top: 1441px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/1808qgh/L5/496/220.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -468px; top: 1185px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map1.daumcdn.net/map_2d/1808qgh/L5/496/221.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -212px; top: 1185px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d/1808qgh/L5/496/222.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 44px; top: 1185px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/1808qgh/L5/496/223.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 300px; top: 1185px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/1808qgh/L5/496/224.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 556px; top: 1185px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map1.daumcdn.net/map_2d/1808qgh/L5/496/225.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 812px; top: 1185px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d/1808qgh/L5/496/226.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1068px; top: 1185px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/1808qgh/L5/496/227.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1324px; top: 1185px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/1808qgh/L5/496/228.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1580px; top: 1185px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/1808qgh/L5/497/220.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -468px; top: 929px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map1.daumcdn.net/map_2d/1808qgh/L5/497/221.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: -212px; top: 929px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d/1808qgh/L5/497/222.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 44px; top: 929px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/1808qgh/L5/497/223.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 300px; top: 929px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/1808qgh/L5/497/224.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 556px; top: 929px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map1.daumcdn.net/map_2d/1808qgh/L5/497/225.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 812px; top: 929px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map2.daumcdn.net/map_2d/1808qgh/L5/497/226.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1068px; top: 929px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map3.daumcdn.net/map_2d/1808qgh/L5/497/227.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1324px; top: 929px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"><img src="http://map0.daumcdn.net/map_2d/1808qgh/L5/497/228.png" alt="" draggable="false" style="position: absolute; user-select: none; -webkit-user-drag: none; min-width: 0px; min-height: 0px; max-width: none; max-height: none; left: 1580px; top: 929px; opacity: 1; transition-property: opacity; transition-duration: 0.2s; transition-timing-function: ease; width: 256px; height: 256px;"></div><div style="position: absolute; z-index: 1;"></div><div style="position: absolute; z-index: 1; width: 1520px; height: 500px;"></div><div style="position: absolute; z-index: 1;"><svg version="1.1" style="stroke: none; stroke-dashoffset: 0.5; stroke-linejoin: round; fill: none; transform: translateZ(0px); position: absolute; left: -3488px; top: -29px; width: 7600px; height: 2500px;" viewBox="0 0 7600 2500"><defs></defs></svg></div><div style="position: absolute; z-index: 1; width: 100%; height: 0px;"><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 494px; top: 1331px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(10px, 36px, 47px, 0px); top: -10px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:1" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:1" name="daum.maps.Marker.Area:1"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 507px; top: 1152px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(56px, 36px, 93px, 0px); top: -56px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:2" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:2" name="daum.maps.Marker.Area:2"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 451px; top: 1337px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(102px, 36px, 139px, 0px); top: -102px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:3" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:3" name="daum.maps.Marker.Area:3"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 478px; top: 1349px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(148px, 36px, 185px, 0px); top: -148px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:4" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:4" name="daum.maps.Marker.Area:4"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 495px; top: 1092px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(194px, 36px, 231px, 0px); top: -194px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:5" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:5" name="daum.maps.Marker.Area:5"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 599px; top: 1316px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(240px, 36px, 277px, 0px); top: -240px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:6" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:6" name="daum.maps.Marker.Area:6"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 459px; top: 1291px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(286px, 36px, 323px, 0px); top: -286px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:7" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:7" name="daum.maps.Marker.Area:7"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 592px; top: 1316px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(332px, 36px, 369px, 0px); top: -332px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:8" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:8" name="daum.maps.Marker.Area:8"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 517px; top: 1108px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(378px, 36px, 415px, 0px); top: -378px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:9" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:9" name="daum.maps.Marker.Area:9"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 538px; top: 1179px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(424px, 36px, 461px, 0px); top: -424px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:a" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:a" name="daum.maps.Marker.Area:a"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 435px; top: 1197px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(470px, 36px, 507px, 0px); top: -470px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:b" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:b" name="daum.maps.Marker.Area:b"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 557px; top: 1320px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(516px, 36px, 553px, 0px); top: -516px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:c" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:c" name="daum.maps.Marker.Area:c"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 504px; top: 1336px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(562px, 36px, 599px, 0px); top: -562px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:d" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:d" name="daum.maps.Marker.Area:d"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 426px; top: 1255px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(608px, 36px, 645px, 0px); top: -608px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:e" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:e" name="daum.maps.Marker.Area:e"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div><div style="position: absolute; margin: -37px 0px 0px -13px; z-index: 0; left: 544px; top: 1319px; display: block;"><img draggable="false" src="http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png" alt="" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; clip: rect(654px, 36px, 691px, 0px); top: -654px; left: 0px; width: 36px; height: 691px;"><img src="http://i1.daumcdn.net/dmaps/apis/transparent.gif" alt="" draggable="false" usemap="#daum.maps.Marker.Area:f" style="min-width: 0px; min-height: 0px; max-width: 99999px; max-height: none; border: 0px; display: block; position: absolute; user-select: none; -webkit-user-drag: none; width: 36px; height: 37px;"><map id="daum.maps.Marker.Area:f" name="daum.maps.Marker.Area:f"><area href="javascript:void(0)" alt="" shape="rect" coords="0,0,36,37" title="" style="-webkit-tap-highlight-color: transparent;"></map></div></div></div></div><div style="position: absolute; cursor: default; z-index: 1; white-space: nowrap; font: 11px tahoma, sans-serif; color: rgb(85, 85, 85); left: 7px; bottom: 5px;"><a target="_blank" href="http://map.daum.net/" title="Daum 지도로 보시려면 클릭하세요." style="float: left; width: 38px; height: 17px; cursor: pointer;"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapjsapi/m_bi.png" alt="Daum 지도로 이동" style="width: 37px; height: 18px; border: none;"></a><div style="color: rgb(0, 0, 0); text-align: center; font-size: 10px; margin: 0px 2px; float: left; width: 64px;"><div style="color: rgb(0, 0, 0);">250m</div><div style="position: relative; overflow: hidden; height: 8px; margin-top: -4px;"><img src="http://t1.daumcdn.net/localimg/localimages/07/mapjsapi/scalebar.png" alt="" style="position: absolute; width: 164px; height: 40px; max-width: none; top: -20px; left: -82px;"></div></div><div style="font: 11px tahoma, sans-serif; float: left; margin: 3px 2px 0px;">© Kakao<span></span></div></div><div style="cursor: auto; position: absolute; z-index: 2; left: 0px; top: 0px;"></div></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"><li class="item"><span class="markerbg marker_1"></span><div class="info">   <h5>바토스 이태원점</h5>    <span>서울 용산구 이태원로15길 1</span>   <span class="jibun gray">서울 용산구 이태원동 181-8</span>  <span class="tel">02-797-8226</span></div></li><li class="item"><span class="markerbg marker_2"></span><div class="info">   <h5>메시야</h5>    <span>서울 용산구 회나무로13가길 23</span>   <span class="jibun gray">서울 용산구 이태원동 260-141</span>  <span class="tel">02-6402-0208</span></div></li><li class="item"><span class="markerbg marker_3"></span><div class="info">   <h5>지노스뉴욕피자</h5>    <span>서울 용산구 녹사평대로40길 46</span>   <span class="jibun gray">서울 용산구 이태원동 457-3</span>  <span class="tel">02-792-2234</span></div></li><li class="item"><span class="markerbg marker_4"></span><div class="info">   <h5>모터시티</h5>    <span>서울 용산구 이태원로 140-1</span>   <span class="jibun gray">서울 용산구 이태원동 56-30</span>  <span class="tel">02-794-8877</span></div></li><li class="item"><span class="markerbg marker_5"></span><div class="info">   <h5>레호이</h5>    <span>서울 용산구 소월로38가길 5</span>   <span class="jibun gray">서울 용산구 이태원동 261-9</span>  <span class="tel">070-4242-0426</span></div></li><li class="item"><span class="markerbg marker_6"></span><div class="info">   <h5>오레노 이태원점</h5>    <span>서울 용산구 이태원로27가길 8</span>   <span class="jibun gray">서울 용산구 이태원동 112-2</span>  <span class="tel">02-794-0055</span></div></li><li class="item"><span class="markerbg marker_7"></span><div class="info">   <h5>씨스루</h5>    <span>서울 용산구 녹사평대로40나길 37</span>   <span class="jibun gray">서울 용산구 이태원동 403-3</span>  <span class="tel">070-7796-8991</span></div></li><li class="item"><span class="markerbg marker_8"></span><div class="info">   <h5>올댓재즈</h5>    <span>서울 용산구 이태원로27가길 12</span>   <span class="jibun gray">서울 용산구 이태원동 112-4</span>  <span class="tel">02-795-5701</span></div></li><li class="item"><span class="markerbg marker_9"></span><div class="info">   <h5>썬댄스플레이스</h5>    <span>서울 용산구 소월로 268</span>   <span class="jibun gray">서울 용산구 이태원동 260-18</span>  <span class="tel">02-790-2292</span></div></li><li class="item"><span class="markerbg marker_10"></span><div class="info">   <h5>비스테까 이태원본점</h5>    <span>서울 용산구 회나무로 49</span>   <span class="jibun gray">서울 용산구 이태원동 211-33</span>  <span class="tel">02-792-7775</span></div></li><li class="item"><span class="markerbg marker_11"></span><div class="info">   <h5>더베이커스테이블</h5>    <span>서울 용산구 녹사평대로 244-1</span>   <span class="jibun gray">서울 용산구 이태원동 691</span>  <span class="tel">070-7717-3501</span></div></li><li class="item"><span class="markerbg marker_12"></span><div class="info">   <h5>마이첼시</h5>    <span>서울 용산구 이태원로27가길 40</span>   <span class="jibun gray">서울 용산구 이태원동 116-7</span>  <span class="tel">02-749-1373</span></div></li><li class="item"><span class="markerbg marker_13"></span><div class="info">   <h5>왕타이</h5>    <span>서울 용산구 이태원로 151</span>   <span class="jibun gray">서울 용산구 이태원1동 176-2</span>  <span class="tel">02-749-2746</span></div></li><li class="item"><span class="markerbg marker_14"></span><div class="info">   <h5>마음과마음</h5>    <span>서울 용산구 녹사평대로 222</span>   <span class="jibun gray">서울 용산구 이태원동 557</span>  <span class="tel">02-790-5284</span></div></li><li class="item"><span class="markerbg marker_15"></span><div class="info">   <h5>젤렌 이태원점</h5>    <span>서울 용산구 이태원로27가길 52</span>   <span class="jibun gray">서울 용산구 이태원1동 116-14</span>  <span class="tel">02-749-0600</span></div></li></ul>
        <div id="pagination"><a href="#" class="on">1</a><a href="#">2</a><a href="#">3</a></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f731cf48a3c7f3a2064b432fb405102&amp;libraries=services"></script><script charset="UTF-8" src="http://t1.daumcdn.net/mapjsapi/js/main/4.0.7/kakao.js"></script><script charset="UTF-8" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapi/libs/1.0.1/1515130215283/services.js"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new daum.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            daum.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            daum.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
</script>


<div class="jumbotron text-center" style="margin-bottom:0">
  <p>Footer</p>
</div>





</body></html>