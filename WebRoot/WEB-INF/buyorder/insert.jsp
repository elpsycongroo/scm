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
		//变量用来支持单元格编辑时使用
	    var editIndex = undefined;
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
					align : 'right',
					editor:'numberbox'
				},
				{
					field : 'bodBuyPrice',
					title : '进价',
					width : 100,
					//numberbox数字类型，precision两位精确数
					editor:{type:'numberbox',options:{precision:2}},					
					align : 'right'
				},
				{
					field : 'bodTotalPrice',
					title : '合计',
					width : 100,
					editor:{type:'numberbox',options:{precision:2}},
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
					editor:'textarea',
					align : 'right'
				}
			] ]	,
			onDblClickCell : function(index,field,value){
				//结束编辑行, 可以不用，不会被调用，将在单击事件处理
				if(editIndex != undefined){							
					//alert(" onDblClickCell editIndex != undefined");			
				  $(this).datagrid('endEdit', editIndex);
					editIndex = undefined;
				}
				//alert("dbclick");		
				//设置可编辑行	
				$(this).datagrid('beginEdit', index);
				editIndex = index;
				//alert("dbclick");				
				var ed = $(this).datagrid('getEditor', {index:index,field:field});
				//alert("field||index:"+field+index);	
				//获取光标			
				$(ed.target).focus();
			},
			onClickCell : function(index,field,value){
				//计算总价
				var amount = $(this).datagrid('getEditor', {index:editIndex,field:"bodAmount"});
				var buyPrice=$(this).datagrid('getEditor', {index:editIndex,field:"bodBuyPrice"});
				var bodTotalPrice =$(buyPrice.target).numberbox('getValue')*$(amount.target).numberbox('getValue');
				//alert("bodTotalPrice"+bodTotalPrice);
				var ed = $(this).datagrid('getEditor', {index:editIndex,field:"bodTotalPrice"});
				//alert(" onClickCell editIndex != undefined3");	
				$(ed.target).numberbox('setValue', bodTotalPrice);
				//alert(" onClickCell editIndex != undefined4");	
				
				//结束编辑行
				$(this).datagrid('endEdit', editIndex);
				editIndex = undefined;

			}
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

<body class="mybody">
	<form class="myfm" style="padding:15px;margin:0px;background:#eee;"
		id="ff" action="">
		<div class="myftitle">请填写采购信息</div>
		<div class="myfitem2">
			<label>供应商：</label><input type="hidden" id="supId" name="supId" /> <input
				type="text" id="supName" name="supName" /> 
				<label>仓库：</label><select id="cc"
				class="easyui-combobox" name="shId" style="width:200px;">
				<c:forEach items="${applicationScope.sysParam.shId}" var="shId">
					<option value="${shId.key}">${shId.value}</option>
				</c:forEach>
			</select> 
			<label>日期：</label><input type="text" id="boDate" class="easyui-datebox"
				name="boDate" required="required"></input>
		</div>
		<div class="myfitem2">
			<label>应付：</label><input type="text" id="boPayable" name="boPayable" />
			<label>已付：</label><input type="text" id="boPaid" name="boPaid" /> 
			<label>欠款：</label><input type="text" id="boArrears" name="boArrears" />
		</div>
		<div class="myfitem2">	
			<label> 原始单号：</label><input type="text" id="boOriginal" name="boOriginal" />
			<label>经手人：</label><input type="text" 	id="boAttn" name="boAttn" /> 
			<label>操作员：</label><input type="text" id="boOperator" 	name="boOperator" /> 
		</div>
		<div class="myfitem2">
			<label>备注：</label><input type="text" id="boRemark" name="boRemark" />
		</div>
	</form>

	<table id="dg"></table>
</body>
</html>