package cn.itcast.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import cn.itcast.entity.SysParam;
import cn.itcast.service.SysParamService;

@Service("sysParamService")
public class SysParamServiceImpl extends BaseServiceImpl<SysParam> implements SysParamService {

	
	
	@Override
	public Map<String, Object> selectList() {
		List<SysParam> sysParams = sysParamMapper.selectList("");
		//系统参数map 用来存放所有字段的相关参数信息
		Map<String, Object> sysParamMap = new HashMap<String, Object>();
		Map<String, Object> fieldMap = null;
		
		for(SysParam sp : sysParams) {
			//获取要执行的sql 用来查询其它表
			if("1".equals(sp.getSysParamType())){
				//通过仓库mapper读出仓库数据列表
				//再把仓库列表的数据中仓库id和仓库名称
				String sql = sp.getSysParamValue();
				System.out.println("============="+sql);
				//执行查询 并把结果存在list中，元素为系统参数类型的实体
				List<SysParam> otherList = sysParamMapper.selectOtherTable(sql);
				fieldMap = new HashMap<String, Object>();
				for(SysParam otherSysParam : otherList){
					fieldMap.put(otherSysParam.getSysParamValue(), otherSysParam.getSysParamText());
				}
				//otherSysParam中只有test和value字段 缺少field值
				sysParamMap.put(sp.getSysParamField(),fieldMap);
			}else{
				//从存放系统参数的map获取字段的map
				if(sysParamMap.get(sp.getSysParamField())==null){
					fieldMap = new HashMap<String, Object>();
					//没有存储过 存储
					fieldMap.put(sp.getSysParamValue(),sp.getSysParamText());
					sysParamMap.put(sp.getSysParamField(), fieldMap);
				}else{
					//已经有存储
					fieldMap = (Map<String, Object>) sysParamMap.get(sp.getSysParamField());
					fieldMap.put(sp.getSysParamValue(), sp.getSysParamText());
				}
			}
		}
		return sysParamMap;
	}
	

}
