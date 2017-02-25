package cn.itcast.service;

import cn.itcast.entity.Page;

public interface BaseService<T> {
	// ��ӵ�������
	public void insert(T entity) throws Exception;

	// �޸ĵ�������
	public void update(T entity) throws Exception;

	// ɾ����������
	public void delete(T entity) throws Exception;

	// ��ѯ��������
	public T select(T entity);
	
	//ͨ���ؼ��ַ�ҳ��ѯ
	public Page<T> selectPage(Page<T> page);
	
	//ͨ���������ؼ��ַ�ҳ��ѯ
	public Page<T> selectPageUseDyc(Page<T> page);
}
