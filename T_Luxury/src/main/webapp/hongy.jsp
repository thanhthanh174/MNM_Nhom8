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
        <img src="${pageContext.request.contextPath}/images/hoa_tulip_hong.jpg">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Hồng Ý</h2>
        <p class="price">800.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=HongY&price=800000&img=hoa_tulip_hong.jpg">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Hồng Ý">
			    <input type="hidden" name="price" value="800000">
			    <input type="hidden" name="img" value="hoa_tulip_hong.jpg">
			
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
	    Bó hoa mang vẻ đẹp nhẹ nhàng và tinh tế với sự kết hợp hài hòa giữa những bông tulip trắng và hồng pastel,
	    tạo nên một tổng thể dịu dàng, thanh thoát và đầy nữ tính. Các cánh hoa tulip mềm mại, khép mở tự nhiên,
	    mang lại cảm giác tươi mới và tràn đầy sức sống.
	</p>
	
	<p>
	    Sắc trắng tinh khôi xen lẫn với màu hồng ngọt ngào tạo nên sự cân bằng hoàn hảo về màu sắc,
	    vừa thanh lịch vừa ấm áp. Những chiếc lá xanh dài, thon gọn ôm lấy từng cành hoa, góp phần
	    tôn lên vẻ đẹp tự nhiên và giúp bó hoa trở nên hài hòa hơn.
	</p>
	
	<p>
	    Bó hoa được gói bằng lớp giấy trắng sữa đơn giản nhưng tinh tế, các lớp giấy được xếp nếp mềm mại,
	    ôm trọn lấy hoa mà không làm mất đi sự thanh thoát. Thiết kế tối giản này giúp làm nổi bật hoàn toàn
	    vẻ đẹp của những bông tulip bên trong.
	</p>
	
	<p>
	    Phần thân bó được buộc bằng ruy băng hồng nhạt, thắt nơ mềm mại và duyên dáng, tạo điểm nhấn nhẹ nhàng
	    và đồng điệu với màu sắc của hoa. Cách hoàn thiện này mang lại cảm giác thanh lịch, trang nhã
	    và rất phù hợp với phong cách hiện đại.
	</p>
	
	<p>
	    Khi đặt gần cửa sổ với ánh sáng tự nhiên, bó hoa càng trở nên nổi bật với vẻ đẹp trong trẻo và dịu dàng,
	    phản chiếu rõ nét từng sắc độ nhẹ nhàng của hoa. Đây là lựa chọn hoàn hảo cho các dịp như sinh nhật,
	    chúc mừng, hoặc làm quà tặng thể hiện sự quan tâm và yêu thương một cách tinh tế.
	</p>
	
	<p>
	    Không chỉ là một bó hoa, đây còn là biểu tượng của sự dịu dàng, thanh khiết và những cảm xúc ngọt ngào,
	    giúp bạn gửi gắm thông điệp yêu thương một cách nhẹ nhàng nhưng đầy ý nghĩa 💗
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