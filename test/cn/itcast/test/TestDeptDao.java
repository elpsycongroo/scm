package cn.itcast.test;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.itcast.entity.Dept;

public class TestDeptDao {
//
//	//@Resource //����û��ʹ�ã���̰汾��������ʽ����ע��
//	static private DeptDaoImpl deptDao;
//	@BeforeClass
//	public static void setUpBeforeClass() throws Exception {
//		ApplicationContext context =new ClassPathXmlApplicationContext("applicationContext.xml");
//		deptDao=(DeptDaoImpl) context.getBean("deptDao");
//	}
//
//	@AfterClass
//	public static void tearDownAfterClass() throws Exception {
//	}
//
//	@Test
//	public void testSelectDept() {
//		System.out.println(deptDao.selectDept(1));
//	}
//
//	@Test
//	public void testInsertDept() {
//		Dept dept=new Dept();
//		//dept.setDeptId(117);
//		dept.setDeptName("name117");
//		dept.setDeptAddress("address117");
//		System.out.println("��Ӱ��������"+deptDao.insertDept(dept));
//	}
}
