<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html> 

<head> 

<title>구글지도</title> 


  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script>



 <script> 

  function initialize() { 

  var myLatlng = new google.maps.LatLng(37.525481, 126.889117); // y, x좌표값

  var mapOptions = { 

        zoom: 15, 

        center: myLatlng, 

        mapTypeId: google.maps.MapTypeId.ROADMAP 

  } 

 
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);

  var marker = new google.maps.Marker({ 

            position: myLatlng, 

            map: map, 

            title: "회사이름" 

  }); 

  var infowindow = new google.maps.InfoWindow( 

          { 

            content: "<h1>회사이름</h1>", 

            maxWidth: 300 

          } 

  ); 



  google.maps.event.addListener(marker, 'click', function() { 

  infowindow.open(map, marker); 

  }); 

  } 

 </script> 



</head> 



<body onload="initialize()"> 


지도를 출력할 영역에 아래 소스 삽입!
<div class="row">
<div class="col-sm-4">
<div id="map_canvas" style="width:width: 100%;
      height: 400px;
      -webkit-filter: grayscale(100%);
      filter: grayscale(100%);"></div> 

</div>
</div>
</body> 

</html> 


