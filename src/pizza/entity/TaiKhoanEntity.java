package pizza.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.transaction.Transactional;

@Transactional
@Entity
@Table(name="TaiKhoan")
public class TaiKhoanEntity {
	@Id
	@GeneratedValue
	@Column(name="id_taikhoan")
	private String id_taikhoan;

	@Column(name="hoten")
	private String hoten;
	@Column(name="taikhoan")
	private String taikhoan;
	@Column(name="email")
	private String email;
	@Column(name="sdt")
	private String sdt;
	@Column(name="matkhau")
	private String matkhau;
	@Column(name="ngaysinh")
	private String ngaysinh;
	@Column(name="gioitinh")
	private boolean gioitinh;
	@Column(name="quyen")
	private int quyen;
	@Column(name="diachi")
	private String diachi;
	@OneToMany(mappedBy="user",fetch = FetchType.EAGER)
	private Collection<GioHangEntity> users;
	public String getId_taikhoan() {
		return id_taikhoan;
	}
	public void setId_taikhoan(String id_taikhoan) {
		this.id_taikhoan = id_taikhoan;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getTaikhoan() {
		return taikhoan;
	}
	public void setTaikhoan(String taikhoan) {
		this.taikhoan = taikhoan;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	public String getNgaysinh() {
		return ngaysinh;
	}
	public void setNgaysinh(String ngaysinh) {
		this.ngaysinh = ngaysinh;
	}
	public boolean isGioitinh() {
		return gioitinh;
	}
	public void setGioitinh(boolean gioitinh) {
		this.gioitinh = gioitinh;
	}
	public int getQuyen() {
		return quyen;
	}
	public void setQuyen(int quyen) {
		this.quyen = quyen;
	}
	public Collection<GioHangEntity> getUsers() {
		return users;
	}
	public void setUsers(Collection<GioHangEntity> users) {
		this.users = users;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	
	
	
	
}
