<%@ page import="T_Luxury_dao.DonHangDAO, T_Luxury_models.DonHang" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    DonHangDAO dao = new DonHangDAO();
    DonHang dh = dao.getById(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa đơn hàng</title>

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
    margin-top: 70px;
    padding: 30px;
    width: 100%;
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
}

/* FORM BOX */
.form-box {
    background: #dcd0df;
    padding: 30px;
    border-radius: 20px;
    width: 100%;
    max-width: 550px;
    margin: auto;
}

/* FORM */
.form-group {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
}

.form-group label {
    width: 180px;
    font-size: 14px;
}

.form-group input {
    flex: 1;
    padding: 10px;
    border-radius: 20px;
    border: none;
    background: #c7b0cc;
}

/* BUTTON */
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

<div class="title">✏️ Sửa đơn hàng</div>

<div class="form-box">

<form action="<%= request.getContextPath() %>/DonHangServlet" method="post">

<input type="hidden" name="action" value="update">
<input type="hidden" name="id" value="<%= dh.getId() %>">

<div class="form-group">
    <label>User ID:</label>
    <input type="number" name="nguoiDungId" value="<%= dh.getNguoiDungId() %>">
</div>

<div class="form-group">
    <label>Tổng tiền:</label>
    <input type="number" name="tongTien" value="<%= dh.getTongTien() %>">
</div>

<div class="form-group">
    <label>Trạng thái:</label>
    <input type="text" name="trangThai" value="<%= dh.getTrangThai() %>">
</div>

<div class="form-group">
    <label>Thanh toán:</label>
    <input type="text" name="trangThaiThanhToan" value="<%= dh.getTrangThaiThanhToan() %>">
</div>

<div class="form-group">
    <label>Phương thức:</label>
    <input type="text" name="phuongThucThanhToan" value="<%= dh.getPhuongThucThanhToan() %>">
</div>

<div class="form-group">
    <label>Tên người gửi:</label>
    <input type="text" name="tenNguoiGui" value="<%= dh.getTenNguoiGui() %>">
</div>

<div class="form-group">
    <label>SĐT người gửi:</label>
    <input type="text" name="sdtNguoiGui" value="<%= dh.getSdtNguoiGui() %>">
</div>

<div class="form-group">
    <label>Tên người nhận:</label>
    <input type="text" name="tenNguoiNhan" value="<%= dh.getTenNguoiNhan() %>">
</div>

<div class="form-group">
    <label>SĐT người nhận:</label>
    <input type="text" name="sdtNguoiNhan" value="<%= dh.getSdtNguoiNhan() %>">
</div>

<div class="form-group">
    <label>Địa chỉ:</label>
    <input type="text" name="diaChiNhan" value="<%= dh.getDiaChiNhan() %>">
</div>

<div class="form-group">
    <label>Lời nhắn:</label>
    <input type="text" name="loiNhan" value="<%= dh.getLoiNhan() %>">
</div>

<div class="form-group">
    <label>Yêu cầu khác:</label>
    <input type="text" name="yeuCauKhac" value="<%= dh.getYeuCauKhac() %>">
</div>

<div class="btn-group">
    <a href="<%= request.getContextPath() %>/admin/DonHang.jsp">
        <button type="button" class="btn back">Quay lại</button>
    </a>

    <button type="submit" class="btn save">Cập nhật</button>
</div>

</form>

</div>

</main>

</body>
</html>