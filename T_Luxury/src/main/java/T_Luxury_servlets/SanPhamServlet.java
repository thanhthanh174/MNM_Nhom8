package T_Luxury_servlets;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import T_Luxury_dao.SanPhamDAO;
import T_Luxury_models.SanPham;

@WebServlet("/SanPhamServlet")
@MultipartConfig
public class SanPhamServlet extends HttpServlet {

    SanPhamDAO dao = new SanPhamDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("delete".equals(action)) {
            String idStr = req.getParameter("id");

            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                dao.delete(id);
            }
        }

        resp.sendRedirect(req.getContextPath() + "/admin/SanPham.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        // ================= ADD =================
        if ("add".equals(action)) {

            String ten = req.getParameter("ten");
            double gia = Double.parseDouble(req.getParameter("gia"));
            int soLuong = Integer.parseInt(req.getParameter("soLuong"));
            String moTa = req.getParameter("moTa");
            int loaiId = Integer.parseInt(req.getParameter("loaiId"));

            Part file = req.getPart("hinh");
            String fileName = file.getSubmittedFileName();

            String hinh = "";

            if (fileName != null && !fileName.isEmpty()) {

                String path = req.getServletContext().getRealPath("/images");
                File dir = new File(path);
                if (!dir.exists()) dir.mkdirs();

                file.write(path + File.separator + fileName);

                hinh = fileName;
            }

            dao.insert(ten, gia, soLuong, hinh, moTa, loaiId);
        }

        // ================= UPDATE =================
        if ("update".equals(action)) {

            int id = Integer.parseInt(req.getParameter("id"));
            String ten = req.getParameter("ten");
            double gia = Double.parseDouble(req.getParameter("gia"));
            int soLuong = Integer.parseInt(req.getParameter("soLuong"));
            String moTa = req.getParameter("moTa");
            int loaiId = Integer.parseInt(req.getParameter("loaiId"));

            Part file = req.getPart("hinh");
            String fileName = file.getSubmittedFileName();

            String hinh;

            if (fileName != null && !fileName.isEmpty()) {

                String path = req.getServletContext().getRealPath("/images");
                File dir = new File(path);
                if (!dir.exists()) dir.mkdirs();
file.write(path + File.separator + fileName);

                hinh = fileName;
            } else {
                SanPham sp = dao.getById(id);
                hinh = sp.getHinhAnh();
            }

            dao.update(id, ten, gia, soLuong, hinh, moTa, loaiId);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/SanPham.jsp");
    }
}
