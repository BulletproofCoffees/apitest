
<script type="text/javascript">

function chageLangSelect() {
	
	 var texts = $("textarea[name='textarea']").val(); 	
	 
	 var sources = "ko";
	 
	 var targets = $("select[name='seoul_gu']").val();; 
	
	 
	 $(".search").empty();
	
		$.get("../../translationaip",
							{
			text : texts,
			source : sources,
			target : targets,							
							},
							function(data) {
								var obj = data;
								console.log(obj);							
								for ( var i in obj.message) {}									
								$(".search").append(obj.message[i].translatedText);
		});
}	
</script>

<div class="container"style="
    width: 580px;
" >
<div class="row ">

	<textarea class=" form-control" name="textarea"
		style="width: 226px; height: 114px;">번역</textarea>




<select name="seoul_gu" onchange="chageLangSelect()" style="
    height: 30px;   
    margin: 20px;
     margin-top: 35px;
" >
	<option>선택</option>
	<option value="en">영어</option>
	<option value="ja">일본어</option>

</select>




		<textarea class=" search" name="textarea"
			style="width: 226px; height: 114px;"></textarea>
	

</div>
</div>
