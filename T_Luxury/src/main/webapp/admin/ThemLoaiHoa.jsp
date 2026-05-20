<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm loại hoa</title>

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

.menu a.active{
    background: #d18ce0;
    color: #6a1b9a;
    font-weight: bold;
    box-shadow: 0 3px 8px rgba(0,0,0,0.12);
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
    margin-left: 260px;
    margin-top: 80px;
    padding: 20px;
    width: 100%;
}

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
}

/* FORM BOX */
.form-box {
    background: #d8c9dc;
    padding: 40px;
    border-radius: 20px;
    margin-top: 20px;
    width: 60%;
    margin-left: auto;
    margin-right: auto;
}

/* INPUT GROUP */
.form-group {
    margin-bottom: 25px;
    display: flex;
    align-items: center;
    gap: 20px;
}

.form-group label {
    width: 150px;
    font-size: 18px;
}

.form-group input {
    flex: 1;
    padding: 10px 20px;
    border-radius: 20px;
    border: none;
    background: #c5a9cf;
}

/* BUTTONS */
.btn-group {
    display: flex;
    justify-content: center;
    gap: 40px;
    margin-top: 30px;
}

.btn {
    padding: 10px 30px;
    border-radius: 20px;
    border: none;
    cursor: pointer;
    font-size: 16px;
}

.back {
    background: #c5a9cf;
}

.save {
    background: #8e24aa;
    color: white;
}
</style>
</head>

<body>

<!-- SIDEBAR -->
<aside class="sidebar">
    <h2>🌸 T Luxury - Admin</h2>
    <ul class="menu">
        <li><a href="admin.jsp">🏠 Trang chủ</a></li>
        <li><a class="active" href="LoaiHoa.jsp">🌷 Loại hoa</a></li>
        <li><a href="SanPham.jsp">💐 Sản phẩm</a></li>
        <li><a href="DonHang.jsp">🛒 Đơn hàng</a></li>
        <li><a href="NguoiDung.jsp">👤 Người dùng</a></li>
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

<div class="title">Thêm loại hoa</div>

<div class="form-box">

<form action="<%= request.getContextPath() %>/LoaiHoaServlet" method="post">

    <input type="hidden" name="action" value="add">

    <div class="form-group">
        <label>Mã loại hoa:</label>
        <input type="text" value="AUTO" disabled>
    </div>

    <div class="form-group">
        <label>Loại hoa:</label>
        <input type="text" name="tenLoai" required>
    </div>

    <div class="btn-group">
        <a href="<%= request.getContextPath() %>/admin/LoaiHoa.jsp">
            <button type="button" class="btn back">Quay lại</button>
        </a>

        <button type="submit" class="btn save">Thêm mới</button>
    </div>

</form>

</div>

</main>

</body>
</html>