<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  pageEncoding="utf-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- header -->
<!DOCTYPE html>
<html>
<head>
    
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	.div-1{
		padding : 25px;
		margin: 0 auto;
		display:block;
		text-align : center;
	}
	
</style>
</head>
<body>
     <!-- contents --> 
  <div id = "contents">
    <!-- 관리자 페이지 -->
 <section class="flex-center3">
 <div>
<div class="myP_left">
<ul class="my_gnb">
						<li class="depth1">
							<a class="depth1_b_m" href="${contextPath}/admin_main.do" >관리자 페이지</a>
								<ul>
									<li><a href="${contextPath}/admin_member.do">회원 관리</a></li>
									<li><a href="${contextPath}/admin_order.do">주문 관리</a></li>
									<li><a href="${contextPath}/admin_prod.do">상품 관리</a></li>
									<li><a href="${contextPath}/admin_review.do">후기 관리</a></li>
									<li><a href="${contextPath}/board_main.do">게시판 관리</a></li>
								</ul>
						</li>
</ul>			
</div> 
        <main>
        <div class="title_wrap"><h2 class="tit_txt">관리자 페이지</h2></div> <hr>
        
            <div class="order_list21">
            	
						<div class="title_wrap"></div>
						<div class="listTable21">
							<h3>공지사항</h3>
							<br><br>							
							<table border="0" cellspacing="0" cellpadding="0" width="100%" class="myP_Ttype1">
								<colgroup>
									<col width="20%">
									<col width="80%">
																		
								</colgroup>
								<thead>
									<thead>
									<tr><th>제목</th><td><c:out value="${list.a_main_title}"/></td></tr>
									<tr><th>날짜</th><td><c:out value="${list.a_main_writeDate}"/></td></tr>
									<tr><th>작성자</th><td><c:out value="${list.user_id}"/></td></tr>
									<tr><th>내용</th><td><c:out value="${list.a_main_content}"/></td></tr>
									</thead>
								<tbody>
									
								</tbody>
							</table>							
							<br>			
						</div>
						<div class="div-1">	
							<button type="button" class="btn btn-outline-dark" onclick="location='admin_main.do'">돌아가기</button>
						</div>					
					</div>
					
        </main>
</div>
</section>
    </div>
  
</body>
</html>

 