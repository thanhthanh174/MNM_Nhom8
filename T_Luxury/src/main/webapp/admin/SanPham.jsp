<%@ page import="java.util.*" %>
<%@ page import="T_Luxury_models.SanPham" %>
<%@ page import="T_Luxury_dao.SanPhamDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    SanPhamDAO dao = new SanPhamDAO();

    String keyword = request.getParameter("keyword");
    List<SanPham> list;

    if(keyword != null && !keyword.trim().isEmpty()){
        list = dao.search(keyword);
    } else {
        list = dao.getAllSanPham();
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T Luxury - Sản phẩm</title>
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

/* SEARCH */
.search-box {
    background: #e1bee7;
    padding: 10px 20px;
    border-radius: 30px;
}

.search-box input {
    border: none;
    outline: none;
    background: transparent;
}

.search-box button {
    background: white;
    border: none;
    padding: 5px 15px;
    border-radius: 20px;
}

/* ADD BUTTON */
.btn-add {
    background: linear-gradient(45deg, #ab47bc, #8e24aa);
    color: white;
    padding: 10px 18px;
    border-radius: 12px;
    text-decoration: none;
}

/* TABLE */
.table-wrapper {
    background: #d8c9dc;
    padding: 30px;
    border-radius: 25px;
    overflow-x: auto;
}

h2 {
    color: #4a148c;
}

/* TABLE STYLE */
table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 10px;
}

th {
    background: #c5a9cf;
    padding: 12px;
    color: #4a148c;
    text-align: center;
}

td {
    background: #f5ecf9;
    padding: 12px;
    text-align: center;
}

/* bo góc */
tr td:first-child {
    border-radius: 10px 0 0 10px;
}
tr td:last-child {
    border-radius: 0 10px 10px 0;
}

/* IMAGE */
img {
    width: 60px;
    height: 60px;
    border-radius: 10px;
}

/* BUTTON */
.btn {
    padding: 5px 10px;
    border-radius: 12px;
    color: white;
    text-decoration: none;
    font-size: 13px;
    margin: 1px;
    display: inline-block;
}

.edit {
    background: linear-gradient(45deg, #ba68c8, #8e24aa);
}

.delete {
    background: linear-gradient(45deg, #ab47bc, #6a1b9a);
}
.action-cell{
    width: 160px;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
}
table{
    width:100%;
    table-layout: fixed;
}
.desc-col{
    width: 220px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
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
        <li><a class="active" href="<%= request.getContextPath() %>/admin/SanPham.jsp">💐 Sản phẩm</a></li>
        <li><a href="<%= request.getContextPath() %>/admin/DonHang.jsp">🛒 Đơn hàng</a></li>
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

<!-- TOP BAR -->
<div class="top-bar">

    <form method="get" class="search-box">
    <input type="text"
           name="keyword"
           placeholder="🔍 Tìm kiếm sản phẩm..."
           value="<%= keyword != null ? keyword : "" %>">

    <button type="submit">Tìm</button>
</form>

    <a class="btn-add" href="<%= request.getContextPath() %>/admin/ThemSanPham.jsp">
        + Thêm sản phẩm
    </a>

</div>

<!-- TABLE -->
<div class="table-wrapper">

<h2>Danh sách sản phẩm</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Giá</th>
        <th>Số lượng</th>
        <th>Mô tả</th>
        <th>Hình</th>
        <th>Loại</th>
        <th>Tác vụ</th>
    </tr>

    <% if(list != null && !list.isEmpty()){ 
	    for(SanPham sp : list){ %>
	
	<tr>
	    <td><%= sp.getId() %></td>
	    <td><%= sp.getTenSP() %></td>
	    <td><%= sp.getGia() %></td>
	    <td><%= sp.getSoLuong() %></td>
	    <td class="desc-col"><%= sp.getMoTa() %></td>
	    <td>
	        <img src="<%= request.getContextPath() %>/images/<%= sp.getHinhAnh() %>">
	    </td>
	    <td><%= sp.getIdLoai() %></td>
	    <td class="action-cell">
	        <a class="btn edit"
	           href="<%= request.getContextPath() %>/admin/SuaSanPham.jsp?id=<%= sp.getId() %>">Sửa</a>
	
	        <a class="btn delete"
	           href="<%= request.getContextPath() %>/admin/XacNhanXoaSanPham.jsp?id=<%= sp.getId() %>">Xóa</a>
	    </td>
	</tr>
	
	<% } } else { %>
	
	<tr>
	    <td colspan="8">⚠️ Không có dữ liệu sản phẩm</td>
	</tr>
	
	<% } %>

</table>

</div>

</main>

</body>
</html>