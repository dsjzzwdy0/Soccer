<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="lqnav" style="position: relative; margin-bottom: 0px; border-bottom: none; background-color: #fafafa;">
	<div style="float: left;">
		<span class="location">当前位置：</span>
		<a href="../" class="aco">东彩首页</a> 
		<span>&gt;</span> 
		<a href="analysis" class="aco">数据比较分析</a>
		<span>&gt;</span>  
		<b> ${title } <c:if test="${league!=null}"> (&nbsp;<a href="league?lid=${league.lid}" class="league">${league.name }</a>&nbsp;)</c:if></b>
	</div>
</div>

<div class="top-chosse">
	<div class="top-plnav">
		<ul>
			<li class="n_1"><a href="javascript:void(0);" <c:if test="${page!='leaguerel'}">onclick="openPage('leaguerel');"</c:if> title="欧赔数据关联分析" <c:if test="${page=='leaguerel'}">class="cur"</c:if>>关联分析</a></li>
			<li class="n_2"><a href="javascript:void(0);" <c:if test="${page!='leagueoy'}">onclick="openPage('leagueoy');"</c:if> title="欧亚数据对比分析" <c:if test="${page=='leagueoy'}">class="cur"</c:if>>欧亚对比</a></li>
			<li class="n_3"><a href="javascript:void(0);" <c:if test="${page!='leaguefirst'}">onclick="openPage('leaguefirst');"</c:if> title="初盘开盘分析" <c:if test="${page=='leaguefirst'}">class="cur"</c:if>>开盘分析</a></li>
			<li class="n_3"><a href="javascript:void(0);" <c:if test="${page!='leagueop'}">onclick="openPage('leagueop');"</c:if> title="初盘开盘分析" <c:if test="${page=='leagueop'}">class="cur"</c:if>>欧盘分析</a></li>
			<li class="n_4"><a href="<c:if test="${page=='anayp'}">javascript:void(0);</c:if><c:if test="${page!='anayp'}">analysis?page=anayp<c:if test="${not empty lid}">&lid=${lid}</c:if></c:if>" title="亚盘对比" class="<c:if test="${page=='anayp'}">cur</c:if>">亚盘对比</a></li>
			<li class="n_5"><a href="<c:if test="${page=='anafc'}">javascript:void(0);</c:if><c:if test="${page!='anafc'}">analysis?page=anafc<c:if test="${not empty lid}">&lid=${lid}</c:if></c:if>" title="欧赔方差分析" class="<c:if test="${page=='anafc'}">cur</c:if>">方差分析</a></li>
			<li class="n_6"><a href="<c:if test="${page=='anazj'}">javascript:void(0);</c:if><c:if test="${page!='anazj'}">analysis?page=anazj<c:if test="${not empty lid}">&lid=${lid}</c:if></c:if>" title="战绩对比分析" class="<c:if test="${page=='anazj'}">cur</c:if>">战绩分析</a></li>
			<li class="n_7"><a href="<c:if test="${page=='anazh'}">javascript:void(0);</c:if><c:if test="${page!='anazh'}">analysis?page=anazh<c:if test="${not empty lid}">&lid=${lid}</c:if></c:if>" title="综合分析" class="<c:if test="${page=='anazh'}">cur</c:if>">综合分析</a></li>
		</ul>
	</div>
	<div class="sx_form_c pl-chosse-cont">
		<select id="settingSel" class="sel_list" style="display: none;">
			<c:forEach items="${settings }" var="setting" varStatus="status">
				<option value="${setting.sid }" >${setting.name}</option>
			</c:forEach>
		</select>
		
		<div id="newToolbar" class="newToolBar" style="display: none; float: right; margin-right: 10px;">
			<label for="sameLeague" class="check_same_league" style="display: none;">
				<input id="sameLeague" class="sel_list" style="margin-right: 4px;" type="checkbox" checked="true" />同联赛内比较
			</label>
			<select id="oddsType" class="sel_list" style="width:70px;">
				<option value="start" selected>初盘</option>
				<option value="now">即时</option>
			</select>
			<select id="sort" class="sel_list" style="display: none; width: 70px;">
				<option value="asc" selected>升序</option>
				<option value="desc">降序</option>
			</select>
			<select id="threshold" class="sel_list" title="关联差值间隔" style="width: 70px; margin-right: 15px;" data-style="btn-warning">
				<option value="0.01">0.01</option>
				<option value="0.02" selected>0.02</option>
				<option value="0.03">0.03</option>
				<option value="0.04">0.04</option>
				<option value="0.05">0.05</option>
				<option value="0.08">0.08</option>
				<option value="0.10">0.10</option>
			</select>
			<div style="display: inline-block; float: left;">选择赔率公司</div>
			<select id="comps-multi-select" multiple="multiple">
				<optgroup label="欧赔">
				    <option value="1" selected="selected">平均欧赔</option>
				    <option value="2" selected="selected">Fonbet</option>
				    <option value="3" selected="selected">Missonjon</option>
			    </optgroup>
			    <optgroup label="亚盘">
				    <option value="5">Fonbet</option>
			    </optgroup>
			</select>
			<div style="display: inline-block; float: right;">
				<input type="button" class="pl-topbtn" id="btnConfigure" style="margin-left: 3px; width: 80px; height: 24px;" value="刷  新"/>
				<!-- <input type="button" class="pl-topbtn" id="btnReUnion" value="重 置"/> -->
			</div>	
		</div>
	</div>
</div>
<script type="text/javascript">

var stateListeners = new StateListeners();
function showNewToolBar()
{
	$('.top-chosse #newToolbar').show();
}

function showSettingSel()
{
	$('.top-chosse #settingSel').show();
}


function openPage(type)
{
	var destUrl = 'analeague?page=' + type+ '&lid=' + lid + '&season=' + season + '&rid=' + round;
	window.open(destUrl);
}

//获得页面的配置信息
function getConfValue()
{
	var type = $('#oddsType').val();
	var sid = $('#settingSel').val();
	var compIds = $('#comps-multi-select').val();
	var sort = $('#sort').val();
	var threshold = Number($('#threshold').val());
	var sameleague = $('#sameLeague').prop('checked');
	var showOrdinary = $('#showOrdinary').prop('checked');
	
	if($.isNullOrEmpty(threshold))
	{
		threshold = 0.02;
	}	
	return {
		sid: sid,
		first: type == 'now' ? false : true,
		sort: "desc" == sort ? false : true,
		threshold: threshold,
		sameLeague: sameleague,
		showOrdinary: showOrdinary,
		showCompIds: compIds,
	};
}

$().ready(function(){
	$('#comps-multi-select').fSelect({
    	placeholder: complabel,
    	showSearch: false,
    	numDisplayed: 0,
        overflowText: '已选择{n}公司',
    });
	$('.top-chosse .sel_list').on('change', function(){
		//layer.msg('State has changed.' + $(this).attr('id'));
		var conf = getConfValue();
		stateListeners.notify('change', this, conf);
	})
	
	$('#btnConfigure').on('click', function(){
    	conf = getConfValue();
    	stateListeners.notify('change', this, conf);
    });
});
</script>