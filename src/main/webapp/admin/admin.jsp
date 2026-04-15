<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>T Luxury - Admin</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo.jpg">
</head>

<body>

<div class="admin-container">

    <!-- Sidebar -->
    <aside class="sidebar">
        <a href="admin.jsp" class="logo">🌸T Luxury - Admin</a>

        <ul class="menu">
		    <li><a href="admin.jsp" class="active">🏠 Trang chủ</a></li>
		    <li><a href="loaihoa.jsp">🌷 Loại hoa</a></li>
		    <li><a href="#">💐 Sản phẩm</a></li>
		    <li><a href="#">🛒 Đơn hàng</a></li>
		    <li><a href="#">👤 Người dùng</a></li>
		</ul>
    </aside>

    <!-- Main content -->
    <main class="main-content">

        <!-- Header -->
        <div class="topbar">
            <div></div>
            <div class="actions">
                <a href="#">👆 Xem website</a>
                <button class="logout">Đăng xuất</button>
            </div>
        </div>

        <!-- Dashboard -->
        <h2 class="title">TỔNG QUAN</h2>

        <div class="cards">

            <div class="card">
                <img src="${pageContext.request.contextPath}/images/loai-hoa.jpg" alt="">
                <h3>Loại hoa</h3>
                <p>12</p>
            </div>

            <div class="card">
                <img src="${pageContext.request.contextPath}/images/sanpham.jpg" alt="">
                <h3>Sản phẩm</h3>
                <p>150</p>
            </div>

            <div class="card">
                <img src="${pageContext.request.contextPath}/images/donhang.jpg" alt="">
                <h3>Đơn hàng</h3>
                <p>30</p>
            </div>

        </div>
		<div class="footer-box">
		     🌸 Cửa hàng hoa T Luxury <br>
		     <small>THANH_THI_THU - PTPMNM</small>
		</div>
    </main>

</div>

</body>
</html>