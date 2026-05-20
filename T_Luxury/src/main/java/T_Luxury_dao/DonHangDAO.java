package T_Luxury_dao;

import java.sql.*;
import java.util.*;
import T_Luxury_models.DonHang;

public class DonHangDAO {

    // ================= GET ALL =================
    public List<DonHang> getAllDonHang() {

        List<DonHang> list = new ArrayList<>();

        String sql = "SELECT * FROM don_hang ORDER BY id DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                list.add(new DonHang(
                        rs.getInt("id"),
                        rs.getInt("nguoi_dung_id"),
                        rs.getDouble("tong_tien"),
                        rs.getString("trang_thai"),
                        rs.getString("trang_thai_thanh_toan"),
                        rs.getString("phuong_thuc_thanh_toan"),
                        rs.getString("ten_nguoi_gui"),
                        rs.getString("sdt_nguoi_gui"),
                        rs.getString("ten_nguoi_nhan"),
                        rs.getString("sdt_nguoi_nhan"),
                        rs.getString("dia_chi_nhan"),
                        rs.getDate("ngay_giao"),
                        rs.getString("thoi_gian_giao"),
                        rs.getString("loi_nhan"),
                        rs.getString("yeu_cau_khac")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= INSERT =================
    public void insertFull(int nguoiDungId, double tongTien,
            String trangThai, String trangThaiThanhToan,
            String phuongThucThanhToan,
            String tenNguoiGui, String sdtNguoiGui,
            String tenNguoiNhan, String sdtNguoiNhan,
            String diaChiNhan,
            String ngayGiao, String thoiGianGiao,
            String loiNhan, String yeuCauKhac) {

        String sql = "INSERT INTO don_hang " +
                "(nguoi_dung_id, tong_tien, trang_thai, trang_thai_thanh_toan, phuong_thuc_thanh_toan," +
                "ten_nguoi_gui, sdt_nguoi_gui, ten_nguoi_nhan, sdt_nguoi_nhan, dia_chi_nhan, ngay_giao, thoi_gian_giao, loi_nhan, yeu_cau_khac) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, nguoiDungId);
            ps.setDouble(2, tongTien);
            ps.setString(3, trangThai);
            ps.setString(4, trangThaiThanhToan);
            ps.setString(5, phuongThucThanhToan);
            ps.setString(6, tenNguoiGui);
            ps.setString(7, sdtNguoiGui);
            ps.setString(8, tenNguoiNhan);
            ps.setString(9, sdtNguoiNhan);
            ps.setString(10, diaChiNhan);
            ps.setDate(11, java.sql.Date.valueOf(ngayGiao));
            ps.setString(12, thoiGianGiao);
ps.setString(13, loiNhan);
            ps.setString(14, yeuCauKhac);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= UPDATE FULL =================
    public void updateFull(int id, int nguoiDungId, double tongTien,
                           String trangThai, String trangThaiThanhToan,
                           String phuongThucThanhToan,
                           String tenNguoiGui, String sdtNguoiGui,
                           String tenNguoiNhan, String sdtNguoiNhan,
                           String diaChiNhan,
                           String loiNhan, String yeuCauKhac) {

        String sql = "UPDATE don_hang SET " +
                "nguoi_dung_id=?, tong_tien=?, trang_thai=?, trang_thai_thanh_toan=?, phuong_thuc_thanh_toan=?," +
                "ten_nguoi_gui=?, sdt_nguoi_gui=?, ten_nguoi_nhan=?, sdt_nguoi_nhan=?, dia_chi_nhan=?," +
                "loi_nhan=?, yeu_cau_khac=? WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, nguoiDungId);
            ps.setDouble(2, tongTien);
            ps.setString(3, trangThai);
            ps.setString(4, trangThaiThanhToan);
            ps.setString(5, phuongThucThanhToan);
            ps.setString(6, tenNguoiGui);
            ps.setString(7, sdtNguoiGui);
            ps.setString(8, tenNguoiNhan);
            ps.setString(9, sdtNguoiNhan);
            ps.setString(10, diaChiNhan);
            ps.setString(11, loiNhan);
            ps.setString(12, yeuCauKhac);
            ps.setInt(13, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= DELETE =================
    public void xoaDonHang(int id) {

        String sql = "DELETE FROM don_hang WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================= GET BY ID =================
    public DonHang getById(int id) {

        String sql = "SELECT * FROM don_hang WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new DonHang(
                        rs.getInt("id"),
                        rs.getInt("nguoi_dung_id"),
                        rs.getDouble("tong_tien"),
                        rs.getString("trang_thai"),
                        rs.getString("trang_thai_thanh_toan"),
                        rs.getString("phuong_thuc_thanh_toan"),
rs.getString("ten_nguoi_gui"),
                        rs.getString("sdt_nguoi_gui"),
                        rs.getString("ten_nguoi_nhan"),
                        rs.getString("sdt_nguoi_nhan"),
                        rs.getString("dia_chi_nhan"),
                        rs.getDate("ngay_giao"),
                        rs.getString("thoi_gian_giao"),
                        rs.getString("loi_nhan"),
                        rs.getString("yeu_cau_khac")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    public List<DonHang> search(String keyword) {

        List<DonHang> list = new ArrayList<>();

        String sql = "SELECT * FROM don_hang WHERE ten_nguoi_nhan LIKE ? OR ten_nguoi_gui LIKE ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new DonHang(
                        rs.getInt("id"),
                        rs.getInt("nguoi_dung_id"),
                        rs.getDouble("tong_tien"),
                        rs.getString("trang_thai"),
                        rs.getString("trang_thai_thanh_toan"),
                        rs.getString("phuong_thuc_thanh_toan"),
                        rs.getString("ten_nguoi_gui"),
                        rs.getString("sdt_nguoi_gui"),
                        rs.getString("ten_nguoi_nhan"),
                        rs.getString("sdt_nguoi_nhan"),
                        rs.getString("dia_chi_nhan"),
                        rs.getDate("ngay_giao"),
                        rs.getString("thoi_gian_giao"),
                        rs.getString("loi_nhan"),
                        rs.getString("yeu_cau_khac")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}