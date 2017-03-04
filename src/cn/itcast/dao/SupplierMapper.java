package cn.itcast.dao;

import java.util.List;
import java.util.Map;

import cn.itcast.entity.Supplier;

public interface SupplierMapper extends BaseMapper<Supplier> {
//    public void insertSupplier(Supplier supplier);
	List<Map<String, Object>> selectSupplier(Map<String, String> paramMap);
	
}