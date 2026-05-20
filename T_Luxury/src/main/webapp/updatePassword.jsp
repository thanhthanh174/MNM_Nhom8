<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>

<%
String email = request.getParameter("email");
String newpass = request.getParameter("newpass");
String confirm = request.getParameter("confirm");

Map<String, String> users = (Map<String, String>) application.getAttribute("users");

/* ===== CHECK NULL ===== */
if(email == null || newpass == null || confirm == null){
%>
<script>
alert("Thiếu dữ liệu!");
window.location="forgot.jsp";
</script>
<%
return;
}

/* ===== CHECK USER ===== */
if(users == null || !users.containsKey(email)){
%>
<script>
alert("Email không tồn tại!");
window.location="forgot.jsp";
</script>
<%
return;
}

/* ===== CHECK PASSWORD ===== */
if(!newpass.equals(confirm)){
%>
<script>
alert("Mật khẩu không khớp!");
window.history.back();
</script>
<%
return;
}

/* ===== UPDATE PASSWORD ===== */
users.put(email, newpass);
application.setAttribute("users", users);
%>

<script>
alert("Đổi mật khẩu thành công!");
window.location="login.jsp";
</script>