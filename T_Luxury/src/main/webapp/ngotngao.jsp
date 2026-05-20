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
</header>der>

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
        <img src="${pageContext.request.contextPath}/images/hoa_baby_trang.jpg">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Ngọt Ngào</h2>
        <p class="price">500.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=NgotNgao&price=500000&img=hoa_baby_trang.jpg">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Ngọt Ngào">
			    <input type="hidden" name="price" value="500000">
			    <input type="hidden" name="img" value="hoa_baby_trang.jpg">
			
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
	    Bó hoa mang vẻ đẹp thuần khiết và nhẹ nhàng với những bông hoa baby trắng nhỏ li ti,
	    tạo nên một tổng thể mềm mại như làn mây. Sắc trắng tinh khôi không chỉ mang lại cảm giác
	    thanh thoát mà còn gợi lên sự trong trẻo, dịu dàng và đầy tinh tế.
	</p>
	
	<p>
	    Những cành hoa baby được bó dày, đan xen tự nhiên, tạo hiệu ứng bồng bềnh và uyển chuyển.
	    Xen lẫn là các nhánh cỏ mảnh vươn nhẹ ra ngoài, giúp bó hoa không bị quá tròn cứng mà trở nên
	    bay bổng và có chiều sâu hơn.
	</p>
	
	<p>
	    Phần giấy gói sử dụng tông nâu kraft mộc mạc, kết hợp với lớp giấy trắng bên trong,
	    tạo nên sự tương phản nhẹ nhàng nhưng hài hòa. Điểm đặc biệt là dòng chữ viết tay
	    “you are my flower” được in trên lớp giấy gói, mang đến cảm giác gần gũi, chân thành
	    và đầy cảm xúc.
	</p>
	
	<p>
	    Thân bó được buộc bằng dây ruy băng trắng đơn giản, thắt nhẹ nhàng, góp phần giữ nguyên
	    phong cách tối giản nhưng tinh tế của toàn bộ bó hoa. Cách thiết kế này không quá cầu kỳ
	    nhưng lại toát lên vẻ đẹp hiện đại và thanh lịch.
	</p>
	
	<p>
	    Khi đặt trong không gian có ánh sáng tự nhiên, bó hoa càng trở nên nổi bật với vẻ đẹp
	    dịu dàng và trong trẻo. Đây là lựa chọn hoàn hảo cho những dịp như tỏ tình, sinh nhật,
	    hoặc đơn giản là một món quà nhỏ để gửi gắm sự quan tâm và yêu thương.
	</p>
	
	<p>
	    Không chỉ là một bó hoa, đây còn là biểu tượng của sự tinh khôi, chân thành và những cảm xúc
	    nhẹ nhàng, giúp bạn truyền tải thông điệp yêu thương một cách giản dị nhưng sâu sắc 🤍
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