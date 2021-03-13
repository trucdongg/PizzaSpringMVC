package pizza.entity;


import java.util.Collection;

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
@Table(name="KichThuoc")
public class KichThuocEntity {
	@Id
	@GeneratedValue
	@Column(name="id_kichthuoc")
	private String id_kichthuoc;

	@ManyToOne
	@JoinColumn(name="idpizza")
	private PizzaEntity piz;
	@OneToMany(mappedBy="kt",fetch = FetchType.EAGER)
	private Collection<CTGHEntity> kts;
	@Column(name="tenkc")
	private String tenkc;
	@Column(name="gia")
	private int gia;
	@Column(name="idtenkc")
	private int idtenkc;
	@Column(name="soluong")
	private int soluong;
	
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	public int getIdtenkc() {
		return idtenkc;
	}
	public void setIdtenkc(int idtenkc) {
		this.idtenkc = idtenkc;
	}
	public String getId_kichthuoc() {
		return id_kichthuoc;
	}
	public void setId_kichthuoc(String id_kichthuoc) {
		this.id_kichthuoc = id_kichthuoc;
	}
	public PizzaEntity getPiz() {
		return piz;
	}
	public void setPiz(PizzaEntity piz) {
		this.piz = piz;
	}
	public String getTenkc() {
		return tenkc;
	}
	public void setTenkc(String tenkc) {
		this.tenkc = tenkc;
	}
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	public Collection<CTGHEntity> getKts() {
		return kts;
	}
	public void setKts(Collection<CTGHEntity> kts) {
		this.kts = kts;
	}
	
}
