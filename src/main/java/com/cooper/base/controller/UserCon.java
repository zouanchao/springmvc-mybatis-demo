package com.cooper.base.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cooper.base.model.SysUser;
import com.cooper.base.service.SysUserService;
import com.cooper.common.util.PageUtil;
import com.cooper.common.util.ace.DatatablesViewPage;

/**  
 * Copyright © 2017 com. All rights reserved.
 *
 * @Title: UserCon.java
 * @Prject: springmvc-mybatis-demo
 * @Package: com.cooper.base.controller
 * @Description: TODO
 * @author: JackCooperZ  
 * @date: 2017年1月16日 下午3:20:47
 * @version: V1.0  
 */
@Controller
@RequestMapping("/user")
public class UserCon {

	@Resource
	private SysUserService sysUserService;//用户操作接口

	/** 
	 * @Title: toListUser 
	 * @Description: 跳转到用户管理列表页
	 * @return     
	 * @throws 
	 */
	@RequestMapping(value="/list",method={RequestMethod.GET})
	public String toListUser(){
		return "ftl/user/list";
	}

	/** 
	 * @Title: ajaxList 
	 * @Description: TODO
	 * @param request
	 * @param page
	 * @return     
	 * @throws 
	 */
	@RequestMapping(value="/ajaxList",method={RequestMethod.POST})
	@ResponseBody
	public DatatablesViewPage<SysUser> ajaxList(HttpServletRequest request,DatatablesViewPage<SysUser> page){
		DatatablesViewPage<SysUser> view = new DatatablesViewPage<SysUser>();
		PageUtil pu = new PageUtil();
		//设置每页显示行数，默认为10
		pu.setPageCount(page.getiDisplayLength());
		if(page.getiDisplayStart()==0){
			pu.setNextPage(1);
		}else{
			int nextPage = page.getiDisplayStart()/page.getiDisplayLength()+1;
			pu.setNextPage(nextPage);
		}
		//设置搜索条件，以后不要用request.getParameter("key")，直接用WebUtils
		pu.putSearchItem("key",page.getsSearch());
		List<SysUser> userList = sysUserService.getUserList(pu);
		view.setiDisplayStart(page.getiDisplayStart());
		view.setiTotalDisplayRecords(pu.getTotalCount());
		view.setiTotalRecords(pu.getTotalCount());
		view.setsEcho(page.getsEcho());
		view.setAaData(userList);
		return view;
	}

}
