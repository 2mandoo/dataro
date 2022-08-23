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
<link rel="shortcut icon" href="#"> <!-- favicon.ico 에러나서 넣어줌 -->
</head>
<body>
    <div id="wrap">
        <div class="content tv_write">
            <form action="insert.do" name="AH" id="save" method="post" enctype="multipart/form-data">
            <input type="hidden" name="member_no" value=${loginInfo.member_no }>
                <!--제목-->
                <div class="title">
                	<div class="title_top">
	                    <span class="user">
	                        <div class="user_img"><img src="/ro/img/${loginInfo.m_filename_server}"></div>
	                        <p>${loginInfo.nickname }</p>
	                    </span>
	                    <input type="text" name="title" id="title" class="title_text" value="코스 타이틀">
	                    <input type="hidden" name="board_name" id="title" class="title_text" value="여행게시판">
	                    <div class="hash">
	                      	<h3>여행테마</h3>
	                   		<c:forEach var="hash" items="${category.hash}">
	                   			<label><input type="checkbox" id="hash${hash.hashtag_no }" name="hashtag_no" value="${hash.hashtag_no}">#${hash.hashtag_name}</label>
	                   		</c:forEach>
	                    </div>
                    </div>
                    <div class="region">
                    	<input type="hidden" name="region_name" value="">
                    	<select name="region" id="region">
                    		<option value="0" selected>지역</option>
                    		<c:forEach var="region" items="${category.region}">
                    			<option value="${region.region_name}" >${region.region_name }</option>
                    		</c:forEach>
                    	</select>
                    	<div class="region_detail">
                    
                    	</div>
                    </div>
                </div>
                <!--지도,글쓰기-->
				<div class="map_wrap">
					
					<!-- 지도 나오는 곳 -->
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    
				    <!-- 검색 목록 -->
				    <div id="menu_wrap" class="bg_white" style="display:;">
				        <div class="option">
				        </div>
				        <hr>
				        <ul id="placesList"></ul>
				        <div id="pagination"></div>
				    </div>
				    
				</div>
				
				<!-- 지도 검색 엔터도 가능-->
				<div class="seracLocation">
					<div>
						<input type="text" value="종각역 맛집" id="keyword" onkeyup="enterkey()" size="15"> 
						<a onclick="jacascript:searchPlaces()"><i class="fa-solid fa-magnifying-glass"></i></a>
					</div>
				</div>
				
				<!-- 코스 설명 들어갈 부분 -->      
				<div class="write_detail">
					<div class="scroll"></div>
				</div>
                <!--//지도,글쓰기-->
				<a href="javascript:displayCouses(courseArr);">[마커표시]</a>&nbsp;&nbsp;
                <a href="javascript:goSave()">[등록]</a>
            </form>
        </div>
    </div>

<!-- 사용하다가 에러 안나면 지우자 
<script type='text/javascript' src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script type='text/javascript' src="https://cdn.rawgit.com/abdmob/x2js/master/xml2json.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>    

 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b93e1f37ba26daefa16850e15e3b7c31&libraries=services"></script>
<script type='text/javascript' src="/ro/js/map.js"></script>
<script type='text/javascript' src="/ro/js/mapMake.js"></script> 
<script>
	$(function(){
		$("#hash0").parent("label").css("background","#eee")
		$("#hash0").prop("disabled",true)
	})
	function goSave(){
		send(courseArr);
		AH.submit();
	};
	var pic =1;
	//체크박스on
	$(".hash label").click(function(){
		if($(this).find("input[type='checkbox']").is(':checked')){
			$(this).toggleClass("on")
		}
	})
	function writebox(index,places){
		count++;
		var html ='<div class="set">'
			html +='<span class="jk"></span>'
			html +='<div class="map_list">'
			html += '<span class="markerbg marker_' + (index+1) + '"></span>'
					+'<span class="info">'+'<h5>' + places.place_name + '</h5>'+'</span>';
			html += '    <span>' +  places.address_name  + '</span>'; 
				    
   			html += '  <span class="tel">' + places.phone  + '</span>'     
			html +="</div>"
	        html +='    <textarea placeholder="내용 입력" name="contents"></textarea>'
	        html +='    <div class="pic_wrap">'
	        html +='        <div class="pic">'
            html +='           <input type="file" class="file_input'+ pic +'" name="filename" id="'+pic+'" onchange="readInputFile(this)">'
            pic++;
	        html +='       		<img src="/ro/img/no-image.jpg">'
        	html +='       		<span class="delete" ><i class="fa-solid fa-circle-minus"></i></span>'
	        html +='     	</div>'
	        html +='   	 	<div class="pic">'
            html +='            <input type="file" class="file_input'+ pic +'" name="filename" id="'+pic+'" onchange="readInputFile(this)">'
            html +='       		<img src="/ro/img/no-image.jpg">'
            html +='        	<span class="delete" ><i class="fa-solid fa-circle-minus"></i></span>'
	        html +='      	</div>'
	        html +='    </div>'
		    html +='    <span class="course_delete">코스삭제</span>'
	        html +='</div>'
	        pic++;
			$('.scroll').append(html);
			 
	}
	// 됐나?

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
	$(document).on("click",".delete",function(){
		$(this).prev('img').attr("src","/ro/img/no-image.jpg");
		$(this).siblings('input').val("");
	})

	// 글쓰기+사진+코스 삭제
	$(document).on("click",".course_delete",function(){
		var idx = $(this).parent("div").index();
        if(confirm('코스 삭제?')) {
      		$(this).parent("div").remove();
            courseIdx=0;
            courseArr.splice(idx,1);
            count--;
            
            if(markerShow){
            	displayCouses(courseArr);
            }else{
            	searchPlaces();
            }
        }
	})
	//지도 소분류 ajax로 바로 가져오기
	$("#region").change(function(){
		console.log($(this).val())
		var region_name = $(this).val()
		$.ajax({
			url:"/ro/board/region_detail",
			data:{
				rs:region_name
			},
			success:function(res){
				$(".region_detail").find("input").remove();
				$(".region_detail").find("label").remove();
				for(var i=0;i<res.regionDetailList.length;i++){
				    	var html = '<label for="region'+i+'">'+res.regionDetailList[i].region_name
				    		html +='<input type="checkbox" name="region_no_arr" id="region'+i+'" value="'+res.regionDetailList[i].region_no+'">'
				    		html +='</label>'
				    	$(".region_detail").append(html);
				}
			}
		})

	});
	//지도소분류 체크css
	$(document).on("click",".region_detail label",function(){
		if($(this).find("input[type='checkbox']").is(':checked')){
			$(this).toggleClass("on")
		}
	})
	
</script>

</body>
</html>