<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"  pageEncoding="utf-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- header -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
      if (input.files && input.files[0]) {
	      var reader = new FileReader();
	      reader.onload = function (e) {
	        $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  

</script>
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
            	
					<div class="title_wrap">
							<h2 class="tit_txt" style="text-align:center">상품 수정</h2>
					</div>
						<div class="listTable21">
            <form class="form-horizontal form_align" role="form" method="post" action="javascript:alert( '상품이 등록되었습니다.' );">
            
            	<div class="form-group">
                    <label for="prodNum" class="col-lg-2 control-label">상품번호</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyHangul" id="prodNumber" placeholder="숫자만 입력하세요." data-rule-required="true"  maxlength="15">
                    </div>
                </div>
            	
                <div class="form-group">
                    <label class="col-lg-2 control-label">1차 카테고리</label>
                    <div class="col-lg-10">
                        <form>
  								<select name="ca1" onchange="categoryChange(this)" class="form-control onlyHangul">
    								<option>선택</option>
    								<option value="a">모니터</option>
    								<option value="b">마우스</option>
    								<option value="c">키보드</option>
    								<option value="d">스피커</option>
    								<option value="e">헤드셋</option>
  								</select>
						</form>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-lg-2 control-label">2차 카테고리</label>
                    <div class="col-lg-10">
                        <form>
  								<select name="ca2" id="good" class="form-control onlyHangul">
    								<option>선택</option>    								    							
  								</select>
						</form>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">제품명</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="prodName" data-rule-required="true" maxlength="30">
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label class="col-lg-2 control-label">제조사</label>
                    <div class="col-lg-10">
                        <input type="text" class="form-control" id="prodmake" data-rule-required="true"  maxlength="40">
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label class="col-lg-2 control-label">재고수량</label>                    
                    <div class="col-lg-10">
                        <input type="text" class="form-control onlyNumber" id="prodNum" data-rule-required="true" placeholder="숫자만 입력하세요." maxlength="11">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="col-lg-2 control-label">상세정보</label>
                    <div class="col-lg-10">            
                             <textarea name="content" rows="10" cols="65" class="form-control onlyNumber" maxlength="4000"></textarea>                                            
                    </div>
                </div>
                
                
                <div class="form-group">
                    <label class="col-lg-3 control-label">제품 이미지 선택하기</label><hr width="80%">
                    <div class="col-lg-10">            
                             <input type="file" name="imageFileName"  onchange="readURL(this);" />
                                                                        
                    </div>
                </div>
                
                <br><br>
                
                <div class="form-group">
                    <label class="col-lg-3 control-label">상세페이지 이미지 선택하기</label><hr width="80%">
                    <div class="col-lg-10">            
                             <input type="file" name="imageFileName"  onchange="readURL(this);" /><br>
                             <input type="file" name="imageFileName"  onchange="readURL(this);" /><br>
     						 <input type="file" name="imageFileName"  onchange="readURL(this);" />                                                                   
                    </div>
                </div>                
                </div><br><br>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10" align="center">
                        <button type="submit"  class="btn btn-outline-dark" onclick="location='#!'">수정하기</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <button type="button" class="btn btn-outline-dark" onclick="location='admin_prod.do'">취소하기</button>
                    </div>
                </div>
            </form>
        
        </div>
       
        </div>				
						
						
        </main>
</div>
</section>
    </div>
  <script></script>
   <script>
   
   function categoryChange(e) {
	    var good_a = ["19인치 이하", "23~25인치", "27~31인치", "32인치 이상", "게이밍 모니터","모니터암,어댑터"];
	    var good_b = ["유선마우스", "무선마우스", "게이밍 마우스", "마우스패드"];
	    var good_c = ["기계식 키보드", "게이밍 키보드", "무접점 키보드", "무선 키보드"];
	    var good_d = ["2채널", "2.1채널 이상", "사운드바"];
	    var good_e = ["헤드셋", "악세사리"];
	    var target = document.getElementById("good");
	 
	    if(e.value == "a") var d = good_a;
	    else if(e.value == "b") var d = good_b;
	    else if(e.value == "c") var d = good_c;
	    else if(e.value == "d") var d = good_d;
	    else if(e.value == "e") var d = good_e;
	 
	    target.options.length = 0;
	 
	    for (x in d) {
	        var opt = document.createElement("option");
	        opt.value = d[x];
	        opt.innerHTML = d[x];
	        target.appendChild(opt);
	    }    
	}
   


</script>
</body>
</html>

 