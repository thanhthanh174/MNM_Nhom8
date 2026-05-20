package T_Luxury_models;

public class NguoiDung {

    private int id;
    private String tenDangNhap;
    private String matKhau;
    private String email;

    // ===== constructor rỗng =====
    public NguoiDung() {
    }

    // ===== constructor full =====
    public NguoiDung(int id, String tenDangNhap, String matKhau, String email) {
        this.id = id;
        this.tenDangNhap = tenDangNhap;
        this.matKhau = matKhau;
        this.email = email;
    }

    // ===== getter/setter =====
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}