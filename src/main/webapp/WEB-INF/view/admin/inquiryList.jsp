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
                      <th>카테고리</th>
                      <th>고객명</th>
                      <th>문의제목</th>
                      <th>문의날짜</th>
                      <th>답변날짜</th>
                      <th class="th-width">관리</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="inquiry" items="${inquiryList}">
                    <tr>
                      <td>${inquiry.inquiryId}</td>
                      <td>${inquiry.inquiryType}</td>
                      <td>${inquiry.memberEmail}</td>
                      <td>${inquiry.inquiryTitle}</td>
                      <td>${inquiry.receiveDate}</td>
                      <td>${inquiry.replyDate}</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-info" onClick="location.href='/getInquiryProc.mdo?inquiryId=${inquiry.inquiryId}'">답변하기</button>
                          <div class="custom-control custom-switch custom-float">
                            <input type="checkbox" class="custom-control-input" id="customSwitch1">
                          </div>
                        </div>
                      </td>
                    </tr>
                    </c:forEach>
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