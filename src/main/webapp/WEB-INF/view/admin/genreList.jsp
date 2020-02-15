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
              <h1>장르</h1>
            </div>
          </div>
        </div><!-- /.container-fluid -->
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <button type="button" class="btn btn-primary" style="float:left;">+ 추가</button>



                <form class="form-inline ml-3" style="float: right; margin-top: 4px;">
                  <div class="card-tools">
                    <div class="input-group input-group-sm" style="width: 300px;">
                      <input type="text" name="table_search" class="form-control float-right" placeholder="검색">

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
                      <th>장르명</th>
                      <th>관리</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>드라마</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>로맨스</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>애니메이션</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>음악</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td>코미디</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>6</td>
                      <td>틴에이저</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>7</td>
                      <td>범죄</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>8</td>
                      <td>재난</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>9</td>
                      <td>역사</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>10</td>
                      <td>스포츠</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>11</td>
                      <td>SF</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>12</td>
                      <td>모험</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>13</td>
                      <td>미스터리</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>14</td>
                      <td>전쟁</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>15</td>
                      <td>키즈</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>16</td>
                      <td>판타지</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>17</td>
                      <td>가족</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>18</td>
                      <td>공포</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>19</td>
                      <td>스릴러</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>20</td>
                      <td>액션</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>21</td>
                      <td>다큐멘터리</td>
                      <td>
                        <div>
                          <button type="button" class="btn btn-sm btn-primary">수정</button>
                          <button type="button" class="btn btn-sm btn-danger">삭제</button>
                        </div>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div> <!-- /.card-body -->
            </div> <!-- /.card -->
          </div> <!-- /.col-12 -->
        </div> <!-- /.row -->
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

</body>

</html>