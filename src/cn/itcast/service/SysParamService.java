package cn.itcast.service;

import java.util.Map;

import cn.itcast.entity.SysParam;

public interface SysParamService extends BaseService<SysParam>{
	public Map<String, Object> selectList();
}
