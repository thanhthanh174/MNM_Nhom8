package T_Luxury_controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import T_Luxury_dao.SanPhamDAO;
import T_Luxury_models.SanPham;
import jakarta.servlet.http.HttpServlet;

@WebServlet("/SanPhamController")
public class SanPhamController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        SanPhamDAO dao = new SanPhamDAO();
        List<SanPham> list = dao.getAllSanPham();

        request.setAttribute("listSP", list);

        request.getRequestDispatcher("admin/SanPham.jsp").forward(request, response);
    }
}