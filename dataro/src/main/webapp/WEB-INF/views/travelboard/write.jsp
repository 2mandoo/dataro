<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/ro/resources/css/reset.css"/>
<link rel="stylesheet" href="/ro/resources/css/style.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <div id="wrap">
        <div class="content tv_write">
            <form action="insert.do" name="AH" id="save" method="post" enctype="multipart/form-data">
                <!--제목-->
                <div class="title">
                	<div class="title_top">
	                    <span class="user">
	                        <div class="user_img"><img src="/ro/img/${loginInfo.m_filename_server}"></div>
	                        <p>${loginInfo.nickname }</p>
	                    </span>
	                    <input type="text" name="title" id="title" class="title_text" value="string">
	                    <input type="hidden" name="board_name" id="title" class="title_text" value="여행게시판">
                    </div>
                    <div class="hash">
	                    	<label><input type="checkbox" id="hash1" name="hashtag_no" value="1">#자전거 코스</label>
	                    	<label><input type="checkbox" id="hash2" name="hashtag_no" value="2">#드라이브 코스</label>
	                    	<label><input type="checkbox" id="hash3" name="hashtag_no" value="3">#뚜벅이 코스</label>
	                    	<label><input type="checkbox" id="hash4" name="hashtag_no" value="4">#가족과함께</label>
	                    	<label><input type="checkbox" id="hash5" name="hashtag_no" value="5">#연인과함께</label>
	                    	<label><input type="checkbox" id="hash6" name="hashtag_no" value="6">#친구과함께</label>
	                    	<label><input type="checkbox" id="hash7" name="hashtag_no" value="7">#자연</label>
	                    	<label><input type="checkbox" id="hash8" name="hashtag_no" value="8">#반려동물</label>
	                    	<label><input type="checkbox" id="hash9" name="hashtag_no" value="9">#레포츠</label>
	                    	<label><input type="checkbox" id="hash10" name="hashtag_no" value="10">#1박2일</label>
	                    	<label><input type="checkbox" id="hash11" name="hashtag_no" value="11">#당일치기</label>
	                    	<label><input type="checkbox" id="hash12" name="hashtag_no" value="12">#축제</label>
	                    	<label><input type="checkbox" id="hash13" name="hashtag_no" value="13">#식도락</label>
	                    	<label><input type="checkbox" id="hash14" name="hashtag_no" value="14">#역사</label>
                    </div>
                </div>
                <!--//제목-->
          
                <!--지도,글쓰기-->
					<div class="map_wrap">
					    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
					    <div id="menu_wrap" class="bg_white" style="display:;">
					        <div class="option">
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>
					</div>
                    <!-- //지도 -->
                    <div class="seracLocation">
                      	<div>
			                 <input type="text" value="종각역" id="keyword" size="15"> 
			                 <a onclick="jacascript:searchPlaces()"><i class="fa-solid fa-magnifying-glass"></i></a>
			            </div>
                     </div>
                    <div class="write_detail">
                    	<div class="scroll"></div>
                    </div>
                 <!--//지도,글쓰기-->
				 <a href="javascript:displayCouses(courseArr);">마커표시</a>
                 <a href="javascript:goSave()">등록</a>
            </form>
        </div>
    </div>
<script type='text/javascript' src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script type='text/javascript' src="https://cdn.rawgit.com/abdmob/x2js/master/xml2json.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b93e1f37ba26daefa16850e15e3b7c31&libraries=services"></script>
<script type='text/javascript' src="/ro/js/map.js"></script> 
<script>
	function goSave(){
		send(courseArr);
		AH.submit();
	};

	var i = 1;
	var pic =1;

	$(function(){

	})			
	
	//체크박스on
	$(".hash label").click(function(){
		if($(this).find("input[type='checkbox']").is(':checked')){
			$(this).toggleClass("on")
		}
	})
	

	function writebox(index,places){
		
		var html ='<div class="set">'
			html +='<span class="jk"></span>'
			html +='<div class="map_list">'
			html += '<span class="markerbg marker_' + (index+1) + '"></span>'
					+'<span class="info">'+'<h5>' + places.place_name + '</h5>'+'</span>';
				    if (places.road_address_name) {
				    	html += '    <span>' + places.road_address_name + '</span>' +
				                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
				    } else {
				    	html += '    <span>' +  places.address_name  + '</span>'; 
				    }
   			html += '  <span class="tel">' + places.phone  + '</span>'     
			html +="</div>"
	        html +='    <textarea placeholder="내용 입력" name="contents"></textarea>'
	        html +='    <div class="pic_wrap">'
	        html +='        <div class="pic">'
            html +='           <input type="file" class="file_input'+ pic +'" name="filename" id="'+pic+'" onchange="readInputFile(this)">'
            pic++;
	        html +='       	<img src="/ro/img/no-image.jpg">'
	        html +='       	<span class="delete"><i class="fa-solid fa-circle-minus"></i></span>'
	        html +='     	</div>'
	        html +='   	 	<div class="pic">'
            html +='           <input type="file" class="file_input'+ pic +'" name="filename" id="'+pic+'" onchange="readInputFile(this)">'
            html +='       		<img src="/ro/img/no-image.jpg">'
	        html +='        	<span class="delete"><i class="fa-solid fa-circle-minus"></i></span>'
	        html +='      	</div>'
	        html +='    </div>'
		    html +='    <span class="course_delete">코스삭제</span>'
	        html +='</div>'
	        pic++;
			i++;
			$('.scroll').append(html);
			
	}

	//사진미리보기
	function readInputFile(input){
			var className = input.className;
			if(input.files && input.files[0]){
				var reader = new FileReader();
				reader.onload = function(e){
				    $('.'+className+'').next('img').attr("src", e.target.result);
				}
				   reader.readAsDataURL(input.files[0]);
			};
	};
	
	//사진삭제
	$(".pic .delete").click(function(){
		alert();
		$(this).prev('img').attr("src","/ro/img/no-image.jpg");
		$(this).siblings('input').val("");
	});

	// 글쓰기+사진+코스 삭제
	$(document).on("click",".course_delete",function(){
		var idx = $(this).parent("div").index()
        if(confirm('코스 삭제?')) {
      		$(this).parent("div").remove();
            courseIdx=0;
            courseArr.splice(idx,1);
        }
	})
</script>

</body>
</html>