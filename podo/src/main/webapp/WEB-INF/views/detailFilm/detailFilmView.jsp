<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript"></script>
<title>PoDo</title>
</head>

<style>
    body{
        width:100%;
        height:100%;
    }
    #body{
        width:60%;
        height:100%;
        margin-left: auto;
        margin-right: auto;
    }
    .video-background {
		background: #000;
        width: 100%;
        height:25%;
	}
	
	.video-foreground, .video-background iframe {
		pointer-events: none;
	}
    #muteYouTubeVideoPlayer{
        width:100%;
    }
    .movie_info{
        width:100%;
        height:40%;
        float:left;
        border:1px solid black;
    }
    .movie_poster_cover{
        width:30%;
        height:100%;
        position:relative;
        float:left;
        left:20px;
        border:1px solid blue;
    }
    .movie_info_cover{
        width: 60%;
        float:right;
    }
    .icon{
        position: absolute;
        z-index: 1;
        width: 30px;
        height: 30px;
    }
    #collection{
        left:90%;
    }
    #likeBtn{
        top:90%;
    }
    #modifyBtn{
        top:90%;
        left:90%;
    }
    #movie_poster{
        position: relative;
    }
    .review{
        width: 100%;
        border: 1px solid black;
        height: 40%;
    }
    .cover{
        border: 1px solid black;
    }
    #title_cover{
        font-size:50px;
    }
    #movie_clip{
        font-size:30px;
        border: 1px solid black;
        float:right;
    }
    #modify_all{
        width: 30%;
        float:right;
    }
</style>
<body>
	<!-- 헤더  -->
	<jsp:include page="../common/header.jsp"/>
    
    <!-- 본문 -->
    <div id="body">
    	<div class="video-background">
            <div class="video-foreground">
                <div id="muteYouTubeVideoPlayer"></div>
            </div>
        </div>
    
        <div class="movie_info">
            <div class="movie_poster_cover">    <!-- 왼쪽 영화 포스터 -->

                <div class="icon" id="collection">   <!-- 콜렉션 -->
                    <img id="plus" src="resources/detailFilmImage/plus.jpg" onclick="#" style="width:30px; height:30px;">
                </div>

                <div class="icon" id="likeBtn">      <!-- 좋아요 -->
                    <img id="heart" src="resources/detailFilmImage/heart.jpg" onclick="#" style="width:30px; height:30px;">
                </div>

                <div class="icon" id="modifyBtn">    <!-- 수  정 -->
                    <img id="memo" src="resources/detailFilmImage/modifyBtn.jpg" onclick="#" style="width:30px; height:30px;">
                </div>

                <div id="movie_poster"> <!-- 포스터 -->
                    <img id="poster" src="resources/detailFilmImage/joker_poster.jpg" onclick="#" style="width:100%; height:100%;">
                </div>

            </div>
            <div class="movie_info_cover">      <!-- 오른쪽 영화 정보 -->
            <form action="bupdate.do" method="get">
                <div id="movie_detail_info">
                	<div class="cover" id="title_cover">
	                    <span id="movie_title">${ df.titleKor }(${ df.titleEng })</span>
	                    <span id="movie_clip">${ df.trailer }</span>                	
                	</div>
                    <div class="cover" id="sysnobsis_cover">
   	                	<div>감독 : ${ df.director }</div>
                    </div>
                    <div class="cover" id="sysnobsis_cover">
                    	<div>배우 : ${ df.actor }</div>
                    </div>
                    <div class="cover" id="sysnobsis_cover">
                    	<div>시놉시스 : ${ df.synopsys }</div>
                    </div>
                    
                    <div class="cover" id="plusInfo_cover">
                    	<div>트리비아 : ${ df.trivia }</div>
                    </div>
                    
                    <div class="cover">
                    	<button type="submit">전체정보 수정</button>
                    </div>	<!-- 버튼 클릭시, updateForm 으로 이동 -->
                    		<!-- updateForm 에서 수정하고 저장 누르면 다시 이 페이지 -->
                </div>
            </form>
            </div>
        </div>
        <hr>
	    <div><a href="#">리뷰 작성하기 버튼</a></div>		<!-- 버튼 -->
        <c:forEach items="${ rl }" var="r">
	        <div class="review">
	            <div>리뷰</div>
	            <div>내용 : ${ r.content }</div>
	            <div>작성자 : ${ r.nickname}</div>
	            <div>좋아요 : ${ r.likeCount }</div>
	        </div>
        </c:forEach>
    </div>
    <br>
    
    <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script async src="https://www.youtube.com/iframe_api"></script>
	<script type="text/javascript">
		var player;
		
        function onYouTubePlayerAPIReady(){
			player = new YT.Player('muteYouTubeVideoPlayer', {
				videoId : 'x60mB0zXZ38',
				playerVars : {
					autoplay : 1, 		// Auto-play the video on load
					controls : 0, 		// Show pause/play buttons in player
					rel : 0,

					start : 75,         // 원하는 예고편 시작 지점
					end : 135,          // 원하는 예고편 끝나는 지점

					showinfo : 0,
					showinfo : 0, 		// Hide the video title
					modestbranding : 1, // Hide the Youtube Logo
					loop : 1, 			// Run the video in a loop
					playlist : 'x60mB0zXZ38',
					fs : 0, 			// Hide the full screen button
					cc_load_policy : 0, // Hide closed captions
					iv_load_policy : 3, // Hide the Video Annotations
					autohide : 1		// Hide video controls when playing
				},
                events:{
					onReady:function(e){
						e.target.mute();
					}
				}
			});
		}
				
	</script>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>