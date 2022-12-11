<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">    
</head>
<body>
<div class="container">
    <div class="row">
    	<!-- 상단 네비게이션 인클루드 -->
        <%@ include file="./inc/top.jsp" %>
    </div>
    <div class="row">
        <!-- 좌측 사이드 인클루드 -->
        <%@ include file="./inc/left.jsp" %>
        <div class="col-9 pt-3">
		    <h2>로그인 페이지</h2>
		    <span style="color: red; font-size: 1.2em;"> 
		        <%= request.getAttribute("LoginErrMsg") == null ?
		                "" : request.getAttribute("LoginErrMsg") %>
		    </span>
		    <%
	  	    if (session.getAttribute("UserId") == null) {
		    %>
			    <script>
				    function validateForm(form) {
				        if (!form.user_id.value) {
				            alert("아이디를 입력하세요.");
				            form.user_id.focus();
				            return false;
				        }
				        if (form.user_pw.value == "") {
				            alert("패스워드를 입력하세요.");
				            form.user_pw.focus();
				            return false;
				        }
				    }
		    	</script>
			    <form action="LoginProcess.jsp" method="post" name="loginFrm"
			        onsubmit="return validateForm(this);">
			        아 이 디 : <input type="text" name="user_id" style="margin:5px;" /><br />
			        패스워드 : <input type="password" name="user_pw" style="margin:5px;" /><br />
			        <input type="submit" class="btn btn-secondary" value="로그인하기" style="margin:10px;" />
			    </form>
		    <%
		    } else { 
		    %>
		        <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br><br>
		    <%
		    }
		    %>
		    
		    <div id="demo" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-indicators">
				    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
				    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
				    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
				    <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
				    <button type="button" data-bs-target="#demo" data-bs-slide-to="4"></button>
			    </div>
			 	<div class="carousel-inner">
			 	    <div class="carousel-item active">
			    		<img src="https://www.tjoeun.co.kr/upload/site/banner/2022/2022090711435884452017880.jpg" alt="Los Angeles" class="d-block" style="width:100%">
			    	</div>
				    <div class="carousel-item">
				     	<img src="https://www.tjoeun.co.kr/upload/site/banner/2022/2022112509053626468507688.jpg" alt="Chicago" class="d-block" style="width:100%">
				    </div>
				    <div class="carousel-item">
				      	<img src="https://www.tjoeun.co.kr/upload/site/banner/2022/2022112114005104570461844.jpg" alt="New York" class="d-block" style="width:100%">
				    </div>
				    <div class="carousel-item">
				    	<img src="https://www.tjoeun.co.kr/upload/smartediter/2022/11/2022111609104712025823173.jpg" alt="New Yark" class="d-block" style="width:100%">
				    </div>
				    <div class="carousel-item">
				      	<img src="https://www.tjoeun.co.kr/upload/site/banner/2022/2022102714571662885837331.jpg" alt="New Ydrk" class="d-block" style="width:100%">
				    </div>
			    </div>
				<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
				    <span class="carousel-control-next-icon"></span>
				</button>
			</div>
		</div>
	</div><br><br>
    <!-- 하단 카피라이트 인클루드 -->
    <%@ include file="./inc/bottom.jsp" %>
</div>
</body>
</html>