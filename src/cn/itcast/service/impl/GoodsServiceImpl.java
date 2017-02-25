package cn.itcast.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.itcast.dao.GoodsMapper;
import cn.itcast.entity.Goods;
import cn.itcast.entity.Page;
import cn.itcast.service.GoodsService;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public void insert(Goods entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Goods entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Goods entity) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Goods select(Goods entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Goods> selectPage(Page<Goods> page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Goods> selectPageUseDyc(Page<Goods> page) {
		// TODO Auto-generated method stub
		return null;
	}

}
