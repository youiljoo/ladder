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
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypageas.css"> 
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  
   
</head>
<body>
    <div id = "contents">
    <!-- 마이페이지 메인 -->
 <section class="flex-center3">
 <div>
<div class="myP_left">
<ul class="my_gnb">
						<li class="depth1">
							<a href="javascript:sl_tab(1)" class="depth1_b_m" id="tab_1">MY 주문</a><i class="gnb_i"></i>
							<div class="depth2 tab_li" id="tab_li_1" style="">
								<ul>
									<li><a href="${contextPath}/orderlist.do">주문내역</a></li>
									<li><a href="${contextPath}/mypageas2.do">교환 · 반품 내역</a></li>
								</ul>
							</div>
						</li>
						
						<li class="depth1">
							<a href="javascript:sl_tab(2)" class="depth1_b_m" id="tab_2">MY 관심목록</a><i class="gnb_i"></i>
							<div class="depth2 tab_li" id="tab_li_2" style="">
								<ul>
									<li><a href="${contextPath}/cart.do">장바구니</a></li>
								</ul>
							</div>
						</li> 
						<li class="depth1">
							<a href="javascript:sl_tab(3)" class="depth1_b_m" id="tab_3">MY 활동</a><i class="gnb_i"></i>
							<div class="depth2 tab_li" id="tab_li_3" style="display: none;">
								<ul>
									<li class="on"><a href="${contextPath}/mypage_conlist.do">상담내역</a></li>
									<li ><a href="${contextPath}/mypage_reviewlist.do">구매후기</a></li>
								</ul>
							</div>
						</li>
						
						<li class="depth1">
							<a href="javascript:sl_tab(4)" class="depth1_b_m" id="tab_4">MY 정보</a><i class="gnb_i"></i>
							<div class="depth2 tab_li" id="tab_li_4">
								<ul>
									<li><a href="${contextPath}/edit_pw.do">회원정보 수정</a></li>
									<li><a href="${contextPath}/removeid.do">회원탈퇴</a></li>
								</ul>
							</div>
						</li>
					</ul>
							<div class="cs_box">
						<h2>사다리컴 고객센터</h2>
						<h3 class="SpqBlue2">1588-0000</h3>
						<p style="margin-bottom: 0px;margin-top: 0px; font-size: 16px">월~금 10:00~19:00</p>
						<p style="margin-top: 2px; margin-bottom: 0px; font-size: 16px">주말, 공휴일 휴무</p>
						<a class="myP_SWbtn" href="${contextPath }/board" target="_blank" style="margin-top:15px;">상담하기</a>
					</div> 
					</div>   
<div class="myP_right as_list_wrap">
					<form name="global_form" id="global_form" method="post" enctype="multipart/form-data">
						<input type="hidden" name="PageNum" value="1">
						<input type="hidden" name="StartNum" value="0">
						<input type="hidden" name="old_db" value="">
						<input type="hidden" name="period" id="period" value="1week">
						<input type="hidden" name="AsPresentState" value="">

					<!-- A/S · 교환 · 반품 내역 -->
					<div class="as_list mt45">
						
						<div class="title_wrap clearfix">
							<h2 class="tit_txt">A/S · 교환 · 반품 신청</h2>
						</div>
						<div class="listTable21">
							<div class="myP_search clearfix">
								<div class="left_area">
									<div class="bottom">
										<span class="myP_select select2">
											<select name="AsPrKind" id="AsPrKind">
                        <option value=""> 전체</option>
                        <option value="A">주문번호</option>
                        <option value="C">상품번호</option>
                        <option value="R">상품명</option>
	                    </select>
										</span>
										<span class="inputWrap search2"><input type="text" name="SearchValue" value="" placeholder="상품번호, 상품명, 접수번호를 입력해주세요."></span>
										<div class="right_area">
									<a class="save_B15btn" href="javascript:fn_SearchList();">조회</a>
								</div>
									</div>
								</div>
								
							</div>
						</div>
						<div class="listTable21 mt20">
							<table border="0" cellspacing="0" cellpadding="0" width="100%" class="myP_Ttype1">
								<colgroup>
									<col width="150">
									<col width="70">
									<col width="*">
									<col width="115">
									<col width="128">
									<col width="104">
								</colgroup>
								<thead>
									<tr><th>주문일자</th>
									<th>구분</th>
									<th>상품정보</th>
									<th>수량</th>
									<th>결제금액</th>
									<th></th>
								</tr></thead>
								<tbody> 
					
									<tr>
										<td colspan="6">
											<div class="no_list">
												<span><img src="${contextPath}/resources/images/cart_big.png"></span>
												<p class="txt">신청 가능한 상품이 없습니다.</p>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							
							<div class="bottom_area">			
								<div class="page_area"></div>							</div>
						</div>
						
					
					</div>
					</form>
				</div>
				</div>
				</div>
				</div>
				
				 <script>
	function sl_tab(tabIdx){
		
		if(!$("#all_view_tab").is(":checked")){
			if( $("#tab_"+tabIdx).hasClass('active')){
				$(".depth1_b_m").removeClass('active');
				$("#tab_"+tabIdx).removeClass('active');
				$(".tab_li").slideUp(300);
			}else{
				$(".tab_li").slideUp(300);
				$(".depth1_b_m").removeClass('active');
				$("#tab_"+tabIdx).addClass('active');
				$("#tab_li_"+tabIdx).slideDown(300);
			}
		}else{
			if( $("#tab_"+tabIdx).hasClass('active')){
				$("#tab_"+tabIdx).removeClass('active');
				$("#tab_li_"+tabIdx).slideUp(300);
			}else{
				$("#tab_"+tabIdx).addClass('active');
				$("#tab_li_"+tabIdx).slideDown(300);
			}
		}
	}
$(document).ready(function(){

	$(window).scroll(function () {
		if($(window).scrollTop() > 200) {
			$(".myP_topFixed").addClass("sticky");
		} else {
			$(".myP_topFixed").removeClass("sticky");
		}
	});

	if(getCookie('mp_all_chk') == "Y"){
		$(".depth2").show();
		$(".depth1_b_m").addClass('active');
		$(".switch-ui-checkbox").prop('checked',true);
	}

	//gnb on/off 스위치 
	$(".switch-ui-checkbox").on('click',function(){
		if($(this).is(':checked')){
			$(".depth2").show();
			$(".depth1_b_m").addClass('active');
			setCookie('mp_all_chk','Y',365,'/');
		}
		else{
			$(".depth2").hide();
			$(".depth1_b_m").removeClass('active');
			setCookie('mp_all_chk','N',1,'/');
		}
	});
	
	
});
</script>
 
</body>
</html>

