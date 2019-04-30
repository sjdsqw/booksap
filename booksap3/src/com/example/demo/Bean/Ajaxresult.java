package com.example.demo.Bean;
import java.util.List;

public class Ajaxresult {
	private int result;
	private List admins ;
	private int page;
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public List getAdmins() {
		return admins;
	}

	public void setAdmins(List admins) {
		this.admins = admins;
	}

	public List getBooks() {
		return books;
	}

	public void setBooks(List books) {
		this.books = books;
	}

	private List books ;

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

}
