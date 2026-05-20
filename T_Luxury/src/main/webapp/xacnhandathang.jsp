<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>

<%
String fullname = request.getParameter("fullname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String note = request.getParameter("note");

List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

int sum = 0;
int ship = 30000;
double vatRate = 0.08;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xác nhận đơn hàng</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/logo.jpg">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/xacnhandathang.css">
</head>

<body>

<div class="container">

    <h2>🎉 Đặt hàng thành công!</h2>

    <div class="info">
        <p><b>Họ tên:</b> <%= fullname %></p>
        <p><b>SĐT:</b> <%= phone %></p>
        <p><b>Địa chỉ:</b> <%= address %></p>
    </div>

    <hr>

    <h3>🛍️ Sản phẩm đã đặt</h3>

    <% if(cart != null && !cart.isEmpty()){ 
        for(Map<String, Object> item : cart){

            int price = (int) item.get("price");
            int qty = (int) item.get("qty");
            sum += price * qty;
    %>

    <div class="product-item">
        <img src="${pageContext.request.contextPath}/images/<%= item.get("img") %>">

        <div>
            <p><b><%= item.get("name") %></b></p>
            <p><%= price %> x <%= qty %></p>
        </div>
    </div>

    <% } } else { %>

        <p>Không có sản phẩm</p>

    <% } %>

    <hr>

    <%
        // FREE SHIP
        if(sum > 500000){
            ship = 0;
        }

        double vat = sum * vatRate;
        int total = (int)(sum + ship + vat);
    %>

    <div class="bill">
        <p>Tạm tính: <%= sum %> VND</p>
        <p>🚚 Phí ship: <%= ship %> VND</p>
        <p>🧾 VAT (8%): <%= (int)vat %> VND</p>

        <h2>💰 Tổng thanh toán: <%= total %> VND</h2>
    </div>

    <p><b>📝 Ghi chú:</b> <%= note %></p>

    <!-- NÚT -->
    <div class="actions">
        <a href="index.jsp">
            <button class="btn-home">🏡 Trang chủ</button>
        </a>

        <a href="sanpham.jsp">
            <button class="btn-shop">🛍️ Mua thêm</button>
        </a>
    </div>

</div>

<%
session.removeAttribute("cart"); // clear giỏ
%>

</body>
</html>