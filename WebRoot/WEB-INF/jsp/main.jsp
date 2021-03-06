<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/common/common.jspf"%>
<html>
<head>
<script type="text/javascript">
	$(function() {
		$("a[title]").click(function() {
			var text = this.href;
			//判断是否存在选项卡
			if ($('#tt').tabs("exists", this.title)) {
				//存在即选中 面板有关闭按键
				$('#tt').tabs("select", this.title);
			} else {
				$('#tt').tabs('add', {
					title : this.title,
					closable : true,
					content : "<iframe src='" + text + "' title='" + this.title + "' height='100%' width='100%' frameborder='0px' ></iframe>"
				});
			}
			//不能打开超链接
			return false;
		});
	});
</script>

</head>
<body class="easyui-layout">
	<!-- 头部 -->
	<div data-options="region:'north',title:'欢迎使用进销存管理系统',split:true"
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
						href="${proPath}/base/goURL/goods/goodslist.action" title="商品管理"
						style="text-decoration: none;display: block;font-weight:bold;">商品管理</a>
					</li>
					<li style="padding: 6px;"><a
						href="${proPath}/base/goURL/storeHouse/storeHouselist.action"
						title="仓库管理"
						style="text-decoration: none;display: block;font-weight:bold;">仓库管理</a>
					</li>
				</ul>
			</div>
			<div title="进货管理">
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<!--href="${proPath}/base/goURL/supplier/supplierlist.action" 也是传给方法的参数，详见BaseAction的定义 -->
					<li style="padding: 6px;"><a
						href="${proPath}/base/goURL/buyorder/insert.action" title="商品采购"
						style="text-decoration: none;display: block;font-weight:bold;">商品采购</a>
					</li>
					<li style="padding: 6px;"><a
						href="${proPath}/base/goURL/buyorder/insert.action" title="商品退货"
						style="text-decoration: none;display: block;font-weight:bold;">商品退货(末实现)</a>
					</li>
				</ul>
			</div>
			<div title="报表查询">
				<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
				<ul style="list-style: none;padding: 0px;margin:0px;">
					<li style="padding: 6px;"><a
						href="${proPath}/base/goURL/datareport/selectsupplier.action"
						title="供应商采购额统计"
						style="text-decoration: none;display: block;font-weight:bold;">供应商采购额统计</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 主要内容 -->
	<div data-options="region:'center',title:'主要信息'">
		<div id="tt" class="easyui-tabs" data-options="fit:true"
			style="width:500px;height:250px;">
			<div title="系统介绍" style="padding:20px;">这里可以写系统或公司的相关介绍等等</div>
		</div>
	</div>
	<!-- 作为父窗口弹出备用 -->
	<div id="win"></div>
</body>
</html>

