<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.loris.soccer.model.League"%>
<%@ taglib prefix="fns" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="qs" uri="/WEB-INF/taglib/function.tld"%>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>

<div class="row">
	<div class="col-sm-12">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>球队数据管理</h5>
			</div>
			<div class="ibox-content">
				<div class="row row-lg">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-lg-8 col-sm-8">
								<div class="row">
									<div class="col-lg-4 col-sm-12">
										<fns:NameCon id="name" name="用户名称" placeholder="帐号/姓名/手机号" />
									</div>
									<div class="col-lg-4 col-sm-6">
										<fns:TimeCon id="beginTime" name="注册开始日期" isTime="false" pattern="YYYY-MM-DD" />
									</div>
									<div class="col-lg-4 col-sm-6">
										<fns:TimeCon id="endTime" name="注册结束日期" isTime="false" pattern="YYYY-MM-DD" />
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-sm-4">
								<div class="row">
									<div class="col-lg-12 col-sm-12">
										<fns:button name="搜索" icon="fa-search" btnType="primary" clickFun="MgrUser.search()" />
										<fns:button name="重置" icon="fa-trash" btnType="primary" clickFun="MgrUser.resetSearch()" space="true" />
										<fns:button name="添加" icon="fa-plus" btnType="primary" clickFun="openAddLeagueMapping()" />
									</div>
								</div>
							</div>
						</div>
						<fns:table id="gridTable" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function() {
    //根据窗口调整表格高度
    $(window).resize(function() {
        $('#gridTable').bootstrapTable('resetView', {
            height: tableHeight()
        })
    })

    $('#gridTable').bootstrapTable({
        url: "getTeamsMappings",		//数据源
        dataField: "rows",		//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
        height: tableHeight(),	//高度调整
        search: true,			//是否搜索
        pagination: true,		//是否分页
        pageSize: 20,			//单页记录数
        pageList: [5, 10, 20, 50],//分页步进值
        sidePagination: "server",//服务端分页
        contentType: "application/x-www-form-urlencoded",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
        dataType: "json",//期待返回数据类型
        method: "post",//请求方式
        searchAlign: "left",//查询框对齐方式
        queryParamsType: "limit",//查询参数组织方式
        queryParams: function getParams(params) {
            //params obj
            params.other = "otherInfo";
            return params;
        },
        searchOnEnterKey: false,//回车搜索
        showRefresh: false,//刷新按钮
        showColumns: true,//列选择按钮
        buttonsAlign: "left",//按钮对齐方式
        toolbar: "#toolbar",//指定工具栏
        toolbarAlign: "right",//工具栏对齐方式
        columns: [
            {
                title: "全选",
                field: "select",
                checkbox: true,
                width: 30,//宽度
                align: "center",//水平
                valign: "middle"//垂直
            },
            {
                title: "ID",//标题
                field: "id",//键名
                sortable: true,//是否可排序
                order: "desc"//默认排序方式
            },
            {
                field: "sourcename",
                title: "Okooo名称",
                sortable: true,
                titleTooltip: "这是来自于澳客网的数据"
            },
            {
                field: "sourcefrom",
                title: "数据来源",
                sortable: false,
            },
            {
                field: "destname",
                title: "联赛名称",
                sortable: true,
                titleTooltip: "这是来自于中国足彩网的数据"
            },
            {
                field: "sourcedest",
                title: "数据来源",
                sortable: false,
            },
            {
                field: "operator",
                title: "数据操作",
                formatter: operateFormatter,		//对本列数据做格式化
                width: '120px',
            }
        ],
        onClickRow: function(row, $element) {
            //$element是当前tr的jquery对象
            //$element.css("background-color", "green");
        },			//单击row事件
        locale: "zh-CN", //中文支持
        detailView: true, //是否显示详情折叠
        detailFormatter: function(index, row, element)
        {
            var html = '';
            $.each(row, function(key, val){
                html += "<p>" + key + ":" + val +  "</p>"
            });
            return html;
        }
    });
    
 	// 格式化按钮
    function operateFormatter(value, row, index) {
        return [
            //'<button type="button" class="btn btn-primary" style="margin-right:5px;height:28px;" title="新增"><i class="glyphicon glyphicon-plus"></i></button>',
            '<button type="button" class="btn btn-primary" style="margin-right:5px;height:28px;" title="修改"><i class="glyphicon glyphicon-pencil"></i></button>',
            '<button type="button" class="btn btn-primary" style="margin-right:5px;height:28px;" title="删除"><i class="glyphicon glyphicon-trash"></i></button>'
        ].join('');

    }

    $("#addRecord").click(function(){
        alert("name:" + $("#name").val() + " age:" +$("#age").val());
    });
    
    function tableHeight() {
        return $(window).height() - 190;
    }
});
</script>