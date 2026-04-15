package T_Luxury_dao;

import java.sql.*;
import java.util.*;

import T_Luxury_models.LoaiHoa;

public class LoaiHoaDAO {
    public static List<LoaiHoa> getAll() {
        List<LoaiHoa> list = new ArrayList<>();

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM loai_hoa";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                LoaiHoa l = new LoaiHoa(0, sql);
                l.setId(rs.getInt("id"));
                l.setTenLoai(rs.getString("ten_loai"));
                list.add(l);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

	public List<LoaiHoa> getAllLoaiHoa() {
		// TODO Auto-generated method stub
		return null;
	}
}