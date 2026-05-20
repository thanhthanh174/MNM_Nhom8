package T_Luxury_dao;


import java.sql.*;
import java.util.*;
import T_Luxury_models.SanPham;

public class SanPhamDAO {

    // ======================
    // LẤY TẤT CẢ SẢN PHẨM
    // ======================
    public List<SanPham> getAllSanPham() {

        List<SanPham> list = new ArrayList<>();

        String sql = "SELECT * FROM san_pham";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                SanPham sp = new SanPham(
                        rs.getInt("id"),
                        rs.getString("ten_hoa"),
                        rs.getDouble("gia"),
                        rs.getInt("so_luong_ton"),
                        rs.getString("hinh_anh"),
                        rs.getString("mo_ta"),
                        rs.getInt("loai_id")
                );

                list.add(sp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ======================
    // THÊM SẢN PHẨM
    // ======================
    public void insert(String ten, double gia, int soLuong,
                       String hinh, String moTa, int loaiId) {

        String sql = "INSERT INTO san_pham " +
                     "(ten_hoa, gia, so_luong_ton, hinh_anh, mo_ta, loai_id) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, ten);
            ps.setDouble(2, gia);
            ps.setInt(3, soLuong);
            ps.setString(4, hinh);
            ps.setString(5, moTa);
            ps.setInt(6, loaiId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ======================
    // XÓA SẢN PHẨM
    // ======================
    public void delete(int id) {

        String sql = "DELETE FROM san_pham WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ======================
    // SỬA SẢN PHẨM
    // ======================
    public void update(int id, String ten, double gia,
            int soLuong, String hinh, String moTa, int loaiId) {

String sql = "UPDATE san_pham SET " +
     "ten_hoa=?, gia=?, so_luong_ton=?, hinh_anh=?, mo_ta=?, loai_id=? " +
     "WHERE id=?";

try (Connection conn = DBConnection.getConnection();
  PreparedStatement ps = conn.prepareStatement(sql)) {

 ps.setString(1, ten);
 ps.setDouble(2, gia);
 ps.setInt(3, soLuong);
 ps.setString(4, hinh);
 ps.setString(5, moTa);
 ps.setInt(6, loaiId);
 ps.setInt(7, id);
ps.executeUpdate();

} catch (Exception e) {
 e.printStackTrace();
}
}

    // ======================
    // LẤY 1 SẢN PHẨM (SỬA)
    // ======================
    public SanPham getById(int id) {

        String sql = "SELECT * FROM san_pham WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new SanPham(
                        rs.getInt("id"),
                        rs.getString("ten_hoa"),
                        rs.getDouble("gia"),
                        rs.getInt("so_luong_ton"),
                        rs.getString("hinh_anh"),
                        rs.getString("mo_ta"),
                        rs.getInt("loai_id")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    public List<SanPham> search(String keyword) {

        List<SanPham> list = new ArrayList<>();

        String sql = "SELECT * FROM san_pham WHERE ten_hoa LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                SanPham sp = new SanPham(
                        rs.getInt("id"),
                        rs.getString("ten_hoa"),
                        rs.getDouble("gia"),
                        rs.getInt("so_luong_ton"),
                        rs.getString("hinh_anh"),
                        rs.getString("mo_ta"),
                        rs.getInt("loai_id")
                );

                list.add(sp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
