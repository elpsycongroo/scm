package cn.itcast.dao;

public interface BaseMapper<T> {
	//添加单个对象
	public void insert(T entity);
	//修改单个对象
	public void update(T entity);
	//删除单个对象
	public void delete(T entity);
	//查询单个对象
	public T select(T entity);
}
