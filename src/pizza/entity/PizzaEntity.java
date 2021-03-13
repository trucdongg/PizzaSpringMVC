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
@Table(name="Pizza")
public class PizzaEntity {
	@Id
	@GeneratedValue
	@Column(name="id_pizza")
	private String id_pizza;
	@Column(name="name")
	private String name;
	@Column(name="detail")
	private String detail;
	@Column(name="hinh")
	private String hinh;
	@OneToMany(mappedBy="piz",fetch = FetchType.EAGER)
	private Collection<KichThuocEntity> kichthuoc;
	@OneToMany(mappedBy="pizza",fetch = FetchType.EAGER)
	private Collection<CTGHEntity> pizzas;
	@Column(name="trangthai")
	private boolean trangthai;
	
	public boolean isTrangthai() {
		return trangthai;
	}
	public void setTrangthai(boolean trangthai) {
		this.trangthai = trangthai;
	}
	public String getId_pizza() {
		return id_pizza;
	}
	public void setId_pizza(String id_pizza) {
		this.id_pizza = id_pizza;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getHinh() {
		return hinh;
	}
	public void setHinh(String hinh) {
		this.hinh = hinh;
	}
	public Collection<KichThuocEntity> getKichthuoc() {
		return kichthuoc;
	}
	public void setKichthuoc(Collection<KichThuocEntity> kichthuoc) {
		this.kichthuoc = kichthuoc;
	}
	public Collection<CTGHEntity> getPizzas() {
		return pizzas;
	}
	public void setPizzas(Collection<CTGHEntity> pizzas) {
		this.pizzas = pizzas;
	}
	
	
	
	
	
	

}
