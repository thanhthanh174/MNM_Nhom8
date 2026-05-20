<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>T Luxury</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.jpg">
</head>
<body>

<header>
	<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
	    <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="logo">
	    <span>T Luxury</span>
	</a>
   	<nav>
	    <a href="index.jsp" class="active">🏡 Trang chủ</a>
	    <a href="sanpham.jsp">🌷 Sản phẩm</a>
	    <a href="lienhe.jsp">📞 Liên hệ</a>
	    <a href="giohang.jsp">🧺 Giỏ hàng</a>
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

<div class="category">
    <span>Hoa sinh nhật</span>
    <span>Hoa tình yêu</span>
    <span>Hoa cưới</span>
    <span>Hoa khai trương</span>
    <span>Hoa chia buồn</span>
    <span>Hoa trang trí</span>
    <span>Hoa 8/3 & 20/10</span>
</div>

<form action="sanpham.jsp" method="get" class="search">
    <input type="text" name="keyword" placeholder="🔍 Tìm kiếm hoa...">
    <button type="submit">Tìm kiếm</button>
</form>

<div class="title">
    <h1>Tinh giản trong thiết kế, tinh tế trong từng đóa hoa</h1>
    <p>Chuyên cung cấp hoa sinh nhật, khai trương, tình yêu – giao nhanh trong ngày</p>
    <a href="sanpham.jsp">
    	<button>Xem hoa</button>
    </a>
</div>

<div class="gallery">
    <a href="sanpham.jsp">
        <img src="${pageContext.request.contextPath}/images/hoa_cuc_hoa_mi.jpg">
    </a>
    <a href="sanpham.jsp">
        <img src="${pageContext.request.contextPath}/images/707ee0decbc4aed29f872c1598aeaf42.jpg">
    </a>
    <a href="sanpham.jsp">
        <img src="${pageContext.request.contextPath}/images/hoa_tulip_hong.jpg">
    </a>
    <a href="sanpham.jsp">
        <img src="${pageContext.request.contextPath}/images/hoa_huong_duong.jpg">
    </a>
    <a href="sanpham.jsp">
        <img src="${pageContext.request.contextPath}/images/3e6f8ddd985968c41a0e82abfb0bded5.webp">
    </a>
</div>

<div class="about">
    
    <!-- BÊN TRÁI -->
    <div class="about-text">
        <h2>T Luxury là ai?</h2>

        <p>
            T Luxury là cửa hàng hoa trực tuyến chuyên mang đến những thiết kế hoa tươi cao cấp 🌿,
            được tuyển chọn kỹ lưỡng và chăm chút trong từng chi tiết.
            Mỗi sản phẩm là sự hòa quyện giữa thẩm mỹ tinh giản và dấu ấn riêng 💐,
            phù hợp cho mọi dịp – từ những khoảnh khắc đời thường đến các sự kiện đặc biệt.
        </p>

        <p>
            Với định hướng đề cao trải nghiệm, T Luxury không chỉ cung cấp hoa 🌸,
            mà còn gửi gắm những thông điệp tinh tế thông qua dịch vụ tận tâm
            và chỉn chu trong từng khâu 🤍.
        </p>

		<a href="sanpham.jsp">
        	<button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

    <!-- BÊN PHẢI -->
    <div class="about-img">
        <img src="${pageContext.request.contextPath}/images/tiemhoa.jpg">
    </div>

</div>

<div class="banner-img">
    <img src="${pageContext.request.contextPath}/images/cua_hang_hoa.jpg">
</div>

<footer class="footer">
    <div class="footer-container">

        <!-- Cột 1 -->
        <div class="footer-left">
            <h3>🌸 Cửa hàng hoa T Luxury</h3>
            <p>
                T Luxury – nơi mỗi đóa hoa là một tuyên ngôn của sự tinh tế.<br>
                Chúng tôi mang đến những thiết kế hoa tươi tinh tuyển,
                được chăm chút trong từng chi tiết để lan tỏa yêu thương mỗi ngày.
            </p>

            <div class="social">
			    <a href="https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.instagram.com%2Ftluxury2026%3Ffbclid%3DIwZXh0bgNhZW0CMTAAYnJpZBExZVI3dkEyeGVlSVB2OTh4dnNydGMGYXBwX2lkEDIyMjAzOTE3ODgyMDA4OTIAAR6IEmmyQKmC0eye4c78yTpwlc8qOFmVYOLrib5iTyRe6zAKYs6-gS42LNJbPw_aem_g2aK07ym4bhKZeZTBMl4bQ&h=AUCYw-UftsrS_sEskMmV_MMtDtLLMuAHpv8SdK9-U2LliXSWdcACVCuS0dI_B6CPWY_iKRBkLx20FCOycw7hQ2Ym33cl8JNPDFGRynTpR0WIusg5EUlUMhZ-d4d57xk3gssG">
			        <img src="${pageContext.request.contextPath}/images/instagram.jpg" alt="Instagram">
			    </a>
			    <a href="https://www.facebook.com/share/18uPGJ2ikq/?mibextid=wwXIfr">
			        <img src="${pageContext.request.contextPath}/images/facebook.jpg" alt="Facebook">
			    </a>
			</div>
        </div>

        <!-- Cột 2 -->
        <div class="footer-middle">
            <h4>Liên hệ</h4>
            <p>📧 Tluxury@gmail.com</p>
            <p>📞 0363707812</p>
            <p>📍 TP. Hồ Chí Minh</p>
        </div>

        <!-- Cột 3 -->
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