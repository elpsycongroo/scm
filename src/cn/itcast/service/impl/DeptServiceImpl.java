package cn.itcast.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.DeptDao;
import cn.itcast.entity.Dept;
import cn.itcast.service.DeptService;

@Service("deptService")
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DeptDao deptdao;
	
	@Override
	public Dept selectDept(Integer deptId) {
		return deptdao.selectDept(deptId);
	}

	@Override
	public int insertDept(Dept dept) {
		return deptdao.insertDept(dept);
	}

}
