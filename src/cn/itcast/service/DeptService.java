package cn.itcast.service;

import cn.itcast.entity.Dept;

public interface DeptService {
	public Dept selectDept(Integer deptId);
	public int insertDept(Dept dept);
}
