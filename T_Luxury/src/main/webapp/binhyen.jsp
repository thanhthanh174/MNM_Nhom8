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
        <img src="${pageContext.request.contextPath}/images/fc0e62c5339d4229678832ee4f18af6c.jpg">
    </div>

    <!-- THÔNG TIN -->
    <div class="detail-info">
        <h2>Bình Yên</h2>
        <p class="price">450.000đ</p>
        <p class="status">Tình trạng: Còn hàng</p>

        <p>Số lượng:</p>
		<div class="quantity">
		    <button onclick="giam()">-</button>
		    <span id="qty">1</span>
		    <button onclick="tang()">+</button>
		</div>

        <div class="actions">
		
		    <a href="dathang.jsp?name=BinhYen&price=450000&img=fc0e62c5339d4229678832ee4f18af6c.jpg">
		        <button class="btn">Đặt hàng</button>
		    </a>
		
		    <form action="add-to-cart" method="post">
			    <input type="hidden" name="name" value="Bình Yên">
			    <input type="hidden" name="price" value="450000">
			    <input type="hidden" name="img" value="fc0e62c5339d4229678832ee4f18af6c.jpg">
			
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
	    Bó hoa mang vẻ đẹp tinh khôi và thanh lịch với tông màu trắng – xanh nhạt chủ đạo,
	    gợi lên cảm giác nhẹ nhàng và yên bình như một buổi sớm trong trẻo. Sự kết hợp hài hòa
	    giữa các sắc độ dịu nhẹ tạo nên tổng thể thanh thoát, không cầu kỳ nhưng vẫn đầy cuốn hút.
	</p>
	
	<p>
	    Những đóa hoa lớn màu trắng và xanh pastel được đặt ở trung tâm, nổi bật với cánh hoa mềm mại,
	    nở đều và tinh tế. Xen kẽ là các loại hoa nhỏ xinh cùng những chi tiết hoa phụ li ti,
	    giúp bó hoa trở nên sinh động và có chiều sâu, giống như một bản hòa ca dịu dàng của thiên nhiên.
	</p>
	
	<p>
	    Cách sắp xếp hoa theo bố cục tròn đầy mang lại cảm giác cân đối và hài hòa,
	    trong khi các nhánh hoa vươn nhẹ tạo điểm nhấn tự nhiên. Lớp giấy gói trong suốt bên ngoài
	    kết hợp cùng lớp giấy trắng bên trong giúp tôn lên vẻ đẹp thuần khiết của từng đóa hoa,
	    đồng thời tạo hiệu ứng mềm mại và tinh tế.
	</p>
	
	<p>
	    Phần thân bó được buộc bằng ruy băng trắng thanh mảnh, thắt nơ gọn gàng,
	    hoàn thiện tổng thể một cách nhẹ nhàng và trang nhã. Thiết kế này mang đến cảm giác
	    hiện đại nhưng vẫn giữ được nét dịu dàng rất riêng.
	</p>
	
	<p>
	    “Bình Yên Nhẹ Tênh” không chỉ là một bó hoa, mà còn là biểu tượng của sự an yên,
	    tinh khiết và những cảm xúc nhẹ nhàng trong cuộc sống. Đây là món quà lý tưởng
	    để gửi gắm sự quan tâm một cách tinh tế và chân thành 🤍
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