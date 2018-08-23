<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>站点管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/cms/site/">站点列表</a></li>
		<shiro:hasPermission name="cms:site:edit">
			<li><a href="${ctx}/cms/site/form">站点添加</a></li>
		</shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl; padding: 0px">
		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">
					<form:form id="searchForm" modelAttribute="site" action="${ctx}/cms/site/" method="post" class="form-horizontal">
						<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
						<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}" />
						<div class="box-body">
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label">名称：</label>
									<div class="col-sm-8">
										<form:input path="name" htmlEscape="false" maxlength="50" class="form-control" />
					                </div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<label class="col-sm-4 control-label">状态：</label>
									<div class="col-sm-8 control-label" id="control-label-left">
										<form:radiobuttons onclick="$('#searchForm').submit();"
											path="delFlag" items="${fns:getDictList('del_flag')}"
											itemLabel="label" itemValue="value" htmlEscape="false" />
					                </div>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group">
									<div class="col-sm-8">
										<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询" />&nbsp;&nbsp;
					                </div>
								</div>
							</div>							
						</div>
					</form:form>
					<sys:message content="${message}" />
					<table id="contentTable"
						class="table table-bordered table-striped table-hover dataTable no-footer">
						<thead>
							<tr>
								<th class="text-center">名称</th>
								<th class="text-center">标题</th>
								<th class="text-center">描述</th>
								<th class="text-center">关键字</th>
								<th class="text-center">主题</th>
								<shiro:hasPermission name="cms:site:edit">
									<th class="text-center">操作</th>
								</shiro:hasPermission>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.list}" var="site">
								<tr>
									<td class="text-center"><a href="${ctx}/cms/site/form?id=${site.id}"
										title="${site.name}">${fns:abbr(site.name,40)}</a></td>
									<td class="text-center">${fns:abbr(site.title,40)}</td>
									<td class="text-center">${fns:abbr(site.description,40)}</td>
									<td class="text-center">${fns:abbr(site.keywords,40)}</td>
									<td class="text-center">${site.theme}</td>
									<shiro:hasPermission name="cms:site:edit">
										<td class="text-center"><a href="${ctx}/cms/site/form?id=${site.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a> <a
											href="${ctx}/cms/site/delete?id=${site.id}${site.delFlag ne 0?'&isRe=true':''}"
											onclick="return confirmx('确认要${site.delFlag ne 0?'恢复':''}删除该站点吗？', this.href)" class="btn btn-warning btn-sm">${site.delFlag ne 0?'恢复':''}删除</a>
										</td>
									</shiro:hasPermission>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					${page}
				</div>
			</div>
		</div>
	</section>
</body>
</html>