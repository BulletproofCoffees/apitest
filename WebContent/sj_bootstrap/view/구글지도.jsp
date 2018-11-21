

  

<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=ko"></script>
 <script> 
  $(function () { 
  var myLatlng = new google.maps.LatLng(51.503056, 0.003141); // y, x좌표값
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
            content: "<h5>O2 arena</h5>", 
            maxWidth: 300 
          } 
  ); 
  google.maps.event.addListener(marker, 'click', function() { 
  infowindow.open(map, marker); 
  }); 
  } );

 </script> 



</head> 







 <!-- 구글맵 api 키 유료..... 
 검색기능 못만듬 ..... -->
<style>

.img-thumbnail>img{padding: 10px; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.5), 0 1px 2px rgba(0, 0, 0, 0.25);}

</style>

<div class="row">
<div class="col-sm-4 img-thumbnail">
<h5>O2 arena</h5>
<p>주소 : Peninsula Square, London SE10 0DX 영국</p>
<img  style="width: 350px;" src="http://mblogthumb3.phinf.naver.net/MjAxNzEwMTBfMTI1/MDAxNTA3NjQ3NTUxNzUx.Axr4FljaagYt3EcxMPG4jSRqkMugCKkUqNGbvhaR3TEg.AUvYe2es95w_FWtBlwToNvzE1JJKcPEYbeZt8UjO-oQg.JPEG.kikibum86/maxresdefault.jpg?type=w800">
<img src="http://3.bp.blogspot.com/_dP1-J5FboIU/SwFm0hIdCHI/AAAAAAAAJ-s/annpsFBVLts/s400/the-o2-arena_000427_1_MainPicture.jpg" style="width: 150px;">
<img src="http://www.segye.com/content/image/2013/03/28/20130328003754_0.jpg" style="width: 150px;">
</div> 
<div class="col-sm-8">
<div id="map_canvas" style="width:width: 100%;
      height: 400px;
      -webkit-filter: grayscale(100%);
      filter: grayscale(100%);"></div> 

</div>
</div>
	





<!-- 출처: http://webagit.tistory.com/92 [Webagit] -->