package com.example.demo.database;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.example.demo.Bean.Admin;

@Component
public class Adminbaseimpl {

	@Resource
	Adminbase am;

	public int insertadmin(Admin ad) {
		am.insertadmin(ad);

		return 1;

	}

	public int moadmin(Admin ad) {
		am.moadmin(ad);
		return 1;

	}

	public Admin seladmin(String id) {

		Admin adm = am.seladmin(id);

		return adm;

	}

	public int deladmin(String id) {

		am.deladmin(id);

		return 1;

	}

	public List<Admin> showalladmin() {

		List<Admin> adms = am.showalladmin();

		return adms;

	}

	public List<Admin> showadminbypage(int page) {

		List<Admin> adms = am.showadminbypage(page);

		return adms;
	}

	public int adselpage() {
		int l;

		int page = am.adselpage();
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
