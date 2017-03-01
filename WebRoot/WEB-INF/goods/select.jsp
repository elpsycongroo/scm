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
	
		var win = parent.$("iframe[title='商品采购']").get(0).contentWindow; //返回iframe页面文档（window)	
	
		$('#dg').datagrid({
			url : '${proPath}/goods/selectPageUseDyc.action',
			fitColumns : true,
			nowrap : true,
			idField : 'goodsId',
			pagination : true,
			rownumbers : true,
			singleSelect : true,//单选
			pageSize : 5,
			pageList : [ 3, 5, 10 ],
			queryParams : {
				goodsName : "%%",
				goodsColor : "%%"
			},
			toolbar : [ {
				iconCls : 'icon-save',
				text : '保存',
				handler : function() {
					alert("保存按钮");
					var row = $("#dg").datagrid("getSelected");
					if(row == null){
						$.messager.alert('修改错误', '请选择需要采购的商品', 'error');
						return false;
					}
					alert($("#bodBuyPrice").val());
					win.$("#dg").datagrid('appendRow',{
						goodsId : row.goodsId,
						goodsName : row.goodsName,
						bodBuyPrice : $("#bodBuyPrice").val(),
						goodsUnit : row.goodsUnit,
						goodsType : row.goodsType,
						goodsColor : row.goodsColor,
						bodAmount : $("#bodAmount").val(),
						bodTotalPrice : $("#bodAmount").val() * $("#bodBuyPrice").val(),
						bodImeiList : $("bodImeiList").val()
						
					});
					//关闭窗体
					parent.$("#win").window("close");
					/*parent.$('#win').window({
						width : 600,
						height : 400,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/goods/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"
					});*/
				}
			}],

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
					//关于颜色下拉框转换
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
	});
</script>

</head>

<body style="margin:0px">
	<table id="dg"></table>
	<form action="">
		数量：<input type="text" id="bodAmount" name="bodAmount"><br>
		进价：<input type="text" id="bodBuyPrice" name="bodBuyPrice"><br>
		手机串号：<textarea id="bodImeiList" name="bodImeiList"></textarea>
	</form>
	
</body>
</html>