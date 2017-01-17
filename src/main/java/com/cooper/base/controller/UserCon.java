package com.cooper.base.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cooper.base.model.SysUser;
import com.cooper.base.service.SysUserService;
import com.cooper.common.util.IdGen;
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

	private Logger logger = LoggerFactory.getLogger(getClass());

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
	 * @Description: 验证用户名是否已经存在
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

	/** 
	 * @Title: toAdd 
	 * @Description: 跳转到添加用户页面
	 * @return     
	 * @throws 
	 */
	@RequestMapping(value="/toAdd",method={RequestMethod.GET})
	public String toAdd(){
		logger.info("跳转到添加用户页");
		return "ftl/user/add";
	}

	/** 
	 * @Title: validateUser 
	 * @Description: 验证用户名是否重复
	 * @param sysUser
	 * @return     
	 * @throws 
	 */
	@RequestMapping(value="/validate",method={RequestMethod.POST})
	@ResponseBody
	public Map<String, Object> validateUser(SysUser sysUser){
		Map<String, Object> res  = new HashMap<String,Object>();
		SysUser tempUser = sysUserService.selectOne(sysUser);
		if(tempUser!=null){
			res.put("isExist", "Y");//已经存在
		}else{
			res.put("isExist", "N");//不存在
		}
		return res;
	}

	/** 
	 * @Title: add 
	 * @Description: 添加用户
	 * @param sysUser
	 * @return     
	 * @throws 
	 */
	@RequestMapping(value="/addUser",method={RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> add(SysUser sysUser){
		
		Map<String, Object> res  = new HashMap<String,Object>();
		String userId = IdGen.uuid();//通过uuid()生成随机的ID
		sysUser.setId(userId);//主键ID
		sysUser.setCreateBy(userId);//创建人
		sysUser.setCreateDate(new Date());//创建时间
		sysUser.setCompanyId("605a5f1150714ee9be51d2d6bf53a715");
		sysUser.setIsDelete("N");
		sysUser.setMobile("132XXXXXXX");
		sysUser.setPhone("135XXXXXXXX");
		sysUser.setOfficeId("3bf4d21c8e39474699b5106a52ba711f");
		//生成随机数，加密密码
		String random = new SecureRandomNumberGenerator().nextBytes().toHex();
		String password = new SimpleHash("SHA-1", sysUser.getPassword(), sysUser.getUserName()+random).toString();
		sysUser.setPassword(password);//加密后的密码
		sysUser.setSalt(sysUser.getUserName()+random);//盐值
		sysUser.setUpdateBy(userId);
		sysUser.setUpdateDate(new Date());
		sysUser.setUserName(sysUser.getUserName());
		sysUser.setUserNumber(userId);
		sysUser.setUserType("T");
		int  m = sysUserService.save(sysUser);
		if(m==1){
			res.put("status", "suc");
		}else{
			res.put("status", "fail");
		}
		return res;
	}

}
