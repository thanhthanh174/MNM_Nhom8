package T_Luxury_models;

public class LoaiHoa {

    private int id;
    private String tenLoai;

    // ===== CONSTRUCTOR RỖNG (BẮT BUỘC NÊN CÓ) =====
    public LoaiHoa() {
    }

    // ===== CONSTRUCTOR FULL =====
    public LoaiHoa(int id, String tenLoai) {
        this.id = id;
        this.tenLoai = tenLoai;
    }

    // ===== GETTER / SETTER =====
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenLoai() {
        return tenLoai;
    }

    public void setTenLoai(String tenLoai) {
        this.tenLoai = tenLoai;
    }
}