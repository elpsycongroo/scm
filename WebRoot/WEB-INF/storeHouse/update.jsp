<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<%@ include file="/common/common.jspf"%>
<title>My JSP</title>
</head>
<body>
	<form id="ff" method="post">
		<div>
			<label for="shId">仓库编号:</label> <input type="text" name="shId" />
		</div>
		<div>
			<label for="shName">仓库名称:</label> <input type="text" name="shName" />
		</div>
		<div>
			<label for="shResponsible">责任人:</label> <input type="text"
				name="shResponsible" />
		</div>
		<div>
			<label for="shPhone">联系电话:</label> <input type="text"
				name="shPhone" />
		</div>
		<div>
			<label for="shAddress">联系地址:</label> <input type="text"
				name="shAddress" />
		</div>
		<div>
			<label for="shType">仓库类型:</label> <input type="text" name="shType" />
		</div>
		
		<div>
			<label for="shRemark">备注:</label>
			<textarea name="shRemark"></textarea>
		</div>
		<div>
			<input id="btn" type="button" value="提交" />
		</div>
	</form>
	<script type="text/javascript">
		$(function() {
			var win = parent.$("iframe[title='仓库管理']").get(0).contentWindow; //返回iframe页面文档（window)	
			//拿到被选行
			var row = win.$('#dg').datagrid("getSelected");
			$('#ff').form('load', {
				shId : row.shId,
				shName: row.shName,
				shResponsible : row.shResponsible,
				shPhone : row.shPhone,
				shAddress : row.shAddress,
				shType : row.shType,
				shRemark : row.shRemark
			});	
			$("[name='shName']").validatebox({
				required : true,
				missingMessage : '请填写仓库名称！'
			});
			//禁用验证
			$("#ff").form("disableValidation");
			$("#btn").click(function() {
				//准备验证
				$("#ff").form("enableValidation");
				if ($("#ff").form("validate")) {
					//alert("------------");
					$('#ff').form('submit', {
						url : '${proPath}/storeHouse/update.action',
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
