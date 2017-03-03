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
		$("#ff").form("disableValidation");
		$('#dg').datagrid({
			//url : '${proPath}/goods/selectPageUseDyc.action',
			fitColumns : true,
			nowrap : true,
			idField : 'goodsId',
			
			toolbar : [ {
				iconCls : 'icon-add',
				text : '选择商品',
				handler : function() {
					alert("选择商品");
					//打开选择商品页面
					parent.$('#win').window({
						title : '选择采购商品',
						width : 600,
						height : 400,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/goods/select.action' height='100%' width='100%' frameborder='0px' ></iframe>"
					});
				}
			}, '-', {
				iconCls : 'icon-remove',
				text : '删除商品',
				handler : function() {
					alert("删除商品");
					//判断是否选中
					var array = $("#dg").datagrid("getSelections");
					if(array.length > 0){
						for(var i = array.length-1; i >= 0; i --){
							var index = $("#dg").datagrid("getRowIndex",array[i].goodsId);
							$("#dg").datagrid("deleteRow",index);
						}
					}else{
						$.messager.alert('提示','请至少选择一条记录！','info');						
					}
				}
			}, '-', {
				iconCls : 'icon-ok',
				text : '提交采购',
				handler : function() {
					alert("提交采购");
					$("#ff").form("enableValidation");
					var data = $("#dg").datagrid("getData");
					console.info(data);
					console.info(data.rows);
					if(data.rows.length == 0){
						$.messager.alert('提示','请至少选择一条采购信息！','info');
						return false;
					}
					
					//对象转换成json
					var rows = JSON.stringify(data.rows);
					console.info(rows);
					
					//提交采购到服务端
					
					 
						$('#ff').form('submit', {    
    						url:'${proPath}/buyOrder/insert.action',    
   				 			onSubmit: function(param){    
        						param.rows = rows;
        						return $('#boDate').form("validate");
    						},
    						success : function(data){
    							alert(data);
    						}    
						});
					 			
				}
			} ],

			columns : [ [
				{
					checkbox : true
				},
				{
					field : 'bodId',
					title : '商品编号',
					width : 100
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
					//关于颜色下拉框转换
					width : 100,
					align : 'right'
				},
				{
					field : 'bodAmount',
					title : '数量',
					width : 100,
					align : 'right'
				},
				{
					field : 'bodBuyPrice',
					title : '进价',
					width : 100,
					align : 'right'
				},
				{
					field : 'bodTotalPrice',
					title : '合计',
					width : 100,
					align : 'right'
				},
				{
					field : 'boId',
					title : '采购单号',
					width : 100,
					align : 'right'
				},
				{
					field : 'bodImeiList',
					title : '串号列表',
					width : 100,
					align : 'right'
				}
			] ]	
		});
		$("#supName").searchbox({
				searcher:function(value,name){
					alert(value + "," + name);
					parent.$("#win").window({
						title : "选择供应商",
						width : 800,
						height : 600,
						modal : true,
						content : "<iframe src='${proPath}/base/goURL/supplier/select.action' height='100%' width='100%' frameborder='0px' />"
					});
				},
				prompt : "请选择供应商"
			});
			//禁用供应商信息的输入
			var box = $('#supName').searchbox('textbox');//获取控件文本框对象
   	    	box.attr('disabled',true);//禁用输入
			//表单禁用验证
   	  		//$("#ff").form("disableValidation");
			$('#boDate').validatebox({
						required : true,
						missingMessage : '请填写日期！'
			});
	});
</script>

</head>

<body>
	<form style="padding:15px;margin:0px;background:#eee;" id="ff"
		action="">
		请填写采购信息：<br> 
		供应商：<input type="hidden" id="supId" name="supId" />
		<input type="text" id="supName" name="supName"/>
		仓库：<select type="text" id="shId" name="shId" >
			<c:forEach items="${applicationScope.sysParam.shId}" var="shId">
				<option value="${shId.key}">${shId.value}</option>
			</c:forEach>
		</select> 
		日期：<input type="text" id="boDate" class="easyui-datebox" name="boDate" required="required"></input>
		应付：<input type="text" id="boPayable" name="boPayable" /><br> 
		已付：<input type="text" id="boPaid" name="boPaid" /> 
		欠款：<input type="text" id="boArrears" name="boArrears" /> 
		原始单号：<input type="text" id="boOriginal" name="boOriginal" /><br> 
		经手人：<input type="text" id="boAttn" name="boAttn" /> 
		操作员：<input type="text" id="boOperator" name="boOperator" /> 
		备注：<input type="text" id="boRemark" name="boRemark" />
	</form>
	<table id="dg"></table>
</body>
</html>