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
        <img src="${pageContext.request.contextPath}/images/hoa_lam_tinh.jpg">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Hòa Ca</h2>
        <p class="price">300.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=HoaCa&price=300000&img=hoa_lam_tinh.jpg">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Hòa Ca">
			    <input type="hidden" name="price" value="300000">
			    <input type="hidden" name="img" value="hoa_lam_tinh.jpg">
			
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
	    Bó hoa mang vẻ đẹp nhẹ nhàng và thanh lịch với tông màu xanh nhạt và trắng làm chủ đạo,
	    tạo cảm giác dịu mắt và tinh khôi ngay từ cái nhìn đầu tiên. Những bông hoa nhỏ xinh với sắc xanh
	    pastel xen lẫn trắng sữa được sắp xếp tự nhiên, không quá dày nhưng đủ để tạo nên tổng thể hài hòa,
	    mềm mại và đầy cuốn hút.
	</p>
	
	<p>
	    Điểm đặc biệt của bó hoa nằm ở sự kết hợp giữa nhiều loại hoa nhỏ với hình dáng khác nhau,
	    từ những cánh hoa mỏng nhẹ đến các nụ hoa chúm chím, mang lại cảm giác sinh động và gần gũi.
	    Xen kẽ là các nhánh lá xanh mảnh mai, vươn nhẹ ra ngoài, tạo độ bay và giúp bó hoa trông tự nhiên hơn.
	</p>
	
	<p>
	    Phần giấy gói sử dụng tông nâu trầm kết hợp với lớp giấy xanh nhạt bên trong, tạo nên sự tương phản
	    tinh tế giữa gam màu ấm và lạnh. Các lớp giấy được gấp nếp đơn giản nhưng khéo léo, giữ form gọn gàng
	    mà vẫn toát lên nét hiện đại và trang nhã.
	</p>
	
	<p>
	    Thân bó được buộc bằng ruy băng xanh nhạt mềm mại, thắt nhẹ nhàng, tạo điểm nhấn tinh tế và hài hòa
	    với tổng thể màu sắc của bó hoa. Cách hoàn thiện này mang lại cảm giác mộc mạc, gần gũi nhưng vẫn rất
	    chỉn chu và có tính thẩm mỹ cao.
	</p>
	
	<p>
	    Với thiết kế nhỏ gọn và phong cách tự nhiên, bó hoa này rất phù hợp để cầm tay, tặng bạn bè, người thân
	    hoặc dùng trong những dịp nhẹ nhàng như chúc mừng, gặp gỡ hay đơn giản là một món quà nhỏ mang ý nghĩa
	    tinh tế.
	</p>
	
	<p>
	    Không quá rực rỡ nhưng đầy cuốn hút, bó hoa là biểu tượng của sự dịu dàng, tinh tế và những cảm xúc
	    chân thành được gửi gắm một cách nhẹ nhàng 💙
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