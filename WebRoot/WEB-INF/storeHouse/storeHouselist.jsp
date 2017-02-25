<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>
<style type="text/css">
.searchbox {
	margin: -2;
}
</style>
<title></title>
<script type="text/javascript">
	$(function() {
		$('#dg').datagrid({
			url : '#',
			fitColumns : true,
			nowrap : true,
			//idField
			pagination : true,
			rownumbers : true,
			pageSize : 5,
			pageList : [ 3, 5, 10 ],
			//queryParams:{},
			toolbar : [ {
				iconCls : 'icon-edit',
				text : '新增',
				handler : function() {
					alert('编辑按钮')
				}
			}, '-', {
				iconCls : 'icon-edit',
				text : '修改',
				handler : function() {
					alert('修改按钮')
				}
			}, '-', {
				iconCls : 'icon-remove',
				text : '删除',
				handler : function() {
					alert('删除按钮')
				}
			}, '-', {
				text : "<input type='text' id='ss' name='keyWord'/>"
			} ],

			columns : [ [
				{
					checkbox : true
				},
				{
					field : 'shid',
					title : '仓库编号',
					width : 100
				},
				{
					field : 'shname',
					title : '仓库名称',
					width : 100
				},
				{
					field : 'shresponsible',
					title : '责任人',
					width : 100,
				},
				{
					field : 'shphone',
					title : '联系电话',
					width : 100,
				},
				{
					field : 'shaddress',
					title : '联系地址',
					width : 100,
				},
				{
					field : 'shtype',
					title : '仓库类型',
					width : 100,
				},
				{
					field : 'shremark',
					title : '备注',
					width : 100,
				}
			] ]
		});
		//搜索框
		$('#ss').searchbox({
			searcher : function(value, name) {
				alert(value + "," + name)
			},
			prompt : '输入要搜索的供应商名称'
		});
	});
</script>

</head>

<body>
	<table id="dg"></table>
</body>
</html>