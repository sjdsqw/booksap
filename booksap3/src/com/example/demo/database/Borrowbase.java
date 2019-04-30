package com.example.demo.database;

import java.util.List;


import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.example.demo.Bean.Borrow;


public interface Borrowbase {

	public void jiebook1(String jiebookname);
	public void huanbook1(String jiebookname);
	public void jiebook2(Borrow borrow);
	public void huanbook2(Borrow borrow);
	public List<Borrow> showborrow();
}
