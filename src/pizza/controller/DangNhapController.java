package pizza.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pizza.entity.CTGHEntity;
import pizza.entity.GioHangEntity;
import pizza.entity.MonAnEntity;
import pizza.entity.PizzaEntity;
import pizza.entity.TaiKhoanEntity;
import pizza.query.QueryT;
@Transactional
@Controller
@RequestMapping("/test")
public class DangNhapController {
	TaiKhoanEntity dangnhap=new TaiKhoanEntity();
	boolean check = false;
	boolean checkadmin = false;
	@Autowired
	SessionFactory factory;
	@Autowired
	JavaMailSender mailer;
	@Autowired
	ServletContext context;
	@RequestMapping(value="/donhang",method = RequestMethod.GET)
	public String donhang(ModelMap model,HttpSession ss){
		Session session = factory.getCurrentSession();
		String hql = "from GioHangEntity gh where gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")	+"AND gh.total!=0 ORDER by gh.id_giohang DESC";
		Query query = session.createQuery(hql);
		List<GioHangEntity> list = query.list();
		model.addAttribute("list",list);
		return "donhang";
		
	}
	@RequestMapping(value="/xemdonhang",method = RequestMethod.GET)
	public String xemdonhang(ModelMap model,HttpSession ss,@RequestParam("id") String id){
		Session session = factory.getCurrentSession();
		String hql = "from CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")	+"AND ctgh.gh.total!=0 AND ctgh.gh.id_giohang = '"+id+"'";
		Query query = session.createQuery(hql);
		List<CTGHEntity> list = query.list();
		model.addAttribute("list",list);
		return "xemdonhang";
		
	}
	@RequestMapping(value="/doiemail",method = RequestMethod.GET)
	public String doiemail(ModelMap model,HttpSession ss){
		return "doiemail";
		
	}
	@RequestMapping(value="/doiemail",method = RequestMethod.POST)
	public String doiemailpost(ModelMap model,HttpSession ss,HttpServletRequest req){
		String emailnew=req.getParameter("emailnew");
		QueryT qt = new QueryT(factory);
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoanEntity";
		Query query = session.createQuery(hql);
		List<TaiKhoanEntity> listAcc = query.list();
		boolean check=false;
		for (TaiKhoanEntity ktra : listAcc) {
			if(emailnew.equals(ktra.getEmail())) {
				model.addAttribute("message1","Email Đã Có Người Sử Dụng Rồi");
				check=true;
				return "doiemail";
			}
			
		
		}
		if(check==false) {
			hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
			 query = session.createQuery(hql);
			 TaiKhoanEntity tkupdate = (TaiKhoanEntity) query.uniqueResult();	
			tkupdate.setEmail(emailnew);
			qt.update(tkupdate);
			model.addAttribute("message1","Đổi Email Thành Công");
			return "doiemail";
		}
		return "doiemail";
		
	}
	@RequestMapping(value="/doisdt",method = RequestMethod.GET)
	public String doisdt(ModelMap model,HttpSession ss){
		return "doisdt";
		
	}
	
	@RequestMapping(value="/doisdt",method = RequestMethod.POST)
	public String doisdtpost(ModelMap model,HttpSession ss,HttpServletRequest req){
		String sdtnew=req.getParameter("sdtnew");
		QueryT qt = new QueryT(factory);
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoanEntity";
		Query query = session.createQuery(hql);
		List<TaiKhoanEntity> listAcc = query.list();
		boolean check=false;
		for (TaiKhoanEntity ktra : listAcc) {
			if(sdtnew.equals(ktra.getSdt())) {
				model.addAttribute("message1","Số Điện Thoại Đã Có Người Sử Dụng Rồi");
				check=true;
				return "doisdt";
			}
			
		
		}
		if(check==false) {
			hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
			 query = session.createQuery(hql);
			 TaiKhoanEntity tkupdate = (TaiKhoanEntity) query.uniqueResult();	
			tkupdate.setSdt(sdtnew);
			qt.update(tkupdate);
			model.addAttribute("message1","Đổi SĐT Thành Công");
			return "doisdt";
		}
		return "doisdt";
		
	}
	
	
	
	@RequestMapping(value="/fixemail",method = RequestMethod.POST)
	public void fixmail(ModelMap mm,HttpSession ss,HttpServletResponse res)throws ServletException, IOException{

		Session session = factory.getCurrentSession();
		PrintWriter out = res.getWriter();
		int code = (int) Math.floor(((Math.random() * 899999) + 100000));
		try {
		String hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
		Query query = session.createQuery(hql);
		TaiKhoanEntity tkupdate = (TaiKhoanEntity) query.uniqueResult();	
		// Tạo mail
		MimeMessage mail =mailer.createMimeMessage();
		// Sử dụng lớp trợ giúp
		MimeMessageHelper helper = new MimeMessageHelper(mail);
		helper.setFrom("abmskcnd1@gmail.com", "Trực Đông");
		helper.setTo(tkupdate.getEmail());
		helper.setSubject("Yêu Cầu Đổi Email");
		helper.setText("Mã Bảo Mật Của Bạn Là "+code, true);
		String codetest=String.valueOf(code);
		ss.setAttribute("code", codetest);
		// Gửi mail
		mailer.send(mail);
		out.print("Mã Đã Gửi Trong Gmail Của Bạn !");
		}
		catch(Exception ex){
		out.print( "Sai Email !");
		}
		
	}
	@RequestMapping(value="/emaillater",method = RequestMethod.POST)
	public void emaillater(ModelMap mm,HttpSession ss,HttpServletResponse res)throws ServletException, IOException{
		
		PrintWriter out = res.getWriter();
		out.print(ss.getAttribute("code"));
	}
	
	@RequestMapping(value="/fixsdt",method = RequestMethod.POST)
	public void fixsdt(ModelMap mm,HttpSession ss,HttpServletResponse res)throws ServletException, IOException{

		Session session = factory.getCurrentSession();
		PrintWriter out = res.getWriter();
		int code = (int) Math.floor(((Math.random() * 899999) + 100000));
		try {
		String hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
		Query query = session.createQuery(hql);
		TaiKhoanEntity tkupdate = (TaiKhoanEntity) query.uniqueResult();	
		// Tạo mail
		MimeMessage mail =mailer.createMimeMessage();
		// Sử dụng lớp trợ giúp
		MimeMessageHelper helper = new MimeMessageHelper(mail);
		helper.setFrom("abmskcnd1@gmail.com", "Trực Đông");
		helper.setTo(tkupdate.getEmail());
		helper.setSubject("Yêu Cầu Đổi Số Điện Thoại");
		helper.setText("Mã Bảo Mật Của Bạn Là "+code, true);
		String codetest=String.valueOf(code);
		ss.setAttribute("code", codetest);
		// Gửi mail
		mailer.send(mail);
		out.print("Mã Đã Gửi Trong Gmail Của Bạn !");
		}
		catch(Exception ex){
		out.print( "Sai Email !");
		}
		
	}
	@RequestMapping(value="/sdtlater",method = RequestMethod.POST)
	public void sdtlater(ModelMap mm,HttpSession ss,HttpServletResponse res)throws ServletException, IOException{
		
		PrintWriter out = res.getWriter();
		out.print(ss.getAttribute("code"));
	}
	
	@RequestMapping(value = "/thongtin", method = RequestMethod.GET)
	public String thongtin(ModelMap mm,HttpSession ss,HttpServletRequest req) throws ServletException, IOException {
		
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
		Query query = session.createQuery(hql);
		TaiKhoanEntity tkupdate = (TaiKhoanEntity) query.uniqueResult();	
		String[] word=tkupdate.getEmail().split("@");
		String mahoaemail1=word[0].substring(0,5);
		String mahoae1=mahoaemail1.replace(mahoaemail1, "*****");
		String mahoaemail2=word[0].substring(5);	
		String end=mahoae1+mahoaemail2+"@"+word[1];
		String mahoasdt1=tkupdate.getSdt().substring(0,8);
		String mahoasdt2=tkupdate.getSdt().substring(8);
		String mahoas1=mahoasdt1.replace(mahoasdt1, "********");
		String end2=mahoas1+mahoasdt2;
		mm.addAttribute("taikhoan", tkupdate.getTaikhoan());
		mm.addAttribute("hoten", tkupdate.getHoten());
		mm.addAttribute("email", end);
		mm.addAttribute("sdt", end2);
		mm.addAttribute("ns", tkupdate.getNgaysinh());
		mm.addAttribute("id",tkupdate.getId_taikhoan());
		mm.addAttribute("idsdt",tkupdate.getSdt());
		mm.addAttribute("emailgoc",tkupdate.getEmail());
		if(ss.getAttribute("success")!= null)
			mm.addAttribute("mess",(String)ss.getAttribute("success"));
		ss.removeAttribute("success");
			
		return "thongtintk";
	}
	@RequestMapping(value = "/thongtin", method = RequestMethod.POST)
	public String thongtinpost(ModelMap mm,HttpSession ss,HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		QueryT qt = new QueryT(factory);
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
		
		Query query = session.createQuery(hql);
		TaiKhoanEntity tkupdate = (TaiKhoanEntity) query.uniqueResult();	
		hql = "FROM TaiKhoanEntity";
		
		query = session.createQuery(hql);
		List<TaiKhoanEntity> checklist = query.list();
		String name=req.getParameter("ten");
		
		String ns=req.getParameter("ngaysinh");
		
		tkupdate.setHoten(name);
	
		tkupdate.setNgaysinh(ns);	
		qt.update(tkupdate);
	
		ss.setAttribute("success", "Thành Công");

		return "redirect:../test/thongtin.htm";
		
	}
	
	@RequestMapping(value = "/password", method = RequestMethod.GET)
	public String doimk(ModelMap mm,HttpSession ss) throws ServletException, IOException {		
		return "doimatkhau";
	}
	@RequestMapping(value = "/password", method = RequestMethod.POST)
	public String doimkpost( HttpSession ss, ModelMap mm,HttpServletRequest req) throws ServletException, IOException {
		Session session = factory.getCurrentSession();
		String matkhau =req.getParameter("matkhauht");
		String matkhaunew =req.getParameter("matkhaunew");
		String rematkhaunew =req.getParameter("rematkhaunew");
		String hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
		Query query = session.createQuery(hql);
		TaiKhoanEntity tkupdate = (TaiKhoanEntity) query.uniqueResult();
		if(!matkhaunew.equals(rematkhaunew)) {
			mm.addAttribute("message1", "Mật Khẩu Nhập Lại Không Trùng Với Mật Khẩu Mới");
		}
		else  if(tkupdate.getMatkhau().equals(matkhau)) {
			tkupdate.setMatkhau(rematkhaunew);
			QueryT qt = new QueryT(factory);
			qt.update(tkupdate);
			mm.addAttribute("message1", "Đổi Mật Khẩu Thành Công");
		}
		 else {
			 mm.addAttribute("message1", "Mật Khẩu Hiện Tại Không Đúng");
			}
		
		
		
		
		
		return "doimatkhau";
	}
	@RequestMapping(value = "/dangnhap", method = RequestMethod.GET)
	public String dangnhap(ModelMap mm,HttpSession ss) throws ServletException, IOException {
		
		if ( check ==true && checkadmin==true) {
			
			return "admin";
		}
		else if(check ==true && checkadmin==false) {
			
			return "dathang";
		}
		else {
			mm.addAttribute("dangnhap", new TaiKhoanEntity());
			return "dangnhap";
		}	
	}
	@RequestMapping(value = "dangnhap", method = RequestMethod.POST)
	public String dangnhappost(@ModelAttribute("dangnhap") TaiKhoanEntity taikhoan, HttpSession ss, ModelMap mm)
			throws ServletException, IOException {
		
		Session session = factory.getCurrentSession();
		String hql = "FROM TaiKhoanEntity";
		Query query = session.createQuery(hql);
		
		
		List<TaiKhoanEntity> listAcc = query.list();
		TaiKhoanEntity user = null;
		
		for (TaiKhoanEntity ktra : listAcc) {
			if (taikhoan.getTaikhoan().equals(ktra.getTaikhoan()) && taikhoan.getMatkhau().equals(ktra.getMatkhau())
			&&  ktra.getQuyen()==1) {
				check = true;		
				ss.setAttribute("dangnhap", ktra.getTaikhoan());
				ss.setAttribute("iduser", ktra.getId_taikhoan());
				ss.setAttribute("checkuser",ktra.getQuyen());
				session = factory.getCurrentSession();			
				hql = "FROM CTGHEntity ctgh where ctgh.gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
				+"AND ctgh.gh.total=0";
				query = session.createQuery(hql);
				List <CTGHEntity> list2 = query.list();	
				ss.setAttribute("count", list2.size());
				hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
				query = session.createQuery(hql);
				user=(TaiKhoanEntity)query.uniqueResult();
				ss.setAttribute("user", user);
				QueryT qt = new QueryT(factory);
				 hql = "FROM GioHangEntity gh where gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
				+"AND gh.total=0";
				 query = session.createQuery(hql);
				GioHangEntity ghupdate= (GioHangEntity) query.uniqueResult();
				if(ghupdate==null) {
					ghupdate =new GioHangEntity();

					ghupdate.setUser(user);
					qt.add(ghupdate);
				}
				
			}
			else if (taikhoan.getTaikhoan().equals(ktra.getTaikhoan()) && taikhoan.getMatkhau().equals(ktra.getMatkhau())
					&&  ktra.getQuyen()==0) {
						checkadmin = true;		
						ss.setAttribute("dangnhap", ktra.getTaikhoan());
						ss.setAttribute("iduser", ktra.getId_taikhoan());
						ss.setAttribute("check",ktra.getQuyen());
						hql = "FROM TaiKhoanEntity tk where tk.id_taikhoan LIKE "+ss.getAttribute("iduser");
						query = session.createQuery(hql);
						user=(TaiKhoanEntity)query.uniqueResult();
						ss.setAttribute("user", user);
						QueryT qt = new QueryT(factory);
						 hql = "FROM GioHangEntity gh where gh.user.id_taikhoan LIKE "+ss.getAttribute("iduser")
						+"AND gh.total=0";
						 query = session.createQuery(hql);
						GioHangEntity ghupdate= (GioHangEntity) query.uniqueResult();
						if(ghupdate==null) {
							ghupdate =new GioHangEntity();

							ghupdate.setUser(user);
							qt.add(ghupdate);
						}	
					}
			}
		

		if(checkadmin == true) {
			
			
			ss.setAttribute("kt", "yes");
			ss.setAttribute("quyen", "ok");
			
			return "redirect:../user/admin.htm";
			
		}
		else if(check == true )
		{
			
			ss.setAttribute("kt", "yes");
		
			return "redirect:../user/pizza.htm";
		}
		
		else {
		
			
			mm.addAttribute("message", "Đăng nhập thất bại!");
		}

		return "dangnhap";
	}
		@RequestMapping(value = "/dangxuat", method = RequestMethod.GET)
	public String dangxuat(ModelMap mm, HttpSession ss) throws ServletException, IOException {
			check=false;
			checkadmin=false;
			ss.removeAttribute("iduser");
			ss.removeAttribute("user");
			ss.removeAttribute("kt");
			ss.removeAttribute("dangnhap");
			ss.removeAttribute("count");
			ss.removeAttribute("quyen");
			return "redirect:../test/dangnhap.htm";

	}
		@RequestMapping(value = "/quenmatkhau", method = RequestMethod.GET)
		public String quenmatkhau(ModelMap mm, HttpSession ss) throws ServletException, IOException {
			
			return "quenmatkhau";

	}
		@RequestMapping(value = "/send", method = RequestMethod.POST)
		public String quenmatkhaupost(ModelMap mm, HttpSession ss,@RequestParam("to") String to) throws ServletException, IOException {
			try{
				
				int code = (int) Math.floor(((Math.random() * 899999) + 100000));
				QueryT qt = new QueryT(factory);
				Session session = factory.getCurrentSession();
				String hql = "FROM TaiKhoanEntity tk where tk.email LIKE '"+to+"'";
				Query query = session.createQuery(hql);	
				TaiKhoanEntity tk = (TaiKhoanEntity) query.uniqueResult();
				String mk=String.valueOf(code);
				tk.setMatkhau(mk);
				
				qt.update(tk);
				// Tạo mail
				MimeMessage mail =mailer.createMimeMessage();
				// Sử dụng lớp trợ giúp
				MimeMessageHelper helper = new MimeMessageHelper(mail);
				helper.setFrom("abmskcnd1@gmail.com", "Trực Đông");
				helper.setTo(to);
				helper.setSubject("Yêu Cầu Đổi Mật Khẩu");
				helper.setText("Mật Khẩu mới của bạn là "+code, true);
				// Gửi mail
				mailer.send(mail);
				mm.addAttribute("message", "Mật Khẩu Mới Đã Gửi Trong Gmail Của Bạn !");
				}
				catch(Exception ex){
				mm.addAttribute("message", "Sai Email !");
				}
				return "quenmatkhau";
			

	}	
}
