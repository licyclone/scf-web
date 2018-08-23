<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>主子表管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
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
		<li class="active"><a href="${ctx}/test/testDataMain/">主子表列表</a></li>
		<shiro:hasPermission name="test:testDataMain:edit"><li><a href="${ctx}/test/testDataMain/form">主子表添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<form:form id="searchForm" modelAttribute="testDataMain" action="${ctx}/test/testDataMain/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="box-body">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">归属用户：</label>
								<div class="col-sm-8">
									<sys:treeselect id="user" name="user.id" value="${testDataMain.user.id}" labelName="user.name" labelValue="${testDataMain.user.name}"
										title="用户" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">名称：</label>
								<div class="col-sm-8">
									<form:input path="name" htmlEscape="false" maxlength="100" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">性别：</label>
								<div class="col-sm-8">
									<form:select path="sex" class="form-control">
										<form:option value="" label=""/>
										<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</div>
							</div>
						</div>
						<div class="col-md-12 col-md-offset-5"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></div>
					</div>
				</form:form>
				<sys:message content="${message}"/>
				<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
					<thead>
						<tr>
							<th class="text-center">归属用户</th>
							<th class="text-center">名称</th>
							<th class="text-center">更新时间</th>
							<th class="text-center">备注信息</th>
							<shiro:hasPermission name="test:testDataMain:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="testDataMain">
						<tr>
							<td class="text-center"><a href="${ctx}/test/testDataMain/form?id=${testDataMain.id}">
								${testDataMain.user.name}
							</a></td>
							<td class="text-center">
								${testDataMain.name}
							</td>
							<td class="text-center">
								<fmt:formatDate value="${testDataMain.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
							</td>
							<td class="text-center">
								${testDataMain.remarks}
							</td>
							<shiro:hasPermission name="test:testDataMain:edit"><td>
			    				<a href="${ctx}/test/testDataMain/form?id=${testDataMain.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
								<a href="${ctx}/test/testDataMain/delete?id=${testDataMain.id}" onclick="return confirmx('确认要删除该主子表吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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