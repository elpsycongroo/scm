package cn.itcast.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.SupplierMapper;
import cn.itcast.entity.Page;
import cn.itcast.entity.Supplier;
import cn.itcast.service.SupplierService;

@Service("supplierService")
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	private SupplierMapper supplierMapper;
	
	@Override
	public void insert(Supplier supplier) throws Exception {
		supplierMapper.insert(supplier);
	}

	@Override
	public void update(Supplier entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Supplier entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Supplier select(Supplier entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Supplier> selectPage(Page<Supplier> page) {
		page.setList(supplierMapper.selectPageList(page));
		page.setTotalRecord(supplierMapper.selectPageCount(page));
		return page;
	}

	@Override
	public Page<Supplier> selectPageUseDyc(Page<Supplier> page) {
		page.setList(supplierMapper.selectPageListUseDyc(page));
		page.setTotalRecord(supplierMapper.selectPageCountUseDyc(page));
		return page;
	}

}
