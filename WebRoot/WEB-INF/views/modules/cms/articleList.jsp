<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>文章管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		function viewComment(href){
			top.$.jBox.open('iframe:'+href,'查看评论',$(top.document).width()-220,$(top.document).height()-120,{
				buttons:{"关闭":true},
				loaded:function(h){
					$(".jbox-content", top.document).css("overflow-y","hidden");
					$(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
					$("body", h.find("iframe").contents()).css("margin","10px");
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
		<li class="active"><a href="${ctx}/cms/article/?category.id=${article.category.id}">文章列表</a></li>
		<shiro:hasPermission name="cms:article:edit"><li><a href="<c:url value='${fns:getAdminPath()}/cms/article/form?id=${article.id}&category.id=${article.category.id}'><c:param name='category.name' value='${article.category.name}'/></c:url>">文章添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
	<form:form id="searchForm" modelAttribute="article" action="${ctx}/cms/article/" method="post" class="form-horizontal">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>						
		<div class="box-body">
		<div class="col-md-12">
			<div class="form-group">
				<label  class="col-sm-2 control-label">栏目：</label>
				<div class="col-sm-4">
					<sys:treeselect id="category" name="category.id" value="${article.category.id}" labelName="category.name" labelValue="${article.category.name}"
						title="栏目" url="/cms/category/treeData" module="article" notAllowSelectRoot="false" cssClass="form-control"/>
                </div>
               	<label  class="col-sm-2 control-label">标题：</label>
				<div class="col-sm-4">
					<form:input path="title" htmlEscape="false" maxlength="50" class="form-control"/>
                </div>
			</div>
			<div class="form-group">
				<label  class="col-sm-2 control-label">状态：</label>
				<div class="col-sm-3 control-label">
					<form:radiobuttons onclick="$('#searchForm').submit();" path="delFlag" items="${fns:getDictList('cms_del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                </div>
			</div>
		</div>
        <div class="col-sm-12 col-sm-offset-5">
        	<button id="btnSubmit" type="submit" class="btn btn-primary" data-btn-type="search">查询</button>
        </div>
        </div>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
		<thead><tr><th class="text-center">栏目</th><th class="text-center">标题</th><th class="text-center">权重</th>
		<th class="text-center">点击数</th><th class="text-center">发布者</th><th class="text-center">更新时间</th><th class="text-center">操作</th></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="article">
			<tr>
				<td class="text-center"><a href="javascript:" onclick="$('#categoryId').val('${article.category.id}');$('#categoryName').val('${article.category.name}');$('#searchForm').submit();return false;">${article.category.name}</a></td>
				<td class="text-center"><a href="${ctx}/cms/article/form?id=${article.id}" title="${article.title}">${fns:abbr(article.title,40)}</a></td>
				<td class="text-center">${article.weight}</td>
				<td class="text-center">${article.hits}</td>
				<td class="text-center">${article.user.name}</td>
				<td class="text-center"><fmt:formatDate value="${article.updateDate}" type="both"/></td>
				<td class="text-center">
					<a href="${pageContext.request.contextPath}${fns:getFrontPath()}/view-${article.category.id}-${article.id}${fns:getUrlSuffix()}" target="_blank" class="btn btn-info btn-sm">访问</a>
					<shiro:hasPermission name="cms:article:edit">
						<c:if test="${article.category.allowComment eq '1'}"><shiro:hasPermission name="cms:comment:view">
							<a href="${ctx}/cms/comment/?module=article&contentId=${article.id}&delFlag=2" onclick="return viewComment(this.href);">评论</a>
						</shiro:hasPermission></c:if>
	    				<a href="${ctx}/cms/article/form?id=${article.id}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
	    				<shiro:hasPermission name="cms:article:audit">
							<a href="${ctx}/cms/article/delete?id=${article.id}${article.delFlag ne 0?'&isRe=true':''}&categoryId=${article.category.id}" onclick="return confirmx('确认要${article.delFlag ne 0?'发布':'删除'}该文章吗？', this.href)" class="btn btn-warning btn-sm">${article.delFlag ne 0?'发布':'<i class=\"fa fa-trash\">&nbsp;删除</i>'}</a>
						</shiro:hasPermission>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	${page}
				</div>
			<!-- /.col -->
		</div></div>
		<!-- /.row -->
	</section>
</body>
</html>