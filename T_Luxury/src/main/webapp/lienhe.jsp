<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>T Luxury</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/lienhe.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.jpg">
</head>
<body>

<header>
	<a href="${pageContext.request.contextPath}/index.jsp" class="logo">
	    <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="logo">
	    <span>T Luxury</span>
	</a>
   	<nav>
	    <a href="index.jsp" >🏡 Trang chủ</a>
	    <a href="sanpham.jsp">🌷 Sản phẩm</a>
	    <a href="lienhe.jsp" class="active">📞 Liên hệ</a>
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

<div class="contact-box">
    <h2>Liên hệ với T Luxury</h2>
    <p>Nếu bạn có bất kỳ thắc mắc hoặc yêu cầu đặc biệt, hãy liên hệ với chúng tôi 💐</p>
    
    <%
	String name = request.getParameter("name");
	
	if(name != null){
	%>
	    <p style="color: green; font-weight: bold;">
	        Gửi thành công 💐 T Luxury sẽ liên hệ lại sớm!
	    </p>
	<%
	}
	%>

    <form action="lienhe.jsp" method="post" onsubmit="return clearForm()">
	    <input type="text" name="name" placeholder="Họ tên" required>
	    <input type="email" name="email" placeholder="Email" required>
	    <textarea name="message" placeholder="Nội dung" required></textarea>
	
	    <button type="submit">Gửi</button>
	</form>
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
			    <a href="#">
			        <img src="${pageContext.request.contextPath}/images/instagram.jpg" alt="Instagram">
			    </a>
			    <a href="#">
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