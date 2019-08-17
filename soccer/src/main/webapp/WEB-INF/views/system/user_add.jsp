<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fns" tagdir="/WEB-INF/tags" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>

<div class="ibox float-e-margins">
	<div class="ibox-content">
		<div class="form-horizontal" id="userInfoForm">
		
			<input type="hidden" id="id" value="">

			<div class="row">
				<div class="col-sm-6 b-r">
					<fns:input id="account" name="账户" underline="true"/>
					<fns:select id="sex" name="性别" underline="true">
						<option value="1">男</option>
						<option value="2">女</option>
					</fns:select>
					<fns:input id="password" name="密码" underline="true" type="password"/>
					<fns:input id="roleid" name="角色" underline="true" disabled="disabled"/>
					<fns:input id="email" name="邮箱" type="email"/>
				</div>
				<div class="col-sm-6">
					<div id="driverInfoContent">
						<fns:input id="name" name="姓名" underline="true"/>
						<fns:input id="birthday" name="出生日期" underline="true" type="date"
								clickFun="laydate({istime: false, format: 'YYYY-MM-DD'})"/>
						<fns:input id="rePassword" name="确认密码" type="password" underline="true"/>
						<fns:input id="citySel" name="部门" underline="true" readonly="readonly" hidden="deptid"
								clickFun="UserInfoDlg.showDeptSelectTree(); return false;"
								style="background-color: #ffffff !important;"/>

						<fns:input id="phone" name="电话"/>
					</div>
				</div>
			</div>

			<!-- 这是部门选择的下拉框 -->
			<div id="menuContent" class="menuContent"
				style="display: none; position: absolute; z-index: 200;">
				<ul id="treeDemo" class="ztree tree-box" style="width: 249px !important;"></ul>
			</div>

			<div class="row btn-group-m-t">
				<div class="col-sm-10">
					<fns:button btnCss="info" name="提交" id="ensure" icon="fa-check" clickFun="UserInfoDlg.addSubmit()"/>
					<fns:button btnCss="danger" name="取消" id="cancel" icon="fa-eraser" clickFun="UserInfoDlg.close()"/>
				</div>
			</div>
		</div>

	</div>
</div>
<script src="${ctxPath}/content/modular/system/user/user_info.js"></script>
