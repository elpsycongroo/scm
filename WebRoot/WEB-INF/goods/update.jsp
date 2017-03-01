<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>My JSP</title>
</head>
<body>
	<form id="ff" method="post">
		<div>
			<label for="goodsId">商品编号:</label> <input type="text" name="goodsId" />
		</div>
		<div>
			<label for="goodsName">商品名称:</label> <input type="text" name="goodsName" />
		</div>
		<div>
			<label for="goodsUnit">单位:</label> <input type="text"
				name="goodsUnit" />
		</div>
		<div>
			<label for="goodsType">商品类型:</label> <input type="text"
				name="goodsType"/>
		</div>
		<div>
			<label for="goodsColor">商品颜色：</label> <select id="cc"
				class="easyui-combobox" name="goodsColor" style="width:200px;">
				<c:forEach items="${applicationScope.sysParam.goodsColor}"
					var="goodsColor">
					<option value="${goodsColor.key}">${goodsColor.value}</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label for="goodsStore">库存下限:</label> <input type="text"
				name="goodsStore" />
		</div>
		<div>
			<label for="goodsLimit">期初应付:</label> <input type="text" name="goodsLimit"/>
		</div>
		<div>
			<label for="goodsCommission">提成:</label> <input type="text"
				name="goodsCommission" />
		</div>
		<div>
			<label for="goodsProducer">生产商:</label> <input type="text"
				name="goodsProducer"/>
		</div>
		<div>
			<label for="goodsSelPrice">售价:</label> <input type="text"
				name="goodsSelPrice" />
		</div>
		<div>
			<label for="goodsBuyPrice">进价:</label> <input type="text"
				name="goodsBuyPrice" />
		</div>
		
		<div>
			<label for="goodsRemark">备注:</label>
			<textarea name="goodsRemark"></textarea>
		</div>
		<div>
			<input id="btn" type="button" value="提交" />
		</div>
	</form>
	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='商品管理']").get(0).contentWindow; //返回iframe页面文档（window)	
			//拿到被选行
			var row = win.$('#dg').datagrid("getSelected");
			$('#ff').form('load', {
				goodsId : row.goodsId,
				goodsName: row.goodsName,
				goodsUnit : row.goodsUnit,
				goodsType : row.goodsType,
				goodsColor : row.goodsColor,
				goodsStore : row.goodsStore,
				goodsLimit : row.goodsLimit,
				goodsCommission : row.goodsCommission,
				goodsProducer : row.goodsProducer,
				goodsRemark : row.goodsRemark,
				goodsSelPrice : row.goodsSelPrice,
				goodsBuyPrice : row.goodsBuyPrice
			});	
			$("[name='goodsName']").validatebox({
				required : true,
				missingMessage : '请填写商品名称！'
			});
			//禁用验证
			$("#ff").form("disableValidation");
			$("#btn").click(function() {
				//准备验证
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					//alert("------------");
					$('#ff').form('submit', {
						url : '${proPath}/goods/update.action',
						onSubmit : function() {
							return true;
						},
						success : function(msg) {
							//可以定义为对应消息框
							if (msg == "success") {
								alert("修改成功");
							} else {
								alert("修改失败")
							}
							parent.$("#win").window("close");
							win.$("#dg").datagrid("reload");
						}
					});
				}
			});
		});
	</script>
</body>
</html>
