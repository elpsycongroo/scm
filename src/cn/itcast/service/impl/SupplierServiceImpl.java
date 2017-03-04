package cn.itcast.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import cn.itcast.entity.Supplier;
import cn.itcast.service.SupplierService;

@Service("supplierService")
public class SupplierServiceImpl extends BaseServiceImpl<Supplier> implements SupplierService {

	@Override
	public List<Map<String, Object>> selectSupplier(Map<String, String> paramMap) {
		return supplierMapper.selectSupplier(paramMap);
	}
}
