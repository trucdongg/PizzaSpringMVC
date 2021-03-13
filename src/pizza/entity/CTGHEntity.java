package pizza.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;
import javax.transaction.Transactional;

@Transactional
@Entity
@Table(name="CTGH")
public class CTGHEntity {
	@Id
	@GeneratedValue
	@Column(name="id_ctgh")
	private String id_ctgh;
	@ManyToOne
	@JoinColumn(name="idgh")
	private GioHangEntity gh;
	@ManyToOne
	@JoinColumn(name="idpizza")
	private PizzaEntity pizza;
	@ManyToOne
	@JoinColumn(name="idkt")
	private KichThuocEntity kt;
	@Column(name="sl")
	private int sl;
	@ManyToOne
	@JoinColumn(name="idmonan")
	private MonAnEntity monanct;
	@Column(name="soluongmonan")
	private int soluongmonan;
	@Column(name="giapizza")
	private int giapizza;
	@Column(name="giamonan")
	private int giamonan;
	
	public int getGiapizza() {
		return giapizza;
	}
	public void setGiapizza(int giapizza) {
		this.giapizza = giapizza;
	}
	public int getGiamonan() {
		return giamonan;
	}
	public void setGiamonan(int giamonan) {
		this.giamonan = giamonan;
	}
	public int getSoluongmonan() {
		return soluongmonan;
	}
	public void setSoluongmonan(int soluongmonan) {
		this.soluongmonan = soluongmonan;
	}
	public MonAnEntity getMonanct() {
		return monanct;
	}
	public void setMonanct(MonAnEntity monanct) {
		this.monanct = monanct;
	}
	public String getId_ctgh() {
		return id_ctgh;
	}
	public void setId_ctgh(String id_ctgh) {
		this.id_ctgh = id_ctgh;
	}
	public GioHangEntity getGh() {
		return gh;
	}
	public void setGh(GioHangEntity gh) {
		this.gh = gh;
	}
	public PizzaEntity getPizza() {
		return pizza;
	}
	public void setPizza(PizzaEntity pizza) {
		this.pizza = pizza;
	}
	public KichThuocEntity getKt() {
		return kt;
	}
	public void setKt(KichThuocEntity kt) {
		this.kt = kt;
	}
	public int getSl() {
		return sl;
	}
	public void setSl(int sl) {
		this.sl = sl;
	}
	
	
	
	
	
	
}
