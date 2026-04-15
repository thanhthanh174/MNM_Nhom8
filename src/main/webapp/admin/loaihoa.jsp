<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, T_Luxury_models.LoaiHoa" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>T Luxury - Quản lý loại hoa</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/logo.jpg">
</head>

<body>

<div class="admin-container">

    <!-- Sidebar -->
    <aside class="sidebar">
        <a href="admin.jsp" class="logo">🌸T Luxury - Admin</a>

        <ul class="menu">
            <li><a href="admin.jsp">🏠 Trang chủ</a></li>
            <a href="${pageContext.request.contextPath}/loaihoa" class="active">🌷 Loại hoa</a>
            <li><a href="#">💐 Sản phẩm</a></li>
            <li><a href="#">🛒 Đơn hàng</a></li>
            <li><a href="#">👤 Người dùng</a></li>
        </ul>
    </aside>

    <!-- Main -->
    <main class="main-content">

        <!-- Topbar -->
        <div class="topbar">
            <div></div>
            <div class="actions">
                <a href="#">👆 Xem website</a>
                <button class="logout">Đăng xuất</button>
            </div>
        </div>

        <!-- Content -->
        <h2 class="title">QUẢN LÝ LOẠI HOA</h2>

        <!-- Search + Button -->
        <div class="toolbar">
            <div class="search-box">
                <input type="text" placeholder="🔍 Tìm kiếm loại hoa...">
                <button>Tìm kiếm</button>
            </div>

            <a href="themloaihoa.jsp">
                <button class="add-btn">+ Thêm loại hoa</button>
            </a>
        </div>

        <!-- Table -->
        <table class="table">
            <thead>
                <tr>
                    <th>Mã loại hoa</th>
                    <th>Loại hoa</th>
                    <th>Tác vụ</th>
                </tr>
            </thead>

            <tbody>
			<%
			    List<LoaiHoa> list = (List<LoaiHoa>) request.getAttribute("dsLoaiHoa");
			
			    if(list != null){
			        for(LoaiHoa lh : list){
			%>
			    <tr>
			        <td><%= lh.getId() %></td>
			        <td><%= lh.getTenLoai() %></td>
			        <td>
			            <button class="btn edit">Sửa</button>
			            <button class="btn delete">Xóa</button>
			        </td>
			    </tr>
			<%
			        }
			    }
			%>
			</tbody>
        </table>
        		<div class="footer-box">
		     🌸 Cửa hàng hoa T Luxury <br>
		     <small>THANH_THI_THU - PTPMNM</small>
		</div>
    </main>
</div>
</body>
</html>