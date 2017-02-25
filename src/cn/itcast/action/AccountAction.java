package cn.itcast.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.entity.Account;
import cn.itcast.entity.Supplier;
import cn.itcast.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountAction extends BaseAction {
	@Resource
	private AccountService accountService;
	
	@RequestMapping("/login")
	public String login(Account account,HttpServletRequest request,HttpSession session){
		System.out.println("---action.account:"+account);
		Account acc = accountService.login(account);
		if(acc != null){
			//存session
			session.setAttribute("account", acc);
			return "forward:/WEB-INF/jsp/main.jsp";
		}else{
			request.setAttribute("msg", "用户名或密码错误！");
			return "forward:/login.jsp";
		}
		
	}
	
	@RequestMapping("/doAjax")
	@ResponseBody//如果返回json格式  需要这个注解 这里用来测试环境
	public Object doAjax(Supplier supplier){
		System.out.println("---doAjax.supplier:"+supplier);
		supplier.setSupName("supName1");
		return supplier;
	}
	
	
}
