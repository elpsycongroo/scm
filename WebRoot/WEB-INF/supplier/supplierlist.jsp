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
			//url : '${proPath}/supplier/selectPage.action',//关键字查询
			url : '${proPath}/supplier/selectPageUseDyc.action', //多条件查询
			fitColumns : true,
			nowrap : true,
			//idField
			pagination : true,
			rownumbers : true,
			pageSize : 5,
			pageList : [ 3, 5, 10 ],
			queryParams : {
				//keyWord : '%%'
				//supId : '',
				supName : '%%',
				supLinkman : '%%',
				supPhone : '%%',
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
				text : "供应商名称：<input type='text' id='supName' name='supName' style='width:100'/>"
			}, '-', {
				text : "联系人：<input type='text' id='supLinkman' name='supLinkman' style='width:100'/>"
			}, '-', {
				text : "电话：<input type='text' id='supPhone' name='supPhone' style='width:100'/>"
			}],

			columns : [ [
				{
					checkbox : true
				},
				{
					field : 'supId',
					title : '供应商编号',
					width : 100
				},
				{
					field : 'supName',
					title : '供应商名称',
					width : 100
				},
				{
					field : 'supLinkman',
					title : '联系人',
					width : 100,
					align : 'right'
				},
				{
					field : 'supPhone',
					title : '电话',
					width : 100
				},
				{
					field : 'supAddress',
					title : '地址',
					width : 100
				},
				{
					field : 'supRemark',
					title : '备注',
					width : 100
				},
				{
					field : 'supPay',
					title : '期初应付',
					width : 100
				},
				{
					field : 'supType',
					title : '类型',
					width : 100
				}
			] ]
		});
		//搜索框
		$('#supPhone').searchbox({
			searcher : function(value, name) {
				$('#dg').datagrid('load', {
					supName : '%' + $('#supName').val() + '%',
					supLinkman : '%' + $('#supLinkman').val() + '%',
					supPhone : '%' + value + '%',
				});
			},
			prompt : '搜索...'
		});
		console.log($('#supId'));
	});
</script>

</head>

<body>
	<table id="dg"></table>
</body>
</html>