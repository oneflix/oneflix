<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="header_url" value="/WEB-INF/view/admin/header.jsp"></c:set>

<c:set var="footer_url" value="/WEB-INF/view/admin/footer.jsp"></c:set>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ONEFLIX</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

</head>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">

    <!-- ====================== 
            ADD headr 
     ====================== -->
	<jsp:include page="${header_url}"></jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>1:1 문의</h1>
            </div>
          </div>
        </div>
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <form class="form-inline ml-3" style="float: right; margin-top: 4px;">
                  <div class="card-tools">
                    <div class="input-group input-group-sm" style="width: 300px;">
                      <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                      <div class="input-group-append">
                        <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                      </div>
                    </div>
                  </div>
                </form>
              </div><!-- /.card-header -->

              <div class="card-body">
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>제목</th>
                      <th>email</th>
                      <th>답변</th>
                      <th>날짜</th>
                      <th class="th-width">관리</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>질문 있어요</td>
                      <td>one@gmail.com</td>
                      <td>답변입니다</td>
                      <td>2020.02.02</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                          <div class="custom-control custom-switch custom-float">
                            <input type="checkbox" class="custom-control-input" id="customSwitch1">
                          </div>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>궁금해요</td>
                      <td>two@gmail.com</td>
                      <td>답변입니다</td>
                      <td>2020.02.03</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                          <div class="custom-control custom-switch custom-float">
                            <input type="checkbox" class="custom-control-input" id="customSwitch1">
                          </div>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
    </section>
    <!-- /.content -->
    </div>
    <!-- /.row -->


    <!-- ====================== 
            ADD Footer
     ====================== -->
     <jsp:include page="${footer_url}"></jsp:include>


  </div>
  
  
</body>

</html>