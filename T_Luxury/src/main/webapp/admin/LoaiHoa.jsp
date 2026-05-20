<%@ page import="java.util.*, T_Luxury_models.LoaiHoa, T_Luxury_dao.LoaiHoaDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    LoaiHoaDAO dao = new LoaiHoaDAO();

    String keyword = request.getParameter("keyword");
    List<LoaiHoa> list;

    if(keyword != null && !keyword.trim().isEmpty()){
        list = dao.search(keyword);
    } else {
        list = dao.getAll();
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T Luxury - Loại hoa</title>
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

/* HEADER TOP */
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

/* TABLE WRAPPER */
.table-wrapper {
    background: #d8c9dc;
    padding: 30px;
    border-radius: 25px;
}

/* TITLE */
h2 {
    color: #4a148c;
}

/* TABLE */
table {
    width: 100%;
    margin: auto;
    border-collapse: separate;
    border-spacing: 0 10px;
    table-layout: fixed;
}

th, td {
    text-align: center;
    vertical-align: middle;
    padding: 12px;
}

th {
    background: #c5a9cf;
    color: #4a148c;
}

td {
    background: #f5ecf9;
}

/* cột tác vụ */
th:last-child,
td:last-child {
    width: 220px;
    white-space: nowrap;
}

td:last-child .btn {
    display: inline-block;
    min-width: 55px;
    text-align: center;
    margin: 0 4px;
}

/* bo góc */
tr td:first-child {
    border-radius: 10px 0 0 10px;
}
tr td:last-child {
    border-radius: 0 10px 10px 0;
}

/* nút */
.btn {
    padding: 6px 14px;
    border-radius: 12px;
    color: white;
    text-decoration: none;
    font-weight: 500;
}

/* HEADER */
th {
    background: #c5a9cf;
    padding: 12px;
    color: #4a148c;
}

/* CELL */
td {
    background: #f5ecf9;
    padding: 12px;
}

/* bo góc */
tr td:first-child {
    border-radius: 10px 0 0 10px;
}
tr td:last-child {
    border-radius: 0 10px 10px 0;
}

/* BUTTON */
.btn {
    padding: 6px 14px;
    border-radius: 12px;
    color: white;
    text-decoration: none;
    margin: 2px;
}

.edit {
    background: linear-gradient(45deg, #ba68c8, #8e24aa);
}

.delete {
    background: linear-gradient(45deg, #ab47bc, #6a1b9a);
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
        <li><a class="active" href="<%= request.getContextPath() %>/admin/LoaiHoa.jsp">🌷 Loại hoa</a></li>
        <li><a href="<%= request.getContextPath() %>/admin/SanPham.jsp">💐 Sản phẩm</a></li>
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
    <input type="text" name="keyword"
           placeholder="🔍 Tìm kiếm loại hoa..."
           value="<%= keyword != null ? keyword : "" %>">
    <button type="submit">Tìm</button>
</form>

    <a class="btn-add" href="<%= request.getContextPath() %>/admin/ThemLoaiHoa.jsp">
        + Thêm loại hoa
    </a>

</div>

<!-- TABLE -->
<div class="table-wrapper">

<h2>Danh sách loại hoa</h2>

<table>
    <tr>
        <th>Mã loại hoa</th>
        <th>Loại hoa</th>
        <th>Tác vụ</th>
    </tr>

    <% if(list != null && !list.isEmpty()){ 
    for(LoaiHoa l : list){ %>

<tr>
    <td><%= l.getId() %></td>
    <td><%= l.getTenLoai() %></td>
    <td>
        <a class="btn edit"
           href="<%= request.getContextPath() %>/admin/SuaLoaiHoa.jsp?id=<%= l.getId() %>">
            Sửa
        </a>

        <a class="btn delete"
           href="<%= request.getContextPath() %>/admin/XacNhanXoaLoaiHoa.jsp?id=<%= l.getId() %>">
            Xóa
        </a>
    </td>
</tr>

<% } } else { %>

<tr>
    <td colspan="3">⚠️ Không có dữ liệu</td>
</tr>

<% } %>
</table>

</div>

</main>

</body>
</html>