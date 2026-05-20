<%@ page import="java.sql.*" %>
<%@ page import="T_Luxury_dao.DBConnection" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
int soLoaiHoa = 0;
int soSanPham = 0;
int soDonHang = 0;

try{
    Connection conn = DBConnection.getConnection();
    Statement st = conn.createStatement();
    ResultSet rs;

    rs = st.executeQuery("SELECT COUNT(*) FROM loai_hoa");
    if(rs.next()) soLoaiHoa = rs.getInt(1);

    rs = st.executeQuery("SELECT COUNT(*) FROM san_pham");
    if(rs.next()) soSanPham = rs.getInt(1);

    rs = st.executeQuery("SELECT COUNT(*) FROM don_hang");
    if(rs.next()) soDonHang = rs.getInt(1);

    conn.close();
}catch(Exception e){
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>T Luxury - Admin</title>
	<link rel="icon" href="${pageContext.request.contextPath}/images/logo.jpg">
<style>
body{
    margin:0;
    font-family:Segoe UI;
    display:flex;
    background:#f3e5f5;
}

/* MENU */
.sidebar{
    width:240px;
    background:#f8eafc;
    height:100vh;
    padding:20px;
    position:fixed;
}

.sidebar h2{
    color:#ba68c8;
}

.menu{
    list-style:none;
    padding:0;
}

.menu li{
    margin:15px 0;
}

.menu a{
    text-decoration:none;
    color:#8e24aa;
    display:block;
    padding:10px;
    border-radius:8px;
}

.menu a:hover{
    background:#d18ce0;
}

.menu a.active{
    background:#d18ce0;
    font-weight:bold;
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
.main{
    margin-left:260px;
    margin-top:80px;
    padding:30px;
    width:100%;
}

/* CARD */
.cards{
    display:flex;
    gap:20px;
}

.card{
    background:white;
    border-radius:20px;
    padding:20px;
    flex:1;
    text-align:center;
    box-shadow:0 4px 10px rgba(0,0,0,0.08);
}

.card img{
    width:100%;
    height:170px;
    object-fit:cover;
    border-radius:15px;
}

.card h3{
    color:#7b1fa2;
}

.card p{
    font-size:32px;
    font-weight:bold;
    color:#4a148c;
}
</style>
</head>

<body>

<!-- MENU -->
<aside class="sidebar">
<h2>🌸 T Luxury - Admin</h2>

<ul class="menu">
<li><a class="active" href="admin.jsp">🏠 Trang chủ</a></li>
<li><a href="LoaiHoa.jsp">🌷 Loại hoa</a></li>
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
<div class="main">
<h2 style="color:#6a1b9a;">Tổng quan hệ thống</h2>

<div class="cards">

<div class="card">
<img src="<%=request.getContextPath()%>/images/loai-hoa.jpg">
<h3>Loại hoa</h3>
<p><%= soLoaiHoa %></p>
</div>

<div class="card">
<img src="<%=request.getContextPath()%>/images/sanpham.jpg">
<h3>Sản phẩm</h3>
<p><%= soSanPham %></p>
</div>

<div class="card">
<img src="<%=request.getContextPath()%>/images/donhang.jpg">
<h3>Đơn hàng</h3>
<p><%= soDonHang %></p>
</div>

</div>

</div>

</body>
</html>