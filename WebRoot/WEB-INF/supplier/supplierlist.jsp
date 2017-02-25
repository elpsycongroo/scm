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


<script>
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
					field : 'supid',
					title : '编号',
					width : 100
				},
				{
					field : 'supname',
					title : '供应商名称',
					width : 100
				},
				{
					field : 'suplinkman',
					title : '联系人',
					width : 100,
					align : 'right'
				},
				{
					field : 'supphone',
					title : '电话',
					width : 100
				},
				{
					field : 'supaddress',
					title : '地址',
					width : 100
				},
				{
					field : 'supremark',
					title : '备注',
					width : 100
				},
				{
					field : 'suppay',
					title : '期初应付',
					width : 100
				},
				{
					field : 'suptype',
					title : '类型',
					width : 100
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