package cn.itcast.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.StoreHouseMapper;
import cn.itcast.entity.Page;
import cn.itcast.entity.StoreHouse;
import cn.itcast.service.StoreHouseService;

@Service("storeHouseService")
public class StoreHouseServiceImpl implements StoreHouseService {

	@Autowired
	private StoreHouseMapper storeHouseMapper;
	
	@Override
	public void insert(StoreHouse entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(StoreHouse entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(StoreHouse entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public StoreHouse select(StoreHouse entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<StoreHouse> selectPage(Page<StoreHouse> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<StoreHouse> selectPageUseDyc(Page<StoreHouse> page) {
		// TODO Auto-generated method stub
		return null;
	}

}
