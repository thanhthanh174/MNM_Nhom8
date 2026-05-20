<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="T_Luxury_dao.DBConnection" %>

<%
request.setCharacterEncoding("UTF-8");

String email = request.getParameter("email");
String password = request.getParameter("password");

/* ===== LOGIN ADMIN CỨNG ===== */
if("admin@gmail.com".equals(email) && "123456".equals(password)){
    session.setAttribute("user", "Admin");
%>
<script>
alert("👑 Đăng nhập Admin thành công!");
window.location="admin/admin.jsp";
</script>
<%
    return;
}

/* ===== LOGIN NGƯỜI DÙNG TỪ MYSQL ===== */
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    conn = DBConnection.getConnection();

    String sql = "SELECT * FROM nguoi_dung WHERE ten_dang_nhap=? AND mat_khau=?";
    ps = conn.prepareStatement(sql);
    ps.setString(1, email);
    ps.setString(2, password);

    rs = ps.executeQuery();

    if(rs.next()){
        String tenDangNhap = rs.getString("ten_dang_nhap");

        session.setAttribute("user", tenDangNhap);
%>
<script>
alert("✅ Đăng nhập thành công!");
window.location="index.jsp";
</script>
<%
    } else {
%>
<script>
alert("❌ Sai tài khoản hoặc mật khẩu!");
window.location="login.jsp";
</script>
<%
    }

} catch(Exception e){
    e.printStackTrace();
%>
<script>
alert("⚠️ Lỗi kết nối database!");
window.location="login.jsp";
</script>
<%
} finally {
    try {
        if(rs != null) rs.close();
        if(ps != null) ps.close();
        if(conn != null) conn.close();
    } catch(Exception ex){}
}
%>