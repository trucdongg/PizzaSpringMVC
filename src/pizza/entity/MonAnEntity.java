package pizza.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.transaction.Transactional;

@Transactional
@Entity
@Table(name="MonAn")
public class MonAnEntity {
	@Id
	@GeneratedValue
	@Column(name="idmonan")
	private String idmonan;
	@OneToMany(mappedBy="monanct",fetch = FetchType.EAGER)
	private Collection<CTGHEntity> monancts;
	@ManyToOne
	@JoinColumn(name="madanhmuc")
	private DanhMucEntity monan;

	@Column(name="tenmonan")
	private String tenmonan;
	@Column(name="mota")
	private String mota;
	@Column(name="giatien")
	private int giatien;
	@Column(name="hinhanh")
	private String hinhanh;
	@Column(name="trangthai")
	private boolean trangthai;
	@Column(name="soluong")
	private int soluong;
	
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public boolean isTrangthai() {
		return trangthai;
	}
	public void setTrangthai(boolean trangthai) {
		this.trangthai = trangthai;
	}
	public String getIdmonan() {
		return idmonan;
	}
	public void setIdmonan(String idmonan) {
		this.idmonan = idmonan;
	}
	public Collection<CTGHEntity> getMonancts() {
		return monancts;
	}
	public void setMonancts(Collection<CTGHEntity> monancts) {
		this.monancts = monancts;
	}
	public DanhMucEntity getMonan() {
		return monan;
	}
	public void setMonan(DanhMucEntity monan) {
		this.monan = monan;
	}

	
	public String getTenmonan() {
		return tenmonan;
	}
	public void setTenmonan(String tenmonan) {
		this.tenmonan = tenmonan;
	}
	public String getMota() {
		return mota;
	}
	public void setMota(String mota) {
		this.mota = mota;
	}
	public int getGiatien() {
		return giatien;
	}
	public void setGiatien(int giatien) {
		this.giatien = giatien;
	}
	public String getHinhanh() {
		return hinhanh;
	}
	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}
	
	
	
	
	
	

}
