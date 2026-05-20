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
        <img src="${pageContext.request.contextPath}/images/hoa_hong_do.jpg">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Say Đắm</h2>
        <p class="price">500.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=Saydam&price=500000&img=hoa_hong_do.jpg">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Say Đắm">
			    <input type="hidden" name="price" value="500000">
			    <input type="hidden" name="img" value="hoa_hong_do.jpg">
			
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
	    Bó hoa mang vẻ đẹp sang trọng và đầy cảm xúc với tông màu đỏ chủ đạo từ những bông hoa hồng nở rộ,
	    cánh dày, mềm mại và được tuyển chọn kỹ lưỡng. Các bông hoa được sắp xếp khéo léo theo bố cục tròn đầy,
	    tạo nên tổng thể hài hòa, cân đối và thu hút ánh nhìn ngay từ khoảnh khắc đầu tiên.
	</p>
	
	<p>
	    Xen kẽ giữa sắc đỏ nổi bật là những nhánh lá eucalyptus xanh xám thanh mát cùng các bông hoa phụ nhỏ
	    mang sắc trắng hồng dịu nhẹ. Sự kết hợp này không chỉ giúp bó hoa trở nên mềm mại hơn mà còn tạo chiều sâu,
	    mang lại cảm giác tinh tế và sang trọng đúng chuẩn phong cách hiện đại.
	</p>
	
	<p>
	    Phần bao bọc bên ngoài được chăm chút với lớp giấy trắng sữa cao cấp kết hợp cùng lớp nilon mờ,
	    tạo hiệu ứng trong suốt nhẹ nhàng, tôn lên vẻ đẹp tự nhiên của từng đóa hoa. Thân bó được buộc chắc chắn
	    bằng ruy băng đỏ đậm, thắt nơ gọn gàng và điểm thêm một chiếc tag nhỏ xinh, góp phần tạo nên tổng thể
	    chỉn chu và đầy tính thẩm mỹ.
	</p>
	
	<p>
	    Khi đặt trong không gian sáng như bàn gỗ, ghế mây hay gần cửa sổ, bó hoa càng trở nên nổi bật,
	    lan tỏa cảm giác ấm áp, lãng mạn và gần gũi. Đây là lựa chọn lý tưởng để dành tặng người yêu,
	    bạn bè hoặc người thân trong những dịp đặc biệt như sinh nhật, kỷ niệm, ngày lễ,
	    hay đơn giản là một món quà tinh tế để gửi gắm yêu thương mỗi ngày.
	</p>
	
	<p>
	    Không chỉ là một bó hoa, đây còn là thông điệp của sự quan tâm và chân thành,
	    giúp bạn thay lời muốn nói một cách nhẹ nhàng nhưng đầy ý nghĩa ❤️
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