package com.cooper.base.service;

import com.cooper.base.dao.SysUserMapper;
import com.cooper.base.model.SysUser;
import com.cooper.common.core.service.BaseService;
import com.cooper.common.util.PageUtil;
import com.cooper.common.util.StringUtil;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;
import tk.mybatis.mapper.entity.Example.Criterion;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * Copyright © 2016  All rights reserved.
 *
 * @Title: SysUserService
 * @Prject: springmvc-mybatis-demo
 * @Package: com.cooper.base.service
 * @Description: 系统用户操作Service
 * @author: JackCooperZ
 * @date: 2017/1/15 0015 下午 6:24
 * @version: V1.0
 */
@Service("com.cooper.base.service.SysUserService")
public class SysUserService extends BaseService<SysUser> {
	
	@Resource
	private SysUserMapper sysUserMapper;
	
	
	/**
	 * @Title: getUserList
	 * @Description: 设置读数据时不要事务， 读取用户数据
	 * @param pu 分页工具类
	 * @return: List<ResExamPaper>
	 */
	public List<SysUser>  getUserList(PageUtil pu){
		Example example = new Example(SysUser.class);
		Criteria cri = example.createCriteria();
		example.setOrderByClause("create_date desc");
		if(pu!=null){
			if(StringUtil.isNotBlank(pu.getSearchItem("key"))){
				cri.andLike("userName", "%" +pu.getSearchItem("key")+"%");
			}
		}
		pu.setTotalCount(sysUserMapper.selectCountByExample(example));
		PageHelper.startPage(pu.getNextPage(), pu.getPageCount());
		List<SysUser>  userList = sysUserMapper.selectByExample(example);
		return userList;
	}
	/*@Transactional(propagation = Propagation.NOT_SUPPORTED)
	public List<ResExamPaper> getResExamPaperList(PageUtil pu) {
		//创建读取条件类，该类封装了order by等条件
		ResExamPaperCriteria crit = new ResExamPaperCriteria();
		crit.setOrderByClause("create_date desc");
		ResExamPaperCriteria.Criteria criteria= crit.createCriteria();
		if(pu!=null){
			if(StringUtil.isNotBlank(pu.getSearchItem("key"))){
				criteria.andNameLike("%" + pu.getSearchItem("key") + "%");
			}
			//分页对象，参数：下一页，单页显示记录数
			PageHelper.startPage(pu.getNextPage(), pu.getPageCount());
		}
		List<ResExamPaper> resExamPaperList = resExamPaperMapper.selectByExample(crit);
		if(pu!=null){
			pu.setRowCount(((Page<ResExamPaper>)resExamPaperList).getTotal());
		}
		return resExamPaperList;
	}*/

}
