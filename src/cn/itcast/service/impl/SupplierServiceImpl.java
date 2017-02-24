package cn.itcast.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.SupplierMapper;
import cn.itcast.entity.Supplier;
import cn.itcast.service.SupplierService;

@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	private SupplierMapper supplierMapper;
	
	@Override
	public void insertSupplier(Supplier supplier) throws Exception {
		supplierMapper.insertSupplier(supplier);
	}

}
