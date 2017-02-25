<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>
<script type="text/javascript">
	$(function() {
		$("a[title]").click(function() {
			var text = this.title;
			alert(text);
			// 添加一个未选中状态的选项卡面板
			$('#tt').tabs('add', {
				title : text
			});
		});
	});
</script>

</head>
<body class="easyui-layout">
	<!-- 头部 -->
	<div data-options="region:'north',title:'North Title',split:true"
		style="height:130px;">欢迎您：${ sessionScope.account.accLogin}</div>
	<!-- 左边导航 -->
	<div data-options="region:'west',title:'导航菜单',split:true"
		style="width:150px;">
		<div id="aa" class="easyui-accordion" data-options="fit:true">
			<div title="基础数据录入">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<!--href="${proPath}/base/goURL/supplier/supplierlist.action" 也是传给方法的参数，详见BaseAction的定义 -->
					<li style="padding: 6px;"><a
						href="${proPath}/base/goURL/supplier/supplierlist.action"
						title="供应商管理"
						style="text-decoration: none;display: block;font-weight:bold;">供应商管理</a>
					</li>
					<li style="padding: 6px;"><a
						href="${proPath}/base/goURL/account/accountlist.action"
						title="商品管理"
						style="text-decoration: none;display: block;font-weight:bold;">商品管理</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 主要内容 -->
	<div data-options="region:'center',title:'主要信息'">
		<div id="tt" class="easyui-tabs" data-options="fit:true"
			style="width:500px;height:250px;">
			<div title="Tab1" style="padding:20px;">tab1</div>
		</div>
	</div>
</body>
</html>

