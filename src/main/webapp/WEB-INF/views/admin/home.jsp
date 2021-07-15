<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="./include/header.jsp" %>

<!-- 이후 메인 콘텐츠 영역 -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Dashboard v1</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- 최근 등록한 회원목록 -->
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">최근등록한회원</h3>

            <div class="card-tools">
              <!-- <span class="badge badge-danger">8 New Members</span> -->
              <button type="button" class="btn btn-tool" data-card-widget="collapse">
                <i class="fas fa-minus"></i>
              </button>
              <button type="button" class="btn btn-tool" data-card-widget="remove">
                <i class="fas fa-times"></i>
              </button>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body p-0">
            <ul class="users-list clearfix">
            <!-- 최신 등록한 회원정보 4개출력-반복문사용  -->
            <c:forEach var="memberVO" items="${latestMembers}">
              <li style="cursor: pointer;" onclick="location.replace('/admin/member/member_view?user_id=${memberVO.user_id}')">
                <!-- <img src="" alt="User Image"> 아래 onerror은 엑박일때 대신 보여줄 이미지를 지정 -->
                <img style="width:120px;height:120px;" onerror="this.src='/resources/admin/dist/img/default-150x150.png'" src="/resources/profile/${memberVO.user_id}.png">
                <a class="users-list-name" href="#">${memberVO.user_name}</a>
                <span class="users-list-date">
                <fmt:formatDate pattern="yyyy-MM-dd hh:MM:ss" value="${memberVO.reg_date}"/>
                </span>
              </li>
            </c:forEach>
              
              
            </ul>
            <!-- /.users-list -->
          </div>
          <!-- /.card-body -->
          <div class="card-footer text-center">
            <a href="/admin/member/member_list">View All Users</a>
          </div>
          <!-- /.card-footer -->
        </div>
        <!-- //최근 등록한 회원목록 -->
        <!-- 최근게시물리스트(공지사항+겔러리+QnA게시판) 현재 2개의 게시판이 나오게 됨 -->
        <!-- include와 import의 차이점: include는 소스를 조립 후 컴파일, import는 개발파일을 컴파일후 조립 -->
        <c:forEach var="boardTypeVO" items="${listBoardTypeVO}">
        	<c:import url="/admin/latest/latest_board?board_type=${boardTypeVO.board_type}&board_name=${boardTypeVO.board_name}" />
        </c:forEach>        
        <!-- //최근게시물리스트 -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
<!-- 여기까지 메인 콘텐츠 영역 -->

<%@ include file="./include/footer.jsp" %>