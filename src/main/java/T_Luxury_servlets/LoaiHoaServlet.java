package T_Luxury_servlets;

import java.io.IOException;
import java.util.List;

import T_Luxury_dao.LoaiHoaDAO;
import T_Luxury_models.LoaiHoa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/loaihoa")
public class LoaiHoaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        LoaiHoaDAO dao = new LoaiHoaDAO();
        List<LoaiHoa> list = dao.getAllLoaiHoa();

        request.setAttribute("dsLoaiHoa", list);

        request.getRequestDispatcher("admin/loaihoa.jsp")
               .forward(request, response);
    }
}