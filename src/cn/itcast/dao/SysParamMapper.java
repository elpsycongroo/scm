package cn.itcast.dao;

import java.util.List;

import cn.itcast.entity.SysParam;

public interface SysParamMapper extends BaseMapper<SysParamMapper>{
	public List<SysParam> selectList(String type);
	public List<SysParam> selectOtherTable(String sql);
}