package cn.itcast.dao;

import cn.itcast.entity.Dept;

public interface DeptDao {

	/**
	 * 根据部门编号查询部门信息 
	 * @param deptId 部门编号
	 * @return 部门信息
	 */
	public Dept selectDept(Integer deptId);
	/**
	 * 添加部门信息 
	 * @param dept 部门信息
	 * @return 添加成功的记录数
	 */
	public int insertDept(Dept dept);
	
}
