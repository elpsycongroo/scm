package cn.itcast.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.entity.Supplier;
import cn.itcast.service.SupplierService;

@Controller
@RequestMapping("/supplier")
public class SupplierAction {
	@Resource
	private SupplierService supplierService;
	
	@RequestMapping("/insert")
	public String insert(Supplier supplier){
		System.out.println("---action.supplier:"+supplier);
		try{
			supplierService.insertSupplier(supplier);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "forward:/jsp/main.jsp";
	}
}
