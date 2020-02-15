<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="sidebar_url" value="/WEB-INF/view/client/mypageSidebar.jsp"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ONeflix</title>

    <link rel="stylesheet" href="client/css/all.css">
    <link rel="stylesheet" href="../admin/css/adminlte.min.css">
    <link rel="stylesheet" href="../admin/css/adminlte.css">
    <link rel="stylesheet" href="client/css/membership.css">
</head>

<body>

	<!-- SIDE BAR -->
    <jsp:include page="${sidebar_url}"></jsp:include>

    <div class="page-body">
        <!-- 이전 결제 내역 -->
        <div style="background-color: #080808;">
            <p>이용권</p><br><br>
            <button type="button" class="btn-close">해지하기</button>
        </div>
        <div style="background-color: #080808;">
            <table class="table table-hover table-dark">
                <thead class="thead-grey">
                    <tr>
                        <th scope="col">상태</th>
                        <th scope="col">상품명</th>
                        <th scope="col">결제금액</th>
                        <th scope="col">구매일</th>
                        <th scope="col">유효기간</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>이용중</td>
                        <td>정기권</td>
                        <td>12,400원</td>
                        <td>2020.02.04 오전 11:26</td> <!-- date format -->
                        <td>2020.03.04 오후 11:59</td> <!-- date format -->
                    </tr>
                    <tr>
                        <td>종료</td>
                        <td>정기권</td>
                        <td>12,400원</td>
                        <td>2020.01.04 오전 11:24</td> <!-- date format -->
                        <td>2020.02.04 오후 11:59</td> <!-- date format -->
                    </tr>
                    <tr>
                        <td>종료</td>
                        <td>정기권</td>
                        <td>12,400원</td>
                        <td>2019.12.04 오전 11:24</td> <!-- date format -->
                        <td>2020.02.04 오후 11:59</td> <!-- date format -->
                    </tr>

                </tbody>
            </table>
            <div class="card-footer clearfix">
                <!--page-link, m-0, float-right css 없음-->
                <ul class="pagination pagination-sm m-0 float-right">
                    <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
            </div>
            <!--card-footer-->
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>


</body>

</html>