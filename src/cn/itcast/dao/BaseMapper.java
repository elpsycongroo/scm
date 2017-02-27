package cn.itcast.dao;

import java.util.List;

import cn.itcast.entity.Page;

public interface BaseMapper<T> {
	//��ӵ�������
	public void insert(T entity);
	//�޸ĵ�������
	public void update(T entity);
	//ɾ����������
	public void delete(T entity);
	//ͨ�����������飩����ɾ������
	public void deleteList(String[] pks);
	//��ѯ��������
	public T select(T entity);
	//ͨ���ؼ��ַ�ҳ��ѯ
	public List<T> selectPageList(Page<T> page);
	//ͨ���ؼ��ַ�ҳ��ѯ�������ܼ�¼��
	public Integer selectPageCount(Page<T> page);
	//ͨ���������ؼ��ַ�ҳ��ѯ�����б�
	public List<T> selectPageListUseDyc(Page<T> page);
	//ͨ���������ؼ��ַ�ҳ��ѯ �����ܼ�¼��
	public Integer selectPageCountUseDyc(Page<T> page);
}
