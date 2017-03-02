package cn.itcast.dao;

import java.util.List;

import cn.itcast.entity.BuyOrderDetail;

public interface BuyOrderDetailMapper extends BaseMapper<BuyOrderDetail>{
	public void insertList(List<BuyOrderDetail> buyOrderDetails);
}