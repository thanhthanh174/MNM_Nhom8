package T_Luxury_servlets;

import java.io.IOException;

import T_Luxury_dao.NguoiDungDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DangKyServlet extends HttpServlet {
	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String username = request.getParameter("ten_dang_nhap");
	        String password = request.getParameter("mat_khau");
	        String email = request.getParameter("email");

	        NguoiDungDAO.dangKy(username, password, email);

	        response.sendRedirect("login.jsp");
	    }
}
