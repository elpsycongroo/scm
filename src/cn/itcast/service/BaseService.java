package cn.itcast.service;

public interface BaseService<T> {
	// 添加单个对象
	public void insert(T entity) throws Exception;

	// 修改单个对象
	public void update(T entity) throws Exception;

	// 删除单个对象
	public void delete(T entity) throws Exception;

	// 查询单个对象
	public T select(T entity);
}
