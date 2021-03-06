package cn.itcast.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.entity.Page;
import cn.itcast.entity.Supplier;
import cn.itcast.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierAction extends BaseAction {
	@Resource
	private SupplierService supplierService;
	
	@RequestMapping("/selectSupplier")
	@ResponseBody
	public Object selectSupplier(String start,String end){
		System.out.println("start:"+ start+"||end:"+end);
		Map<String, String> paramMap =new HashMap<String, String>();
		paramMap.put("start", start);
		paramMap.put("end", end);

		return supplierService.selectSupplier(paramMap);
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public Object insert(Supplier supplier){
		String msg = "success";
		System.out.println("---action.insert:"+supplier);
		try{
			supplierService.insert(supplier);
		}catch(Exception e){
			msg = "e";
			e.printStackTrace();
		}
		return msg;
	}
	@RequestMapping("/deleteList")
	@ResponseBody
	public Object deleteList(String[] pks) throws Exception{
		System.out.println("---doAjax.deleteList:"+pks);
		supplierService.deleteList(pks);						
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("msg", "success");
		return map;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public Object Update(Supplier supplier){
		String msg = "success";
		System.out.println("---action.update:"+supplier);
		try{
			supplierService.update(supplier);
		}catch(Exception e){
			msg = "e";
			e.printStackTrace();
		}
		return msg;
	}
	
	//通过关键字分页查询
//	@RequestMapping("/selectPage")
//	@ResponseBody
//	public Object selectPage(Page<Supplier> page){
//		Page<Supplier> p = supplierService.selectPage(page);
//		System.out.println("--page:"+page);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("total", p.getTotalRecord());
//		map.put("rows", p.getList());
//		return map;
//	}
	//通过多条件关键字分类查询
	@RequestMapping("selectPageUseDyc")
	@ResponseBody
	public Object selectPage(Page<Supplier> page,Supplier supplier){		
		page.setParamEntity(supplier);
		System.out.println("--page:"+page);
		Page<Supplier> p = supplierService.selectPageUseDyc(page);		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("total", p.getTotalRecord());
//		map.put("rows", p.getList());
		return p.getPageMap();
	}
	
	@RequestMapping("/doAjax")
	@ResponseBody//如果返回json格式  需要这个注解 这里用来测试环境
	public Object doAjax(Supplier supplier){
		System.out.println("---doAjax.supplier:"+supplier);
		supplier.setSupName("supName1");
		return supplier;
	}
}
