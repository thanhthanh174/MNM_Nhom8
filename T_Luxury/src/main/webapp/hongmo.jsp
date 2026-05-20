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
        <img src="${pageContext.request.contextPath}/images/hoa_dong_tien.jpg">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Hồng Mơ</h2>
        <p class="price">250.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=HongMo&price=250000&img=hoa_dong_tien.jpg">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Hồng Mơ">
			    <input type="hidden" name="price" value="250000">
			    <input type="hidden" name="img" value="hoa_dong_tien.jpg">
			
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
	    Bó hoa mang vẻ đẹp dịu dàng và ngọt ngào với những bông hoa đồng tiền hồng phấn nhẹ nhàng,
	    tạo nên cảm giác thanh thoát và nữ tính ngay từ cái nhìn đầu tiên. Các cánh hoa xếp đều,
	    mỏng nhẹ và tỏa tròn quanh nhụy vàng nhạt, mang lại vẻ đẹp tươi tắn và đầy sức sống.
	</p>
	
	<p>
	    Sắc hồng pastel của hoa được kết hợp hài hòa cùng những nhánh lá xanh eucalyptus,
	    tạo nên sự cân bằng tinh tế giữa gam màu ấm và lạnh. Các cành lá được cắm xen kẽ một cách tự nhiên,
	    vươn nhẹ lên trên, giúp tổng thể bó hoa trở nên mềm mại và có chiều sâu hơn.
	</p>
	
	<p>
	    Bó hoa được đặt trong một hộp tròn màu hồng đồng điệu với màu hoa, mang đến cảm giác liền mạch
	    và hiện đại. Thiết kế dạng hộp giúp giữ form chắc chắn, đồng thời tạo nên sự gọn gàng và tiện lợi
	    khi trưng bày hoặc mang tặng.
	</p>
	
	<p>
	    Phần thân hộp được trang trí bằng lớp giấy gói hồng và ruy băng cùng tông, thắt nơ nhẹ nhàng,
	    tạo điểm nhấn tinh tế và nữ tính. Cách phối màu đồng bộ này giúp tổng thể bó hoa trở nên hài hòa,
	    thanh lịch và rất dễ gây thiện cảm.
	</p>
	
	<p>
	    Khi đặt trên chiếc ghế nhỏ giữa không gian đơn giản như nền đường, bó hoa vẫn nổi bật nhờ sắc màu
	    nhẹ nhàng nhưng cuốn hút. Đây là lựa chọn lý tưởng cho những dịp như sinh nhật, chúc mừng,
	    hoặc làm quà tặng mang ý nghĩa ngọt ngào và dễ thương.
	</p>
	
	<p>
	    Không chỉ là một bó hoa, đây còn là biểu tượng của sự tươi vui, dịu dàng và những cảm xúc tích cực,
	    giúp bạn gửi gắm sự quan tâm một cách tinh tế và đầy yêu thương 💕
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