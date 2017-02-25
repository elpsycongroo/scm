package cn.itcast.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsAction extends BaseAction {
	
	@Resource
	private GoodsService goodsService;
	
}
