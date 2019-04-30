package com.example.demo.database;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.example.demo.Bean.Book;

public interface Bookbase{
	public void delbook(String id);
	public void insertbook(Book book);
	public void moabook(Book book);
	public List<Book> showallbook();
	public List<Book> showbookbypage(int page);
	public int selpage();
	public List<Book> selbookbyname(String bookname);
	public List<Book> selbookbyCat(String cat);
}
