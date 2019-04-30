package com.example.demo.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.example.demo.Bean.Borrow;


@Component
public class Borrowbaseimpl {
	
	@Resource
	Borrowbase bw;
	
	public int jiebook(String jiebookname,String peopleid)
	{ 
		Borrow bor=new Borrow();
		bor.setJiebookname(jiebookname);
		bor.setPeopleid(peopleid);
		bw.jiebook1(jiebookname);
		bw.jiebook2(bor);
		
		return 1;
	}
	public int huanbook(String jiebookname,String peopleid)
	{
		Borrow bor=new Borrow();
		bor.setJiebookname(jiebookname);
		bor.setPeopleid(peopleid);
		bw.huanbook1(jiebookname);
		bw.huanbook2(bor);
		
		return 1;
	}
	
	
	public List<Borrow> showborrow() 
	{
		
		 List<Borrow> bors=bw.showborrow();
	
		 return bors;
		
		
	}

}
