package cn.itcast.action;

import java.util.Arrays;

import javax.annotation.Resource;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.dao.BuyOrderMapper;
import cn.itcast.entity.BuyOrder;
import cn.itcast.entity.BuyOrderDetail;
import cn.itcast.service.BuyOrderService;

@Controller
@RequestMapping("/buyOrder")
public class BuyOrderAction {

	@Resource
	private BuyOrderService buyOrderService;
	
	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(BuyOrder buyOrder,String rows){
		String msg = "success";
		System.out.println("---action.buyOrder" + buyOrder);
		System.out.println("---action.rows" + rows);
		//提供json格式数据转java对象
		ObjectMapper mapper = new ObjectMapper();
		try{
			BuyOrderDetail[] buyOrderDetails = 
					mapper.readValue(rows, BuyOrderDetail[].class);
			buyOrder.setBuyOrderDetails(Arrays.asList(buyOrderDetails));
			buyOrderService.insertBuyOrder(buyOrder);
		} catch (Exception e){
			msg = "e";
			e.printStackTrace();
		}
		return msg;
	}
	
}
