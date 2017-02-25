package cn.itcast.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.service.StoreHouseService;

@Controller
@RequestMapping("/storeHouse")
public class StoreHouseAction extends BaseAction {
	
	@Resource
	private StoreHouseService storeHouseService;
	
}
