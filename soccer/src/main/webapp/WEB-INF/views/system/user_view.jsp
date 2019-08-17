<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fns" tagdir="/WEB-INF/tags" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>

<div class="col-sm-6  col-sm-offset-3">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>用户管理</h5>
        </div>
        <div class="ibox-content">
            <div class="row row-lg">
                <div class="col-sm-12">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content" style="border:none !important; ">
                            <div class="form-horizontal" id="userInfoForm">

                                <input type="hidden" id="id" value="${user.id}">
                                <input type="hidden" id="sexValue" value="${user.sex}">

                                <div class="row">
                                    <div class="col-sm-6 b-r">
                                        <fns:avatar id="avatar" name="头像" underline="true" avatarImg="${user.avatar}"/>

                                        <fns:input id="account" name="账户" underline="true" value="${user.account}" disabled="disabled" />

                                        <fns:select id="sex" name="性别" underline="true" value="${user.sex}">
                                            <option value="1">男</option>
                                            <option value="2">女</option>
                                        </fns:select>

                                        <fns:input id="roleid" name="角色" underline="true" value="${roleName}" disabled="disabled"/>

                                        <fns:input id="email" name="邮箱" type="email" value="${user.email}"/>
                                    </div>

                                    <div class="col-sm-6">
                                        <div id="driverInfoContent">
                                            <fns:input id="name" name="姓名" underline="true" value="${user.name}"/>

                                            <fns:input id="birthday" name="出生日期" underline="true" type="date"
                                                    value="${user.birthday}"
                                                    clickFun="laydate({istime: false, format: 'YYYY-MM-DD'})"/>

                                            <fns:input id="citySel" name="部门" underline="true" readonly="readonly" value="${deptName}"
                                                    hidden="deptid" hiddenValue="${user.deptid}"
                                                    clickFun="UserInfoDlg.showInfoDeptSelectTree(); return false;"
                                                    style="background-color: #ffffff !important;"
                                                    selectFlag="true" selectId="menuContent" selectTreeId="treeDemo" selectStyle="width:250px !important;"/>

                                            <fns:input id="phone" name="电话" value="${user.phone}"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="progress progress-striped" id="progressTipArea" style="margin-top: 20px;">
                                    <div id="progressBar" style="width: 0%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="0" role="progressbar" class="progress-bar progress-bar-info">
                                    </div>
                                </div>

                                <div class="row btn-group-m-t">
                                    <div class="col-sm-10">
                                        <fns:button btnCss="info" name="提交" id="ensure" icon="fa-check" clickFun="UserInfoDlg.editSubmit()"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctxPath}/content/modular/system/user/user_info.js"></script>
