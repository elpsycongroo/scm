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
			idField : 'supId', //记录跨页的ID选中情况
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
					alert('新增按钮'),
					parent.$('#win').window({
						title : '新增供应商',
						width : 600,
						height : 400,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/supplier/insert.action' height='100%' width='100%' frameborder='0px' ></iframe>"
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
						title : '修改供应商',
						width : 600,
						height : 400,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/supplier/update.action' height='100%' width='100%' frameborder='0px' ></iframe>"
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
							ids[i] = array[i].supId;
						//alert(ids[i]);
						}
						//alert("ids" + ids);
						//如果需要锁整个页面，前面加parent.
						parent.$.messager.confirm('删除对话框', '您确认要删除吗？', function(r) {
							if (r) {
								$.ajax({
									url : "${proPath}/supplier/deleteList.action",
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
			}, '-',
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