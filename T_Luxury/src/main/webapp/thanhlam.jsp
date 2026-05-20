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
        <img src="${pageContext.request.contextPath}/images/3e6f8ddd985968c41a0e82abfb0bded5.webp">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Thanh Lam</h2>
        <p class="price">450.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=ThanhLam&price=450000&img=3e6f8ddd985968c41a0e82abfb0bded5.webp">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Thanh Lam">
			    <input type="hidden" name="price" value="450000">
			    <input type="hidden" name="img" value="3e6f8ddd985968c41a0e82abfb0bded5.webp">
			
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
	    Bó hoa mang vẻ đẹp hiện đại và đầy nghệ thuật với tông màu xanh dương chủ đạo, tạo cảm giác sâu lắng,
	    thanh mát và có phần bí ẩn. Những cụm hoa lớn màu xanh được sắp xếp làm nền chính, cánh hoa mềm mại
	    và xếp lớp dày, mang lại cảm giác đầy đặn và sang trọng.
	</p>
	
	<p>
	    Điểm nhấn độc đáo của bó hoa nằm ở sự kết hợp với các bông hoa trắng tinh khôi nở mềm mại,
	    xen kẽ cùng những chi tiết xanh lá đặc biệt như các cụm hoa hình cầu nhỏ và các nhánh cỏ mảnh,
	    tạo nên sự tương phản thú vị cả về màu sắc lẫn hình dáng. Điều này giúp tổng thể không bị đơn điệu
	    mà trở nên sinh động và cuốn hút hơn.
	</p>
	
	<p>
	    Bó hoa còn được trang trí thêm bằng lớp giấy gói mang phong cách nghệ thuật với họa tiết và chữ in nhẹ,
	    kết hợp cùng lớp giấy trong suốt bên ngoài, tạo nên hiệu ứng hiện đại và tinh tế. Các lớp giấy được xếp
	    khéo léo, ôm trọn bó hoa nhưng vẫn giữ được độ thoáng và tự nhiên.
	</p>
	
	<p>
	    Sự hòa quyện giữa sắc xanh dương, trắng và xanh lá mang lại cảm giác cân bằng, vừa dịu dàng vừa cá tính,
	    phù hợp với những người yêu thích phong cách khác biệt và sáng tạo. Bó hoa không chỉ đẹp ở màu sắc mà còn
	    nổi bật nhờ cách phối hợp đa dạng các loại hoa và chất liệu.
	</p>
	
	<p>
	    Khi xuất hiện trong không gian như trên xe hay phòng kín, bó hoa vẫn giữ được sự nổi bật riêng,
	    tạo điểm nhấn tinh tế và đầy nghệ thuật. Đây là lựa chọn lý tưởng cho những dịp đặc biệt hoặc
	    để thể hiện gu thẩm mỹ độc đáo của người tặng.
	</p>
	
	<p>
	    Không chỉ là một bó hoa, đây còn là sự kết hợp giữa nghệ thuật và cảm xúc, mang đến một món quà
	    vừa tinh tế vừa ấn tượng 💙
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