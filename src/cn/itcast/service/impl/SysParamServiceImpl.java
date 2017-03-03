package cn.itcast.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import cn.itcast.entity.SysParam;
import cn.itcast.service.SysParamService;

@Service("sysParamService")
public class SysParamServiceImpl extends BaseServiceImpl<SysParam> implements SysParamService {

	
	
	@Override
	public Map<String, Object> selectList() {
		List<SysParam> sysParams = sysParamMapper.selectList("");
		//ϵͳ����map ������������ֶε���ز�����Ϣ
		Map<String, Object> sysParamMap = new HashMap<String, Object>();
		Map<String, Object> fieldMap = null;
		
		for(SysParam sp : sysParams) {
			//��ȡҪִ�е�sql ������ѯ������
			if("1".equals(sp.getSysParamType())){
				//ͨ���ֿ�mapper�����ֿ������б�
				//�ٰѲֿ��б�������вֿ�id�Ͳֿ�����
				String sql = sp.getSysParamValue();
				System.out.println("============="+sql);
				//ִ�в�ѯ ���ѽ������list�У�Ԫ��Ϊϵͳ�������͵�ʵ��
				List<SysParam> otherList = sysParamMapper.selectOtherTable(sql);
				fieldMap = new HashMap<String, Object>();
				for(SysParam otherSysParam : otherList){
					fieldMap.put(otherSysParam.getSysParamValue(), otherSysParam.getSysParamText());
				}
				//otherSysParam��ֻ��test��value�ֶ� ȱ��fieldֵ
				sysParamMap.put(sp.getSysParamField(),fieldMap);
			}else{
				//�Ӵ��ϵͳ������map��ȡ�ֶε�map
				if(sysParamMap.get(sp.getSysParamField())==null){
					fieldMap = new HashMap<String, Object>();
					//û�д洢�� �洢
					fieldMap.put(sp.getSysParamValue(),sp.getSysParamText());
					sysParamMap.put(sp.getSysParamField(), fieldMap);
				}else{
					//�Ѿ��д洢
					fieldMap = (Map<String, Object>) sysParamMap.get(sp.getSysParamField());
					fieldMap.put(sp.getSysParamValue(), sp.getSysParamText());
				}
			}
		}
		return sysParamMap;
	}
	

}
