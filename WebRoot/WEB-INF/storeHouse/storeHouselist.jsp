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
					parent.$('#win').window({
						width : 600,
						height : 400,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/storeHouse/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"
					});
				}
			}, '-', {
				iconCls : 'icon-edit',
				text : '修改',
				handler : function() {
					//判断是否选中一行，并且只能选中一行进行修改
					var array = $("#dg").datagrid("getSelections");
					if(array.length != 1){
						$.messager.alert('修改错误', '选中修改的记录有且只能选中一条', 'error');
						return false;
					}
					//弹出修改窗体
					parent.$('#win').window({
						title : '修改商品',
						width : 600,
						height : 400,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/storeHouse/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"
					});
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
							ids[i] = array[i].shId;
						//alert(ids[i]);
						}
						//alert("ids" + ids);
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
							if (r) {
								$.ajax({
									url : "${proPath}/storeHouse/deleteList.action",
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