package cn.itcast.action;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
	@ResponseBody
	public Object insert(Supplier supplier){
		int i = 0;
		System.out.println("---action.supplier:"+supplier);
		try{
			supplierService.insert(supplier);
		}catch(Exception e){
			e.printStackTrace();
		}
		return i;
	}
	@RequestMapping("/deleteList")
	@ResponseBody
	public Object deleteList(String[] pks) throws Exception{
		System.out.println("---doAjax.deleteList:"+pks);
		supplierService.deleteList(pks);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("msg", "success");
		return map;
	}
	
	//ͨ���ؼ��ַ�ҳ��ѯ
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
	//ͨ���������ؼ��ַ����ѯ
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
	@ResponseBody//�������json��ʽ  ��Ҫ���ע�� �����������Ի���
	public Object doAjax(Supplier supplier){
		System.out.println("---doAjax.supplier:"+supplier);
		supplier.setSupName("supName1");
		return supplier;
	}
}
