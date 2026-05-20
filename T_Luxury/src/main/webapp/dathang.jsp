<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

    int subtotal = 0;
    int ship = 30000;
    double vatRate = 0.08;
%>

<!DOCTYPE html>
<html>
<head>
    <title>T Luxury</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dathang.css">
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

<div class="order-container">

    <!-- LEFT -->
    <div class="order-product">

        <h3>Thông tin sản phẩm</h3>

        <% if(cart != null && !cart.isEmpty()){ %>

            <% for(Map<String, Object> item : cart){ 
                int price = (int) item.get("price");
                int qty = (int) item.get("qty");
                subtotal += price * qty;
            %>

            <div class="product-item">
                <img src="images/<%= item.get("img") %>" width="100">

                <div>
                    <h4><%= item.get("name") %></h4>
                    <p>Giá: <%= price %> VND</p>
                    <p>Số lượng: <%= qty %></p>
                </div>
            </div>

            <% } %>

            <%
                double vat = subtotal * vatRate;
                int total = (int)(subtotal + ship + vat);
            %>

            <div class="bill">
                <p>Tạm tính: <%= subtotal %> VND</p>
                <p>🚚 Phí ship: <%= ship %> VND</p>
                <p>🧾 VAT (8%): <%= (int)vat %> VND</p>
                <h2>💰 Tổng: <%= total %> VND</h2>
            </div>

        <% } else { %>

            <p>🛒 Giỏ hàng trống</p>

        <% } %>

    </div>

    <!-- RIGHT -->
    <form class="order-form" action="xacnhandathang.jsp" method="post" onsubmit="return checkPayment()">

        <h3>📦 Thông tin nhận hàng</h3>

        <input type="text" name="fullname" placeholder="Họ và tên" required>
        <input type="text" name="phone" placeholder="Số điện thoại" required>
        <input type="text" name="address" placeholder="Địa chỉ nhận hàng" required>

        <textarea name="note" placeholder="Ghi chú"></textarea>

        <!-- PHƯƠNG THỨC THANH TOÁN -->
        <div class="payment-box">
            <h3>💳 Phương thức thanh toán</h3>

            <label>
                <input type="radio" name="payment" value="cash" checked onclick="showBank(false)">
                Thanh toán tiền mặt
            </label>

            <br><br>

            <label>
                <input type="radio" name="payment" value="bank" onclick="showBank(true)">
                Chuyển khoản
            </label>

            <div id="bankInfo" style="display:none; margin-top:15px;">
                <img src="images/qr.png" width="500">
            </div>
        </div>

        <input type="hidden" name="total" value="<%= (int)(subtotal + ship + (subtotal * vatRate)) %>">

        <button type="submit" class="btn">Xác nhận đặt hàng</button>

    </form>

</div>

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

<script>
function showBank(show){
    document.getElementById("bankInfo").style.display = show ? "block" : "none";
}
</script>

<script>
function showBank(show){
    document.getElementById("bankInfo").style.display = show ? "block" : "none";
}

function checkPayment(){
    let payment = document.querySelector('input[name="payment"]:checked').value;

    if(payment === "bank"){
        return confirm("Bạn đã chuyển khoản thành công chưa?");
    }

    return true;
}
</script>

</body>
</html>