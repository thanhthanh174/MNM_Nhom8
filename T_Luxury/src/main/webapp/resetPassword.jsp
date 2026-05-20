<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>

<%
String email = request.getParameter("email");

Map<String, String> users = (Map<String, String>) application.getAttribute("users");

if(users != null && users.containsKey(email)){
%>

<h3>Đặt lại mật khẩu</h3>

<form action="updatePassword.jsp" method="post">
    <input type="hidden" name="email" value="<%= email %>">

    <input type="password" name="newpass" placeholder="Mật khẩu mới" required>
    <input type="password" name="confirm" placeholder="Nhập lại mật khẩu" required>

    <button type="submit">Cập nhật</button>
</form>

<%
}else{
%>

<script>
alert("Email không tồn tại!");
window.location="forgot.jsp";
</script>

<%
}
%>