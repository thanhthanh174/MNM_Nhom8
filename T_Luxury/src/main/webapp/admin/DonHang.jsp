<%@ page import="java.util.*, T_Luxury_models.DonHang, T_Luxury_dao.DonHangDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    List<DonHang> list = (List<DonHang>) request.getAttribute("list");

    if(list == null){
        DonHangDAO dao = new DonHangDAO();
        list = dao.getAllDonHang();
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T Luxury - Đơn hàng</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/logo.jpg">
<style>
body {
    margin: 0;
    font-family: 'Segoe UI', sans-serif;
    display: flex;
    background: #f3e5f5;
}

/* SIDEBAR */
.sidebar {
    width: 240px;
    background: #f8eafc;
    height: 100vh;
    padding: 20px;
    position: fixed;
}

.sidebar h2 {
    color: #ba68c8;
    font-style: italic;
}

.menu { list-style: none; padding: 0; }
.menu li { margin: 15px 0; }

.menu a {
    text-decoration: none;
    color: #8e24aa;
    font-weight: 500;
    display: block;
    padding: 8px;
    border-radius: 5px;
}

.menu a:hover {
    background: #e1bee7;
}


/* HEADER */
.top-header {
    position: fixed;
    top: 0;
    left: 280px;
    right: 0;
    height: 60px;
    background: #e1bee7;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 30px;
    box-sizing: border-box;
    z-index: 1000;
}

.top-header .left {
    font-size: 20px;
    font-weight: bold;
    color: #7b1fa2;
}

.top-header .right {
    display: flex;
    align-items: center;
    gap: 18px;
}

.top-header .right a {
    text-decoration: none;
    color: #6a1b9a;
    font-weight: 500;
}

.top-header .right span {
    color: #4a148c;
    font-weight: 600;
}

.top-header .btn {
    background: #8e24aa;
    color: white !important;
    padding: 7px 14px;
    border-radius: 10px;
    text-decoration: none;
    font-size: 14px;
    transition: 0.3s;
}

.top-header .btn:hover {
    background: #6a1b9a;
}

/* MAIN */
.main-content {
    margin-left: 300px;
    margin-top: 70px;
    padding: 30px;
    width: 100%;
}

/* TOP BAR */
.top-bar {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

/* BUTTON ADD */
.btn-add {
    background: linear-gradient(45deg, #ab47bc, #8e24aa);
    color: white;
    padding: 10px 18px;
    border-radius: 12px;
    text-decoration: none;
}

/* TABLE WRAPPER */
.table-wrapper {
    background: #d8c9dc;
    padding: 25px;
    border-radius: 25px;
    overflow-x: auto;
}

/* TITLE */
h2 {
    color: #4a148c;
}

/* TABLE */
table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 10px;
    font-size: 13px;
}

/* HEADER */
th {
    background: #c5a9cf;
    padding: 10px;
    color: #4a148c;
}

/* CELL */
td {
    background: #f5ecf9;
    padding: 10px;
}

/* BO GÓC */
tr td:first-child {
    border-radius: 10px 0 0 10px;
}
tr td:last-child {
    border-radius: 0 10px 10px 0;
}

/* STATUS */
.status {
    padding: 5px 10px;
    border-radius: 10px;
    color: white;
    font-size: 12px;
}

.Cho_xac_nhan { background: orange; }
.Dang_giao { background: #42a5f5; }
.Hoan_thanh { background: #66bb6a; }

/* BUTTON */
.btn{
    display: inline-block;
    min-width: 58px;
    text-align: center;
    padding: 6px 14px;
    border-radius: 12px;
    color: white;
    text-decoration: none;
    margin: 2px;
    font-weight: 500;
}

.edit {
    background: linear-gradient(45deg, #ba68c8, #8e24aa);
}

.delete {
    background: linear-gradient(45deg, #ab47bc, #6a1b9a);
}
/* SEARCH */
.search-box {
    background: #e1bee7;
    padding: 10px 20px;
    border-radius: 30px;
    display: flex;
    align-items: center;
    gap: 10px;
}

.search-box input {
    border: none;
    outline: none;
    background: transparent;
    font-size: 14px;
}

.search-box button {
    background: white;
    border: none;
    padding: 5px 15px;
    border-radius: 20px;
    cursor: pointer;
}
.menu a.active{
    background: #d18ce0;
    color: #6a1b9a;
    font-weight: bold;
    box-shadow: 0 3px 8px rgba(0,0,0,0.12);
}
</style>

</head>

<body>

<!-- SIDEBAR -->
<aside class="sidebar">
    <h2>🌸 T Luxury - Admin</h2>
    <ul class="menu">
        <li><a href="<%= request.getContextPath() %>/admin/admin.jsp">🏠 Trang chủ</a></li>
        <li><a href="<%= request.getContextPath() %>/admin/LoaiHoa.jsp">🌷 Loại hoa</a></li>
        <li><a href="<%= request.getContextPath() %>/admin/SanPham.jsp">💐 Sản phẩm</a></li>
        <li><a class="active" href="<%= request.getContextPath() %>/admin/DonHang.jsp">🛒 Đơn hàng</a></li>
        <li><a href="<%= request.getContextPath() %>/admin/NguoiDung.jsp">👤 Người dùng</a></li>
    </ul>
</aside>

<!-- HEADER -->
<div class="top-header">
    <div class="left"></div>

    <div class="right">
        <a href="<%= request.getContextPath() %>/index.jsp">🌐 Xem website</a>
        <%
		String user = (String) session.getAttribute("user");
		%>
		
		<% if(user != null){ %>
		    <span>👤 <%= user %></span>
		    <a href="<%= request.getContextPath() %>/logout.jsp" 
			   class="btn"
			   onclick="return confirm('Bạn có chắc muốn đăng xuất không?');">
			   Đăng xuất
			</a>
		<% } else { %>
		    <a href="login.jsp" class="btn">Đăng nhập</a>
		<% } %>
    </div>
</div>

<!-- MAIN -->
<main class="main-content">

<div class="top-bar">

<form action="<%= request.getContextPath() %>/DonHangServlet" method="get" class="search-box">
        <input type="text" name="keyword" placeholder="🔍 Tìm người gửi / người nhận...">
        <button type="submit">Tìm</button>
    </form>
    <a class="btn-add" href="<%= request.getContextPath() %>/admin/ThemDonHang.jsp">
        + Thêm đơn hàng
    </a>
</div>

<div class="table-wrapper">

<h2>Danh sách đơn hàng</h2>

<table>
<tr>
    <th>ID</th>
    <th>User</th>
    <th>Tổng</th>
    <th>TT</th>
    <th>PTTT</th>
    <th>Trạng thái</th>
    <th>Người gửi</th>
    <th>SĐT</th>
    <th>Người nhận</th>
    <th>SĐT</th>
    <th>Địa chỉ</th>
    <th>Ngày</th>
    <th>Giờ</th>
    <th>Lời nhắn</th>
    <th>Khác</th>
    <th>Thao tác</th>
</tr>

<% for(DonHang dh : list){ %>
<tr>
    <td><%= dh.getId() %></td>
    <td><%= dh.getNguoiDungId() %></td>
    <td><%= dh.getTongTien() %></td>
    <td><%= dh.getTrangThaiThanhToan() %></td>
    <td><%= dh.getPhuongThucThanhToan() %></td>

    <td>
        <span class="status <%= dh.getTrangThai() %>">
            <%= dh.getTrangThai() %>
        </span>
    </td>

    <td><%= dh.getTenNguoiGui() %></td>
    <td><%= dh.getSdtNguoiGui() %></td>
    <td><%= dh.getTenNguoiNhan() %></td>
    <td><%= dh.getSdtNguoiNhan() %></td>
    <td><%= dh.getDiaChiNhan() %></td>
    <td><%= dh.getNgayGiao() %></td>
    <td><%= dh.getThoiGianGiao() %></td>
    <td><%= dh.getLoiNhan() %></td>
    <td><%= dh.getYeuCauKhac() %></td>

    <td>
        <a class="btn edit"
   href="<%= request.getContextPath() %>/admin/SuaDonHang.jsp?id=<%= dh.getId() %>">
    Sửa
</a>

<a class="btn delete"
   href="<%= request.getContextPath() %>/admin/XacNhanXoaDonHang.jsp?id=<%= dh.getId() %>">
    Xóa
</a>
    </td>
</tr>
<% } %>

</table>

</div>

</main>

</body>
</html>