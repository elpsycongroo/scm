package cn.itcast.service.impl;

import java.util.UUID;

import org.springframework.stereotype.Service;

import cn.itcast.entity.AccountRecords;
import cn.itcast.entity.BuyOrder;
import cn.itcast.entity.BuyOrderDetail;
import cn.itcast.service.BuyOrderService;

@Service("buyOrderService")
public class BuyOrderServiceImpl extends BaseServiceImpl<BuyOrder> implements BuyOrderService{

	@Override
	public void insertBuyOrder(BuyOrder buyOrder) throws Exception {
		System.out.println("----service.buyOrder" + buyOrder);		
		//���ɲɹ�����,bo��ʾ�ɹ�ҵ��
		String boId ="bo"+UUID.randomUUID().toString().replace("-", "");
		System.out.println("boIduuid:"+boId);
		//���òɹ�����
		buyOrder.setBoId(boId);
		//���òɹ���ϸ��������ɹ��������ֵ
		for(BuyOrderDetail bod : buyOrder.getBuyOrderDetails()){
			bod.setBodId(UUID.randomUUID().toString().replace("-", ""));
			bod.setBoId(boId);
		}
		buyOrderMapper.insert(buyOrder);
		buyOrderDetailMapper.insertList(buyOrder.getBuyOrderDetails());
		AccountRecords accountRecords = new AccountRecords();
		// ���ɲ����������¼������
		accountRecords.setArId(String.valueOf("ar"+UUID.randomUUID().toString().replace("-", "")));
		accountRecords.setArAttn(buyOrder.getBoAttn());
		accountRecords.setArArrears(buyOrder.getBoArrears());
		//bo��ʾ��Ʒ�ɹ��������ڲ������м����������
		accountRecords.setArBusType("bo");
		accountRecords.setArDate(buyOrder.getBoDate());
		//�Żݽ���Ӧ������ȥʵ������ټ�ȥǷ��
		accountRecords.setArDiscount(buyOrder.getBoPayable().subtract(buyOrder.getBoPaid()).subtract(buyOrder.getBoArrears()));
		accountRecords.setArOperator(buyOrder.getBoOperator());
		//�ɹ�����
		accountRecords.setArOrderId(buyOrder.getBoId());
		accountRecords.setArPaid(buyOrder.getBoPaid());
		accountRecords.setArPayable(buyOrder.getBoPayable());
		accountRecords.setArRemark(buyOrder.getBoRemark());
		accountRecords.setSupId(buyOrder.getSupId());
		accountRecordsMapper.insert(accountRecords);
		

	}

}
