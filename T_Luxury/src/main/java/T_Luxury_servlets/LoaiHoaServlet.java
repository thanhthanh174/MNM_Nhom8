package T_Luxury_servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import T_Luxury_dao.LoaiHoaDAO;

@WebServlet("/LoaiHoaServlet")
public class LoaiHoaServlet extends HttpServlet {

    LoaiHoaDAO dao = new LoaiHoaDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("delete".equals(action)) {

            String idStr = req.getParameter("id");

            if (idStr != null && !idStr.isEmpty()) {
                try {
                    int id = Integer.parseInt(idStr);
                    dao.delete(id);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        resp.sendRedirect(req.getContextPath() + "/admin/LoaiHoa.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        String tenLoai = req.getParameter("tenLoai");

        if ("add".equals(action)) {
            dao.insert(tenLoai);
        }

        if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.update(id, tenLoai);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/LoaiHoa.jsp");
    }
}
