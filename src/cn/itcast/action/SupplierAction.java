package cn.itcast.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/doAjax")
	@ResponseBody//�������json��ʽ  ��Ҫ���ע�� �����������Ի���
	public Object doAjax(Supplier supplier){
		System.out.println("---doAjax.supplier:"+supplier);
		supplier.setSupName("supName1");
		return supplier;
	}
}
