package cn.itcast.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/insert")
	public String insert(Supplier supplier){
		System.out.println("---action.supplier:"+supplier);
		try{
			supplierService.insert(supplier);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "forward:/jsp/main.jsp";
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
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", p.getTotalRecord());
		map.put("rows", p.getList());
		return map;
	}
	
	@RequestMapping("/doAjax")
	@ResponseBody//如果返回json格式  需要这个注解 这里用来测试环境
	public Object doAjax(Supplier supplier){
		System.out.println("---doAjax.supplier:"+supplier);
		supplier.setSupName("supName1");
		return supplier;
	}
}
