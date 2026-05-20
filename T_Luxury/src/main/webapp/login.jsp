<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T Luxury</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<link rel="icon" href="${pageContext.request.contextPath}/images/logo.jpg">
</head>
<body>

<header>
    <a href="${pageContext.request.contextPath}/index.jsp" class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.jpg" alt="logo">
        <span>T Luxury</span>
    </a>

    <nav>
        <a href="index.jsp">🏡 Trang chủ</a>
        <a href="sanpham.jsp">🌷 Sản phẩm</a>
        <a href="lienhe.jsp">📞 Liên hệ</a>
        <a href="giohang.jsp">🧺 Giỏ hàng</a>

        <%
            String user = (String) session.getAttribute("user");
        %>

        <% if(user != null){ %>
            <span>👤 <%= user %></span>
            <a href="logout.jsp" class="btn"
               onclick="return confirm('Bạn có chắc muốn đăng xuất không?');">
               Đăng xuất
            </a>
        <% } else { %>
            <a href="login.jsp" class="btn">Đăng nhập</a>
        <% } %>
    </nav>
</header>

<div class="container">

    <div class="left">

        <!-- ĐĂNG NHẬP -->
        <form action="xacnhanlogin.jsp" method="post" class="form-box">
            <h3>ĐĂNG NHẬP</h3>

            <input type="text" name="email" placeholder="Tên tài khoản hoặc địa chỉ email" required>

            <div class="password-box">
                <input type="password" id="loginPassword" name="password" placeholder="Mật khẩu" required>
                <span class="toggle-pass" onclick="togglePassword('loginPassword', this)">👁</span>
            </div>

            <div class="extra">
                <label><input type="checkbox"> Ghi nhớ mật khẩu</label>
                <a href="forgot.jsp">Quên mật khẩu?</a>
            </div>

            <button type="submit">Đăng nhập</button>
        </form>

        <!-- ĐĂNG KÝ -->
        <form action="register.jsp" method="post" class="form-box">
            <h3>ĐĂNG KÝ</h3>

            <input type="text" name="email" placeholder="Địa chỉ email" required>

            <div class="password-box">
                <input type="password" id="registerPassword" name="password" placeholder="Mật khẩu" required>
                <span class="toggle-pass" onclick="togglePassword('registerPassword', this)">👁</span>
            </div>

            <div class="password-box">
                <input type="password" id="confirmPassword" name="confirm" placeholder="Nhập lại mật khẩu" required>
                <span class="toggle-pass" onclick="togglePassword('confirmPassword', this)">👁</span>
            </div>

            <button type="submit">Đăng ký</button>
        </form>

    </div>

    <div class="right">
        <h1>T Luxury</h1>
        <p>Chào mừng bạn đến với cửa hàng của chúng mình ✨</p>
        <img src="images/logo.jpg" alt="logo">
    </div>

</div>

<script>
function togglePassword(id, element) {
    const input = document.getElementById(id);

    if (input.type === "password") {
        input.type = "text";
        element.textContent = "🙈";
    } else {
        input.type = "password";
        element.textContent = "👁";
    }
}
</script>

</body>
</html>