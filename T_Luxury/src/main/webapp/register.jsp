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
String email = request.getParameter("email");
String password = request.getParameter("password");
String confirm = request.getParameter("confirm");

if(!password.equals(confirm)){
%>
<script>
alert("Mật khẩu không khớp!");
window.location="login.jsp";
</script>
<%
return;
}

// Lấy danh sách user
Map<String, Map<String, String>> users = 
(Map<String, Map<String, String>>) application.getAttribute("users");

if(users == null){
    users = new HashMap<>();
}

// ❌ Không cho đăng ký admin
String role = "user";

Map<String, String> info = new HashMap<>();
info.put("password", password);
info.put("role", role);

users.put(email, info);
application.setAttribute("users", users);
%>

<script>
alert("Đăng ký thành công!");
window.location="login.jsp";
</script>
</body>
</html>