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
        <img src="${pageContext.request.contextPath}/images/1ae4ebafcbc3ec7b8938f16d04222e89.jpg">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Nhật Ký Mùa Xuân</h2>
        <p class="price">600.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=NhatKyMuaXuan&price=600000&img=1ae4ebafcbc3ec7b8938f16d04222e89.jpg">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Nhật Ký Mùa Xuân">
			    <input type="hidden" name="price" value="600000">
			    <input type="hidden" name="img" value="1ae4ebafcbc3ec7b8938f16d04222e89.jpg">
			
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
	    Bó hoa mang vẻ đẹp dịu dàng và đầy chất thơ với tông màu hồng pastel làm chủ đạo,
	    điểm xuyết sắc trắng và xanh nhạt, gợi lên cảm giác trong trẻo như những ngày đầu xuân.
	    Tổng thể hài hòa, nhẹ nhàng như từng trang nhật ký ghi lại những khoảnh khắc ngọt ngào
	    và bình yên của tuổi trẻ.
	</p>
	
	<p>
	    Những đóa hoa hồng hồng phấn nở rộ ở trung tâm, xen kẽ là hoa đồng tiền,
	    hoa baby và các loài hoa nhỏ xinh khác, tạo nên sự phong phú và sống động.
	    Mỗi bông hoa như một cảm xúc riêng, hòa quyện lại thành một câu chuyện đầy màu sắc
	    nhưng vẫn giữ được nét tinh tế, thanh thoát.
	</p>
	
	<p>
	    Lớp giấy gói màu hồng pastel kết hợp cùng lớp lưới trắng mềm mại tạo hiệu ứng bồng bềnh,
	    như những áng mây nhẹ trôi trong không gian. Cách gói được xử lý khéo léo,
	    ôm trọn bó hoa một cách tự nhiên, tôn lên vẻ đẹp nữ tính và thanh lịch.
	</p>
	
	<p>
	    Phần thân bó được buộc bằng ruy băng trắng thanh mảnh, thắt nơ nhẹ nhàng,
	    hoàn thiện tổng thể một cách tinh tế. Từng chi tiết nhỏ đều được chăm chút,
	    mang lại cảm giác chỉn chu và đầy cảm xúc.
	</p>
	
	<p>
	    “Nhật Ký Mùa Xuân” không chỉ là một bó hoa, mà còn là biểu tượng của những khởi đầu mới,
	    của sự dịu dàng, hy vọng và những rung động trong trẻo. Đây là món quà hoàn hảo
	    để gửi gắm yêu thương trong những dịp đặc biệt hoặc đơn giản là để làm đẹp cho một ngày bình yên 💗
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