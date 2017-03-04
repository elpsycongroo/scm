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
	
		var win = parent.$("iframe[title='商品采购']").get(0).contentWindow; //返回iframe页面文档（window)
	
		$('#dg').datagrid({
			
			url : '${proPath}/supplier/selectPageUseDyc.action', //多条件查询
			fitColumns : true,
			nowrap : true,
			idField : 'supId', //记录跨页的ID选中情况
			pagination : true,
			rownumbers : true,
			singleSelect : true,
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
				iconCls : 'icon-ok',
				text : '选择供应商',
				handler : function() {
					//alert('新增按钮'),
					var row = $("#dg").datagrid("getSelected");
					win.$("#ff").form('load',{
						supId : row.supId,
						supName : row.supName
					});
					parent.$("#win").window("close");
				}
			},'-',
				{
					text : "供应商名称：<input type='text' id='supName' name='supName' style='width:100'/>"
				}, '-', {
					text : "联系人：<input type='text' id='supLinkman' name='supLinkman' style='width:100'/>"
				}, '-', {
					text : "电话：<input type='text' id='supPhone' name='supPhone' style='width:100'/>"
				} ],

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
					width : 100,
					formatter : function(value,row,index){
						var str = "${applicationScope.sysParam.supType}";
						return valueToText(str,value);
					}
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