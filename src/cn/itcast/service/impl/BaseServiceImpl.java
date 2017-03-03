package cn.itcast.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;

import cn.itcast.dao.AccountMapper;
import cn.itcast.dao.AccountRecordsMapper;
import cn.itcast.dao.BaseMapper;
import cn.itcast.dao.BuyOrderDetailMapper;
import cn.itcast.dao.BuyOrderMapper;
import cn.itcast.dao.GoodsMapper;
import cn.itcast.dao.StoreHouseMapper;
import cn.itcast.dao.SupplierMapper;
import cn.itcast.dao.SysParamMapper;
import cn.itcast.entity.Page;
import cn.itcast.service.BaseService;

public class BaseServiceImpl<T> implements BaseService<T> {

	/**
	 * 注入dao层 定义相关字段
	 */
	
	@Autowired
	protected SupplierMapper supplierMapper;
	
	@Autowired
	protected AccountMapper accountMapper;
	
	@Autowired
	protected GoodsMapper goodsMapper;
	
	@Autowired
	protected StoreHouseMapper storeHouseMapper;
	
	@Autowired
	protected BuyOrderMapper buyOrderMapper;
	
	@Autowired
	protected BuyOrderDetailMapper buyOrderDetailMapper;
	
	@Autowired
	protected AccountRecordsMapper accountRecordsMapper;
	
	@Autowired
	protected SysParamMapper sysParamMapper;
	
	protected BaseMapper<T> baseMapper;
	
	/**
	 * 初始化
	 * @postConstruct 在构造方法后 初始化之前执行     
	 * @throws Exception
	 */
	@PostConstruct
	private void initBaseMapper() throws Exception{
		//完成以下逻辑，需要对研发本身进行命名与使用规范
		//this 关键字指对象本身，这里是调用此方法的实现类（子类）
		System.out.println("======this: " + this);
		System.out.println("======父类基本信息： " + this.getClass().getSuperclass());
		System.out.println("======父类和泛型的信息： " + this.getClass().getGenericSuperclass());
		
		//通过反射获取类
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		//获取第一个参数的class(子类Class名)->例：Supplier.class
		Class clazz = (Class) type.getActualTypeArguments()[0]; 
		System.out.println("======class: "  + clazz);
		//转换为属性名（相关的Mapper子类的引用名）Supplier->supplierMapper
		String localField 
			= clazz.getSimpleName().substring(0,1).toLowerCase() 
				+ clazz.getSimpleName().substring(1) + "Mapper";
		System.out.println("=====localField:" + localField);
		
		//getDeclaredField:使用包括私有、默认、受保护、公共字段。但不包括继承的字段
		//拿到字段相对应的对象
		Field field = this.getClass().getSuperclass().getDeclaredField(localField);
		System.out.println("======field:" + field);
		System.out.println("======field 相应的对象：" + field.get(this));
		//获得baseField字段中对应baseMapper的字段，再用get(this)取得其对象(实现类)
		Field baseField = this.getClass().getSuperclass().getDeclaredField("baseMapper");
		System.out.println("======baseField:" + baseField);
		System.out.println("======baseField对应的对象：" + baseField.get(this));
		/**
		 * field.get(this):获取当前this的field字段的值。例如：
		 * Supplier对象中，baseMapper所指向的对象为其子类型SupplierMapper对象，
		 * 子类型对象已被spring实例化于容器中.
		 * 将field字段对应的对象设置入baseField对应的对象储存位置中
		 */
		baseField.set(this, field.get(this));//反射后baseMapper对象已经有了子类的值
		System.out.println("=======baseField对应的对象：" + baseMapper);
	}
	
	@Override
	public void insert(T entity) throws Exception {
		baseMapper.insert(entity);
	}

	@Override
	public void update(T entity) throws Exception {
		baseMapper.update(entity);
		
	}

	@Override
	public void delete(T entity) throws Exception {
		baseMapper.delete(entity);
		
	}

	@Override
	public void deleteList(String[] pks) throws Exception {
		baseMapper.deleteList(pks);
		
	}

	@Override
	public T select(T entity) {
		return baseMapper.select(entity);
	}

	@Override
	public Page<T> selectPage(Page<T> page) {
		page.setList(baseMapper.selectPageList(page));
		page.setTotalRecord(baseMapper.selectPageCount(page));
		return page;
	}

	@Override
	public Page<T> selectPageUseDyc(Page<T> page) {
		page.setList(baseMapper.selectPageListUseDyc(page));
		page.setTotalRecord(baseMapper.selectPageCountUseDyc(page));
		return page;
	}

}
