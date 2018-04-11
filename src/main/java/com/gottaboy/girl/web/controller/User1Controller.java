package com.gottaboy.girl.web.controller;

import com.github.pagehelper.PageInfo;
import com.gottaboy.girl.bean.User1;
import com.gottaboy.girl.commons.datatables.DataTablesRequest;
import com.gottaboy.girl.commons.datatables.DataTablesResponse;
import com.gottaboy.girl.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class User1Controller {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
    private UserService userService;
	
	@RequestMapping(value = "/user1/list", method = RequestMethod.GET)
	public String list() {
		return "/user1/list";
	}	
	
	@RequestMapping(value = "/user1/dblist", method = RequestMethod.POST)
	public @ResponseBody DataTablesResponse<User1> dblist(User1 user1, String dtParaJson) {
		logger.debug(dtParaJson);
		DataTablesRequest req = DataTablesRequest.getInstance(dtParaJson);
		PageInfo<User1> page = userService.getUserPageList(user1,req.getPageNum(),req.getiDisplayLength());
		DataTablesResponse<User1> ret = new DataTablesResponse<User1>();
		ret.setData(page.getList());
		ret.setDraw(req.getsEcho() + 1);
		ret.setRecordsTotal(page.getTotal());
		ret.setRecordsFiltered(page.getTotal());
		return ret;
	}
}
