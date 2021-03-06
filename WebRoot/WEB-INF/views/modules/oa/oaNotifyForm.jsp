<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>通知管理</title>
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
		<li><a href="${ctx}/oa/oaNotify/">通知列表</a></li>
		<li class="active"><a href="${ctx}/oa/oaNotify/form?id=${oaNotify.id}">通知<shiro:hasPermission name="oa:oaNotify:edit">${oaNotify.status eq '1' ? '查看' : not empty oaNotify.id ? '修改' : '添加'}</shiro:hasPermission><shiro:lacksPermission name="oa:oaNotify:edit">查看</shiro:lacksPermission></a></li>
	</ul>
	<section class="content" style="background: redl;padding: 0px">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
			<form:form id="inputForm" modelAttribute="oaNotify" action="${ctx}/oa/oaNotify/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>	
				<div class="box-body">
				<div class="form-group">
					<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>类型：</label>
					<div class="col-sm-4 controls">
						<form:select path="type" class="form-control required">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('oa_notify_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>	
				<div class="form-group">
					<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>标题：</label>
					<div class="col-sm-4 controls">
						<form:input path="title" htmlEscape="false" maxlength="200" class="form-control required"/>					</div>
				</div>
				<div class="form-group">
					<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>内容：</label>
					<div class="col-sm-4 controls">
						<form:textarea path="content" htmlEscape="false" rows="6" maxlength="2000" class="form-control required"/>
					</div>
				</div>
				<c:if test="${oaNotify.status ne '1'}">
					<div class="form-group">
						<label  class="col-sm-2 control-label">附件：</label>
						<div class="col-sm-2 controls">
							<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="form-control"/>
							<sys:ckfinder input="files" type="files" uploadPath="/oa/notify" selectMultiple="true"/>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>状态：</label>
						<div class="col-sm-2 control-label ">
							<form:radiobuttons path="status" items="${fns:getDictList('oa_notify_status')}" itemLabel="label" itemValue="value" htmlEscape="false" class=" required"/>
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label"><span class="help-inline"><font color="red">*</font> </span>接受人：</label>
						<div class="col-sm-4 controls">
			                <sys:treeselect id="oaNotifyRecord" name="oaNotifyRecordIds" value="${oaNotify.oaNotifyRecordIds}" labelName="oaNotifyRecordNames" labelValue="${oaNotify.oaNotifyRecordNames}"
								title="用户" url="/sys/office/treeData?type=3" cssClass="form-control required" notAllowSelectParent="true" checked="true"/>
						</div>
					</div>
				</c:if>
				<c:if test="${oaNotify.status eq '1'}">
					<div class="form-group">
						<label  class="col-sm-2 control-label">附件：</label>
						<div class="col-sm-4 controls">
							<form:hidden id="files" path="files" htmlEscape="false" maxlength="255" class="input-xlarge"/>
							<sys:ckfinder input="files" type="files" uploadPath="/oa/notify" selectMultiple="true" readonly="true" />
						</div>
					</div>
					<div class="form-group">
						<label  class="col-sm-2 control-label">接受人：</label>
						<div class="col-sm-4 controls">
							<table id="contentTable" class="table table-bordered table-striped table-hover dataTable no-footer">
								<thead>
									<tr>
										<th>接受人</th>
										<th>接受部门</th>
										<th>阅读状态</th>
										<th>阅读时间</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${oaNotify.oaNotifyRecordList}" var="oaNotifyRecord">
									<tr>
										<td>
											${oaNotifyRecord.user.name}
										</td>
										<td>
											${oaNotifyRecord.user.office.name}
										</td>
										<td>
											${fns:getDictLabel(oaNotifyRecord.readFlag, 'oa_notify_read', '')}
										</td>
										<td>
											<fmt:formatDate value="${oaNotifyRecord.readDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
										</td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
							已查阅：${oaNotify.readNum} &nbsp; 未查阅：${oaNotify.unReadNum} &nbsp; 总共：${oaNotify.readNum + oaNotify.unReadNum}
						</div>
					</div>
				</c:if>
				</div>
				<div class="box-footer">
				<label class="col-sm-3 control-label"></label>
					<c:if test="${oaNotify.status ne '1'}">
						<shiro:hasPermission name="oa:oaNotify:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
					</c:if>
					<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
				</div>
			</form:form>
	        </div>
		</div>
      </div>
    </section>
</body>
</html>