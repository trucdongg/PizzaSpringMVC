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
@Table(name="DanhMuc")
public class DanhMucEntity {
	@Id
	@GeneratedValue
	@Column(name="iddanhmuc")
	private String iddanhmuc;
	@OneToMany(mappedBy="monan",fetch = FetchType.EAGER)
	private Collection<MonAnEntity> monans;
	@Column(name="tensanpham")
	private String tensanpham;
	public String getIddanhmuc() {
		return iddanhmuc;
	}
	public void setIddanhmuc(String iddanhmuc) {
		this.iddanhmuc = iddanhmuc;
	}
	public Collection<MonAnEntity> getMonans() {
		return monans;
	}
	public void setMonans(Collection<MonAnEntity> monans) {
		this.monans = monans;
	}
	public String getTensanpham() {
		return tensanpham;
	}
	public void setTensanpham(String tensanpham) {
		this.tensanpham = tensanpham;
	}

	
	
	
	
	

}
