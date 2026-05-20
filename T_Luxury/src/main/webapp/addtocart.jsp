<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T Luxury</title>
<link rel="icon" href="${pageContext.request.contextPath}/images/logo.jpg">
</head>
<body>
<%@ page import="java.util.*" %>

<%
    String name = request.getParameter("name");
    int price = Integer.parseInt(request.getParameter("price"));
    String img = request.getParameter("img");

    // Lấy giỏ hàng từ session
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");

    if(cart == null){
        cart = new ArrayList<>();
    }

    // Tạo sản phẩm
    Map<String, Object> item = new HashMap<>();
    item.put("name", name);
    item.put("price", price);
    item.put("img", img);
    item.put("qty", 1);

    cart.add(item);

    // Lưu lại session
    session.setAttribute("cart", cart);

    // quay về trang sản phẩm
    response.sendRedirect("giohang.jsp");
%>
</body>
</html>