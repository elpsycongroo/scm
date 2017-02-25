<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>
<title></title>
<style type="text/css">
.searchbox {
	margin: -2;
}
</style>



<script>
	$(function() {
		$('#dg').datagrid({
			url : '${proPath}/datagrid_data1.json',
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
					field : 'productid',
					title : '产品编号',
					width : 100
				},
				{
					field : 'productname',
					title : '产品名称',
					width : 100
				},
				{
					field : 'listprice',
					title : '价格',
					width : 100,
					align : 'right'
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