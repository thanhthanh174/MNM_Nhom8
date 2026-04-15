<%@ page import="java.util.*, T_Luxury_models.LoaiHoa, T_Luxury_dao.LoaiHoaDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm loại hoa</title>
<link rel="stylesheet" href="css/themloaihoa.css">
</head>
<body>

<h2>➕ Thêm loại hoa</h2>

<form action="themloaihoa" method="post">

    <label>Tên hoa:</label><br>
    <input type="text" name="ten_hoa" required>
    <br>

    <label>Giá:</label><br>
    <input type="number" name="gia" required>
    <br>

    <label>Loại hoa:</label><br>
    <select name="loai_id">
    <%
        List<LoaiHoa> ds = LoaiHoaDAO.getAll();
        for(LoaiHoa l : ds){
    %>
        <option value="<%=l.getId()%>"><%=l.getTenLoai()%></option>
    <%
        }
    %>
    </select>
    <br>

    <button type="submit">Thêm</button>

</form>

</body>
</html>