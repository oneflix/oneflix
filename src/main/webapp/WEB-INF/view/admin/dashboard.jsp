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
      <div class="content-header">
        <div class="container-fluid">
          <div class="row mb-2">
            <div class="col-sm-6">
              <h1 class="m-0 text-dark">대시보드</h1>
            </div><!-- /.col -->
          </div><!-- /.row -->
        </div><!-- /.container-fluid -->
      </div>
      <!-- /.content-header -->

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          <!-- Small boxes (Stat box) -->
          <div class="row">
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-info">
                <div class="inner">
                  <h3>${movieList}<sup style="font-size: 20px">편</sup></h3>
                  <p>총 영화</p>
                </div>
                <div class="icon">
                  <i class="ion ion-film-marker"></i>
                </div>
                <a href="/getMovieList.mdo" class="small-box-footer">자세히 <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-success">
                <div class="inner">
                  <h3>${memberList}<sup style="font-size: 20px">명</sup></h3>

                  <p>총 회원수</p>
                </div>
                <div class="icon">
                  <i class="ion ion-ios-people"></i>
                </div>
                <a href="/getMemberList.mdo" class="small-box-footer">자세히 <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-warning">
                <div class="inner">
                  <h3>${inquiryList}<sup style="font-size: 20px">개</sup></h3>

                  <p>문의</p>
                </div>
                <div class="icon">
                  <i class="ion ion-email-unread"></i>
                </div>
                <a href="/getInquiryList.mdo" class="small-box-footer">자세히 <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-6">
              <!-- small box -->
              <div class="small-box bg-danger">
                <div class="inner">
                  <h3>${salseList}<sup style="font-size: 20px">￦</sup></h3>

                  <p>일매출</p>
                </div>
                <div class="icon">
                  <i class="ion ion-cash"></i>
                </div>
                <a href="/getSalesList.mdo" class="small-box-footer">자세히 <i class="fas fa-arrow-circle-right"></i></a>
              </div>
            </div>
            <!-- ./col -->
          </div>
          <!-- /.row -->

          <!-- Main row -->
          <div class="row">
            <section class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">신규 가입자 : </h3>
                  <a href="#" style="float: right;">more</a><br>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <table id="example1" class="table table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 10px">#</th>
                        <th>이메일</th>
                        <th>가입일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>${member.email }</td>
                        <td><p><fmt:formatDate value="${movie.movieRegDate}" pattern="yyyy-MM-dd"/></p></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
				</div>
            </section>
            <!-- /.card -->
            <section class="col-lg-6">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">신규 구독자 : </h3>
                  <a href="#" style="float: right;">more</a><br>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <table id="example2" class="table table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 10px">#</th>
                        <th>이메일</th>
                        <th>닉네임</th>
                        <th>이용권</th>
                        <th>구독일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>${member.email }</td>
                        <td>${member.nick }</td>
                       <c:forEach var="j" begin="0" end="${ticketList.size() }" step="1">
													<c:set var="ticket" value="${ticketList[j]}"/>
													<c:if test="${ticket.ticketId eq member.ticketId}">
													<c:set var="ticketName" value="${ticket.ticketName }"/>
													<td>${ticketName}</td>
													</c:if>
												</c:forEach>
                        <td><p><fmt:formatDate value="${movie.movieRegDate}" pattern="yyyy-MM-dd"/></p></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
				</div>
                <!-- /.card -->
            </section>

            <section class="col-lg-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">최근 등록한 영화</h3>
                  <a href="#" style="float: right;">more</a><br>
                </div>
                <!-- /.card-header -->
                <div class="card-body">
                  <table id="example3" class="table table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 10px">#</th>
                        <th>포스터</th>
                        <th>제목</th>
                        <th>장르</th>
                        <th>등록일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td><p>1</p></td>
												<td><img src="${movie.posterPath}"/></td>
												<td><p>${movie.movieTitle}</p></td>
												<td><p>
													<c:forEach var="genre" items="${genreList}">
														<c:if test="${movie.genreId1 eq genre.genreId}">
															${genre.genre}
														</c:if>
														<c:if test="${movie.genreId2 ne 0}">
															<c:if test="${genre.genreId eq movie.genreId2}">
																&nbsp;· ${genre.genre}
															</c:if>
														</c:if>
													</c:forEach>
													</p>
												</td>
												<td><p><fmt:formatDate value="${movie.movieRegDate}" pattern="yyyy-MM-dd"/></p></td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->

              </div>
              <!-- /.card -->
            </section>
          </div> <!-- /.row (main row) -->
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- ====================== 
            ADD Footer
    ====================== -->
    <jsp:include page="${footer_url}"></jsp:include>


  </div>
  <!-- ./wrapper -->

  <!-- jQuery -->
  <script src="admin/plugins/jquery/jquery.min.js"></script>
  <!-- jQuery UI 1.11.4 -->
  <script src="admin/plugins/jquery-ui/jquery-ui.min.js"></script>
  <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
  <script>
    $.widget.bridge('uibutton', $.ui.button)
  </script>
  <!-- Bootstrap 4 -->
  <script src="admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- ChartJS -->
  <script src="admin/plugins/chart.js/Chart.min.js"></script>
  <!-- Sparkline -->
  <script src="admin/plugins/sparklines/sparkline.js"></script>
  <!-- JQVMap -->
  <script src="admin/plugins/jqvmap/jquery.vmap.min.js"></script>
  <script src="admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
  <!-- jQuery Knob Chart -->
  <script src="admin/plugins/jquery-knob/jquery.knob.min.js"></script>
  <!-- daterangepicker -->
  <script src="admin/plugins/moment/moment.min.js"></script>
  <script src="admin/plugins/daterangepicker/daterangepicker.js"></script>
  <!-- Tempusdominus Bootstrap 4 -->
  <script src="admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
  <!-- Summernote -->
  <script src="admin/plugins/summernote/summernote-bs4.min.js"></script>
  <!-- overlayScrollbars -->
  <script src="admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
  <!-- AdminLTE App -->
  <script src="admin/js/adminlte.js"></script>
  <!-- AdminLTE dashboard demo (This is only for demo purposes) -->
  <script src="admin/js/dashboard.js"></script>
  <!-- AdminLTE for demo purposes -->
  <script src="admin/js/demo.js"></script>
  <!-- DataTables -->
  <script src="admin/plugins/datatables/jquery.dataTables.js"></script>
  <script src="admin/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
  <!-- page script -->
  
  <script>
    $(function () {
      // $("#example1").DataTable();
      $('#example1').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
      });
      $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
      });
      $('#example3').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false,
      });
    });
  </script>
</body>

</html>