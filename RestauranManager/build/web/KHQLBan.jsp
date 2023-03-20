<%-- 
    Document   : KHQLBan
    Created on : Feb 21, 2023, 9:47:14 AM
    Author     : Admin
--%>

<%@page import="model.Customers"%>
<%@page import="model.Apartment"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Restaurant Management</title>

        <!-- Custom fonts for this template -->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <!-- Custom styles for this page -->
        <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="QLBan.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Restaurant Management</div>
                </a>

                <!-- Nav Item - Pages Collapse Menu -->
                

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <h5 class=" price position-relative text-uppercase mb-3"><span class="pr-3">Filter by price</span></h5>
                    <style>
                        .price{
                            color: white
                        }
                    </style>
                    <div class="price-size bg-light p-4 mb-30">
                        <form method="post" action="searchprice">
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" checked value="0" name="price" id="price-all">
                                <label class="custom-control-label" for="price-all">All Price</label>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" value="1" name="price" id="price-1">
                                <label class="custom-control-label" for="price-1">500.000-1.000.000</label>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" value="2" name="price" id="price-2">
                                <label class="custom-control-label" for="price-2">1.000.000-1.500.000</label>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" value="3" name="price" id="price-3">
                                <label class="custom-control-label" for="price-3">1.500.000-2.000.000</label>
                            </div>
                            <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                                <input type="radio" class="custom-control-input" value="4" name="price" id="price-4">
                                <label class="custom-control-label" for="price-4">&gt;2.000.000</label>
                            </div>
                            <input type="submit" class="btn btn-primary" value="Filter">
                        </form>

                    </div>
                    <style>
                        .price-size{
                            font-size: 12px;
                        }
                    </style>
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                       aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Quản Lý</span>
                    </a>
                    <%@include file="Component/dropdown.jsp" %>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <form class="form-inline">
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=session.getAttribute("username")%></span>
                                    <img class="img-profile rounded-circle"
                                         src="img/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Đăng Xuất
                                    </a>
                                </div>
                            </li>

                        </ul>
                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Restaurant Management</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>ID Bàn</th>
                                                <th>Khách Hàng</th>
                                                <th>Giờ Hẹn</th>
                                                <th>Giá </th>
                                                <th>Trạng Thái</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.ApaList}" var='a'>
                                                <tr>
                                                    <c:if test="${a.getIdKH()==0||sessionScope.Account.getIdKH()==a.getIdKH()}">
                                                        <td>
                                                        ${a.getIdPhong()}
                                                    </td>
                                                    <td>
                                                        <c:if test="${a.getIdKH()==0}">
                                                            Trống
                                                        </c:if>
                                                        <c:if test="${sessionScope.Account.getIdKH()==a.getIdKH()}">
                                                            ${sessionScope.cus.getTenKH()};
                                                        </c:if>    
                                                        
                                                    </td>
                                                    <td>
                                                        <c:if test="${a.getThangThue()!=0}">
                                                            ${a.getThangThue()}
                                                        </c:if>
                                                        <c:if test="${a.getThangThue()==0}">
                                                            Trống
                                                        </c:if>
                                                    </td>
                                                    <td>${String.format("%.0f", a.getGiaThue())}</td>
                                                    <td>
                                                        <c:if test="${a.getTrangThai()==1}">
                                                            Được Đặt
                                                        </c:if>
                                                        <c:if test="${a.getTrangThai()==3}">
                                                            Đang dọn dẹp
                                                        </c:if>    
                                                        <c:if test="${a.getTrangThai()==0}">
                                                            Trống
                                                        </c:if>     
                                                    <td>
                                                        <c:if test="${a.getTrangThai()!=3&&a.getTrangThai()!=1}">
                                                            <a href="CRUD?id=${a.getIdPhong()}&type=edit&manage=Apartment" class="btn btn-info btn-circle">
                                                            <i class="fas fa-pen"></i>
                                                        </a>
                                                        </c:if>    
                                                        
                                                    </td>
                                                    </c:if>
                                                    
                                                </tr>
                                            </c:forEach>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Bạn muốn Đăng Xuất ?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Chọn Đăng Xuất bên dưới nếu muốn kết thúc phiên đăng nhập.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Hủy</button>
                        <a class="btn btn-primary" href="Login.jsp">Đăng Xuất</a>
                    </div>
                </div>
            </div>
        </div>


        <script>
            function confDel(id) {
                if (confirm("Bạn Muốn Xóa Bàn Này ?") == true) {
                    document.location.href = "CRUD?id=" + id + "&type=del&manage=Apartment";
                } else {

                }
            }
        </script>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/datatables-demo.js"></script>

    </body>

</html>
