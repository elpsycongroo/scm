package cn.itcast.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SysInitServlet extends HttpServlet {


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		Map<String, Object> sysParamMap = new HashMap<String, Object>();
		Map<String, Object> supTypeMap = new HashMap<String, Object>();
		supTypeMap.put("1", "一级供应商");
		supTypeMap.put("2", "二级供应商");
		supTypeMap.put("3", "三级供应商");
		sysParamMap.put("supType", supTypeMap);
		Map<String, Object> goodsColorMap = new HashMap<String, Object>();
		goodsColorMap.put("1", "红色");
		goodsColorMap.put("2", "绿色");
		goodsColorMap.put("3", "蓝色");
		sysParamMap.put("goodsColor", goodsColorMap);
		this.getServletContext().setAttribute("sysParam", sysParamMap);
		System.out.println("-----------------系统参数加载完成-----------------");
	}

}
