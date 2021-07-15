<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>

<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">회원 상세보기</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">관리자관리</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- 콘텐츠 내용 -->
        <div class="card card-primary">
          <div class="card-header">
            <h3 class="card-title">보기</h3>
          </div>
          <!-- /.card-header -->
          <!-- form start -->
          <!-- 첨부파일을 전송할때 enctype=필수 없으면, 첨부파일이 전송X -->
          <form id="form_view" name="form_view" action="/admin/member/member_update_form" method="get" enctype="multipart/form-data">
            <div class="card-body">
              <div class="form-group">
              <img style="width:120px;height:120px;border-radius: 70%;" onerror="this.src='/resources/admin/dist/img/default-150x150.png'" src="/resources/profile/${memberVO.user_id}.png">
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">사용자ID</label>
                <br>
                <c:out value="${memberVO.user_id}" /> 
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">사용자명</label>
                <br>
                <c:out value="${memberVO.user_name}" />
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">이메일</label>
                <br>
                <c:out value="${memberVO.email}" />
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">로그인여부</label>
                <br>
                <c:out value="${memberVO.enabled}" />
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">권한</label>
                <br>
                <c:out value="${memberVO.levels}" />
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">가입일</label>
                <br>
                <c:out value="${memberVO.reg_date}" />
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">수정일</label>
                <br>
                <c:out value="${memberVO.update_date}" />
              </div>
            </div>
            <!-- /.card-body -->

            <div class="card-footer text-right">
              <button type="submit" class="btn btn-primary">수정폼</button>
              <button type="button" class="btn btn-danger" id="btn_delete">삭제</button>
              <button type="button" class="btn btn-default" id="btn_list">목록</button>
              <!-- 목록으로 이동하려면, pageVO도 가져야 합니다. 또한 삭제/수정 보안때문에 
              URL쿼리 스트링(GET)으로 보내면 X, POST방식으로 보냅니다. -->
              <input type="hidden" name="page" value="${pageVO.page}">
              <input type="hidden" name="search_type" value="${pageVO.search_type}">
              <%-- <input type="hidden" name="search_keyword" value="${pageVO.search_keyword}"> --%>
              <input type="hidden" name="user_id" value="${memberVO.user_id}">
            </div>
          </form>
        </div>
        <!-- //콘텐츠 내용 -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
<!-- /.content-wrapper -->

<%@ include file="../include/footer.jsp" %>
<!-- 관리자단은 jQuery코어가 하단 footer에 있기 때문에 여기에 위치합니다. -->
<script>
$(document).ready(function(){
	$("#btn_delete").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")) {
			//위 컨펌대화상자에서 예,를 누르면, 아래 부분이 실행됨.(아니오, 건너띔)
			$("#form_view").attr("action","/admin/member/member_delete");
			$("#form_view").attr("method","post");
			$("#form_view").submit();
		}
	});
	$("#btn_list").click(function(){
		var queryString = 'page=${pageVO.page}&search_type=${pageVO.search_type}';
		//alert(queryString);//디버그
		location.replace('/admin/member/member_list?'+queryString);
	});
});
</script>