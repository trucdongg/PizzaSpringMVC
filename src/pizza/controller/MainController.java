package pizza.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pizza.entity.CTGHEntity;
import pizza.entity.DanhMucEntity;
import pizza.entity.GioHangEntity;
import pizza.entity.KichThuocEntity;
import pizza.entity.MonAnEntity;
import pizza.entity.PizzaEntity;
import pizza.entity.TaiKhoanEntity;
import pizza.query.QueryT;
@Transactional
@Controller
@RequestMapping("/user")
public class MainController {
	
	@Autowired
	SessionFactory factory;
	@Autowired
	ServletContext context;
	TaiKhoanEntity dangky=new TaiKhoanEntity();
	KichThuocEntity kt=new KichThuocEntity();
	PizzaEntity pz=new PizzaEntity();
	GioHangEntity gh=new GioHangEntity();
	CTGHEntity ctgh=new CTGHEntity();
	MonAnEntity ma=new MonAnEntity();
	DanhMucEntity danh=new DanhMucEntity();
	
// ------------------------------- PIZZAFULL ------------------------------------------
	@RequestMapping(value="/monan",method = RequestMethod.GET)
	public String monanget(ModelMap model,ModelMap mm,HttpSession ss){
			if(ss.getAttribute("dangnhap")==null) {
				return "redirect:../test/dangnhap.htm";
			}
			else if((int)ss.getAttribute("check")==1) {
				return "redirect:../user/pizza.htm";
			}
			else {
				Session session = factory.getCurrentSession();
				String hql = "from PizzaEntity ORDER BY id_pizza DESC";
				Query query = session.createQuery(hql);
				List<PizzaEntity> list = query.list();
				
				model.addAttribute("list",list);
			
				return "monan";
			}
			
	}
	
	@RequestMapping(value="/suamonan",method = RequestMethod.POST)
	public String suamonan(ModelMap model,
			@RequestParam("tensanpham") String tensanpham,
			@RequestParam("photo") MultipartFile photo,
			@RequestParam("mota") String mota,
			@RequestParam("id") int id) throws InterruptedException  {
			QueryT qt = new QueryT(factory);
			Session session = factory.getCurrentSession();
			String hql = "FROM PizzaEntity pz where pz.id_pizza LIKE "+id;
			Query query = session.createQuery(hql);	
			PizzaEntity pz = (PizzaEntity) query.uniqueResult();
			pz.setName(tensanpham);
			pz.setDetail(mota);
			System.out.println(photo.getOriginalFilename());
		
			if(!photo.isEmpty()) {
				try {
					String photoPath = context.getRealPath("/load/pizza/"+photo.getOriginalFilename());
					System.out.println(photoPath);
					photo.transferTo(new File(photoPath));
					pz.setHinh(photo.getOriginalFilename().trim());
					qt.update(pz);
					
					return "redirect:../user/monan.htm";
				}
				catch(Exception ex) {
					System.out.println(ex);
				}
			}

			
			
			return "redirect:../user/monan.htm";
	}	
	
	
	
	@RequestMapping(value="/thucdon",method = RequestMethod.GET)
	public String thucdon(ModelMap model,ModelMap mm,HttpSession ss){
		Session session = factory.getCurrentSession();
		String hql = "from PizzaEntity pz where pz.trangthai=true";
		Query query = session.createQuery(hql);
		List<PizzaEntity> list = query.list();
		
		model.addAttribute("list",list);
		return "dathang";
	}
	
	@RequestMapping(value="/pizza",method = RequestMethod.GET)
	public String pizza(ModelMap model,ModelMap mm,HttpSession ss){
		
		Session session = factory.getCurrentSession();
			String hql = "from PizzaEntity pz where pz.trangthai=true";
			Query query = session.createQuery(hql);
			List<PizzaEntity> list = query.list();
			System.out.println(list.size());
			model.addAttribute("list",list);
			 session = factory.getCurrentSession();
				
			 hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
			+"AND ctgh.gh.total=0 ";
			 
			 System.out.println(ss.getAttribute("iduser"));
			query = session.createQuery(hql);
			List <CTGHEntity> list2 = query.list();	
			ss.setAttribute("count", list2.size());
			return "dathang";
	}
	
	@RequestMapping(value="/datpizza",method = RequestMethod.POST)
	public void pizzapost(HttpServletRequest req, HttpServletResponse res, HttpSession ss
			,@RequestParam("idPizza") String pizzaId
			,@RequestParam("size") int sizeId
			,@RequestParam("soluong") int soluong
			,@RequestParam("giatien") int giatien) throws IOException{
		System.out.println(pizzaId);
		System.out.println(sizeId);
		System.out.println(soluong);
		String userId=(String) ss.getAttribute("iduser");
		System.out.println(userId);
		QueryT qt = new QueryT(factory);
		
		TaiKhoanEntity acc = ((TaiKhoanEntity)qt.select("TaiKhoanEntity", new String[]{"id_taikhoan="+userId}).get(0));
		List<Object> ghL = qt.select("GioHangEntity",new String[]{"user.id_taikhoan="+userId,"total=0"});
		if (ghL.size() == 0) {
			gh.setUser(acc);
			gh.setTt(false);
			qt.add(gh);
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM GioHangEntity gh where gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
		+"AND gh.total=0";
		Query query = session.createQuery(hql);
		GioHangEntity ghupdate= (GioHangEntity) query.uniqueResult();
		hql="FROM CTGHEntity ctgh where ctgh.gh.id_giohang = '"+ghupdate.getId_giohang()+"' and ctgh.pizza.id_pizza = '"+pizzaId+"'"
				+ " and ctgh.kt.id_kichthuoc = '"+sizeId+"'";
		query = session.createQuery(hql);
		CTGHEntity ctghupdate= (CTGHEntity) query.uniqueResult();
		if(ctghupdate!=null) {
			if(ctghupdate.getKt().getSoluong() >= ctghupdate.getSl()+soluong)
			ctghupdate.setSl(ctghupdate.getSl()+soluong);
			else
				ctghupdate.setSl(ctghupdate.getKt().getSoluong());
			qt.update(ctghupdate);
		}
		else {

			ctgh.setGh(((GioHangEntity)ghL.get(0)));
			ctgh.setKt(((KichThuocEntity)qt.select("KichThuocEntity",new String[] {"id_kichthuoc="+sizeId}).get(0)));
			ctgh.setGiapizza(giatien);
			ctgh.setGiamonan(0);
			ctgh.setPizza(((PizzaEntity)qt.select("PizzaEntity",new String[] {"id_pizza="+pizzaId}).get(0)));
			ctgh.setSl(soluong);
			ctgh.setMonanct(null);
			ctgh.setSoluongmonan(0);
			qt.add(ctgh);
		}

				 session = factory.getCurrentSession();
	
				 hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
				+"AND ctgh.gh.total=0";
				 query = session.createQuery(hql);
				List <CTGHEntity> list2 = query.list();	
				ss.setAttribute("count", list2.size());	
				PrintWriter out = res.getWriter();
				System.out.println(pizzaId);
	
	}
	
	
	@RequestMapping(value="/addpizza",method = RequestMethod.GET)
	public String themsanpham(ModelMap model,HttpSession ss){
		model.addAttribute("pizza", new PizzaEntity());
		model.addAttribute("kichthuoc", new KichThuocEntity());
		Session session = factory.getCurrentSession();
		
		String hql = "FROM PizzaEntity";
		Query query = session.createQuery(hql);
		List <PizzaEntity> list = query.list();
		model.addAttribute("list",list);
		return "thempizza";
	}
	
	@RequestMapping(value="/ktpizza",method = RequestMethod.GET)
	public String ktpizza(ModelMap model,HttpSession ss){
		model.addAttribute("pizza", new PizzaEntity());
		model.addAttribute("kichthuoc", new KichThuocEntity());
		Session session = factory.getCurrentSession();
		String hql = "FROM PizzaEntity pz where pz.trangthai=false";
		Query query = session.createQuery(hql);
		List <PizzaEntity> list = query.list();
		model.addAttribute("list",list);
		return "ktpizza";
	}
  
	@RequestMapping(value="/fixktpizza",method = RequestMethod.POST)
	public String fixktpizza(ModelMap model,HttpSession ss,HttpServletRequest request){
		QueryT qt = new QueryT(factory);
		String name=request.getParameter("piz");
		int tenidkc=Integer.parseInt(request.getParameter("tenidkc"));
		int gia=Integer.parseInt(request.getParameter("gia"));
		int soluong=Integer.parseInt(request.getParameter("soluong"));
		System.out.println(name);
		System.out.println(""+tenidkc);
		System.out.println(gia);
		System.out.println(soluong);
		String temp=null;
		if(tenidkc==0) {
			temp="Nhỏ";
		}
		else if (tenidkc==1) {
			temp="Vừa";
		}
		else if (tenidkc==2) {
			temp="Nhỏ";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM KichThuocEntity kt where kt.piz.id_pizza='"+name+"' and kt.idtenkc='"+tenidkc+"'";
		Query query = session.createQuery(hql);
		KichThuocEntity ktupdate =(KichThuocEntity)query.uniqueResult();
		ktupdate.setGia(gia);
		ktupdate.setSoluong(soluong);
		qt.update(ktupdate);
		model.addAttribute("message","Sửa Thành Công");
		session = factory.getCurrentSession();
		hql = "FROM PizzaEntity pz where pz.trangthai=true";
		query = session.createQuery(hql);
		List <PizzaEntity> list = query.list();
		model.addAttribute("list",list);
		return "fixkt";
	}
	
	
	
	
	@RequestMapping(value="/addktpizza",method = RequestMethod.POST)
	public String ktpizzapost(ModelMap model,HttpSession ss,HttpServletRequest request)
		throws ServletException, IOException{
		QueryT qt = new QueryT(factory);
		String name=request.getParameter("piz");
		int tenidkc=Integer.parseInt(request.getParameter("tenidkc"));
		int gia=Integer.parseInt(request.getParameter("gia"));
		int soluong=Integer.parseInt(request.getParameter("soluong"));
		System.out.println(name);
		System.out.println(""+tenidkc);
		System.out.println(gia);
		System.out.println(soluong);
		String temp=null;
		if(tenidkc==0) {
			temp="Nhỏ";
		}
		else if (tenidkc==1) {
			temp="Vừa";
		}
		else if (tenidkc==2) {
			temp="Nhỏ";
		}
		kt.setIdtenkc(tenidkc);
		kt.setGia(gia);
		kt.setSoluong(soluong);
		kt.setTenkc(temp);
		Session session = factory.getCurrentSession();
		String hql = "FROM PizzaEntity pz where pz.trangthai=false and pz.id_pizza='"+name+"'";
		Query query = session.createQuery(hql);
		PizzaEntity pzupdate =(PizzaEntity)query.uniqueResult();
		kt.setPiz(pzupdate);
		qt.add(kt);
		model.addAttribute("message","Thêm Thành Công");
		
		hql = "FROM PizzaEntity pz where pz.trangthai=false";
		query = session.createQuery(hql);
		List <PizzaEntity> list = query.list();
		model.addAttribute("list",list);
		return "ktpizza";
	
	}
	
	@RequestMapping(value="/fixkt",method = RequestMethod.GET)
	public String fixkt(ModelMap model)	throws ServletException, IOException{
		Session session = factory.getCurrentSession();
		String hql = "FROM PizzaEntity pz where pz.trangthai=true";
		Query query = session.createQuery(hql);
		List <PizzaEntity> list = query.list();
		model.addAttribute("list",list);
		return "fixkt";
	}
	@RequestMapping(value="/listkt",method = RequestMethod.POST)
	public void listkt(ModelMap model,@RequestParam("idPizza") String id, HttpServletResponse res)throws ServletException, IOException{
		Session session = factory.getCurrentSession();
		String hql = "FROM KichThuocEntity kt where kt.piz.id_pizza='"+id+"'";
		Query query = session.createQuery(hql);
		List <KichThuocEntity> listkt = query.list();
		PrintWriter out = res.getWriter();
		String s = "";
		for(KichThuocEntity i : listkt) {
			s+= i.getIdtenkc()+":"+i.getTenkc()+",";
		}
		out.print(s);
	}
	
	@RequestMapping(value="/fixslgia",method = RequestMethod.POST)
	public void fixslgia(HttpServletRequest req, HttpServletResponse res,@RequestParam("idPizza") String id, @RequestParam("size") int idtkt) throws IOException {
		Session session = factory.getCurrentSession();
		
		String hql = "FROM KichThuocEntity kt WHERE kt.piz.id_pizza='"+id+"' and kt.idtenkc="+idtkt;
		Query query = session.createQuery(hql);
		KichThuocEntity ktupdate = (KichThuocEntity)query.uniqueResult();
		PrintWriter out = res.getWriter();
		if(ktupdate != null)
			out.print(ktupdate.getGia()+","+ktupdate.getSoluong());	
		else
			out.print("");	
	}
	
	@RequestMapping(value="/addpizza",method = RequestMethod.POST)
	public String themsanphampost(@ModelAttribute("pizza") PizzaEntity pizza,
			ModelMap model,BindingResult errors,HttpServletRequest request,@RequestParam("photo") MultipartFile photo)
					throws ServletException, IOException{
		Session session = factory.getCurrentSession();
		String hql = "FROM PizzaEntity";
		Query query = session.createQuery(hql);
		List <PizzaEntity> list = query.list();
		model.addAttribute("list",list);
		String parten="^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ" +
	            "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểếiếnỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ" +
	            "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$";
	
		
		if(pizza.getName().trim().length()==0) {
			errors.rejectValue("name","pizza","Vui Lòng Nhập Tên Pizza!");		
		}
		else if(!pizza.getName().matches(parten)) {
			errors.rejectValue("name","pizza","Tên Không Hợp Lệ ");		
		
		}
		else if(pizza.getDetail().trim().length()==0) {
			errors.rejectValue("detail","pizza","Vui Lòng Nhập Mô Tả!");		
		}
		else if(!pizza.getDetail().matches(parten)) {
			errors.rejectValue("detail","pizza","Mô Tả Không Hợp Lệ!");	
		}
		
		else if(photo.isEmpty()) {
			model.addAttribute("bugphoto","Vui Lòng Chọn Hình Ảnh");
		}
		else if(!photo.isEmpty()){
			try {
				
				QueryT qt = new QueryT(factory);
				String photoPath = context.getRealPath("/load/pizza/"+photo.getOriginalFilename());
				System.out.println(photoPath);
				photo.transferTo(new File(photoPath));
				pizza.setHinh(photo.getOriginalFilename().trim());
				
				qt.add(pizza);
				model.addAttribute("message", "Thêm Thành Công");
				
				
			}
			catch(Exception ex) {
				System.out.println(ex);
			}
		}

		
		return "thempizza";
	}
		
// mở bán đóng bán pizza
	@RequestMapping(value="/mobanvadongban",method = RequestMethod.POST)
	public void mobanvadongban(ModelMap model,HttpSession ss
			,HttpServletResponse res
			,@RequestParam("idPizza") String id_pizza ) throws IOException{
		QueryT qt = new QueryT(factory);
		PrintWriter out = res.getWriter();
		Session session = factory.getCurrentSession();		
		String hql = "FROM PizzaEntity pz where pz.id_pizza='"+id_pizza+"'";
		Query query = session.createQuery(hql);
		PizzaEntity pz = (PizzaEntity)query.uniqueResult();
		pz.setTrangthai( !pz.isTrangthai());
		qt.update(pz);
		out.print(true);
	}
//  ------------------------------------ END PIZZA ----------------------------	
	
//	COMMON
	// mở bán đóng bán mon an khác
		@RequestMapping(value="/movadongmonan",method = RequestMethod.POST)
		public void movadongmonan(ModelMap model,HttpSession ss
				,HttpServletResponse res
				,@RequestParam("id") String id ) throws IOException{
			QueryT qt = new QueryT(factory);
			PrintWriter out = res.getWriter();
			Session session = factory.getCurrentSession();		
			String hql = "FROM MonAnEntity ma where ma.idmonan='"+id+"'";
			Query query = session.createQuery(hql);
			MonAnEntity pz = (MonAnEntity)query.uniqueResult();
			pz.setTrangthai( !pz.isTrangthai());
			qt.update(pz);
			out.print(true);
		}
	
// ------------------------------------ MÌ Ý ------------------------------------------	

		@RequestMapping(value="/fixmiy",method = RequestMethod.POST)
		public String fixmiy(ModelMap model,
				@RequestParam("tenmonan") String tenmonan,
				@RequestParam("photo") MultipartFile photo,
				@RequestParam("mota") String mota,
				@RequestParam("gia") int gia,
				@RequestParam("soluong") int soluong,
				@RequestParam("id") String id) throws InterruptedException  {
			System.out.println(tenmonan);
			System.out.println(mota);
			System.out.println(id);
			System.out.println(soluong);
			System.out.println(gia);
				QueryT qt = new QueryT(factory);
				Session session = factory.getCurrentSession();
				String hql = "FROM MonAnEntity ma where ma.idmonan='"+id+"'";
				Query query = session.createQuery(hql);	
				MonAnEntity maupdate = (MonAnEntity) query.uniqueResult();
				maupdate.setTenmonan(tenmonan);
				maupdate.setMota(mota);
				maupdate.setSoluong(soluong);
				maupdate.setGiatien(gia);
				System.out.println(photo.getOriginalFilename());			
				if(!photo.isEmpty()) {
					try {
						String photoPath = context.getRealPath("/load/miy/"+photo.getOriginalFilename());
						System.out.println(photoPath);
						photo.transferTo(new File(photoPath));
						maupdate.setHinhanh(photo.getOriginalFilename().trim());
						qt.update(maupdate);
						model.addAttribute("message","Sửa Thành Công");
						session = factory.getCurrentSession();
						hql = "from MonAnEntity ma where ma.monan.iddanhmuc =1";
						query = session.createQuery(hql);
						List <MonAnEntity> list = query.list();
						model.addAttribute("list",list);
						return "fixmiy";
					}
					catch(Exception ex) {
						System.out.println(ex);
					}
				}
				else {
					qt.update(maupdate);
					model.addAttribute("message","Sửa Thành Công");
					session = factory.getCurrentSession();
					hql = "from MonAnEntity ma where ma.monan.iddanhmuc =1";
					query = session.createQuery(hql);
					List <MonAnEntity> list = query.list();
					model.addAttribute("list",list);
					return "fixmiy";
				}

				
				
				return "fixmiy";
		}	
		
		
		
		
		
		@RequestMapping(value="/miy",method = RequestMethod.GET)
	public String miy(ModelMap model,ModelMap mm,HttpSession ss){
		
		Session session = factory.getCurrentSession();
			String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =1 and ma.soluong!=0";
			Query query = session.createQuery(hql);
			List<MonAnEntity> list = query.list();
			
			model.addAttribute("list",list);
			model.addAttribute("piz", new PizzaEntity());
			model.addAttribute("gh", new GioHangEntity());
			model.addAttribute("ctgh", new CTGHEntity());
			 session = factory.getCurrentSession();
				
			 hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
			+"AND ctgh.gh.total=0";
			query = session.createQuery(hql);
			List <CTGHEntity> list2 = query.list();	
			ss.setAttribute("count", list2.size());
			return "miy";
	}
	@RequestMapping(value="/thucdonmiy",method = RequestMethod.GET)
	public String thucdonmiy(ModelMap model,ModelMap mm,HttpSession ss){	
		Session session = factory.getCurrentSession();
		String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =1 and ma.soluong!=0";
		Query query = session.createQuery(hql);
		List<PizzaEntity> list = query.list();
		
		model.addAttribute("list",list);
		
			return "miy";
	}
	
	@RequestMapping(value="/fixmiy",method = RequestMethod.GET)
	public String fixmiy(ModelMap model)	throws ServletException, IOException{
		Session session = factory.getCurrentSession();
		String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =1";
		Query query = session.createQuery(hql);
		List <MonAnEntity> list = query.list();
		model.addAttribute("list",list);
		return "fixmiy";
	}
	
	@RequestMapping(value="/getmiy",method = RequestMethod.POST)
	public void getmiy(ModelMap model,@RequestParam("id") String id,HttpServletResponse res)	throws ServletException, IOException{
		Session session = factory.getCurrentSession();
		String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =1 and ma.idmonan='"+id+"'";
		Query query = session.createQuery(hql);
		MonAnEntity monan = (MonAnEntity) query.uniqueResult();
		
		PrintWriter out = res.getWriter();
		out.print(monan.getTenmonan()+"/"+monan.getMota()+"/"+monan.getHinhanh()+"/"+monan.getGiatien()+"/"+monan.getSoluong()+"/"+id);
	}
	
	
	@RequestMapping(value="/miy",method = RequestMethod.POST)
	public void miypost(HttpServletRequest req, HttpServletResponse res, HttpSession ss
			,@RequestParam("idMonan") String monAnId
			,@RequestParam("soluong") int soluong
			,@RequestParam("giatien") int gia) throws IOException{
		String userId=(String) ss.getAttribute("iduser");
		System.out.println(userId);
		QueryT qt = new QueryT(factory);
		
		TaiKhoanEntity acc = ((TaiKhoanEntity)qt.select("TaiKhoanEntity", new String[]{"id_taikhoan="+userId}).get(0));
		List<Object> ghL = qt.select("GioHangEntity",new String[]{"user.id_taikhoan="+userId,"total=0"});
		if (ghL.size() == 0) {
			gh.setUser(acc);
			gh.setTt(false);
			qt.add(gh);
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM GioHangEntity gh where gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
		+"AND gh.total=0";
		Query query = session.createQuery(hql);
		GioHangEntity ghupdate= (GioHangEntity) query.uniqueResult();
		hql="FROM CTGHEntity ctgh where ctgh.gh.id_giohang = '"+ghupdate.getId_giohang()+"' and ctgh.monanct.idmonan = '"+monAnId+"'";		
		query = session.createQuery(hql);
		CTGHEntity ctghupdate= (CTGHEntity) query.uniqueResult();
		if(ctghupdate!=null) {
			if (ctghupdate.getSoluongmonan() >= ctghupdate.getSoluongmonan()+soluong)
			ctghupdate.setSoluongmonan(ctghupdate.getSoluongmonan()+soluong);
			else
				ctghupdate.setSoluongmonan(ctghupdate.getSoluongmonan());
			qt.update(ctghupdate);
		}
		else {
			ctgh.setGh(((GioHangEntity)ghL.get(0)));
			ctgh.setMonanct(((MonAnEntity)qt.select("MonAnEntity",new String[] {"idmonan="+monAnId}).get(0)));		
			ctgh.setSoluongmonan(soluong);
			ctgh.setKt(null);
			ctgh.setSl(0);
			ctgh.setGiamonan(gia);
			ctgh.setGiapizza(0);
			ctgh.setPizza(null);
			qt.add(ctgh);
		}
				 session = factory.getCurrentSession();
				 hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
				+"AND ctgh.gh.total=0";
				 query = session.createQuery(hql);
				List <CTGHEntity> list2 = query.list();	
				ss.setAttribute("count", list2.size());	
	}
	
	
	
	@RequestMapping(value="/themmiy",method = RequestMethod.GET)
	public String themmiy(ModelMap model,ModelMap mm,HttpSession ss){
			if(ss.getAttribute("dangnhap")==null) {
				return "redirect:../test/dangnhap.htm";
			}
			else if((int)ss.getAttribute("check")==1) {
				return "redirect:../user/pizza.htm";
			}
			else {
				
				Session session = factory.getCurrentSession();
				String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =1";
				Query query = session.createQuery(hql);
				List<MonAnEntity> list = query.list();
				model.addAttribute("list",list);
			
				return "themmiy";
			}
			
	}
	
	
	@RequestMapping(value="/addmiy",method = RequestMethod.GET)
	public String addmiyget(ModelMap model)	throws ServletException, IOException{
		model.addAttribute("monan",new MonAnEntity());
		return "addmiy";
	}
	
	
	@RequestMapping(value="/addmiy",method = RequestMethod.POST)
	public String addmiy(@ModelAttribute("monan") MonAnEntity monan,
			ModelMap model,BindingResult errors,HttpServletRequest request,@RequestParam("photo") MultipartFile photo)
					throws ServletException, IOException{

		String parten="^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ" +
	            "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểếiếnỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ" +
	            "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$";
		if(monan.getTenmonan().trim().length()==0) {
			errors.rejectValue("tenmonan","monan","Vui Lòng Nhập Tên Mì Ý!");		
		}
		else if(!monan.getTenmonan().matches(parten)) {
			errors.rejectValue("tenmonan","monan","Tên Không Hợp Lệ ");		
		
		}
		else if(monan.getMota().trim().length()==0) {
			errors.rejectValue("mota","monan","Vui Lòng Nhập Mô Tả!");		
		}
		else if(!monan.getMota().matches(parten)) {
			errors.rejectValue("tenmonan","monan","Mô Tả Không Hợp Lệ!");	
		}
		
		else if(photo.isEmpty()) {
			model.addAttribute("bugphoto","Vui Lòng Chọn Hình Ảnh");
		}
		else if(!photo.isEmpty()){
			try {
				Session session = factory.getCurrentSession();		
				String hql = "FROM DanhMucEntity dm where dm.iddanhmuc='1'";
				Query query = session.createQuery(hql);
				DanhMucEntity dm = (DanhMucEntity)query.uniqueResult();
				QueryT qt = new QueryT(factory);
				String photoPath = context.getRealPath("/load/miy/"+photo.getOriginalFilename());
				System.out.println(photoPath);
				photo.transferTo(new File(photoPath));
				monan.setHinhanh(photo.getOriginalFilename().trim());
				monan.setMonan(dm);
				monan.setTrangthai(false);
				qt.add(monan);
				model.addAttribute("message", "Thêm Thành Công");
				
				
			}
			catch(Exception ex) {
				System.out.println(ex);
			}
		}

		
		return "addmiy";
	}
		
	
	
	
	
	
// ------------------------------------ END   MÌ Ý ------------------------------------------	
	

	
// ------------------------------------ THỨC UỐNG ------------------------------------------		

	@RequestMapping(value="/fixthucuong",method = RequestMethod.POST)
	public String fixthucuong(ModelMap model,
			@RequestParam("tenmonan") String tenmonan,
			@RequestParam("photo") MultipartFile photo,
			@RequestParam("mota") String mota,
			@RequestParam("gia") int gia,
			@RequestParam("soluong") int soluong,
			@RequestParam("id") String id) throws InterruptedException  {
		System.out.println(tenmonan);
		System.out.println(mota);
		System.out.println(id);
		System.out.println(soluong);
		System.out.println(gia);
			QueryT qt = new QueryT(factory);
			Session session = factory.getCurrentSession();
			String hql = "FROM MonAnEntity ma where ma.idmonan='"+id+"'";
			Query query = session.createQuery(hql);	
			MonAnEntity maupdate = (MonAnEntity) query.uniqueResult();
			maupdate.setTenmonan(tenmonan);
			maupdate.setMota(mota);
			maupdate.setSoluong(soluong);
			maupdate.setGiatien(gia);
			System.out.println(photo.getOriginalFilename());			
			if(!photo.isEmpty()) {
				try {
					String photoPath = context.getRealPath("/load/thucuong/"+photo.getOriginalFilename());
					System.out.println(photoPath);
					photo.transferTo(new File(photoPath));
					maupdate.setHinhanh(photo.getOriginalFilename().trim());
					qt.update(maupdate);
					model.addAttribute("message","Sửa Thành Công");
					session = factory.getCurrentSession();
					hql = "from MonAnEntity ma where ma.monan.iddanhmuc =3";
					query = session.createQuery(hql);
					List <MonAnEntity> list = query.list();
					model.addAttribute("list",list);
					return "fixthucuong";
				}
				catch(Exception ex) {
					System.out.println(ex);
				}
			}
			else {
				qt.update(maupdate);
				model.addAttribute("message","Sửa Thành Công");
				session = factory.getCurrentSession();
				hql = "from MonAnEntity ma where ma.monan.iddanhmuc =3";
				query = session.createQuery(hql);
				List <MonAnEntity> list = query.list();
				model.addAttribute("list",list);
				return "fixthucuong";
			}

			
			
			return "fixthucuong";
	}
	
	
	
	
	
	@RequestMapping(value="/fixthucuong",method = RequestMethod.GET)
	public String fixthucuong(ModelMap model)	throws ServletException, IOException{
		Session session = factory.getCurrentSession();
		String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =3";
		Query query = session.createQuery(hql);
		List <MonAnEntity> list = query.list();
		model.addAttribute("list",list);
		return "fixthucuong";
	}

	@RequestMapping(value="/getthucuong",method = RequestMethod.POST)
	public void getthucuong(ModelMap model,@RequestParam("id") String id,HttpServletResponse res)	throws ServletException, IOException{
		Session session = factory.getCurrentSession();
		String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =3 and ma.idmonan='"+id+"'";
		Query query = session.createQuery(hql);
		MonAnEntity monan = (MonAnEntity) query.uniqueResult();
		
		PrintWriter out = res.getWriter();
		out.print(monan.getTenmonan()+"/"+monan.getMota()+"/"+monan.getHinhanh()+"/"+monan.getGiatien()+"/"+monan.getSoluong()+"/"+id);
	}

	
	
	
	
	
	@RequestMapping(value="/themthucuong",method = RequestMethod.GET)
	public String themthucuong(ModelMap model,ModelMap mm,HttpSession ss){
			if(ss.getAttribute("dangnhap")==null) {
				return "redirect:../test/dangnhap.htm";
			}
			else if((int)ss.getAttribute("check")==1) {
				return "redirect:../user/pizza.htm";
			}
			else {
				Session session = factory.getCurrentSession();
				String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =3";
				Query query = session.createQuery(hql);
				List<MonAnEntity> list = query.list();
				model.addAttribute("list",list);
			
				return "themthucuong";
			}
			
	}
	

	
	@RequestMapping(value="/thucuong",method = RequestMethod.GET)
	public String thucuong(ModelMap model,ModelMap mm,HttpSession ss){
		
		Session session = factory.getCurrentSession();
			String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =3 and ma.soluong!=0";
			Query query = session.createQuery(hql);
			List<MonAnEntity> list = query.list();
			
			model.addAttribute("list",list);
			model.addAttribute("piz", new PizzaEntity());
			model.addAttribute("gh", new GioHangEntity());
			model.addAttribute("ctgh", new CTGHEntity());
			 session = factory.getCurrentSession();
				
			 hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
			+"AND ctgh.gh.total=0";
			query = session.createQuery(hql);
			List <CTGHEntity> list2 = query.list();	
			ss.setAttribute("count", list2.size());
			return "thucuong";
	}
	
	@RequestMapping(value="/thucdonthucuong",method = RequestMethod.GET)
	public String thucdonthucuong(ModelMap model,ModelMap mm,HttpSession ss){
		Session session = factory.getCurrentSession();
		String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =3 and ma.soluong!=0";
		Query query = session.createQuery(hql);
		List<PizzaEntity> list = query.list();
		
		model.addAttribute("list",list);
		
	

			return "thucuong";
	}
	
	
	
	
	@RequestMapping(value="/thucuong",method = RequestMethod.POST)
	public void thucuongpost(HttpServletRequest req, HttpServletResponse res, HttpSession ss
			,@RequestParam("idMonan") String monAnId
			,@RequestParam("soluong") int soluong
			,@RequestParam("giatien") int giathucuong) throws IOException{
		String userId=(String) ss.getAttribute("iduser");
		System.out.println(userId);
		QueryT qt = new QueryT(factory);
		
		TaiKhoanEntity acc = ((TaiKhoanEntity)qt.select("TaiKhoanEntity", new String[]{"id_taikhoan="+userId}).get(0));
		List<Object> ghL = qt.select("GioHangEntity",new String[]{"user.id_taikhoan="+userId,"total=0"});
		if (ghL.size() == 0) {
			gh.setUser(acc);
			gh.setTt(false);
			qt.add(gh);
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM GioHangEntity gh where gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
		+"AND gh.total=0";
		Query query = session.createQuery(hql);
		GioHangEntity ghupdate= (GioHangEntity) query.uniqueResult();
		hql="FROM CTGHEntity ctgh where ctgh.gh.id_giohang = '"+ghupdate.getId_giohang()+"' and ctgh.monanct.idmonan = '"+monAnId+"'";		
		query = session.createQuery(hql);
		CTGHEntity ctghupdate= (CTGHEntity) query.uniqueResult();
		if(ctghupdate!=null) {
			if (ctghupdate.getSoluongmonan() >= ctghupdate.getSoluongmonan()+soluong)
				ctghupdate.setSoluongmonan(ctghupdate.getSoluongmonan()+soluong);
				else
					ctghupdate.setSoluongmonan(ctghupdate.getSoluongmonan());
				qt.update(ctghupdate);
		}
		else {
			ctgh.setGh(((GioHangEntity)ghL.get(0)));
			ctgh.setMonanct(((MonAnEntity)qt.select("MonAnEntity",new String[] {"idmonan="+monAnId}).get(0)));		
			ctgh.setSoluongmonan(soluong);
			ctgh.setKt(null);
			ctgh.setSl(0);
			ctgh.setGiamonan(giathucuong);
			ctgh.setGiapizza(0);
			ctgh.setPizza(null);
			qt.add(ctgh);
		}
				 session = factory.getCurrentSession();
				 hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
				+"AND ctgh.gh.total=0";
				 query = session.createQuery(hql);
				List <CTGHEntity> list2 = query.list();	
				ss.setAttribute("count", list2.size());	
	}	
	
	@RequestMapping(value="/addthucuong",method = RequestMethod.GET)
	public String addthucuongget(ModelMap model)	throws ServletException, IOException{
		model.addAttribute("monan",new MonAnEntity());
		return "addthucuong";
	}
	
	
	@RequestMapping(value="/addthucuong",method = RequestMethod.POST)
	public String addthucuong(@ModelAttribute("monan") MonAnEntity monan,
			ModelMap model,BindingResult errors,HttpServletRequest request,@RequestParam("photo") MultipartFile photo)
					throws ServletException, IOException{

		String parten="^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ" +
	            "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểếiếnỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ" +
	            "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$";
		if(monan.getTenmonan().trim().length()==0) {
			errors.rejectValue("tenmonan","monan","Vui Lòng Nhập Tên Thức Uống!");		
		}
		else if(!monan.getTenmonan().matches(parten)) {
			errors.rejectValue("tenmonan","monan","Tên Không Hợp Lệ ");		
		
		}
		else if(monan.getMota().trim().length()==0) {
			errors.rejectValue("mota","monan","Vui Lòng Nhập Mô Tả!");		
		}
		else if(!monan.getMota().matches(parten)) {
			errors.rejectValue("tenmonan","monan","Mô Tả Không Hợp Lệ!");	
		}
		
		else if(photo.isEmpty()) {
			model.addAttribute("bugphoto","Vui Lòng Chọn Hình Ảnh");
		}
		else if(!photo.isEmpty()){
			try {
				Session session = factory.getCurrentSession();		
				String hql = "FROM DanhMucEntity dm where dm.iddanhmuc='3'";
				Query query = session.createQuery(hql);
				DanhMucEntity dm = (DanhMucEntity)query.uniqueResult();
				QueryT qt = new QueryT(factory);
				String photoPath = context.getRealPath("/load/miy/"+photo.getOriginalFilename());
				System.out.println(photoPath);
				photo.transferTo(new File(photoPath));
				monan.setHinhanh(photo.getOriginalFilename().trim());
				monan.setMonan(dm);
				monan.setTrangthai(false);
				qt.add(monan);
				model.addAttribute("message", "Thêm Thành Công");
				
				
			}
			catch(Exception ex) {
				System.out.println(ex);
			}
		}

		
		return "addthucuong";
	}	
	
		
	
	
	
	
// ------------------------------------ END THỨC UỐNG  ------------------------------------------	

	
	
	
	
// ------------------------------------ KHAI VỊ  ------------------------------------------		

	@RequestMapping(value="/fixkhaivi",method = RequestMethod.POST)
	public String fixkhaivi(ModelMap model,
			@RequestParam("tenmonan") String tenmonan,
			@RequestParam("photo") MultipartFile photo,
			@RequestParam("mota") String mota,
			@RequestParam("gia") int gia,
			@RequestParam("soluong") int soluong,
			@RequestParam("id") String id) throws InterruptedException  {
		System.out.println(tenmonan);
		System.out.println(mota);
		System.out.println(id);
		System.out.println(soluong);
		System.out.println(gia);
			QueryT qt = new QueryT(factory);
			Session session = factory.getCurrentSession();
			String hql = "FROM MonAnEntity ma where ma.idmonan='"+id+"'";
			Query query = session.createQuery(hql);	
			MonAnEntity maupdate = (MonAnEntity) query.uniqueResult();
			maupdate.setTenmonan(tenmonan);
			maupdate.setMota(mota);
			maupdate.setSoluong(soluong);
			maupdate.setGiatien(gia);
			System.out.println(photo.getOriginalFilename());			
			if(!photo.isEmpty()) {
				try {
					String photoPath = context.getRealPath("/load/khaivi/"+photo.getOriginalFilename());
					System.out.println(photoPath);
					photo.transferTo(new File(photoPath));
					maupdate.setHinhanh(photo.getOriginalFilename().trim());
					qt.update(maupdate);
					model.addAttribute("message","Sửa Thành Công");
					session = factory.getCurrentSession();
					hql = "from MonAnEntity ma where ma.monan.iddanhmuc =2";
					query = session.createQuery(hql);
					List <MonAnEntity> list = query.list();
					model.addAttribute("list",list);
					return "fixkhaivi";
				}
				catch(Exception ex) {
					System.out.println(ex);
				}
			}
			else {
				qt.update(maupdate);
				model.addAttribute("message","Sửa Thành Công");
				session = factory.getCurrentSession();
				hql = "from MonAnEntity ma where ma.monan.iddanhmuc =2";
				query = session.createQuery(hql);
				List <MonAnEntity> list = query.list();
				model.addAttribute("list",list);
				return "fixkhaivi";
			}

			
			
			return "fixkhaivi";
	}
	
	
	
	
	
	@RequestMapping(value="/fixkhaivi",method = RequestMethod.GET)
	public String fixkhaivi(ModelMap model)	throws ServletException, IOException{
		Session session = factory.getCurrentSession();
		String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =2";
		Query query = session.createQuery(hql);
		List <MonAnEntity> list = query.list();
		model.addAttribute("list",list);
		return "fixkhaivi";
	}

	@RequestMapping(value="/getkhaivi",method = RequestMethod.POST)
	public void getkhaivi(ModelMap model,@RequestParam("id") String id,HttpServletResponse res)	throws ServletException, IOException{
		Session session = factory.getCurrentSession();
		String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =2 and ma.idmonan='"+id+"'";
		Query query = session.createQuery(hql);
		MonAnEntity monan = (MonAnEntity) query.uniqueResult();
		
		PrintWriter out = res.getWriter();
		out.print(monan.getTenmonan()+"/"+monan.getMota()+"/"+monan.getHinhanh()+"/"+monan.getGiatien()+"/"+monan.getSoluong()+"/"+id);
	}


	@RequestMapping(value="/khaivi",method = RequestMethod.GET)
	public String khaivi(ModelMap model,ModelMap mm,HttpSession ss){
		
		Session session = factory.getCurrentSession();
			String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =2 and ma.soluong!=0";
			Query query = session.createQuery(hql);
			List<MonAnEntity> list = query.list();
			
			model.addAttribute("list",list);
			model.addAttribute("piz", new PizzaEntity());
			model.addAttribute("gh", new GioHangEntity());
			model.addAttribute("ctgh", new CTGHEntity());
			 session = factory.getCurrentSession();
				
			 hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
			+"AND ctgh.gh.total=0";
			query = session.createQuery(hql);
			List <CTGHEntity> list2 = query.list();	
			ss.setAttribute("count", list2.size());
			return "khaivi";
	}
	
	@RequestMapping(value="/thucdonkhaivi",method = RequestMethod.GET)
	public String thucdonkhaivi(ModelMap model,ModelMap mm,HttpSession ss){
		Session session = factory.getCurrentSession();
		String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =2 and ma.soluong!=0";
		Query query = session.createQuery(hql);
		List<PizzaEntity> list = query.list();
		
		model.addAttribute("list",list);
		
		
		
			return "khaivi";
	}
	
	
	
	
	@RequestMapping(value="/khaivi",method = RequestMethod.POST)
	public void khaivipost(HttpServletRequest req, HttpServletResponse res, HttpSession ss
			,@RequestParam("idMonan") String monAnId
			,@RequestParam("soluong") int soluong
			,@RequestParam("giatien") int giakhaivi) throws IOException{
		String userId=(String) ss.getAttribute("iduser");
		System.out.println(userId);
		QueryT qt = new QueryT(factory);
		
		TaiKhoanEntity acc = ((TaiKhoanEntity)qt.select("TaiKhoanEntity", new String[]{"id_taikhoan="+userId}).get(0));
		List<Object> ghL = qt.select("GioHangEntity",new String[]{"user.id_taikhoan="+userId,"total=0"});
		if (ghL.size() == 0) {
			gh.setUser(acc);
			gh.setTt(false);
			qt.add(gh);
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM GioHangEntity gh where gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
		+"AND gh.total=0";
		Query query = session.createQuery(hql);
		GioHangEntity ghupdate= (GioHangEntity) query.uniqueResult();
		hql="FROM CTGHEntity ctgh where ctgh.gh.id_giohang = '"+ghupdate.getId_giohang()+"' and ctgh.monanct.idmonan = '"+monAnId+"'";		
		query = session.createQuery(hql);
		CTGHEntity ctghupdate= (CTGHEntity) query.uniqueResult();
		if(ctghupdate!=null) {
			if (ctghupdate.getSoluongmonan() >= ctghupdate.getSoluongmonan()+soluong)
				ctghupdate.setSoluongmonan(ctghupdate.getSoluongmonan()+soluong);
				else
					ctghupdate.setSoluongmonan(ctghupdate.getSoluongmonan());
				qt.update(ctghupdate);
		}
		else {
			ctgh.setGh(((GioHangEntity)ghL.get(0)));
			ctgh.setMonanct(((MonAnEntity)qt.select("MonAnEntity",new String[] {"idmonan="+monAnId}).get(0)));		
			ctgh.setSoluongmonan(soluong);
			ctgh.setKt(null);
			ctgh.setSl(0);
			ctgh.setGiamonan(giakhaivi);
			ctgh.setGiapizza(0);
			ctgh.setPizza(null);
			qt.add(ctgh);
		}
				 session = factory.getCurrentSession();
				 hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
				+"AND ctgh.gh.total=0";
				 query = session.createQuery(hql);
				List <CTGHEntity> list2 = query.list();	
				ss.setAttribute("count", list2.size());	
	}	
	
	
	
	@RequestMapping(value="/themkhaivi",method = RequestMethod.GET)
	public String themkhaivi(ModelMap model,ModelMap mm,HttpSession ss){
			if(ss.getAttribute("dangnhap")==null) {
				return "redirect:../test/dangnhap.htm";
			}
			else if((int)ss.getAttribute("check")==1) {
				return "redirect:../user/pizza.htm";
			}
			else {
				Session session = factory.getCurrentSession();
				String hql = "from MonAnEntity ma where ma.monan.iddanhmuc =2";
				Query query = session.createQuery(hql);
				List<MonAnEntity> list = query.list();
				model.addAttribute("list",list);
			
				return "themkhaivi";
			}
			
	}
	
	
	@RequestMapping(value="/addkhaivi",method = RequestMethod.GET)
	public String addkhaiviget(ModelMap model)	throws ServletException, IOException{
		model.addAttribute("monan",new MonAnEntity());
		return "addkhaivi";
	}
	
	
	@RequestMapping(value="/addkhaivi",method = RequestMethod.POST)
	public String addkhaivi(@ModelAttribute("monan") MonAnEntity monan,
			ModelMap model,BindingResult errors,HttpServletRequest request,@RequestParam("photo") MultipartFile photo)
					throws ServletException, IOException{

		String parten="^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ" +
	            "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểếiếnỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ" +
	            "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$";
		if(monan.getTenmonan().trim().length()==0) {
			errors.rejectValue("tenmonan","monan","Vui Lòng Nhập Tên Khai Vị!");		
		}
		else if(!monan.getTenmonan().matches(parten)) {
			errors.rejectValue("tenmonan","monan","Tên Không Hợp Lệ ");		
		
		}
		else if(monan.getMota().trim().length()==0) {
			errors.rejectValue("mota","monan","Vui Lòng Nhập Mô Tả!");		
		}
		else if(!monan.getMota().matches(parten)) {
			errors.rejectValue("tenmonan","monan","Mô Tả Không Hợp Lệ!");	
		}
		
		else if(photo.isEmpty()) {
			model.addAttribute("bugphoto","Vui Lòng Chọn Hình Ảnh");
		}
		else if(!photo.isEmpty()){
			try {
				Session session = factory.getCurrentSession();		
				String hql = "FROM DanhMucEntity dm where dm.iddanhmuc='2'";
				Query query = session.createQuery(hql);
				DanhMucEntity dm = (DanhMucEntity)query.uniqueResult();
				QueryT qt = new QueryT(factory);
				String photoPath = context.getRealPath("/load/miy/"+photo.getOriginalFilename());
				System.out.println(photoPath);
				photo.transferTo(new File(photoPath));
				monan.setHinhanh(photo.getOriginalFilename().trim());
				monan.setMonan(dm);
				monan.setTrangthai(false);
				qt.add(monan);
				model.addAttribute("message", "Thêm Thành Công");
				
				
			}
			catch(Exception ex) {
				System.out.println(ex);
			}
		}

		
		return "addkhaivi";
	}	
	
	
	
// ------------------------------------ END  KHAI VỊ  ------------------------------------------		
	
	
	
// ------------------------- XỬ LÝ GIỎ HÀNG ------------------------------
	@RequestMapping(value="/giohang",method = RequestMethod.GET)
	public String ctgh(ModelMap model,HttpSession ss){
			Session session = factory.getCurrentSession();
			String hql = "from CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")	+"AND ctgh.gh.total=0";
			Query query = session.createQuery(hql);
			List<CTGHEntity> list = query.list();
			hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
			 query = session.createQuery(hql);
			 TaiKhoanEntity tkupdate = (TaiKhoanEntity) query.uniqueResult();
			 model.addAttribute("diachi", tkupdate.getDiachi());
			 model.addAttribute("sdt", tkupdate.getSdt());
			if(list.size()==0) {
				return "giohang";
			}
			else {
				model.addAttribute("lp",list);
				session = factory.getCurrentSession();			
				hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
				+"AND ctgh.gh.total=0";
				query = session.createQuery(hql);
				List <CTGHEntity> list2 = query.list();	
				ss.setAttribute("count", list2.size());
				return "giohang";	
			}
			
	}
	
	@RequestMapping(value="/giohang",method = RequestMethod.POST)
	public String ctghpost(ModelMap model,HttpSession ss,HttpServletRequest req){
		String ctgh_id = req.getParameter("ctgh_id");
		
		ctgh.setId_ctgh(ctgh_id);
		QueryT qt = new QueryT(factory);
		qt.delete(ctgh);
		Session session = factory.getCurrentSession();
					
		String hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
		+"AND ctgh.gh.total=0";
		Query query = session.createQuery(hql);
		List <CTGHEntity> list2 = query.list();	
		ss.setAttribute("count", list2.size());
		
		return "giohang";
	}
	
	
	
	@RequestMapping(value="/update",method = RequestMethod.POST)
	public String ctghupdate(ModelMap model,HttpSession ss,HttpServletRequest req){
		String ctgh_id = req.getParameter("ctgh_id");
		String soluong = req.getParameter("soluong");
		int s=Integer.parseInt(soluong);
		QueryT qt = new QueryT(factory);
		Session session = factory.getCurrentSession();
		String hql = "FROM CTGHEntity ctgh where ctgh.id_ctgh = "+ctgh_id;
		Query query = session.createQuery(hql);
		CTGHEntity ctghupdate = (CTGHEntity) query.uniqueResult();
		ctghupdate.setId_ctgh(ctgh_id);	
		if(ctghupdate.getPizza() != null)
			ctghupdate.setSl(s);
		else
			ctghupdate.setSoluongmonan(s);
		
		qt.update(ctghupdate);
	
		return "giohang";
	}
	@RequestMapping(value="/thanhtoan",method = RequestMethod.POST)
	public void thanhtoanpost(ModelMap model,HttpSession ss,HttpServletRequest req,HttpServletResponse res) throws IOException{
		QueryT qt = new QueryT(factory);
		Session session = factory.getCurrentSession();
		PrintWriter out = res.getWriter();
		
		String hql = "from CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")	+"AND ctgh.gh.total=0";
		Query query = session.createQuery(hql);
		List<CTGHEntity> list = query.list();
		for(CTGHEntity ktra:list) {		
			if(ktra.getKt()!=null) {
				if(ktra.getKt().getSoluong()==0) {
					out.print("Xin lỗi đã hết hàng");
					return;
				}
				else {
					ktra.getKt().setSoluong( ktra.getKt().getSoluong() - ktra.getSl());
					qt.update(ktra.getKt());
				}
			}
			
			else if(ktra.getMonanct()!=null) {
				if(ktra.getMonanct().getSoluong()==0) {
					out.print("Xin lỗi đã hết hàng");
					return;
				}
				else {
					ktra.getMonanct().setSoluong(ktra.getMonanct().getSoluong()-ktra.getSoluongmonan());
					qt.update(ktra.getMonanct());
				}
			}
			
		}
		
		
		String total = req.getParameter("tongtien");
		String userId = ss.getAttribute("iduser").toString();
		String diachinew=req.getParameter("diachi");
		String sdtnew=req.getParameter("sdt");
		System.out.println(sdtnew);
		int totall=Integer.parseInt(total);
		
		 session = factory.getCurrentSession();
		 hql = "FROM GioHangEntity gh where gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")+"AND gh.total=0";
		 query = session.createQuery(hql);	
		GioHangEntity gh = (GioHangEntity) query.uniqueResult();
		gh.setTotal(totall);
		gh.setDay(new Date());
		gh.setDiachi(diachinew);
		gh.setSdt(sdtnew);
		qt.update(gh);
		 session = factory.getCurrentSession();
		
		 hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
		+"AND ctgh.gh.total=0";
		query = session.createQuery(hql);
		List <CTGHEntity> list2 = query.list();	
		ss.setAttribute("count", list2.size());
		
		 hql = "FROM GioHangEntity gh where gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
		+"AND gh.total=0";
		 query = session.createQuery(hql);
		GioHangEntity ghupdate= (GioHangEntity) query.uniqueResult();
		if(ghupdate==null) {
			ghupdate =new GioHangEntity();

			ghupdate.setUser((TaiKhoanEntity)ss.getAttribute("user"));
			qt.add(ghupdate);
		}
		
//		System.out.println(diachi);
//		TaiKhoanEntity user = null;
//		hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
//		query = session.createQuery(hql);
//		user=(TaiKhoanEntity)query.uniqueResult();
//		user.setDiachi(diachi);
//		qt.update(user);
		out.print("Đơn Hàng Của Bạn Đã Được Lưu");
		return;
	}
// ------------------------------- END GIỎ HÀNG --------------------------	

	
	
	
	
	
// -------------------------------- ADMINFULL ------------------------------------
	
	@RequestMapping(value="/chitiet",method = RequestMethod.GET)
	public String xemdonhang(ModelMap model,HttpSession ss,@RequestParam("id") String id){
		Session session = factory.getCurrentSession();
		String hql = "from CTGHEntity ctgh where ctgh.gh.total!=0 AND ctgh.gh.id_giohang = '"+id+"'";
		Query query = session.createQuery(hql);
		List<CTGHEntity> list = query.list();
		model.addAttribute("list",list);
		return "chitiet";
		
	}
	@RequestMapping(value="/thongke",method = RequestMethod.GET)
	public String thongke(ModelMap model,HttpSession ss){
		if(ss.getAttribute("dangnhap")==null) {
			return "redirect:../test/dangnhap.htm";
		}
		else if((int)ss.getAttribute("check")==1) {
			return "redirect:../user/pizza.htm";
		}
		else {
			return "thongke";
		}
	
		
	}
	@RequestMapping(value="/xemdaduyet",method = RequestMethod.GET)
	public String xemdaduyet(ModelMap model,HttpSession ss,@RequestParam("id") String id){
		Session session = factory.getCurrentSession();
		String hql = "from CTGHEntity ctgh where ctgh.gh.total!=0 AND ctgh.gh.id_giohang = '"+id+"'";
		Query query = session.createQuery(hql);
		List<CTGHEntity> list = query.list();
		model.addAttribute("list",list);
		hql = "from GioHangEntity gh where gh.id_giohang = '"+id+"'";
		query = session.createQuery(hql);
		GioHangEntity total =(GioHangEntity) query.uniqueResult();
		model.addAttribute("total",total.getTotal());
		model.addAttribute("giaohang",total);
		hql = "from TaiKhoanEntity tk where tk.id_taikhoan = '"+total.getUser().getId_taikhoan()+"'";
		query = session.createQuery(hql);
		TaiKhoanEntity tk =(TaiKhoanEntity) query.uniqueResult();
		model.addAttribute("tk",tk);
		return "xemdaduyet";
		
	}
	@RequestMapping(value="/thongke",method = RequestMethod.POST)
	public String thongke(ModelMap model,HttpSession ss,@RequestParam("from") String from,
			@RequestParam("to") String to){
		System.out.println(to);
		System.out.println(from);
		Session session = factory.getCurrentSession();
		String hql = "from GioHangEntity gh where gh.tt=true and day between '"+from+"' and '"+to+"'";
		Query query = session.createQuery(hql);
	
		List<GioHangEntity> list = query.list();
		model.addAttribute("list",list);
		System.out.println(list.size());
		return "thongke";
		
	}
	
	@RequestMapping(value="/layslgia",method = RequestMethod.POST)
	public void layslgia(HttpServletRequest req, HttpServletResponse res,@RequestParam("idPizza") String id, @RequestParam("size") int idtkt) throws IOException {
		Session session = factory.getCurrentSession();
		String hql = "FROM KichThuocEntity kt WHERE kt.piz.id_pizza='"+id+"' and kt.idtenkc="+idtkt;
		Query query = session.createQuery(hql);
		KichThuocEntity ktupdate = (KichThuocEntity)query.uniqueResult();
		PrintWriter out = res.getWriter();
		if(ktupdate != null)
			out.print(ktupdate.getGia()+","+ktupdate.getSoluong());	
		else
			out.print("");	
	}
	

	@RequestMapping(value="/admin",method = RequestMethod.GET)
	public String duyetdon(ModelMap model,ModelMap mm,HttpSession ss){
		if(ss.getAttribute("dangnhap")==null) {
			return "redirect:../test/dangnhap.htm";
		}
		else if((int)ss.getAttribute("check")==1) {
			return "redirect:../user/pizza.htm";
		}
		else {
			QueryT qt = new QueryT(factory);
			Session session = factory.getCurrentSession();
			String hql = "FROM GioHangEntity gh where gh.tt=false and gh.total!=0 and gh.tuchoi=false ORDER BY id_giohang DESC";
			Query query = session.createQuery(hql);	
			List <GioHangEntity> list = query.list();	
			ss.setAttribute("list", list);
			ss.setAttribute("duyet", list.size());
			return "dashboad";
		}
	
	}
	@RequestMapping(value="/admin",method = RequestMethod.POST)
	public void duyetdonpost(ModelMap model,HttpSession ss
			,@RequestParam("accept") boolean accept
			,@RequestParam("id") String id,
			HttpServletResponse res) throws IOException{
		QueryT qt = new QueryT(factory);
		PrintWriter out = res.getWriter();
		Session session = factory.getCurrentSession();
		String hql = "FROM GioHangEntity gh where gh.id_giohang='"+id+"'";
		Query query = session.createQuery(hql);	
		GioHangEntity ghupdate  = (GioHangEntity)query.uniqueResult();
		if(accept==true) {
			ghupdate.setTt(true);
			qt.update(ghupdate);
			out.print(true);
		}
		
		else {
			//từ chối xong rồi + lại số lượng cho người ta
			ghupdate.setTuchoi(true);
			qt.update(ghupdate);
			hql="FROM CTGHEntity ctgh where ctgh.gh.id_giohang = '"+id+"'";
			query = session.createQuery(hql);
			List<CTGHEntity> ctghupdate= query.list();
			for(CTGHEntity ktra:ctghupdate) {
				if(ktra.getKt()!=null) {
						ktra.getKt().setSoluong( ktra.getKt().getSoluong() + ktra.getSl());
						qt.update(ktra.getKt());
					
				}
				
				else if(ktra.getMonanct()!=null) {
					
						ktra.getMonanct().setSoluong(ktra.getMonanct().getSoluong()+ktra.getSoluongmonan());
						qt.update(ktra.getMonanct());
					
				}
			}
		}
		return;
	}
	@RequestMapping(value="/khachhang",method = RequestMethod.GET)
	public String khachhang(ModelMap model,ModelMap mm,HttpSession ss){
		if(ss.getAttribute("dangnhap")==null) {
			return "redirect:../test/dangnhap.htm";
		}
		else if((int)ss.getAttribute("check")==1) {
			return "redirect:../user/pizza.htm";
		}
		else {
			QueryT qt = new QueryT(factory);
			Session session = factory.getCurrentSession();
			String hql = "FROM TaiKhoanEntity ";
			Query query = session.createQuery(hql);	
			List <TaiKhoanEntity> list = query.list();	
			model.addAttribute("list", list);
			return "khachhang";
		}
		
	}
	
	@RequestMapping(value="/inbill",method = RequestMethod.GET)
	public String inbill(ModelMap model,ModelMap mm,HttpSession ss){
		if(ss.getAttribute("dangnhap")==null) {
			return "redirect:../test/dangnhap.htm";
		}
		else if((int)ss.getAttribute("check")==1) {
			return "redirect:../user/pizza.htm";
		}
		else {
			Session session = factory.getCurrentSession();
			System.out.println(ss.getAttribute("iduser"));
			String hql = "FROM GioHangEntity gh where gh.tt=true and gh.total!=0 and gh.tuchoi=false";
			Query query = session.createQuery(hql);
			List<GioHangEntity> list = query.list();
			System.out.println(list);
			model.addAttribute("list",list);
			return "inbill";
		}
		
	}
	@RequestMapping(value="/huybill",method = RequestMethod.GET)
	public String huybill(ModelMap model,ModelMap mm,HttpSession ss){
		if(ss.getAttribute("dangnhap")==null) {
			return "redirect:../test/dangnhap.htm";
		}
		else if((int)ss.getAttribute("check")==1) {
			return "redirect:../user/pizza.htm";
		}
		else {
			Session session = factory.getCurrentSession();
			System.out.println(ss.getAttribute("iduser"));
			String hql = "FROM GioHangEntity gh where gh.tt=false and gh.total!=0 and gh.tuchoi=true";
			Query query = session.createQuery(hql);
			List<GioHangEntity> list = query.list();
			System.out.println(list);
			model.addAttribute("list",list);
			return "huybill";
		}
		
	}
	

	
	
	

	@RequestMapping("/home")
	public String home(){	
		return "home";
	}

	
// ---------------------------------   END ADMIN   -----------------------------
	
	
// ---------------------------------  TÀI KHOẢN   -----------------------------
	
	@RequestMapping(value="/taotaikhoan",method = RequestMethod.GET)
	public String taotaikhoan(ModelMap model) throws ServletException, IOException {
	model.addAttribute("taikhoan", new TaiKhoanEntity());
	return "taotaikhoan";
	}

	@RequestMapping(value="/taotaikhoan",method = RequestMethod.POST)
	public String taotaikhoanpost(@ModelAttribute("taikhoan") TaiKhoanEntity taikhoan,ModelMap model,BindingResult errors,HttpServletRequest request) throws ServletException, IOException{
		String parten="^[a-zA-Z_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶ" +
	            "ẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểếiếnỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợ" +
	            "ụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\\s]+$";
		
		String rematkhau=request.getParameter("rematkhau");
		String regex="^(?=.{5,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$";
		
		if(taikhoan.getHoten().length()==0) {
			errors.rejectValue("hoten","taikhoan","Vui Lòng Nhập Họ Tên!");	
			
		}
		else if(!taikhoan.getHoten().matches(parten)) {
			errors.rejectValue("hoten","taikhoan"," Họ Tên Không Hợp Lệ");	
			
		}
		else if(taikhoan.getTaikhoan().trim().length()==0) {
			errors.rejectValue("taikhoan","taikhoan","Vui Lòng Tài Khoản");	
			
		}
		else if(!taikhoan.getTaikhoan().matches(regex)) {
			errors.rejectValue("taikhoan","taikhoan","Tài Khoản Từ 5-20 Kí Tự và không được dấu cách dấu . _");	
			
		}
		else if(taikhoan.getEmail().trim().length()==0) {
			errors.rejectValue("email","taikhoan","Vui Lòng Nhập Gmail!");	
			
		}
		else if(taikhoan.getSdt().trim().length()==0) {
			errors.rejectValue("sdt","taikhoan","Vui Lòng Nhập SĐT");	
			
		}
		else if(!taikhoan.getSdt().matches("0[0-9]{9}")) {
			errors.rejectValue("sdt","taikhoan","Số Điện Thoại Không Hợp Lệ");	
			
		}
		else if(taikhoan.getMatkhau().trim().length()==0) {
			errors.rejectValue("matkhau","taikhoan","Vui Lòng Nhập Mật Khẩu");	
			
		}
		else if(!taikhoan.getMatkhau().matches(".{8,}")) {
			errors.rejectValue("matkhau","taikhoan","Tối thiểu tám ký tự, ít nhất một chữ cái và một số");	
			
		}
		else if(!taikhoan.getMatkhau().equals(rematkhau)) {
			errors.rejectValue("matkhau","taikhoan","Hai Mật Khẩu Không Trùng Nhau");	
			
		}
		else if(taikhoan.getDiachi().length()==0) {
			errors.rejectValue("diachi","taikhoan","Vui Lòng Nhập Địa Chỉ");	
		}
		else if(errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau");
		}
		else {
			Session session = factory.openSession();
			Transaction t= session.beginTransaction();	
			String hql = "FROM TaiKhoanEntity";
			Query query = session.createQuery(hql);
			List<TaiKhoanEntity> listAcc = query.list();
			for(TaiKhoanEntity i: listAcc) {
				if(taikhoan.getTaikhoan().equals(i.getTaikhoan())) {
					
					model.addAttribute("message", "Tài Khoản Đã Có Người Sử Dụng");
					return "taotaikhoan";
				}
				else if(taikhoan.getEmail().equals(i.getEmail())) {
					
					model.addAttribute("message", "Email Đã Có Người Sử Dụng");
					return "taotaikhoan";
				}
				else if(taikhoan.getSdt().equals(i.getSdt())) {
					
					model.addAttribute("message", "SDT  Đã Có Người Sử Dụng");
					return "taotaikhoan";
				}
				
			}
		
			try {
			
				
				taikhoan.setQuyen(1);
				session.save(taikhoan);
				t.commit();
				model.addAttribute("message", "Đăng Ký Thành Công");
			}
			catch(Exception ex) {
				t.rollback();
			}
			finally {
				session.close();
			}
			return "taotaikhoan";
			
		}
			
		return "taotaikhoan";
	
		
	}
	
	@RequestMapping("test")
	public void test() {
		QueryT qt = new QueryT(factory);
		String[] patterns = {"id_pizza=1","detail=ABC"};
		System.out.println(((PizzaEntity)qt.select("PizzaEntity", patterns).get(0)).getName());
	}
}

	
	// --------------------------------- END   TÀI KHOẢN   -----------------------------	
	
