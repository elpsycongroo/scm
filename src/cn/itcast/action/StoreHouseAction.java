package cn.itcast.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.entity.Page;
import cn.itcast.entity.StoreHouse;
import cn.itcast.entity.Supplier;
import cn.itcast.service.StoreHouseService;

@Controller
@RequestMapping("/storeHouse")
public class StoreHouseAction extends BaseAction {

	@Resource
	private StoreHouseService storeHouseService;

	// 通过多条件关键字分类查询
	@RequestMapping("selectPageUseDyc")
	@ResponseBody
	public Object selectPage(Page<StoreHouse> page, StoreHouse storeHouse) {
		page.setParamEntity(storeHouse);
		System.out.println("--page:" + page);
		Page<StoreHouse> p = storeHouseService.selectPageUseDyc(page);
		return p.getPageMap();
	}
}
