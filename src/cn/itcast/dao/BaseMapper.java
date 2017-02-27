package cn.itcast.dao;

import java.util.List;

import cn.itcast.entity.Page;

public interface BaseMapper<T> {
	//添加单个对象
	public void insert(T entity);
	//修改单个对象
	public void update(T entity);
	//删除单个对象
	public void delete(T entity);
	//通过主键（数组）批量删除数据
	public void deleteList(String[] pks);
	//查询单个对象
	public T select(T entity);
	//通过关键字分页查询
	public List<T> selectPageList(Page<T> page);
	//通过关键字分页查询，返回总记录数
	public Integer selectPageCount(Page<T> page);
	//通过多条件关键字分页查询数据列表
	public List<T> selectPageListUseDyc(Page<T> page);
	//通过多条件关键字分页查询 返回总记录数
	public Integer selectPageCountUseDyc(Page<T> page);
}
