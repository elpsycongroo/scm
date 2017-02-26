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
			url : '${proPath}/storeHouse/selectPageUseDyc.action',
			fitColumns : true,
			nowrap : true,
			//idField
			pagination : true,
			rownumbers : true,
			pageSize : 5,
			pageList : [ 3, 5, 10 ],
			queryParams:{
				shName:'%%',
				shAddress:'%%'
			},
			toolbar : [ {
				iconCls : 'icon-add',
				text : '新增',
				handler : function() {
					alert('新增按钮')
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
				text : "仓库名称：<input type='text' id='shName' name='shName'/>"
			}, '-', {
				text : "联系地址：<input type='text' id='shAddress' name='shAddress'/>"
			} ],

			columns : [ [
				{
					checkbox : true
				},
				{
					field : 'shId',
					title : '仓库编号',
					width : 100
				},
				{
					field : 'shName',
					title : '仓库名称',
					width : 100
				},
				{
					field : 'shResponsible',
					title : '责任人',
					width : 100,
				},
				{
					field : 'shPhone',
					title : '联系电话',
					width : 100,
				},
				{
					field : 'shAddress',
					title : '联系地址',
					width : 100,
				},
				{
					field : 'shType',
					title : '仓库类型',
					width : 100,
				},
				{
					field : 'shRemark',
					title : '备注',
					width : 100,
				}
			] ]
		});
		//搜索框
		$('#shAddress').searchbox({
			searcher : function(value, name) {
				$('#dg').datagrid('load', {
					shName : '%' + $('#shName').val() + '%',
					shAddress : '%' + value + '%',
				});
			},
			prompt : '输入后点击搜索→'
		});
	});
</script>

</head>

<body>
	<table id="dg"></table>
</body>
</html>