<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>栏目管理</title>
	<meta name="decorator" content="adminlte"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#treeTable").treeTable({expandLevel : 3});
		});
    	function updateSort() {
			loading('正在提交，请稍等...');
	    	$("#listForm").attr("action", "${ctx}/cms/category/updateSort");
	    	$("#listForm").submit();
    	}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/category/">栏目列表</a></li>
		<shiro:hasPermission name="cms:category:edit"><li><a href="${ctx}/cms/category/form">栏目添加</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<form id="listForm" method="post">
		<table id="treeTable" class="table table-bordered table-striped table-hover dataTable no-footer">
			<tr><th class="text-center">栏目名称</th><th class="text-center">归属机构</th><th class="text-center">栏目模型</th><th style="text-align:center;">排序</th><th title="是否在导航中显示该栏目" class="text-center">导航菜单</th><th title="是否在分类页中显示该栏目的文章列表" class="text-center">栏目列表</th><th class="text-center">展现方式</th><th class="text-center">操作</th></tr>
			<c:forEach items="${list}" var="tpl">
				<tr id="${tpl.id}" pId="${tpl.parent.id ne '1'?tpl.parent.id:'0'}">
					<td class="text-center"><a href="${ctx}/cms/category/form?id=${tpl.id}">${tpl.name}</a></td>
					<td class="text-center">${tpl.office.name}</td>
					<td class="text-center">${fns:getDictLabel(tpl.module, 'cms_module', '公共模型')}</td>
					<td style="text-align:center;">
						<shiro:hasPermission name="cms:category:edit">
							<input type="hidden" name="ids" value="${tpl.id}"/>
							<input name="sorts" type="text" value="${tpl.sort}" style="width:50px;margin:0;padding:0;text-align:center;">
						</shiro:hasPermission><shiro:lacksPermission name="cms:category:edit">
							${tpl.sort}
						</shiro:lacksPermission>
					</td>
					<td class="text-center">${fns:getDictLabel(tpl.inMenu, 'show_hide', '隐藏')}</td>
					<td class="text-center">${fns:getDictLabel(tpl.inList, 'show_hide', '隐藏')}</td>
					<td class="text-center">${fns:getDictLabel(tpl.showModes, 'cms_show_modes', '默认展现方式')}</td>
					<td class="text-center">
						<a href="${pageContext.request.contextPath}${fns:getFrontPath()}/list-${tpl.id}${fns:getUrlSuffix()}" target="_blank" class="btn btn-info btn-sm">访问</a>
						<shiro:hasPermission name="cms:category:edit">
							<a href="${ctx}/cms/category/form?id=${tpl.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
							<a href="${ctx}/cms/category/delete?id=${tpl.id}" onclick="return confirmx('要删除该栏目及所有子栏目项吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
							<a href="${ctx}/cms/category/form?parent.id=${tpl.id}" class="btn btn-info btn-sm"><i class="fa fa-plus">&nbsp;添加下级栏目</i></a>
						</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div class=" box-footer">
			<label class="col-sm-4 control-label"></label>
			<shiro:hasPermission name="cms:category:edit">
			<input id="btnSubmit" class="btn btn-primary" type="button" value="保存排序" onclick="updateSort();"/>
			</shiro:hasPermission>
		</div>
	</form>
</body>
</html>