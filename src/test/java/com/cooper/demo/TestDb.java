package com.cooper.demo;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cooper.base.model.SysUser;
import com.cooper.base.service.SysUserService;
import com.cooper.common.util.IdGen;
import com.cooper.common.util.PageUtil;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

/**  
 * Copyright © 2017 com. All rights reserved.
 *
 * @Title: TestDb.java
 * @Prject: springmvc-mybatis-demo
 * @Package: com.cooper.demo
 * @Description: TODO
 * @author: JackCooperZ  
 * @date: 2017年1月16日 上午9:32:22
 * @version: V1.0  
 */
//引入Spring测试框架
@RunWith(SpringJUnit4ClassRunner.class)
//加载Spring配置文件
@ContextConfiguration(locations = {"classpath*:/spring.xml"})
public class TestDb {
	
	@Resource
	private SysUserService sysUserService;
	
	@Test
	public void testDb(){
		SysUser sysUser = new SysUser();
		sysUser.setCompanyId(IdGen.uuid());
		sysUser.setCreateBy("-1");
		sysUser.setCreateDate(new Date());
		sysUser.setEmail("initemail@email.com");
		sysUser.setId(IdGen.uuid());
		sysUser.setIsDelete("N");
		sysUser.setMobile("13214621359");
		sysUser.setOfficeId(IdGen.uuid());
		
		String username = "yaoming";  
		String pass_mingwen = "admin";
		String random = new SecureRandomNumberGenerator().nextBytes().toHex();
		//内部使用MessageDigest  
		String password = new SimpleHash("SHA-1", pass_mingwen, username+random).toString();
		
		sysUser.setPassword(password);
		sysUser.setPhone("13512695869");
		sysUser.setRealName("姚明");
		sysUser.setRemarks("篮球高手");
		sysUser.setSalt(username+random);
		sysUser.setUpdateBy("-1");
		sysUser.setUpdateDate(new Date());
		sysUser.setUserName(username);
		sysUser.setUserNumber("058697584");
		sysUser.setUserType("A");
		int  m = sysUserService.save(sysUser);
		System.out.println(m);
	}
	
	@Test
	public void testSelect(){
	/*	Example example = new Example(SysUser.class);
        Criteria cri = example.createCriteria();
        cri.andEqualTo("userName", "admin");*/
		
        SysUser sysUser = new SysUser();
        sysUser.setUserName("admin");
        sysUser = sysUserService.selectOne(sysUser);
        System.out.println(sysUser.getEmail());
        
	}
	
	@Test
	public void testSelectList(){
		PageUtil pu = new PageUtil();
		//设置每页显示行数，默认为10
		pu.setPageCount(1);
		pu.setNextPage(2);
		List<SysUser> userList = sysUserService.getUserList(pu);
		for (SysUser sysUser : userList) {
			System.out.println(sysUser.getEmail()+":"+sysUser.getUserName()+":"+sysUser.getCreateDate());
		}
	}

}
