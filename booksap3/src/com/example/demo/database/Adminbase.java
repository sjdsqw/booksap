package com.example.demo.database;

import java.util.List;


import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.example.demo.Bean.Admin;


public interface Adminbase {
	public void deladmin(String id);
	public void insertadmin(Admin admin);
	public void moadmin(Admin admin);
	public List<Admin> showalladmin();
	public List<Admin> showadminbypage(int page);
	public int adselpage();
	public Admin seladmin(String id);

}
