package cn.itcast.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.entity.Dept;
import cn.itcast.service.DeptService;

@Controller
@RequestMapping(value="/dept")
public class DeptAction {
	@Resource
	private DeptService deptService;
	
	@RequestMapping(value="/insert")
	public String insert(Dept dept){
		System.out.println("---action.dept:"+dept);
		deptService.insertDept(dept);
		return "forward:/jsp/main.jsp";
	}
}

