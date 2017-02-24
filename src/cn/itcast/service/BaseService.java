package cn.itcast.service;

public interface BaseService<T> {
	// ��ӵ�������
	public void insert(T entity) throws Exception;

	// �޸ĵ�������
	public void update(T entity) throws Exception;

	// ɾ����������
	public void delete(T entity) throws Exception;

	// ��ѯ��������
	public T select(T entity);
}
