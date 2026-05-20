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
        <img src="${pageContext.request.contextPath}/images/hoa-hong-do.jpg">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Nhất Ngân</h2>
        <p class="price">600.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=AnhNhat&price=850000&img=hoa-hong-do.jpg">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Nhất Ngân">
			    <input type="hidden" name="price" value="600000">
			    <input type="hidden" name="img" value="hoa-hong-do.jpg">
			
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
	    Bó hoa mang vẻ đẹp sang trọng và quyến rũ với sắc đỏ rực rỡ từ những bông hoa hồng được sắp xếp dày đặc,
	    tạo nên một tổng thể tròn đầy và vô cùng ấn tượng. Những cánh hoa mềm mại, nở đều và được tuyển chọn kỹ lưỡng
	    giúp bó hoa toát lên sự tinh tế và đẳng cấp ngay từ cái nhìn đầu tiên.
	</p>
	
	<p>
	    Xen kẽ giữa những đóa hồng đỏ nổi bật là các nhánh lá xanh đậm cùng những chùm quả nhỏ đỏ li ti,
	    góp phần tạo điểm nhấn độc đáo và tăng thêm chiều sâu cho bố cục. Sự kết hợp hài hòa giữa các chi tiết
	    khiến tổng thể trở nên sống động nhưng vẫn giữ được nét thanh lịch đặc trưng.
	</p>
	
	<p>
	    Bó hoa được cắm trong một hộp trụ tròn màu kem sang trọng, giúp cố định form dáng một cách chắc chắn
	    và gọn gàng. Thiết kế này không chỉ tiện lợi mà còn mang lại cảm giác hiện đại, phù hợp với xu hướng
	    hoa hộp cao cấp đang được ưa chuộng.
	</p>
	
	<p>
	    Phần hộp được trang trí bằng ruy băng đỏ satin mềm mại, thắt nơ tinh tế ở phía trước, đi kèm một chiếc
	    tag nhỏ xinh tạo điểm nhấn nhẹ nhàng nhưng đầy thẩm mỹ. Sự phối hợp giữa màu đỏ và màu kem mang lại
	    tổng thể hài hòa, nổi bật nhưng không quá chói mắt.
	</p>
	
	<p>
	    Khi đặt trong không gian sáng hoặc làm quà tặng, bó hoa dễ dàng thu hút mọi ánh nhìn nhờ vẻ đẹp nổi bật
	    và sang trọng của mình. Đây là lựa chọn hoàn hảo cho những dịp đặc biệt như sinh nhật, kỷ niệm,
	    lễ tình nhân hay những khoảnh khắc cần thể hiện tình cảm sâu sắc.
	</p>
	
	<p>
	    Không chỉ là một món quà, bó hoa còn là biểu tượng của tình yêu mãnh liệt, sự trân trọng và những cảm xúc
	    chân thành, giúp bạn thay lời muốn nói một cách tinh tế và đầy ý nghĩa ❤️
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