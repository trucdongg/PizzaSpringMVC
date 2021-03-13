package pizza.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.transaction.Transactional;

import org.springframework.format.annotation.DateTimeFormat;

@Transactional
@Entity
@Table(name="GioHang")
public class GioHangEntity {
	@Id
	@GeneratedValue
	@Column(name="id_giohang")
	private String id_giohang;
	@ManyToOne
	@JoinColumn(name="iduser")
	private TaiKhoanEntity user;
	@OneToMany(mappedBy="gh",fetch = FetchType.EAGER)
	private Collection<CTGHEntity> ghs;
	@Column(name="total")
	private int total;
	@Column(name="tt")
	private boolean tt;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="dd/MM/yyyy")
	@Column(name="day")
	private Date day;
	@Column(name="diachi")
	private String diachi;
	@Column(name="sdt")
	private String sdt;
	@Column(name="tuchoi")
	private boolean tuchoi;
	
	public boolean isTuchoi() {
		return tuchoi;
	}
	public void setTuchoi(boolean tuchoi) {
		this.tuchoi = tuchoi;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public String getId_giohang() {
		return id_giohang;
	}
	public void setId_giohang(String id_giohang) {
		this.id_giohang = id_giohang;
	}
	public TaiKhoanEntity getUser() {
		return user;
	}
	public void setUser(TaiKhoanEntity user) {
		this.user = user;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public boolean isTt() {
		return tt;
	}
	public void setTt(boolean tt) {
		this.tt = tt;
	}
	public Collection<CTGHEntity> getGhs() {
		return ghs;
	}
	public void setGhs(Collection<CTGHEntity> ghs) {
		this.ghs = ghs;
	}



	
	
	
}
