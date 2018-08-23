<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>评论管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		function view(href){
			top.$.jBox.open('iframe:'+href,'查看文档',$(top.document).width()-220,$(top.document).height()-180,{
				buttons:{"关闭":true},
				loaded:function(h){
					//$(".jbox-content", top.document).css("overflow-y","hidden");
					//$(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
				}
			});
			return false;
		}
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
		<li class="active"><a href="${ctx}/cms/comment/">评论列表</a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
			<form:form id="searchForm" modelAttribute="comment" action="${ctx}/cms/comment/" method="post" class="form-horizontal">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
				<div class="box-body">
				<div class="col-md-8">
					<div class="form-group">
						<label  class="col-sm-2 control-label">文档标题：</label>
						<div class="col-sm-4">
							<form:input path="title" htmlEscape="false" maxlength="50" class="form-control"/>
		                </div>
		               	<label  class="col-sm-2 control-label">状态：</label>
						<div class="col-sm-4 control-label">
							<form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false" />
		                </div>
					</div>
				</div>
				<div class="col-sm-12 col-sm-offset-5">
		        	<button id="btnSubmit" type="submit" class="btn btn-primary" data-btn-type="search">查询</button>
		        </div>
		        </div>
			</form:form>
			<sys:message content="${message}"/>
			<table id="contentTable" class="table table-bordered table-condensed">
				<thead><tr><th class="text-center">评论内容</th><th class="text-center">文档标题</th><th class="text-center">评论人</th><th class="text-center">评论IP</th><th class="text-center">评论时间</th><th nowrap="nowrap"  class="text-center">操作</th></tr></thead>
				<tbody>
				<c:forEach items="${page.list}" var="comment">
					<tr>
						<td class="text-center"><a href="javascript:" onclick="$('#c_${comment.id}').toggle()">${fns:abbr(fns:replaceHtml(comment.content),40)}</a></td>
						<td class="text-center"><a href="${pageContext.request.contextPath}${fns:getFrontPath()}/view-${comment.category.id}-${comment.contentId}${fns:getUrlSuffix()}" title="${comment.title}" onclick="return view(this.href);">${fns:abbr(comment.title,40)}</a></td>
						<td class="text-center">${comment.name}</td>
						<td class="text-center">${comment.ip}</td>
						<td class="text-center"><fmt:formatDate value="${comment.createDate}" type="both"/></td>
						<td class="text-center"><shiro:hasPermission name="cms:comment:edit">
							<c:if test="${comment.delFlag ne '2'}"><a href="${ctx}/cms/comment/delete?id=${comment.id}${comment.delFlag ne 0?'&isRe=true':''}" 
								onclick="return confirmx('确认要${comment.delFlag ne 0?'恢复审核':'删除'}该审核吗？', this.href)">${comment.delFlag ne 0?'恢复审核':'删除'}</a></c:if>
							<c:if test="${comment.delFlag eq '2'}"><a href="${ctx}/cms/comment/save?id=${comment.id}">审核通过</a></c:if></shiro:hasPermission>
						</td>
					</tr>
					<tr id="c_${comment.id}" style="background:#fdfdfd;display:none;"><td colspan="6">${fns:replaceHtml(comment.content)}</td></tr>
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
