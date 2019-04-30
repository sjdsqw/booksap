package com.example.demo.filter;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.FilterConfig;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.demo.Bean.Admin;

@WebFilter(urlPatterns = {"/showadmin.do","/firstselbook.do","/showborrow.do"}, filterName = "myfilter")
public class filter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Filter初始化中");
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

    	HttpServletRequest request=(HttpServletRequest) servletRequest;
    	HttpSession session=request.getSession();
        System.out.println("开始进行过滤处理");
        //调用该方法后，表示过滤器经过原来的url请求处理方法
  
       Admin a=  (Admin) session.getAttribute("login");
        System.out.println(a);
  	if(a==null)
  	{
  		System.out.println("已拦截");
  		request.setAttribute("error", "nologin");
  		HttpServletResponse response=(HttpServletResponse) servletResponse;
  		response.sendRedirect("loggin.jsp");
  	 
  	}
  	
        else {
        	
        	filterChain.doFilter(servletRequest, servletResponse);
        }
       
    }

    @Override
    public void destroy() {
        System.out.println("Filter销毁中");
    }
}
