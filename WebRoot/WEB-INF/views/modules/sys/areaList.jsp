<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>区域管理</title>
	<meta name="decorator" content="adminlte"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, rootId = "0";
			addRow("#treeTableList", tpl, data, rootId, true);
			$("#treeTable").treeTable({expandLevel : 5});
		});
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
							type: getDictLabel(${fns:toJson(fns:getDictList('sys_area_type'))}, row.type)
						}, pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
				}
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/area/">区域列表</a></li>
		<shiro:hasPermission name="sys:area:edit"><li><a href="${ctx}/sys/area/form">区域添加</a></li></shiro:hasPermission>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
     <div class="row">
       <div class="col-md-12">
         <div class="box box-primary">
			<sys:message content="${message}"/>
			<table id="treeTable" class="table table-bordered table-striped table-hover dataTable no-footer">
				<thead><tr><th>&nbsp;&nbsp;&nbsp;&nbsp;区域名称</th><th  class="text-center">区域编码</th>
				<th class="text-center">区域类型</th><th class="text-center">备注</th><shiro:hasPermission name="sys:area:edit"><th  class="text-center">操作</th></shiro:hasPermission></tr></thead>
				<tbody id="treeTableList"></tbody>
			</table>
			<script type="text/template" id="treeTableTpl">
				<tr id="{{row.id}}" pId="{{pid}}">
					<td ><a href="${ctx}/sys/area/form?id={{row.id}}">{{row.name}}</a></td>
					<td class="text-center">{{row.code}}</td>
					<td class="text-center">{{dict.type}}</td>
					<td class="text-center">{{row.remarks}}</td>
					<shiro:hasPermission name="sys:area:edit"><td class="text-center">
						<a href="${ctx}/sys/area/form?id={{row.id}}" class="btn btn-success btn-sm"><span class=""><i class="fa fa-pencil">&nbsp;修改</i></span></a>
						<a href="${ctx}/sys/area/delete?id={{row.id}}" onclick="return confirmx('要删除该区域及所有子区域项吗？', this.href)" class="btn btn-warning btn-sm"><i class="fa fa-trash">&nbsp;删除</i></a>
						<a href="${ctx}/sys/area/form?parent.id={{row.id}}" class="btn btn-info btn-sm"><i class="fa fa-plus">&nbsp;添加下级区域</i></a> 
					</td></shiro:hasPermission>
				</tr>
			</script>		 
				</div>
			</div>
		</div>
	</section>
</body>
</html>