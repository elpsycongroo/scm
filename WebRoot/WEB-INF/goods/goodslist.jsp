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
			idField : 'goodsId',
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
					parent.$('#win').window({
						width : 600,
						height : 400,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/goods/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"
					});
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
					//获取选中的记录
					var array = $("#dg").datagrid("getSelections");
					//alert(array);
					//判断是否选中
					if (array.length > 0) {
						//定义数组，通过下边的用来存储选中记录的Id
						var ids = new Array();
						for (i = 0; i < array.length; i++) {
							ids[i] = array[i].goodsId;
						//alert(ids[i]);
						}
						//alert("ids" + ids);
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
							if (r) {
								$.ajax({
									url : "${proPath}/goods/deleteList.action",
									type : "POST",
									//设置为传统方式传送参数 不加的会传pks[]
									traditional : true,
									data : {
										pks : ids
									},
									success : function(html) {
										//重新刷新页面
										$("#dg").datagrid("reload");
										//请除所有勾选的行 否则IDFILED属性依旧会记录曾经勾选过的值
										$("#dg").datagrid("clearSelections");
									},
									error : function(XMLHttpRequest, textStatus, errorThrown) {
										$.messager.alert('删除错误', '请联系管理员！', 'error');
									},
									dataType : 'json'
								});
							}
						});

					} else {
						$.messager.show({
							title : '操作提示',
							msg : '请先选择要删除的记录。',
							timeout : 4000,
							showType : 'slide'
						});
					}
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