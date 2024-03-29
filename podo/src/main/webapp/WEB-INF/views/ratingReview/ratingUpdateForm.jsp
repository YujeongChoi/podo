<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="icon" href="img/Fevicon.png" type="image/png">

  <link rel="stylesheet" href="vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="vendors/linericon/style.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">

  <link rel="stylesheet" href="css/style.css">
  <script src="vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="js/jquery.ajaxchimp.min.js"></script>
  <script src="js/mail-script.js"></script>
  <script src="js/main.js"></script>
<title>Insert title here</title>
<style>
	body{
		width: 100%;
		height: 100%;
	}
	#body{
		width: 60%;
		height: 100%;
		margin-left:auto;
		margin-right:auto;
	}
	#mychart2{
		margin-left:auto;
		margin-right:auto;
		width:300px;
		height:190px;
		display:inline-block;
	}
	#movieform{
		display:inline-block;
	}
	.img-fluid{
		margin-left:180px;
		width:300px;
		height:190px;
	}
	.star-input>.input,
			.star-input>.input>label:hover,
			.star-input>.input>input:focus+label,
			.star-input>.input>input:checked+label {
				display: inline-block;
				vertical-align: middle;
				background: url('resources/common/img/rating-star.png') no-repeat;
			}
			
			.star-input {
				display: inline-block;
				white-space: nowrap;
				width: 225px;
				height: 40px;
				padding: 25px;
				line-height: 30px;
			}
			
			.star-input>.input {
				display: inline-block;
				width: 150px;
				background-size: 150px;
				height: 28px;
				white-space: nowrap;
				overflow: hidden;
				position: relative;
			}
			
			.star-input>.input>input {
				position: absolute;
				width: 1px;
				height: 1px;
				opacity: 0;
			}
			
			star-input>.input.focus {
				outline: 1px dotted #ddd;
			}
			
			.star-input>.input>label {
				width: 30px;
				height: 0;
				padding: 28px 0 0 0;
				overflow: hidden;
				float: left;
				cursor: pointer;
				position: absolute;
				top: 0;
				left: 0;
			}
			
			.star-input>.input>label:hover,
			.star-input>.input>input:focus+label,
			.star-input>.input>input:checked+label {
				background-size: 150px;
				background-position: 0 bottom;
			}
			
			.star-input>.input>label:hover ~label{
				background-image: none;
			}
		
			.star-input>output {
				display: inline-block;
				width: 60px;
				font-size: 18px;
				text-align: right;
				vertical-align: middle;
			}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<div id="body">
		<h1 align="center">리뷰 수정 페이지</h1>
		
		<br>
		
		<h3 align="center">
			
		</h3>
	  <section class="blog-post-area section-margin">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
            <div class="main_blog_details">
                <img class="img-fluid" src="resources/detailFilmImage/defaultImg.png" alt="">
            <%-- 이게원래써야함    <img class="img-fluid" src="resources/detailFilmImage/ ${ rr.posterImage }" alt=""> --%>
               <h4 align="center">${rr.titleKor }</h4>
                <div class="user_details">
                    <div class="float-left">
                      <div class="media">
                      <div class="media-body">
                        <h5>${rr.nickName }님</h5>
                        <p>${ rr.createDate }에 수정하려함</p>
                      </div>
                      <div class="d-flex">
                        <img width="42" height="42" src="resources/memberProfileImage/${ rr.userImage }" alt="">
                      </div>
                    </div>
                  	</div>
                  <div class="float-right mt-sm-0 mt-3">
                    <div class="media">
                      <div class="media-body">
                        <h5>${rr.nickName }</h5>
                        <span class="star-input">
								<span class="input">
								<input type="radio" name="star-input1" value="1" id="p1">
									<label for="p1" style="width: 30px; z-index: 5;">1</label>
								<input type="radio" name="star-input1" value="2" id="p2">
									<label for="p2" style="width: 60px; z-index: 4;">2</label>
								<input type="radio" name="star-input1" value="3" id="p3">
									<label for="p3" style="width: 90px; z-index: 3;">3</label>
								<input type="radio" name="star-input1" value="4" id="p4">
									<label for="p4" style="width: 120px; z-index: 2;">4</label>
								<input type="radio" name="star-input1" value="5" id="p5">
									<label for="p5" style="width: 150px; z-index: 1;">5</label>
								</span>
								<output for="star-input"><b style="display: none;"></b></output>
						</span>
                        <p>여기가 별점남기는곳입니다!!</p>
                      </div>
                      <div class="d-flex">
                        <img width="42" height="42" src="resources/bootstrap/img/blog/user-img.png" alt="">
                      </div>
                    </div>
                  </div>
                </div>
                <br>
                <br>
                <div id="mychart2">
   <canvas id="myChart">캔버스</canvas>
   
   <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
   
   
   
   <script>
   var ctx = document.getElementById('myChart');
   var chart = new Chart(ctx, {
       // The type of chart we want to create
       type: 'radar',

       // The data for our dataset
       data: {
           labels: ["음악", "영상", "연기", "대중성", "각본","연출"],
           datasets: [{
               label: ["${ rr.titleKor }"], 
            backgroundColor: "rgb(165,102,255)",
            pointBackground:"rgba(179,181,198,1)",
            pointBorderColor:"#fff",
            pointBorderBackgroundColor:"#fff",

               data: [
            	   ${rr.ratingSound},${rr.ratingVisual},${rr.ratingActing},${rr.ratingPop},${rr.ratingScript},${rr.ratingDirect}
            	   ]
    
           }]
       },

       // Configuration options go here
             options: {
                 
                 scale: {
                      angleLines: {
                          display: false
                      },
                      ticks: {
                          suggestedMin: 0,
                          suggestedMax: 10,
                      }
                  },
                  tooltips:{
                     callbacks: {
                          label: function(tooltipItem, data) {
                              
                              return data.labels[tooltipItem.index]  + " : "+ Math.round(tooltipItem.yLabel * 100) / 100 +"점";
                          }
                      }
                  }
              }
    });
   </script>
   </div>
   
    <form action="reviewUpdate.do" method="post" enctype="mutipart/form-data" id="movieform">
      <table align="center" id="vv">
      	<input type="hidden" name="id" value="${rr.id }">
         <tr>
            <td>영화제목</td>
            <td><input type="text" name="title" id="vtitle"  value="${ rr.titleKor }"  readonly></td>
         </tr>
         <tr>
            <td>음악</td>
            <td><input type="number" name="ratingSound" class="insertRating" id="ratingSound" value="${rr.ratingSound }"></td>
         </tr>
         <tr>   
            <td>영상</td>
            <td><input type="number" name="ratingVisual" class="insertRating" id="ratingVisual" value="${rr.ratingVisual }"></td>
         </tr>
         <tr>
            <td>연기</td>
            <td><input type="number" name="ratingActing" class="insertRating" id="ratingActing" value="${rr.ratingActing }"></td>
         </tr>
         <tr>
            <td>대중성</td>
            <td><input type="number" name="ratingPop" class="insertRating" id="ratingPop" value="${rr.ratingPop }"></td>
         </tr>
         <tr>
            <td>각본</td>
            <td><input type="number" name="ratingScript" class="insertRating" id="ratingScript" value="${rr.ratingScript }"></td>
         </tr>
         <tr>
            <td>연출</td>
            <td><input type="number" name="ratingDirect" class="insertRating" id="ratingDirect" value="${rr.ratingDirect }" ></td>
         </tr>

      </table>
   </div>
                <p><textarea rows="3" cols="75" name="content"  >${rr.content }</textarea></p>
               <button type="submit" id="reviewupdate">리뷰수정하기</button>
               <button type="button" onclick="location.href='reviewList.do';">목록으로</button>
   </form>
     

              </div>
        </div>
      </div>
  </section>	
	
	<br>
	

	</div>
	
	 <script>
      $('.insertRating').on('input',function(){
         var ctx = document.getElementById('myChart');
         var chart = new Chart(ctx, {
             // The type of chart we want to create
             type: 'radar',

             // The data for our dataset
             data: {
                 labels: ["음악", "영상", "연기", "대중성", "각본","연출"],
                 datasets: [{
                	 label: ["${ rr.titleKor }"], 
                     backgroundColor: "rgb(165,102,255)",
                     pointBackground:"rgba(179,181,198,1)",
                     pointBorderColor:"#fff",
                     pointBorderBackgroundColor:"#fff", 
             
                    data: [$('#ratingSound').val(),$('#ratingVisual').val(),$('#ratingActing').val(),$('#ratingPop').val(),$('#ratingScript').val(),$('#ratingDirect').val()]
   
               }]
             },

             // Configuration options go here
             options: {
                 
                 scale: {
                      angleLines: {
                          display: false
                      },
                      ticks: {
                          suggestedMin: 0,
                          suggestedMax: 10,
                      }
                  },
                  tooltips:{
                     callbacks: {
                          label: function(tooltipItem, data) {
                              
                              return data.labels[tooltipItem.index]  + " : "+ Math.round(tooltipItem.yLabel * 100) / 100 +"점";
                          }
                      }
                  }
              }
          });
   })
 

   </script>
	
</body>
</html>