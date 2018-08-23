<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>留言管理</title>
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
		<li class="active"><a href="${ctx}/cms/guestbook/">留言列表</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
			<form:form id="searchForm" modelAttribute="guestbook" action="${ctx}/cms/guestbook/" method="post" class="form-horizontal">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<div class="box-body">
					<div class="col-md-4">
						<div class="form-group">
							<label class="col-sm-4 control-label">分类：</label>
							<div class="col-sm-8">
								<form:select id="type" path="type" class="form-control">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('cms_guestbook')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
								</form:select>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label  class="col-sm-4 control-label">内容 ：</label>
							<div class="col-sm-8">
								<input  name="content" class="form-control required" type="text" value="" maxlength="100"/>
							</div>
						</div>	
					</div>	
					<div class="col-md-4">
						<div class="form-group">
							<label class="col-sm-4 control-label">状态 ：</label>
							<div class="col-sm-8 control-label">
								<form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" />
							</div>
						</div>
					</div>	
					<div class="col-md-12 col-md-offset-5">
			        	<button id="btnSubmit" type="submit" class="btn btn-primary" data-btn-type="search">查询</button>
			        </div>
				</div>
			</form:form>
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
				<thead><tr><th class="text-center">留言分类</th><th class="text-center">留言内容</th><th class="text-center">留言人</th><th class="text-center">留言时间</th><th class="text-center">回复人</th><th class="text-center">回复内容</th><th class="text-center">回复时间</th><shiro:hasPermission name="cms:guestbook:edit"><th class="text-center">操作</th></shiro:hasPermission></tr></thead>
				<tbody>
				<c:forEach items="${page.list}" var="guestbook">
					<tr>
						<td class="text-center">${fns:getDictLabel(guestbook.type, 'cms_guestbook', '无分类')}</td>
						<td class="text-center"><a href="${ctx}/cms/guestbook/form?id=${guestbook.id}">${fns:abbr(guestbook.content,40)}</a></td>
						<td class="text-center">${guestbook.name}</td>
						<td class="text-center"><fmt:formatDate value="${guestbook.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td class="text-center">${guestbook.reUser.name}</td>
						<td class="text-center">${fns:abbr(guestbook.reContent,40)}</td>
						<td class="text-center"><fmt:formatDate value="${guestbook.reDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<shiro:hasPermission name="cms:guestbook:edit"><td class="text-center">
							<c:if test="${guestbook.delFlag ne '2'}"><a href="${ctx}/cms/guestbook/delete?id=${guestbook.id}${guestbook.delFlag ne 0?'&isRe=true':''}" 
								onclick="return confirmx('确认要${guestbook.delFlag ne 0?'恢复审核':'删除'}该留言吗？', this.href)" class="btn btn-warning btn-sm">${guestbook.delFlag ne 0?'恢复审核':'删除'}</a></c:if>
							<c:if test="${guestbook.delFlag eq '2'}"><a href="${ctx}/cms/guestbook/form?id=${guestbook.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;审核</i></span></a></c:if>
						</td></shiro:hasPermission>
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