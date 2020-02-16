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
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1>감독 수정</h1>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>


      <form action="#" class="row">
        <div class="col-md-3"></div> <!-- 센터 맞추기 위한 빈 div (화면의 왼쪽)-->
        <div class="col-md-6" style="margin-bottom: 5%;">
          <div class="card card-info">
            <div class="card-body pad">

              <div class="form-group mb-3">
                <label for="title">이름</label>
                <input type="text" class="form-control" id="title" name="title" required="">
              </div>

              <div class="form-group mb-3">
                <label for="title">나이</label>
                <input type="text" class="form-control" id="title" name="title" required="">
              </div>

              <br>
              <div class="buttons" style="float: right;">
                <button type="submit" class="btn btn-success">수정</button>
                <button type="button" class="btn btn-secondary">취소</button>
              </div><!-- /.buttons -->
            </div> <!-- /.card-body pad -->
          </div>
        </div>
      </form>
      <!--/.row-->
    </div><!-- /.card card-outline card-info -->


    <!-- ====================== 
            ADD Footer
     ====================== -->
	<jsp:include page="${footer_url}"></jsp:include>

  </div>
  <!-- ./wrapper -->

 
  <!-- Select2 -->
  <script src="admin/plugins/select2/js/select2.full.min.js"></script>
  <!-- Bootstrap4 Duallistbox -->
  <script src="admin/plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>

  <script>
    $(function () {
      //Initialize Select2 Elements
      $('.select2').select2()

      //Initialize Select2 Elements
      $('.select2bs4').select2({
        theme: 'bootstrap4'
      })



      //Bootstrap Duallistbox
      $('.duallistbox').bootstrapDualListbox()



    })
  </script>

</body>

</html>