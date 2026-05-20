package T_Luxury_dao;

import java.sql.*;
import java.util.*;
import T_Luxury_models.LoaiHoa;

public class LoaiHoaDAO {

    public List<LoaiHoa> getAll() {
        List<LoaiHoa> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM loai_hoa";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                LoaiHoa l = new LoaiHoa(
                    rs.getInt("id"),
                    rs.getString("ten_loai")
                );
                list.add(l);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public void insert(String tenLoai) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO loai_hoa(ten_loai) VALUES (?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tenLoai);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void update(int id, String tenLoai) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "UPDATE loai_hoa SET ten_loai=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, tenLoai);
            ps.setInt(2, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "DELETE FROM loai_hoa WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            int row = ps.executeUpdate();
            System.out.println("DELETE ROW = " + row);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<LoaiHoa> search(String keyword) {
        List<LoaiHoa> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM loai_hoa WHERE ten_loai LIKE ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                LoaiHoa l = new LoaiHoa(
                    rs.getInt("id"),
                    rs.getString("ten_loai")
                );
                list.add(l);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
