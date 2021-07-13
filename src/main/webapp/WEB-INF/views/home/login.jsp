<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<script>
//로그인 실패 전용 메세지
if("${param.msg}" == "fail") {
	alert("로그인 실패입니다. 다시 입력해 주세요!");
}
</script>
<!-- 게시판용 CSS 임포트 -->
<link rel="stylesheet" href="/resources/home/css/board.css">

<!-- 메인콘텐츠영역 만 변경됩니다. -->
<div id="container">
    <!-- 메인상단위치표시영역 -->
    <div class="location_area customer">
        <div class="box_inner">
            <h2 class="tit_page">스프링 <span class="in">in</span> 자바</h2>
            <p class="location">고객센터 <span class="path">/</span> 로그인</p>
            <ul class="page_menu clear">
                <li><a href="#" class="on">로그인</a></li>
            </ul>
        </div>
    </div>	
    <!-- //메인상단위치표시영역 -->

    <!-- 메인본문영역 -->
    <div class="bodytext_area box_inner">
        <!-- 폼영역 -->
        <form method="POST" name="login_form" action="/login" class="appForm">
            <fieldset>
                <legend>로그인폼</legend>
                <p class="info_pilsoo pilsoo_item">필수입력</p>
                <ul class="app_list">
                    <li class="clear">
                        <label for="id_lbl" class="tit_lbl pilsoo_item">아이디</label>
                        <div class="app_content"><input autofocus type="text" name="user_id"" class="w100p" id="id_lbl" placeholder="아이디를 입력해주세요" required/></div>
                    </li>
                    <li class="clear">
                        <label for="password_lbl" class="tit_lbl pilsoo_item">암호</label>
                        <div class="app_content"><input type="password" name="user_pw" class="w100p" id="password_lbl" placeholder="암호를 입력해주세요" required/></div>
                    </li>

                </ul>
                <p class="btn_line">
                <button type="submit" class="btn_baseColor">로그인</button>
                <button type="button" class="btn_baseColor" id="btn_naver_login" style="background:#19ce60;min-width:250px;">네아로 로그인</button>
                </p>	
            </fieldset>
        </form>
        <!-- //폼영역 -->
    </div>
    <!-- //메인본문영역 -->
</div>
<!-- //메인콘텐츠영역 -->

<%@ include file="./include/footer.jsp" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script>
$(document).ready(function(){
	$("#btn_naver_login").click(function(){
		//alert("준비중 입니다.");
		location.replace("${url}");//login컨트롤로에서 model로 받은 $url변수값이 필요
		//위 url자바변수값은 네이버의 RestAPI주소 입니다.(네아로 인증 ID와 secret암호 URL에 포함됨.)
	});
});
</script>