package T_Luxury_dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class NguoiDungDAO {
	public static void dangKy(String username, String password, String email) {
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
}
