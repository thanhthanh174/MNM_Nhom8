<%@ page import="T_Luxury_dao.SanPhamDAO, T_Luxury_models.SanPham" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String idParam = request.getParameter("id");

    if(idParam == null){
        response.sendRedirect(request.getContextPath() + "/admin/SanPham.jsp");
        return;
    }

    int id = Integer.parseInt(idParam);

    SanPhamDAO dao = new SanPhamDAO();
    SanPham sp = dao.getById(id);

    if(sp == null){
        response.sendRedirect(request.getContextPath() + "/admin/SanPham.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xóa sản phẩm</title>

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
    box-sizing: border-box;
}

.sidebar h2 {
    color: #ba68c8;
    font-style: italic;
}

.menu {
    list-style: none;
    padding: 0;
}

.menu li {
    margin: 15px 0;
}

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

.menu a.active{
    background: #d18ce0;
    color: #6a1b9a;
    font-weight: bold;
    box-shadow: 0 3px 8px rgba(0,0,0,0.12);
}

/* MAIN */
.main-content {
    margin-left: 260px;
    flex: 1;
    padding: 20px;
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


/* TITLE */
.title {
    background: linear-gradient(90deg, #8e24aa, #ba68c8);
    color: white;
    padding: 12px;
    border-radius: 12px;
    text-align: center;
    width: 50%;
    margin: 25px auto;
    font-size: 20px;
    font-weight: bold;
    margin-top: 90px;
}

.form-box {
    background: #dcd0df;
    padding: 30px;
    border-radius: 20px;
    width: 100%;
    max-width: 500px;
    margin: auto;
}

.form-group {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
}

.form-group label {
    width: 150px;
}

.form-group input {
    flex: 1;
    padding: 10px;
    border-radius: 20px;
    border: none;
    background: #c7b0cc;
}

.btn-group {
    text-align: center;
    margin-top: 25px;
}

.btn {
    padding: 10px 25px;
    border: none;
    border-radius: 20px;
    margin: 0 10px;
    cursor: pointer;
}

.back {
    background: #c7b0cc;
}

.delete {
    background: #8e24aa;
    color: white;
}
</style>

</head>
<body>

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
<main class="main-content">
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



<div class="title">🗑 Xóa sản phẩm</div>

<div class="form-box">

    <div class="form-group">
        <label>ID:</label>
        <input type="text" value="<%= sp.getId() %>" disabled>
    </div>

    <div class="form-group">
        <label>Tên sản phẩm:</label>
        <input type="text" value="<%= sp.getTenSP() %>" disabled>
    </div>

    <div class="form-group">
        <label>Giá:</label>
        <input type="text" value="<%= sp.getGia() %>" disabled>
    </div>

    <div class="btn-group">
        <a href="<%= request.getContextPath() %>/admin/SanPham.jsp">
            <button type="button" class="btn back">Quay lại</button>
        </a>

        <a href="<%= request.getContextPath() %>/SanPhamServlet?action=delete&id=<%= sp.getId() %>">
            <button type="button" class="btn delete">Xóa</button>
        </a>
    </div>

</div>

</main>

</body>
</html>