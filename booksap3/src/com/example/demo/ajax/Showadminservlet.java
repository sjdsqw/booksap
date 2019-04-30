package com.example.demo.ajax;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Bean.Admin;
import com.example.demo.Bean.Ajaxresult;
import com.example.demo.database.Adminbaseimpl;



@Controller
public class Showadminservlet {
	@Resource
	Adminbaseimpl adm;
	
	@RequestMapping("showadmin.do") 	
	public @ResponseBody Ajaxresult showadmin(ModelAndView m)
	{
		
		List<Admin> ads=adm.showadminbypage(1);
		int page = 0; 
		page=adm.adselpage();
		Ajaxresult re=new Ajaxresult();
		re.setAdmins(ads);
		re.setPage(page);
		return re;
		
	}
	
	
	@RequestMapping("showadminbypage.do")
	public @ResponseBody List<Admin> showadminbypage(int page)
	{
	
		List<Admin> ads=adm.showadminbypage(page);
		return ads;
		
	}
	
	@RequestMapping("modadmin.do") 	
	public @ResponseBody Ajaxresult modadmin(String id,String password,String auth)
	{
		
		Admin ad=new Admin();
		ad.setId(id);
		ad.setPassword(password);
		ad.setAuth(auth);
		
	    int result=adm.moadmin(ad);
//	    ModelAndView mv=new ModelAndView();
//	    mv.getModel().put("modresult", result);
	    Ajaxresult ar=new Ajaxresult();
	    ar.setResult(result);
	    return ar;
		
		
	
	
		
	}
	@RequestMapping("deladmin.do") 	
	public @ResponseBody Ajaxresult deladmin(String id)
	{
		
	    int result=adm.deladmin(id);
//	    ModelAndView mv=new ModelAndView();
//	    mv.getModel().put("modresult", result);
	    Ajaxresult ar=new Ajaxresult();
	    ar.setResult(result);
	    return ar;
	
	}
	
	@RequestMapping("addadmin.do") 	
	public @ResponseBody Ajaxresult addadmin(String id,String password,String auth)
	{
		
		Admin ad=new Admin();
		ad.setId(id);
		ad.setPassword(password);
		ad.setAuth(auth);
	    int result=adm.insertadmin(ad);
//	    ModelAndView mv=new ModelAndView();
//	    mv.getModel().put("modresult", result);
	    Ajaxresult ar=new Ajaxresult();
	    ar.setResult(result);
	    return ar;

	}
	

}
