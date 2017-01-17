package com.cooper.demo.controller;

import com.cooper.base.model.SysUser;
import com.cooper.base.service.SysUserService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * Copyright © 2016  All rights reserved.
 *
 * @Title: DemoCon
 * @Prject: springmvc-mybatis-demo
 * @Package: com.cooper.demo.controller
 * @Description: TODO
 * @author: JackCooperZ
 * @date: 2017/1/15 0015 下午 6:26
 * @version: V1.0
 */
@Controller
@RequestMapping("/demo")
public class DemoCon {

	private  static Logger logger = LoggerFactory.getLogger(DemoCon.class);

	@Resource
	private SysUserService sysUserService;

	/** 
	 * @Title: welcome 
	 * @Description: TODO
	 * @return     
	 * @throws 
	 */
	@RequestMapping(value = "/welcome",method = {RequestMethod.GET,RequestMethod.POST})
	public String welcome(){
		return "ftl/welcome";
	}

	/**  
	 * @Title: index
	 * @Description: 跳转到首页
	 * @author: JackCooperZ
	 * @date: 2017/1/15 0015 下午 6:31
	 * @since: v1.0
	 */
	@RequestMapping(value = "/index",method = {RequestMethod.GET,RequestMethod.POST})
	public String index(){
		return "ftl/index";
	}

	/**
	 * @Title: login
	 * @Description: TODO
	 * @author: JackCooperZ
	 * @date: 2017/1/15 0015 下午 7:08
	 * @since: v1.0
	 */
	@RequestMapping(value = "/login",method = {RequestMethod.GET})
	public String login(){
		logger.debug("GET登录方法");
		return "ftl/login";
	}

	/**
	 * @Title: login
	 * @Description: TODO
	 * @author: JackCooperZ
	 * @date: 2017/1/15 0015 下午 7:08
	 * @since: v1.0
	 */
	@RequestMapping(value = "/login",method = {RequestMethod.POST})
	public String login(SysUser sysUser){
		logger.debug("POST登录方法");
		return "redirect:index";
	}


}
