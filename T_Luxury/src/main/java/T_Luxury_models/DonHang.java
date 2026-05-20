package T_Luxury_models;

import java.util.Date;

public class DonHang {

    private int id;
    private int nguoiDungId;
    private double tongTien;
    private String trangThai;
    private String trangThaiThanhToan;
    private String phuongThucThanhToan;

    private String tenNguoiGui;
    private String sdtNguoiGui;

    private String tenNguoiNhan;
    private String sdtNguoiNhan;
    private String diaChiNhan;

    private Date ngayGiao;
    private String thoiGianGiao;

    private String loiNhan;
    private String yeuCauKhac;

    // ===== CONSTRUCTOR FULL =====
    public DonHang(int id, int nguoiDungId, double tongTien,
                   String trangThai, String trangThaiThanhToan, String phuongThucThanhToan,
                   String tenNguoiGui, String sdtNguoiGui,
                   String tenNguoiNhan, String sdtNguoiNhan, String diaChiNhan,
                   Date ngayGiao, String thoiGianGiao,
                   String loiNhan, String yeuCauKhac) {

        this.id = id;
        this.nguoiDungId = nguoiDungId;
        this.tongTien = tongTien;
        this.trangThai = trangThai;
        this.trangThaiThanhToan = trangThaiThanhToan;
        this.phuongThucThanhToan = phuongThucThanhToan;

        this.tenNguoiGui = tenNguoiGui;
        this.sdtNguoiGui = sdtNguoiGui;

        this.tenNguoiNhan = tenNguoiNhan;
        this.sdtNguoiNhan = sdtNguoiNhan;
        this.diaChiNhan = diaChiNhan;

        this.ngayGiao = ngayGiao;
        this.thoiGianGiao = thoiGianGiao;

        this.loiNhan = loiNhan;
        this.yeuCauKhac = yeuCauKhac;
    }

    // ===== GETTERS =====
    public int getId() { return id; }
    public int getNguoiDungId() { return nguoiDungId; }
    public double getTongTien() { return tongTien; }

    public String getTrangThai() { return trangThai; }
    public String getTrangThaiThanhToan() { return trangThaiThanhToan; }
    public String getPhuongThucThanhToan() { return phuongThucThanhToan; }

    public String getTenNguoiGui() { return tenNguoiGui; }
    public String getSdtNguoiGui() { return sdtNguoiGui; }

    public String getTenNguoiNhan() { return tenNguoiNhan; }
    public String getSdtNguoiNhan() { return sdtNguoiNhan; }
    public String getDiaChiNhan() { return diaChiNhan; }

    public Date getNgayGiao() { return ngayGiao; }
    public String getThoiGianGiao() { return thoiGianGiao; }

    public String getLoiNhan() { return loiNhan; }
    public String getYeuCauKhac() { return yeuCauKhac; }
}