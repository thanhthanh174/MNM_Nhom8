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
        <img src="${pageContext.request.contextPath}/images/e791d1f3472840aa4af3573bac052b80.jpg">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Hòa Ca</h2>
        <p class="price">450.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=HoaCa&price=450000&img=e791d1f3472840aa4af3573bac052b80.jpg">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Hòa Ca">
			    <input type="hidden" name="price" value="450000">
			    <input type="hidden" name="img" value="e791d1f3472840aa4af3573bac052b80.jpg">
			
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
	    Bó hoa mang vẻ đẹp tươi sáng và đầy sức sống với sự kết hợp hài hòa giữa các gam màu vàng, trắng và xanh pastel,
	    tạo nên một tổng thể nhẹ nhàng nhưng vẫn vô cùng nổi bật. Những bông hoa cúc trắng nhỏ xinh với nhụy vàng rực rỡ
	    được điểm xuyết khắp bó, mang lại cảm giác trong trẻo, tự nhiên và tràn đầy năng lượng tích cực.
	</p>
	
	<p>
	    Xen kẽ giữa các bông cúc là những đóa hoa màu vàng dịu và trắng kem nở mềm mại, cùng với các cụm hoa xanh nhạt
	    nhỏ li ti, giúp tạo chiều sâu và sự đa dạng cho bố cục. Sự phối hợp màu sắc tinh tế này mang đến cảm giác nhẹ nhàng,
	    thanh thoát và rất dễ chịu cho người nhìn.
	</p>
	
	<p>
	    Phần lá và hoa phụ được chọn lựa khéo léo với các nhánh mảnh, tạo độ bay tự nhiên cho bó hoa. Các chi tiết này
	    không chỉ làm nền tôn lên vẻ đẹp của hoa chính mà còn giúp tổng thể trở nên mềm mại và sống động hơn.
	</p>
	
	<p>
	    Bó hoa được gói bằng lớp giấy xanh nhạt trong suốt, kết hợp cùng lớp giấy mờ bên trong, tạo hiệu ứng nhẹ nhàng
	    và thanh thoát. Phần thân bó được buộc bằng dây cói mảnh, mang lại cảm giác mộc mạc, gần gũi nhưng vẫn rất tinh tế
	    và hiện đại.
	</p>
	
	<p>
	    Khi được đặt dưới ánh sáng tự nhiên bên cửa sổ, bó hoa càng trở nên rực rỡ và thu hút, phản chiếu rõ nét từng
	    sắc màu tươi sáng. Đây là lựa chọn lý tưởng cho những dịp như sinh nhật, chúc mừng, hoặc đơn giản là một món quà
	    mang đến niềm vui và sự tích cực cho người nhận.
	</p>
	
	<p>
	    Không chỉ là một bó hoa, đây còn là biểu tượng của sự tươi mới, lạc quan và những cảm xúc nhẹ nhàng,
	    giúp bạn gửi gắm thông điệp yêu thương một cách tự nhiên và đầy ý nghĩa 💛
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