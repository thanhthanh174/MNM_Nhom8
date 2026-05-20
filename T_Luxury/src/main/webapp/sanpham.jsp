<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    int currentPage = 1;
    String p = request.getParameter("page");

    try {
        if (p != null) {
            currentPage = Integer.parseInt(p);
        }
    } catch (Exception e) {
        currentPage = 1;
    }
%>
<%
    if(currentPage < 1) currentPage = 1;
    if(currentPage > 3) currentPage = 3;
%>

<%@ page import="java.util.*" %>
<%@ page import="T_Luxury_models.SanPham" %>
<%@ page import="T_Luxury_dao.SanPhamDAO" %>

<%
    SanPhamDAO dao = new SanPhamDAO();

    String keyword = request.getParameter("keyword");
    List<SanPham> list;

    if(keyword != null && !keyword.trim().isEmpty()){
        list = dao.search(keyword);
    } else {
        list = dao.getAllSanPham();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>T Luxury</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.jpg">
</head>
<body>

<header>
    <a href="index.jsp" class="logo">
        <img src="${pageContext.request.contextPath}/images/logo.jpg">
        <span>T Luxury</span>
    </a>

    <nav>
        <a href="index.jsp">🏡 Trang chủ</a>
        <a href="sanpham.jsp" class="active">🌷 Sản phẩm</a>
        <a href="lienhe.jsp">📞 Liên hệ</a>
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
    <input type="text" 
           name="keyword" 
           placeholder="🔍 Tìm kiếm hoa..."
           value="<%= keyword != null ? keyword : "" %>">
    <button type="submit">Tìm kiếm</button>
</form>

<!-- NẾU ĐANG TÌM KIẾM -->
<% if(keyword != null && !keyword.trim().isEmpty()){ %>

<div class="product-list">
    <% if(list != null && !list.isEmpty()){ 
        for(SanPham sp : list){ %>

        <div class="product-card">
            <img src="<%= request.getContextPath() %>/images/<%= sp.getHinhAnh() %>">
            <h3><%= sp.getTenSP() %></h3>
            <p><%= sp.getGia() %>đ</p>

            <a href="addtocart.jsp?name=<%= sp.getTenSP() %>&price=<%= sp.getGia() %>&img=<%= sp.getHinhAnh() %>">
                <button class="btn">🧺 Thêm vào giỏ</button>
            </a>

            <a href="dathang.jsp?name=<%= sp.getTenSP() %>&price=<%= sp.getGia() %>&img=<%= sp.getHinhAnh() %>">
                <button class="btn">Đặt hàng ngay</button>
            </a>
        </div>

    <% } } else { %>
        <p style="text-align:center;">Không tìm thấy sản phẩm phù hợp</p>
    <% } %>
</div>

<% } else { %>

<!-- PRODUCT LIST -->
<% if(currentPage == 1){ %>
<div class="product-list">

    <!-- SẢN PHẨM 1 -->
    <div class="product-card">
        <a href="saydam.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/hoa_hong_do.jpg">
            <h3>Say đắm</h3>
            <p>500.000đ</p>
        </a>
		
		<a href="addtocart.jsp?name=Saydam&price=500000&img=hoa_hong_do.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=Saydam&price=500000&img=hoa_hong_do.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

    <!-- SẢN PHẨM 2 -->
    <div class="product-card">
        <a href="haiduong.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/hoa_hong_xanh.jpg">
            <h3>Hải Dương</h3>
            <p>700.000đ</p>
        </a>
		
		<a href="addtocart.jsp?name=HaiDuong&price=700000&img=hoa_hong_xanh.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=HaiDuong&price=700000&img=hoa_hong_xanh.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

    <!-- SẢN PHẨM 3 -->
    <div class="product-card">
        <a href="anhnhat.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/hoa_hong_cam.jpg">
            <h3>Ánh Nhật</h3>
            <p>850.000đ</p>
        </a>
		
		<a href="addtocart.jsp?name=AnhNhat&price=850000&img=hoa_hong_cam.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=AnhNhat&price=850000&img=hoa_hong_cam.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

    <!-- SẢN PHẨM 4 -->
    <div class="product-card">
        <a href="nhatngan.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/hoa-hong-do.jpg">
            <h3>Nhất Ngân</h3>
            <p>600.000đ</p>
        </a>

		<a href="addtocart.jsp?name=NhatNgan&price=600000&img=hoa-hong-do.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=NhatNgan&price=600000&img=hoa-hong-do.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

</div>
<% } %>


<% if(currentPage == 2){ %>
<div class="product-list">

    <!-- SẢN PHẨM 1 -->
    <div class="product-card">
        <a href="giacmoxanh.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/d99bbd5bbd555b3383e65f1546d16a8a.jpg">
            <h3>Giấc Mơ Xanh</h3>
            <p>450.000đ</p>
        </a>

		<a href="addtocart.jsp?name=GiacMoXanh&price=450000&img=d99bbd5bbd555b3383e65f1546d16a8a.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=GiacMoXanh&price=450000&img=d99bbd5bbd555b3383e65f1546d16a8a.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

    <!-- SẢN PHẨM 2 -->
    <div class="product-card">
        <a href="hoaca1.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/e791d1f3472840aa4af3573bac052b80.jpg">
            <h3>Hòa Ca</h3>
            <p>450.000đ</p>
        </a>

		<a href="addtocart.jsp?name=HoaCa&price=450000&img=e791d1f3472840aa4af3573bac052b80.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=HoaCa&price=450000&img=e791d1f3472840aa4af3573bac052b80.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

    <!-- SẢN PHẨM 3 -->
    <div class="product-card">
        <a href="hoaca2.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/hoa_lam_tinh.jpg">
            <h3>Hòa Ca</h3>
            <p>300.000đ</p>
        </a>

		<a href="addtocart.jsp?name=HoaCa&price=300000&img=hoa_lam_tinh.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=HoaCa&price=300000&img=hoa_lam_tinh.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

    <!-- SẢN PHẨM 4 -->
    <div class="product-card">
        <a href="thanhlam.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/3e6f8ddd985968c41a0e82abfb0bded5.webp">
            <h3>Thanh Lam</h3>
            <p>450.000đ</p>
        </a>

		<a href="addtocart.jsp?name=ThanhLam&price=450000&img=3e6f8ddd985968c41a0e82abfb0bded5.webp">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=ThanhLam&price=450000&img=3e6f8ddd985968c41a0e82abfb0bded5.webp">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

</div>
<% } %>

<% if(currentPage == 3){ %>
<div class="product-list">

    <!-- SẢN PHẨM 1 -->
    <div class="product-card">
        <a href="ngotngao.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/hoa_baby_trang.jpg">
            <h3>Ngọt ngào</h3>
            <p>500.000đ</p>
        </a>

		<a href="addtocart.jsp?name=NgotNgao&price=500000&img=hoa_baby_trang.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=NgotNgao&price=500000&img=hoa_baby_trang.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

    <!-- SẢN PHẨM 2 -->
    <div class="product-card">
        <a href="hongy.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/hoa_tulip_hong.jpg">
            <h3>Hồng Ý</h3>
            <p>800.000đ</p>
        </a>

		<a href="addtocart.jsp?name=HongY&price=800000&img=hoa_tulip_hong.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=HongY&price=800000&img=hoa_tulip_hong.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

    <!-- SẢN PHẨM 3 -->
    <div class="product-card">
        <a href="loithitham.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/hoa_cuc_hoa_mi.jpg">
            <h3>Lời Thì Thầm</h3>
            <p>200.000đ</p>
        </a>

		<a href="addtocart.jsp?name=LoiThiTham&price=200000&img=hoa_cuc_hoa_mi.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=LoiThiTham&price=200000&img=hoa_cuc_hoa_mi.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

    <!-- SẢN PHẨM 4 -->
    <div class="product-card">
        <a href="hongmo.jsp" class="product-link">
            <img src="${pageContext.request.contextPath}/images/hoa_dong_tien.jpg">
            <h3>Hồng Mơ</h3>
            <p>250.000đ</p>
        </a>

		<a href="addtocart.jsp?name=HongMo&price=250000&img=hoa_dong_tien.jpg">
		    <button class="btn">🧺 Thêm vào giỏ</button>
		</a>
        <a href="dathang.jsp?name=HongMo&price=250000&img=hoa_dong_tien.jpg">
            <button class="btn">Đặt hàng ngay</button>
        </a>
    </div>

</div>
<% } %>

<div class="pagination">

    <!-- NÚT PREV -->
    <a href="sanpham.jsp?page=<%= currentPage-1 %>" 
       class="<%= currentPage==1 ? "disabled" : "" %>">
        ←
    </a>

    <!-- SỐ TRANG -->
    <a href="sanpham.jsp?page=1" class="<%= currentPage==1?"active":"" %>">1</a>
    <a href="sanpham.jsp?page=2" class="<%= currentPage==2?"active":"" %>">2</a>
    <a href="sanpham.jsp?page=3" class="<%= currentPage==3?"active":"" %>">3</a>

    <!-- NÚT NEXT -->
    <a href="sanpham.jsp?page=<%= currentPage+1 %>" 
       class="<%= currentPage==3 ? "disabled" : "" %>">
        →
    </a>

</div>

<% } %>

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