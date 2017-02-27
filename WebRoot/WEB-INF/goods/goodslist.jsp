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
			url : '${proPath}/goods/selectPageUseDyc.action',
			fitColumns : true,
			nowrap : true,
			//idField
			pagination : true,
			rownumbers : true,
			pageSize : 5,
			pageList : [ 3, 5, 10 ],
			queryParams : {
				goodsName : "%%",
				goodsColor : "%%"
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
				text : "产品名称：<input type='text' id='goodsName' name='goodsName'/>"
			}, '-', {
				text : "产品颜色：<input type='text' id='goodsColor' name='goodsColor'/>"
			} ],

			columns : [ [
				{
					checkbox : true
				},
				{
					field : 'goodsId',
					title : '商品编号',
					width : 100
				},
				{
					field : 'goodsName',
					title : '商品名称',
					width : 100
				},
				{
					field : 'goodsUnit',
					title : '单位',
					width : 100,
					align : 'right'
				},
				{
					field : 'goodsType',
					title : '商品类型',
					width : 100,
					align : 'right'
				},
				{
					field : 'goodsColor',
					title : '商品颜色',
					width : 100,
					align : 'right'
				},
				{
					field : 'goodsStore',
					title : '库存下限',
					width : 100,
					align : 'right'
				},
				{
					field : 'goodsLimit',
					title : '有效的修改时间',
					width : 100,
					align : 'right'
				},
				{
					field : 'goodsCommission',
					title : '提成',
					width : 100,
					align : 'right'
				},
				{
					field : 'goodsProducer',
					title : '生产商',
					width : 100,
					align : 'right'
				},
				{
					field : 'goodsRemark',
					title : '备注',
					width : 100,
					align : 'right'
				},
				{
					field : 'goodsSelPrice',
					title : '售价',
					width : 100,
					align : 'right'
				},
				{
					field : 'goodsBuyPrice',
					title : '进价',
					width : 100,
					align : 'right'
				}
			] ]
		});
		//搜索框
		$('#goodsColor').searchbox({
			searcher : function(value, name) {
				$('#dg').datagrid('load', {
					goodsName : '%' + $('#goodsName').val() + '%',
					goodsColor : '%' + value + '%',
				});
			},
			prompt : '点击搜索→'
		});
	});
</script>

</head>

<body>
	<table id="dg"></table>

</body>
</html>