<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>客户信息列表管理</title>
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
		<li><a href="${ctx}/scf/cm/khCyz/">客户信息列表列表</a></li>
		<li class="active"><a href="${ctx}/scf/cm/khCyz/form?id=${khCyz.id}">客户信息列表<shiro:hasPermission name="scf:cm:khCyz:edit">${not empty khCyz.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="scf:cm:khCyz:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
     <div class="row">
       <div class="col-md-12">
         <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="khCyz" action="${ctx}/scf/cm/khCyz/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>	
				<div class="box-body">	
		 			    <div class="control-group">
		 			    <div class="container-fluid">
		 				<div class="span6">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>客户编号：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="khbh" htmlEscape="false" maxlength="64" class="form-control required"/>
					</div>
			 			  </div>
		 				<div class="span6">	 
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>客户名称：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="khmc" htmlEscape="false" maxlength="100" class="form-control required"/>
					</div>
			 			</div>
			 			</div>
			 			</div>
		 			    <div class="control-group">
		 			    <div class="container-fluid">
		 				<div class="span6">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>客户类型：
					</label>
					<div class="col-sm-4 controls">
						<form:select path="khlx" class="form-control required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('khlx')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
			 			  </div>
		 				<div class="span6">	 
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>证件类型：
					</label>
					<div class="col-sm-4 controls">
						<form:select path="zjlx" class="form-control required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('zjlx')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
			 			</div>
			 			</div>
			 			</div>
		 			    <div class="control-group">
		 			    <div class="container-fluid">
		 				<div class="span6">
					<label  class="col-sm-2 control-label">
						<span class="help-inline"><font color="red">*</font> </span>证件号码：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="zjhm" htmlEscape="false" maxlength="100" class="form-control required"/>
					</div>
			 			  </div>
		 				<div class="span6">	 
					<label  class="col-sm-2 control-label">备注：
					</label>
					<div class="col-sm-4 controls">
						<form:input path="bz" htmlEscape="false" maxlength="1024" class="form-control "/>
					</div>
			 			</div>
			 			</div>
			 			</div>
		 			    <div class="control-group">
		 			    <div class="container-fluid">
		 				<div class="span6">
					<label  class="col-sm-2 control-label">状态：
					</label>
					<div class="col-sm-4 controls">
						<form:select path="zt" class="form-control ">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('zt')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
			 			  </div>
				</div>
				<div class="box-footer">
					<label class="col-sm-5 control-label"></label>
					<shiro:hasPermission name="scf:cm:khCyz:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
        </div>
	</div>
     </div>
   </section>
</body>
</html>