package cn.itcast.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.entity.Goods;
import cn.itcast.entity.Page;
import cn.itcast.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsAction extends BaseAction {
	
	@Resource
	private GoodsService goodsService;
	
	@RequestMapping("selectPageUseDyc")
	@ResponseBody
	public Object selectPage(Page<Goods> page,Goods good){
		page.setParamEntity(good);
		Page<Goods> p = goodsService.selectPageUseDyc(page);	
		return p.getPageMap();
	}
	
}
