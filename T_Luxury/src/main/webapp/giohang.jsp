<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>

<%
List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

int sum = 0;
int ship = 30000; 
double vatRate = 0.08; 
%>

<!DOCTYPE html>
<html>
<head>
    <title>T Luxury</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/giohang.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.jpg">
</head>
<body>

<!-- HEADER -->
<header>
    <a href="${pageContext.request.contextPath}/index.jsp" class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.jpg">
        <span>T Luxury</span>
    </a>
    <nav>
        <a href="index.jsp">🏡 Trang chủ</a>
        <a href="sanpham.jsp">🌷 Sản phẩm</a>
        <a href="lienhe.jsp">📞 Liên hệ</a>
        <a href="giohang.jsp" class="active">🧺 Giỏ hàng</a>
        <%
		String user = (String) session.getAttribute("user");
		%>
		
		<% if(user != null){ %>
		    <span>👤 <%= user %></span>
		    <a href="logout.jsp" class="btn">Đăng xuất</a>
		<% } else { %>
		    <a href="login.jsp" class="btn">Đăng nhập</a>
		<% } %>
    </nav>
</header>

<form action="sanpham.jsp" method="get" class="search">
    <input type="text" name="keyword" placeholder="🔍 Tìm kiếm hoa...">
    <button type="submit">Tìm kiếm</button>
</form>

<!-- DANH MỤC -->
<div class="category">
    <span>Hoa sinh nhật</span>
    <span>Hoa tình yêu</span>
    <span>Hoa cưới</span>
    <span>Hoa khai trương</span>
    <span>Hoa chia buồn</span>
    <span>Hoa trang trí</span>
    <span>Hoa 8/3 & 20/10</span>
</div>

<!-- CART -->
<div class="cart-container">

    <!-- LEFT -->
    <div class="cart-left">

        <% if(cart != null && !cart.isEmpty()){
            for(Map<String, Object> item : cart){

                int p = (int) item.get("price");
                int qty = (int) item.get("qty");
                sum += p * qty;
        %>

        <div class="cart-item">
            <img src="${pageContext.request.contextPath}/images/<%= item.get("img") %>">

            <div class="info">
                <h3><%= item.get("name") %></h3>
                <p>Giá: <%= p %> VND</p>
                <p>Số lượng: <%= qty %></p>

                <a href="remove.jsp?index=<%= cart.indexOf(item) %>"
				   onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng không?')">
				    <button class="btn">❌ Xóa</button>
				</a>
            </div>
        </div>

        <% } } else { %>

            <p>🛒 Giỏ hàng trống</p>

        <% } %>

    </div>

    <!-- RIGHT -->
    <div class="cart-right">

        <%
            double vat = sum * vatRate;

            // FREE SHIP nếu > 500k
            if(sum > 500000){
                ship = 0;
            }

            int total = (int)(sum + ship + vat);
        %>

        <h3>Tạm tính</h3>
        <p><%= sum %> VND</p>

        <p>🚚 Phí ship: <%= ship %> VND</p>

        <p>🧾 VAT (8%): <%= (int)vat %> VND</p>

        <h2>💰 Tổng: <%= total %> VND</h2>

        <form action="dathang.jsp" method="get">
            <input type="hidden" name="total" value="<%= total %>">
            <button class="btn">Thanh toán</button>
        </form>

    </div>

</div>

<!-- FOOTER -->
<footer class="footer">
    <div class="footer-container">

        <div class="footer-left">
            <h3>🌸 Cửa hàng hoa T Luxury</h3>
            <p>
                T Luxury – nơi mỗi đóa hoa là một tuyên ngôn của sự tinh tế.<br>
                Chúng tôi mang đến những thiết kế hoa tươi tinh tuyển,
                được chăm chút trong từng chi tiết để lan tỏa yêu thương mỗi ngày.
            </p>

            <div class="social">
                <a href="#"><img src="${pageContext.request.contextPath}/images/instagram.jpg"></a>
                <a href="#"><img src="${pageContext.request.contextPath}/images/facebook.jpg"></a>
            </div>
        </div>

        <div class="footer-middle">
            <h4>Liên hệ</h4>
            <p>📧 Tluxury@gmail.com</p>
            <p>📞 0363707812</p>
            <p>📍 TP. Hồ Chí Minh</p>
        </div>

        <div class="footer-right">
            <h4>WEBSHOP</h4>
            <p>Trang chủ</p>
            <p>Sản phẩm</p>
            <p>Giỏ hàng</p>
        </div>

    </div>
</footer>

</body>
</html>