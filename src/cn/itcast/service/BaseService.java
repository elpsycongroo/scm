package cn.itcast.service;

import cn.itcast.entity.Page;

public interface BaseService<T> {
	// 添加单个对象
	public void insert(T entity) throws Exception;

	// 修改单个对象
	public void update(T entity) throws Exception;

	// 删除单个对象
	public void delete(T entity) throws Exception;

	// 查询单个对象
	public T select(T entity);
	
	//通过关键字分页查询
	public Page<T> selectPage(Page<T> page);
	
	//通过多条件关键字分页查询
	public Page<T> selectPageUseDyc(Page<T> page);
}
