package T_Luxury_models;

public class SanPham {

    private int id;
    private String tenSP;
    private double gia;
    private int soLuong;
    private String hinhAnh;
    private String moTa;
    private int idLoai;

    public SanPham(int id, String tenSP, double gia, int soLuong,
                   String hinhAnh, String moTa, int idLoai) {
        this.id = id;
        this.tenSP = tenSP;
        this.gia = gia;
        this.soLuong = soLuong;
        this.hinhAnh = hinhAnh;
        this.moTa = moTa;
        this.idLoai = idLoai;
    }

    public int getId() { return id; }
    public String getTenSP() { return tenSP; }
    public double getGia() { return gia; }
    public int getSoLuong() { return soLuong; }
    public String getHinhAnh() { return hinhAnh; }
    public String getMoTa() { return moTa; }
    public int getIdLoai() { return idLoai; }
}