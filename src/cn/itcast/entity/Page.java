package cn.itcast.entity;

import java.io.Serializable;
import java.util.List;

public class Page<T> implements Serializable {

	private static final long serialVersionUID = 2325635811439704010L;
	
	private Integer page;//当前页
	private Integer rows;//每页行数
	private Integer totalRecord;//总记录数
	private List<T> list;//记录列表
	private String keyWord;//关键字
	//多条件查询
	private T paramEntity;//多条件查询
	private Integer start;//开始记录数 需要计算
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Integer getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(Integer totalRecord) {
		this.totalRecord = totalRecord;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public T getParamEntity() {
		return paramEntity;
	}
	public void setParamEntity(T paramEntity) {
		this.paramEntity = paramEntity;
	}
	public Integer getStart() {
		this.start = (page-1)*rows;
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	@Override
	public String toString() {
		return "Page [page=" + page + ", rows=" + rows + ", totalRecord=" + totalRecord
				+ ", list=" + list + ", keyWord=" + keyWord + ", start=" + start + "]";
	}
	
}
