package com.example.demo.servlet;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Bean.Admin;
import com.example.demo.database.Adminbaseimpl;

@Controller
public class Adminservlet {
	Admin adm;
	@Autowired
	Adminbaseimpl ad;
	

@RequestMapping(value = "/admin.form", method = RequestMethod.GET)
	public String login(ServletRequest request1)
	{
	HttpServletRequest request =(HttpServletRequest) request1;
		HttpSession session=request.getSession();
		System.out.println("admin.form");
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
			String id=request.getParameter("id");
			String password=request.getParameter("password");
		System.out.println(id+" "+password);
		
			adm=ad.seladmin(id);
	
			
			if(adm==null||!adm.getPassword().equals(password))	
			{
				return "login.html";
			}
			else if(adm.getId().equals(id)&&adm.getPassword().equals(password)) {
				
	    	request.getSession().setAttribute("login", adm);
		
				return "Ne.html";
				
			}
			else {
				System.out.println("错误");
				return "login.html";
				
			}
			
		
	

		
		

		
	
		
	}
	
  


	
}
