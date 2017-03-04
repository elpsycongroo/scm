package cn.itcast.service;

import java.util.List;
import java.util.Map;

import cn.itcast.entity.Supplier;

public interface SupplierService extends BaseService<Supplier>{
	
	List<Map<String, Object>> selectSupplier(Map<String, String> paramMap);
}
