<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>单表管理</title>
	<meta name="decorator" content="adminlte"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/test/testData/">单表列表</a></li>
		<li class="active"><a href="${ctx}/test/testData/form?id=${testData.id}">单表<shiro:hasPermission name="test:testData:edit">${not empty testData.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="test:testData:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
     <div class="row">
       <div class="col-md-12">
         <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="testData" action="${ctx}/test/testData/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>	
				<div class="box-body">	
		 			    <div class="control-group">
		 			    <div class="container-fluid">
		 				<div class="span6">
					<label  class="col-sm-2 control-label">归属用户：
					</label>
					<div class="col-sm-4 controls">
						<sys:treeselect id="user" name="user.id" value="${testData.user.id}" labelName="user.name" labelValue="${testData.user.name}"
							title="用户" url="/sys/office/treeData?type=3" cssClass="form-control " allowClear="true" notAllowSelectParent="true"/>
					</div>
			 			  </div>
		 				<div class="span6">	 
					<label  class="col-sm-2 control-label">归属部门：
					</label>
					<div class="col-sm-4 controls">
						<sys:treeselect id="office" name="office.id" value="${testData.office.id}" labelName="office.name" labelValue="${testData.office.name}"
							title="部门" url="/sys/office/treeData?type=2" cssClass="form-control " allowClear="true" notAllowSelectParent="true"/>
					</div>
			 			</div>
			 			</div>
			 			</div>
		 			    <div class="control-group">
		 			    <div class="container-fluid">
		 				<div class="span6">
					<label  class="col-sm-2 control-label">归属区域：
					</label>
					<div class="col-sm-4 controls">
						<sys:treeselect id="area" name="area.id" value="${testData.area.id}" labelName="area.name" labelValue="${testData.area.name}"
							title="区域" url="/sys/area/treeData" cssClass="form-control " allowClear="true" notAllowSelectParent="true"/>
					</div>
			 			  </div>
		 				<div class="span6">	 
					<label  class="col-sm-2 control-label">名称：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="name" htmlEscape="false" maxlength="100" class="form-control "/>
					</div>
			 			</div>
			 			</div>
			 			</div>
		 			    <div class="control-group">
		 			    <div class="container-fluid">
		 				<div class="span6">
					<label  class="col-sm-2 control-label">性别：
					</label>
					<div class="col-sm-4 controls">
						<form:radiobuttons path="sex" items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false" class=""/>
					</div>
			 			  </div>
		 				<div class="span6">	 
					<label  class="col-sm-2 control-label">加入日期：
					</label>
					<div class="col-sm-4 controls">
						<input name="inDate" type="text" readonly="readonly" maxlength="20" class="form-control Wdate "
							value="<fmt:formatDate value="${testData.inDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
					</div>
			 			</div>
			 			</div>
			 			</div>
		 			    <div class="control-group">
		 			    <div class="container-fluid">
		 				<div class="span6">
					<label  class="col-sm-2 control-label">备注信息：
					</label>
					<div class="col-sm-4 controls">
						<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="form-control "/>
					</div>
			 			  </div>
				</div>
				<div class="box-footer">
					<label class="col-sm-5 control-label"></label>
					<shiro:hasPermission name="test:testData:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
        </div>
	</div>
     </div>
   </section>
</body>
</html>