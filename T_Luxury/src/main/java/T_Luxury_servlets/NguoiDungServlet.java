package T_Luxury_servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import T_Luxury_dao.NguoiDungDAO;

@WebServlet("/NguoiDungServlet")
public class NguoiDungServlet extends HttpServlet {

    NguoiDungDAO dao = new NguoiDungDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        // ===== XÓA =====
        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.delete(id);

            resp.sendRedirect(req.getContextPath() + "/NguoiDungServlet");
            return;
        }

        // ===== TÌM KIẾM =====
        String keyword = req.getParameter("keyword");

        if (keyword != null && !keyword.trim().isEmpty()) {
            req.setAttribute("list", dao.search(keyword));
        } else {
            req.setAttribute("list", dao.getAllNguoiDung());
        }

        req.getRequestDispatcher("/admin/NguoiDung.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");

        // ===== THÊM =====
        if ("add".equals(action)) {

            String ten = req.getParameter("tenDangNhap");
            String mk = req.getParameter("matKhau");
            String email = req.getParameter("email");

            dao.insert(ten, mk, email);
        }

        // ===== SỬA =====
        else if ("update".equals(action)) {

            int id = Integer.parseInt(req.getParameter("id"));
            String ten = req.getParameter("tenDangNhap");
            String mk = req.getParameter("matKhau");
            String email = req.getParameter("email");

            dao.update(id, ten, mk, email);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/NguoiDung.jsp");
    }
}
