package T_Luxury_servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import T_Luxury_models.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class GioHangServlet {
	@WebServlet("/add-to-cart")
	public class AddToCartServlet extends HttpServlet {

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String name = request.getParameter("name");
	        int price = Integer.parseInt(request.getParameter("price"));
	        String img = request.getParameter("img");

	        // tạo sản phẩm
	        Product p = new Product(name, price, img);

	        HttpSession session = request.getSession();

	        List<Product> cart = (List<Product>) session.getAttribute("cart");

	        if(cart == null){
	            cart = new ArrayList<>();
	        }

	        cart.add(p);

	        session.setAttribute("cart", cart);

	        response.sendRedirect("giohang.jsp");
	    }
	}
}
