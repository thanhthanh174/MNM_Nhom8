package T_Luxury_servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import T_Luxury_dao.DonHangDAO;

@WebServlet("/DonHangServlet")
public class DonHangServlet extends HttpServlet {

    DonHangDAO dao = new DonHangDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.xoaDonHang(id);

            resp.sendRedirect(req.getContextPath() + "/DonHangServlet");
            return;
        }

        String keyword = req.getParameter("keyword");

        if (keyword != null && !keyword.trim().isEmpty()) {
            req.setAttribute("list", dao.search(keyword));
        } else {
            req.setAttribute("list", dao.getAllDonHang());
        }

        req.getRequestDispatcher("/admin/DonHang.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");

        if ("add".equals(action)) {

            dao.insertFull(
            		Integer.parseInt(req.getParameter("nguoiDungId")),
                    Double.parseDouble(req.getParameter("tongTien")),
                    req.getParameter("trangThai"),
                    req.getParameter("trangThaiThanhToan"),
                    req.getParameter("phuongThucThanhToan"),
                    req.getParameter("tenNguoiGui"),
                    req.getParameter("sdtNguoiGui"),
                    req.getParameter("tenNguoiNhan"),
                    req.getParameter("sdtNguoiNhan"),
                    req.getParameter("diaChiNhan"),
                    req.getParameter("ngayGiao"),
                    req.getParameter("thoiGianGiao"),
                    req.getParameter("loiNhan"),
                    ""
            );
        }

        else if ("update".equals(action)) {

            dao.updateFull(
                    Integer.parseInt(req.getParameter("id")),
                    Integer.parseInt(req.getParameter("nguoiDungId")),
                    Double.parseDouble(req.getParameter("tongTien")),
                    req.getParameter("trangThai"),
                    req.getParameter("trangThaiThanhToan"),
                    req.getParameter("phuongThucThanhToan"),
                    req.getParameter("tenNguoiGui"),
                    req.getParameter("sdtNguoiGui"),
                    req.getParameter("tenNguoiNhan"),
                    req.getParameter("sdtNguoiNhan"),
                    req.getParameter("diaChiNhan"),
                    req.getParameter("loiNhan"),
                    req.getParameter("yeuCauKhac")
            );
}

        resp.sendRedirect(req.getContextPath() + "/admin/DonHang.jsp");
    }
}