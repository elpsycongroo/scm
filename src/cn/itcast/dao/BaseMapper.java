package cn.itcast.dao;

public interface BaseMapper<T> {
	//��ӵ�������
	public void insert(T entity);
	//�޸ĵ�������
	public void update(T entity);
	//ɾ����������
	public void delete(T entity);
	//��ѯ��������
	public T select(T entity);
}
