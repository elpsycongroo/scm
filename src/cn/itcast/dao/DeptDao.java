package cn.itcast.dao;

import cn.itcast.entity.Dept;

public interface DeptDao {

	/**
	 * ���ݲ��ű�Ų�ѯ������Ϣ 
	 * @param deptId ���ű��
	 * @return ������Ϣ
	 */
	public Dept selectDept(Integer deptId);
	/**
	 * ��Ӳ�����Ϣ 
	 * @param dept ������Ϣ
	 * @return ��ӳɹ��ļ�¼��
	 */
	public int insertDept(Dept dept);
	
}
