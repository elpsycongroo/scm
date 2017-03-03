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
	 * ע��dao�� ��������ֶ�
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
	 * ��ʼ��
	 * @postConstruct �ڹ��췽���� ��ʼ��֮ǰִ��     
	 * @throws Exception
	 */
	@PostConstruct
	private void initBaseMapper() throws Exception{
		//��������߼�����Ҫ���з��������������ʹ�ù淶
		//this �ؼ���ָ�����������ǵ��ô˷�����ʵ���ࣨ���ࣩ
		System.out.println("======this: " + this);
		System.out.println("======���������Ϣ�� " + this.getClass().getSuperclass());
		System.out.println("======����ͷ��͵���Ϣ�� " + this.getClass().getGenericSuperclass());
		
		//ͨ�������ȡ��
		ParameterizedType type = (ParameterizedType) this.getClass().getGenericSuperclass();
		//��ȡ��һ��������class(����Class��)->����Supplier.class
		Class clazz = (Class) type.getActualTypeArguments()[0]; 
		System.out.println("======class: "  + clazz);
		//ת��Ϊ����������ص�Mapper�������������Supplier->supplierMapper
		String localField 
			= clazz.getSimpleName().substring(0,1).toLowerCase() 
				+ clazz.getSimpleName().substring(1) + "Mapper";
		System.out.println("=====localField:" + localField);
		
		//getDeclaredField:ʹ�ð���˽�С�Ĭ�ϡ��ܱ����������ֶΡ����������̳е��ֶ�
		//�õ��ֶ����Ӧ�Ķ���
		Field field = this.getClass().getSuperclass().getDeclaredField(localField);
		System.out.println("======field:" + field);
		System.out.println("======field ��Ӧ�Ķ���" + field.get(this));
		//���baseField�ֶ��ж�ӦbaseMapper���ֶΣ�����get(this)ȡ�������(ʵ����)
		Field baseField = this.getClass().getSuperclass().getDeclaredField("baseMapper");
		System.out.println("======baseField:" + baseField);
		System.out.println("======baseField��Ӧ�Ķ���" + baseField.get(this));
		/**
		 * field.get(this):��ȡ��ǰthis��field�ֶε�ֵ�����磺
		 * Supplier�����У�baseMapper��ָ��Ķ���Ϊ��������SupplierMapper����
		 * �����Ͷ����ѱ�springʵ������������.
		 * ��field�ֶζ�Ӧ�Ķ���������baseField��Ӧ�Ķ��󴢴�λ����
		 */
		baseField.set(this, field.get(this));//�����baseMapper�����Ѿ����������ֵ
		System.out.println("=======baseField��Ӧ�Ķ���" + baseMapper);
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
