package cn.itcast.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.entity.Goods;
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
	
	@RequestMapping("insert")
	@ResponseBody
	public Object Insert(StoreHouse storeHouse){
		int i = 0;
		System.out.println("---action.insert:"+storeHouse);
		try{
			storeHouseService.insert(storeHouse);
		}catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}
	
	@RequestMapping("update")
	@ResponseBody
	public Object Update(StoreHouse storeHouse){
		String msg = "success";
		System.out.println("---action.update:" + storeHouse);
		try {
			storeHouseService.update(storeHouse);
		} catch (Exception e) {
			msg = "e";
			e.printStackTrace();
		}
		return msg;
	}
	
	@RequestMapping("deleteList")
	@ResponseBody
	public Object deleteByList(String[] pks) throws Exception{
		System.out.println("---doAjax.deleteList:"+pks);
		storeHouseService.deleteList(pks);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;		
	}
	
}
