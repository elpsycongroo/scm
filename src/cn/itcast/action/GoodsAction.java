package cn.itcast.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
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
	
	@RequestMapping("insert")
	@ResponseBody
	public Object Insert(Goods goods){
		String msg = "success";
		System.out.println("---action.insert:"+goods);
		try{
			goodsService.insert(goods);
		}catch(Exception e){
			msg = "e";
			e.printStackTrace();
		}
		return msg;
	}
	
	@RequestMapping("update")
	@ResponseBody
	public Object Update(Goods goods){
		String msg = "success";
		System.out.println("---action.update:" + goods);
		try {
			goodsService.update(goods);
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
		goodsService.deleteList(pks);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;		
	}
	
	@RequestMapping("selectPageUseDyc")
	@ResponseBody
	public Object selectPage(Page<Goods> page,Goods good){
		page.setParamEntity(good);
		Page<Goods> p = goodsService.selectPageUseDyc(page);	
		return p.getPageMap();
	}
	
}
