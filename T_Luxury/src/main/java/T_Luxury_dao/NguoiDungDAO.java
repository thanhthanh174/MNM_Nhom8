package T_Luxury_dao;

import java.sql.*;
import java.util.*;
import T_Luxury_models.NguoiDung;

public class NguoiDungDAO {

    // =====================
    // ĐĂNG KÝ USER
    // =====================
    public void dangKy(String username, String password, String email) {

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO nguoi_dung (ten_dang_nhap, mat_khau, email) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, email);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =====================
    // LẤY ALL USER
    // =====================
    public List<NguoiDung> getAllNguoiDung() {

        List<NguoiDung> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM nguoi_dung ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                list.add(new NguoiDung(
                        rs.getInt("id"),
                        rs.getString("ten_dang_nhap"),
                        rs.getString("mat_khau"),
                        rs.getString("email")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // =====================
    // THÊM USER
    // =====================
    public void insert(String tenDN, String matKhau, String email) {

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO nguoi_dung (ten_dang_nhap, mat_khau, email) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, tenDN);
            ps.setString(2, matKhau);
            ps.setString(3, email);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =====================
    // LẤY 1 USER
    // =====================
    public NguoiDung getById(int id) {

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM nguoi_dung WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new NguoiDung(
                        rs.getInt("id"),
                        rs.getString("ten_dang_nhap"),
                        rs.getString("mat_khau"),
                        rs.getString("email")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
// =====================
    // UPDATE USER
    // =====================
    public void update(int id, String tenDN, String matKhau, String email) {

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "UPDATE nguoi_dung SET ten_dang_nhap=?, mat_khau=?, email=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, tenDN);
            ps.setString(2, matKhau);
            ps.setString(3, email);
            ps.setInt(4, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // =====================
    // DELETE USER
    // =====================
    public void delete(int id) {

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "DELETE FROM nguoi_dung WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<NguoiDung> search(String keyword) {

        List<NguoiDung> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "SELECT * FROM nguoi_dung WHERE ten_dang_nhap LIKE ? OR email LIKE ?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new NguoiDung(
                        rs.getInt("id"),
                        rs.getString("ten_dang_nhap"),
                        rs.getString("mat_khau"),
                        rs.getString("email")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}