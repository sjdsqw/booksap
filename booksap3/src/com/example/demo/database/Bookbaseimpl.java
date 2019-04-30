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

import com.example.demo.Bean.Book;

@Component
public class Bookbaseimpl {

    @Resource
	Bookbase bo;

	public int insertbook(Book book) {

		bo.insertbook(book);

		return 1;

	}

	public int moabook(Book book) {

		bo.moabook(book);

		return 1;

	}

	public List<Book> selbookbyname(String bookname) {

		List<Book> books = bo.selbookbyname(bookname);

		return books;

	}

	public List<Book> selbookbyCat(String cat) {

		List<Book> books = bo.selbookbyCat(cat);

		return books;

	}

	public int delbook(String id) {

		bo.delbook(id);

		return 1;

	}

	public List<Book> showallbook() {

		List<Book> books = bo.showallbook();

		return books;
	}

	public List<Book> showbookbypage(int page) {

		List<Book> books = bo.showbookbypage(page);

		return books;
	}

	public int selpage() {
		int l;
		int page = bo.selpage();
		if (page % 10 == 0) {
			l = 0;
		} else {

			l = 1;
		}
		page = page / 10;
		page = page + l;

		return page;

	}

}
