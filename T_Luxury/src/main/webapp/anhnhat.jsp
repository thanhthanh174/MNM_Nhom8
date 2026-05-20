<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="icon" href="${pageContext.request.contextPath}/images/logo.jpg">
</head>
<body>

<!-- HEADER -->
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

<!-- CATEGORY -->
<div class="category">
    <span>Hoa sinh nhật</span>
    <span>Hoa tình yêu</span>
    <span>Hoa cưới</span>
    <span>Hoa khai trương</span>
    <span>Hoa chia buồn</span>
    <span>Hoa trang trí</span>
    <span>Hoa 8/3 & 20/10</span>
</div>

<!-- SEARCH -->
<form action="sanpham.jsp" method="get" class="search">
    <input type="text" name="keyword" placeholder="🔍 Tìm kiếm hoa...">
    <button type="submit">Tìm kiếm</button>
</form>

<!-- CHI TIẾT -->
<div class="detail-container">

    <!-- ẢNH -->
    <div class="detail-img">
        <img src="${pageContext.request.contextPath}/images/hoa_hong_cam.jpg">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Ánh Nhật</h2>
        <p class="price">850.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=AnhNhat&price=850000&img=hoa_hong_cam.jpg">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Ánh Nhật">
			    <input type="hidden" name="price" value="850000">
			    <input type="hidden" name="img" value="hoa_hong_cam.jpg">
			
			    <button class="btn">Thêm vào giỏ</button>
			</form>
		
		</div>

        <a href="sanpham.jsp" class="back">← Quay lại</a>
    </div>

</div>

<!-- MÔ TẢ -->
<div class="description">
    <h3>Mô tả sản phẩm</h3>
   	<p>
	    Bó hoa nổi bật với gam màu cam rực rỡ, mang đến cảm giác ấm áp, tươi vui và tràn đầy năng lượng.
	    Những bông hoa hồng cam được chọn lựa kỹ lưỡng, cánh hoa to, mềm mại và nở đều, tạo nên tổng thể
	    căng tràn sức sống và thu hút ánh nhìn ngay từ lần đầu tiên.
	</p>
	
	<p>
	    Xen kẽ giữa sắc cam nổi bật là các nhánh lá eucalyptus xanh xám thanh mát, giúp cân bằng màu sắc
	    và tạo nên sự hài hòa cho bó hoa. Sự kết hợp này không chỉ làm nổi bật vẻ đẹp của hoa chính mà còn
	    mang lại chiều sâu, khiến tổng thể trở nên tinh tế và hiện đại hơn.
	</p>
	
	<p>
	    Phần giấy gói được phối hợp tinh tế giữa lớp giấy màu kem nhẹ nhàng và lớp giấy cam bên trong,
	    tạo hiệu ứng chuyển màu ấm áp và nổi bật. Các lớp giấy được xếp nếp mềm mại, ôm trọn bó hoa một
	    cách tự nhiên nhưng vẫn giữ được form dáng sang trọng và chỉn chu.
	</p>
	
	<p>
	    Thân bó được buộc gọn gàng bằng ruy băng vàng ánh kim, thắt nơ mềm mại và nổi bật trên nền giấy
	    sáng màu. Chi tiết này không chỉ giúp cố định bó hoa mà còn tăng thêm vẻ cao cấp và trang nhã cho
	    tổng thể thiết kế.
	</p>
	
	<p>
	    Khi đặt trong không gian đời thường như trước cửa nhà, quán cà phê hay góc phố, bó hoa vẫn nổi bật
	    và thu hút, mang lại cảm giác gần gũi nhưng không kém phần sang trọng. Đây là lựa chọn hoàn hảo cho
	    các dịp như chúc mừng, sinh nhật, khai trương hoặc đơn giản là món quà gửi gắm sự tích cực và niềm vui.
	</p>
	
	<p>
	    Không chỉ là một bó hoa, đây còn là biểu tượng của sự nhiệt huyết, lạc quan và nguồn năng lượng tích cực,
	    giúp bạn truyền tải thông điệp yêu thương một cách rực rỡ và đầy ấn tượng 🧡
	</p>
</div>

<!-- SẢN PHẨM LIÊN QUAN -->
<div class="related">
    <h3>Sản phẩm liên quan</h3>

    <div class="related-list">

        <a href="thanhambienxanh.jsp">
            <img src="${pageContext.request.contextPath}/images/707ee0decbc4aed29f872c1598aeaf42.jpg">
        </a>

        <a href="nhatkymuaxuan.jsp">
            <img src="${pageContext.request.contextPath}/images/1ae4ebafcbc3ec7b8938f16d04222e89.jpg">
        </a>

        <a href="thanhlam.jsp">
            <img src="${pageContext.request.contextPath}/images/3e6f8ddd985968c41a0e82abfb0bded5.webp">
        </a>

        <a href="anhduong.jsp">
            <img src="${pageContext.request.contextPath}/images/hoa_huong_duong.jpg">
        </a>

        <a href="binhyen.jsp">
            <img src="${pageContext.request.contextPath}/images/fc0e62c5339d4229678832ee4f18af6c.jpg">
        </a>

    </div>
</div>

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

<script>
    let soLuong = 1;

    function tang() {
        soLuong++;
        document.getElementById("qty").innerText = soLuong;
    }

    function giam() {
        if (soLuong > 1) {
            soLuong--;
            document.getElementById("qty").innerText = soLuong;
        }
    }
</script>
</body>
</html>