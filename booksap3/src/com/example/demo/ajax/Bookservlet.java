package com.example.demo.ajax;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Bean.Ajaxresult;
import com.example.demo.Bean.Book;
import com.example.demo.Bean.Borrow;
import com.example.demo.database.Bookbaseimpl;
import com.example.demo.database.Borrowbaseimpl;


@Controller
public class Bookservlet {
	
	@Resource
	Bookbaseimpl bim;
	@Resource
	Borrowbaseimpl bor;
	
	@RequestMapping("showbook.do")
	public @ResponseBody List<Book> showbook()
	{
	
	
		List<Book> books=bim.showallbook();
		return books;
		
	}
	@RequestMapping("showbookbypage.do")
	public @ResponseBody List<Book> showbookbypage(int page)
	{
		
	
		
		List<Book> books=bim.showbookbypage(page);
		return books;
		
	}
	
	@RequestMapping("firstselbook.do")
	public @ResponseBody Ajaxresult firstselbook()
	{

		List<Book> books=bim.showbookbypage(1);
		int page=bim.selpage();
	
	Ajaxresult sult=new Ajaxresult();
	sult.setBooks(books);
	sult.setPage(page);
	
		return sult;
		
	}
	
	@RequestMapping("addbook.do")
	public @ResponseBody Ajaxresult addbook(int id,String name,int number,String des,float price)
	{

		
		
		Book book=new Book();
		book.setId(id);
		book.setBookname(name);
		book.setNumber(number);
		book.setDescribe(des);
		book.setPrice(price);
	    int result=bim.insertbook(book);
//	    ModelAndView mv=new ModelAndView();
//	    mv.getModel().put("modresult", result);
	    Ajaxresult ar=new Ajaxresult();
	    ar.setResult(result);
	    return ar;
		
	}
	@RequestMapping("jiebook.do")
	public @ResponseBody Ajaxresult jiebook(String jiebookname,String peopleid )
	{

		

	    int result=bor.jiebook(jiebookname, peopleid);
//	    ModelAndView mv=new ModelAndView();
//	    mv.getModel().put("modresult", result);
	    Ajaxresult ar=new Ajaxresult();
	    ar.setResult(result);
	    return ar;
		
	}
	@RequestMapping("showborrow.do")
	public @ResponseBody List<Borrow> showborrow()
	{
      
		
	
		 List<Borrow> bors=bor.showborrow();
	
//	    ModelAndView mv=new ModelAndView();
//	    mv.getModel().put("modresult", result);

	    return bors;
		
	}
	
	@RequestMapping("huanbook.do")
	public @ResponseBody Ajaxresult huanbook(String jiebookname, String peopleid)
	{
      
		
	
		 int result=bor.huanbook(jiebookname, peopleid);
	
//	    ModelAndView mv=new ModelAndView();
//	    mv.getModel().put("modresult", result);
		 Ajaxresult ar=new Ajaxresult();
		    ar.setResult(result);
	    return ar;
		
	}

	@RequestMapping("selbookbyname.do")
	public @ResponseBody List<Book> selbookbyname(String bookname)
	{
		
		
		List<Book> books=bim.selbookbyname(bookname);
		return books;
		
	}
	

	@RequestMapping("selbookbycat.do")
	public @ResponseBody List<Book> selbookbyCat(String cat)
	{
		
		
		List<Book> books=bim.selbookbyCat(cat);
		return books;
		
	}
}
