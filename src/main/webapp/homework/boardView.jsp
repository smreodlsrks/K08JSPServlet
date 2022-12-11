<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");   
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);

Cookie[] cookies = request.getCookies();
boolean cookieExist = false;
for(Cookie c : cookies) {
    String cookieName = c.getName();        
	    if (cookieName.equals(dto.getId()+num)) {
	    	cookieExist = true;
	    	break;
	    }
}
if(cookieExist == false){
	dao.updateVisitCount(num);
	Cookie cookie = new Cookie(dto.getId()+num, "visited");
	response.addCookie(cookie);
}   
dao.close();
%>
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
    <script>
	function deletePost() {
	    var confirmed = confirm("정말로 삭제하겠습니까?"); 
	    if (confirmed) {
	        var form = document.writeFrm;      
	        form.method = "post";  
	        form.action = "DeleteProcess.jsp";  
	        form.submit();  
	    }
	}
	</script>  
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
            <h3>게시판 내용보기 - <small>자유게시판</small></h3>
			<form name="writeFrm">
			<input type="hidden" name="num" value="<%= num %>" />
            <table class="table table-bordered">
            <colgroup>
                <col width="20%"/>
                <col width="30%"/>
                <col width="20%"/>
                <col width="*"/>
            </colgroup>
            <tbody>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">작성자</th>
                    <td>
                        <%= dto.getName() %>
                    </td>
                    <th class="text-center" 
                        style="vertical-align:middle;">작성일</th>
                    <td>
                        <%= dto.getPostdate() %>
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">이메일</th>
                    <td>
                        <%= dto.getId() %>@naver.com
                    </td>
                    <th class="text-center" 
                        style="vertical-align:middle;">조회수</th>
                    <td>
                        <%= dto.getVisitcount() %>
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">제목</th>
                    <td colspan="3">
                        <%= dto.getTitle() %>
                    </td>
                </tr>
                <tr>
                    <th class="text-center" 
                        style="vertical-align:middle;">내용</th>
                    <td colspan="3" height="100">
		                <%= dto.getContent().replace("\r\n", "<br/>") %>
		            </td>
                </tr>
                <tr>
                	<td colspan="4" align="center">
	                <%
					if(session.getAttribute("UserId")!=null &&  
						dto.getId().equals(session.getAttribute("UserId").toString())){
					%>
					    <button type="button"  class="btn btn-secondary"
					    	onclick="location.href='Edit.jsp?num=<%= dto.getNum() %>';">수정하기</button>
					    <button type="button" class="btn btn-secondary" onclick="deletePost();">삭제하기</button> 
					<%
					}
					%>
		                <button type="button" class="btn btn-secondary" onclick="location.href='boardList.jsp';">
		                    목록 보기
		                </button>
		            </td>
		        </tr>
            </tbody>
            </table>
            </form>
        </div>
    </div>
    <!-- 하단 카피라이트 인클루드 -->
    <%@ include file="./inc/bottom.jsp" %>
</div>
</body>
</html>