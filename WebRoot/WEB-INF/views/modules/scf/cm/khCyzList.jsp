<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户信息列表管理</title>
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
		<li class="active"><a href="${ctx}/scf/cm/khCyz/">客户信息列表列表</a></li>
		<shiro:hasPermission name="scf:cm:khCyz:edit"><li><a href="${ctx}/scf/cm/khCyz/form">客户信息列表添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-primary">
				<form:form id="searchForm" modelAttribute="khCyz" action="${ctx}/scf/cm/khCyz/" method="post" class="form-horizontal">
					<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
					<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
					<div class="box-body">
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">客户名称：</label>
								<div class="col-sm-8">
									<form:input path="khmc" htmlEscape="false" maxlength="100" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">客户类型：</label>
								<div class="col-sm-8">
									<form:select path="khlx" class="form-control">
										<form:option value="" label=""/>
										<form:options items="${fns:getDictList('khlx')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">证件类型：</label>
								<div class="col-sm-8">
									<form:select path="zjlx" class="form-control">
										<form:option value="" label=""/>
										<form:options items="${fns:getDictList('zjlx')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
									</form:select>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">证件号码：</label>
								<div class="col-sm-8">
									<form:input path="zjhm" htmlEscape="false" maxlength="100" class="form-control"/>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="col-sm-4 control-label">状态：</label>
								<div class="col-sm-8">
									<form:select path="zt" class="form-control">
										<form:option value="" label=""/>
										<form:options items="${fns:getDictList('zt')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
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
							<th class="text-center">参与者ID</th>
							<th class="text-center">客户编号</th>
							<th class="text-center">客户名称</th>
							<th class="text-center">客户类型</th>
							<th class="text-center">证件类型</th>
							<th class="text-center">证件号码</th>
							<th class="text-center">状态</th>
							<shiro:hasPermission name="scf:cm:khCyz:edit"><th>操作</th></shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${page.list}" var="khCyz">
						<tr>
							<td class="text-center"><a href="${ctx}/scf/cm/khCyz/form?id=${khCyz.id}">
								${khCyz.id}
							</a></td>
							<td class="text-center">
								${khCyz.khbh}
							</td>
							<td class="text-center">
								${khCyz.khmc}
							</td>
							<td class="text-center">
								${fns:getDictLabel(khCyz.khlx, 'khlx', '')}
							</td>
							<td class="text-center">
								${fns:getDictLabel(khCyz.zjlx, 'zjlx', '')}
							</td>
							<td class="text-center">
								${khCyz.zjhm}
							</td>
							<td class="text-center">
								${fns:getDictLabel(khCyz.zt, 'zt', '')}
							</td>
							<shiro:hasPermission name="scf:cm:khCyz:edit"><td>
			    				<a href="${ctx}/scf/cm/khCyz/form?id=${khCyz.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
								<a href="${ctx}/scf/cm/khCyz/delete?id=${khCyz.id}" onclick="return confirmx('确认要删除该客户信息列表吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
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