<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.loris.soccer.model.League"%>
<%@page import="com.loris.soccer.util.IssueMatchUtil" %>
<%@page import="org.apache.commons.lang3.StringUtils" %>
<c:set var="ctxPath" value="${pageContext.request.contextPath}"/>

<%
    String issue = request.getParameter("issue");
	String sid = request.getParameter("sid");		//配置编号
	String type = request.getParameter("type");
	if(StringUtils.isEmpty(issue))
	{
		issue = IssueMatchUtil.getCurrentIssue();
	}
	if(StringUtils.isEmpty(sid))
	{
		sid = "1011";
	}
	if(StringUtils.isEmpty(type))
	{
		type = "bd";
	}
%>
<link rel="stylesheet" type="text/css" href="${ctxPath}/content/css/soccer/datacenter.css" />
<link rel="stylesheet" type="text/css" href="${ctxPath}/content/scripts/soccer/soccer-table.css" />
<script type="text/javascript" src="${ctxPath}/content/scripts/soccer/soccer-table.js"></script>

<div id="content" class="container_wrapper">
	<%@include file="./analysis/anatoolbar.jsp"%>
	
	<div id="main" class="main_wrapper">
		<table id="gridTable" class="gridTable table-hover"
			data-pagination="true" data-show-refresh="true">
			<thead id="tableHeader">
			</thead>
			<tbody id="tableContent">
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">

var url = "${ctxPath}/odds/getMatchesOdds";
//系统参数
var issue = "<%=issue%>";
var type = "<%=type%>";
var sid = "<%=sid%>"

//基础数据
var table = null;

var options = { 
	refresh: false,	
	sorter: null,
	relator: null,
	rows: null,
	results: null,
	columns: null,
	setting: null,
	first: true,
	filter: null,
	clear: function()
	{
		this.columns = null;
		this.rows = null;
		this.setting = null;
	},
	postshow: function()
	{
		var total = 0;
		var shownum = 0;
		if($.isNotNullOrEmpty(this.rows))
		{
			total = this.rows.length;
		}
		if($.isNotNullOrEmpty(this.results))
		{
			shownum = this.results.length;
		}
		$('#matchNumAll').text(total);
		$('#matchNumHide').text(total - shownum);
		$('#gridTable tbody .relation').off('click').on('click', function(){
			getRelatedMatch($(this));
		});
	}
};

//用于获得配置数据
function createMatchOddsTable(conf)
{
	//if($.isNullOrEmpty(conf.issue)) conf.issue = issue;
	sid = conf.sid;
	issue = conf.issue;
	type = conf.type;
	var relator = new Relator(conf.threshold, conf.sameLeague, false);
	var sorter = new MatchOddsFieldSorter('ordinary', true);
	var source = {
		type: "GET",
		url: url,
		contentType : "application/json;charset=utf-8",
		dataType : "json",
		data : {
			"sid": sid,
			"issue": issue,
			"type": type,
		},
		jsonp:'callback',
		success: null,
		error: null,
		presuccess: function(json, soccerTable)
		{
			var data = json.data;
			if($.isNullOrEmpty(json.data))
			{
				return;
			}
			if ($.isNotNullOrEmpty(json.data.comps)) {
				var corpSetting = new CorpSetting(json.data.comps);
				soccerTable.options.setting = corpSetting;
				soccerTable.options.columns = new SoccerTableColumns().createCorpSettingColumns(corpSetting);
				
				updateCompsSelect(corpSetting);
			}
			if ($.isNotNullOrEmpty(json.data.matchOdds))
			{
				soccerTable.options.rows = json.data.matchOdds;
				initLeaguePanel(json.data.matchOdds);
			}			
		},
		complete: function(){
			/*$('#gridTable tbody .relation').off('click').on('click', function(){
				getRelatedMatch($(this));
			});*/
		}
	}	
	options.source = source;
	options.relator = relator;
	options.sorter = sorter;
	table = new SoccerTable(options);
	$('#gridTable').soccerTable(table);
}

function openLeagueRel(lid, season, round, source)
{
	var sid = $('#settingSel').val();
	window.open('analeague?type=leaguerel&lid=' + lid + '&season=' + season + '&round=' 
			+ round + '&source=' + source + '&sid=' + sid);
}

//获得比赛的数据
function getRelatedMatch(element)
{
	var mid = $(element).attr('mid');
	var gid = $(element).attr('gid');
	var index = $(element).attr('index');
	var val = $(element).text();
	
	var mids = [];
	mids.push(mid);
	$(element).parent().parent().siblings().each(function()
	{
		var div = $(this).find('div[gid="' + gid + '"]');
		if($.isNullOrEmpty(div))
		{
			return;
		}
		if(div.length > 0)
		{
			var len = div.length;
			for(var i = 0; i < len; i ++)
			{
				var mid = $(div[i]).attr('mid');
				var idx = $(div[i]).attr('index');
				if(idx == index)
					mids.push(mid);
			}			
		}	
	});
	
	var sid = $('#settingSel').val();
	//layer.msg(mid + ': ' + gid + ', ' + val + ': ' + mids.join(';'));
	window.open('../soccer/matchrel?sid=' + sid + '&mids=' + mids.join(','));
}

function stateChange(state, source, conf)
{
	options.first = conf.first;
	if($.isNotNullOrEmpty(options.relator))
	{
		options.relator.threshold = conf.threshold;
		options.relator.sameLeague = conf.sameLeague;
	}
	var sourceId = $(source).attr('id');
	if(sourceId == 'settingSel' ||
			sourceId == 'typeSel' ||
			sourceId == 'issueSel')
	{
		options.clear();
		createMatchOddsTable(conf);
	}
	else
	{		
		var filter = options.filter;
		if($.isNullOrEmpty(filter))
		{
			filter = new FieldFilter('lid', [], true);
			options.filter = filter;
		}
		filter.clear();
		if($.isNotNullOrEmpty(conf.lids))
		{
			filter.setValues(conf.lids);
		}		
		table.update();
	}
}

$(document).ready(function() {
	showNewToolBar();
	showSettingSel();
	showOddsType();
	if($.isNotNullOrEmpty(type))
	{
		$('#typeSel').val(type);
	}
	if($.isNotNullOrEmpty(sid))
	{
		$('#settingSel').val(sid);
	}
	if($.isNotNullOrEmpty(issue))
	{
		$('#issueSel').val(issue);
	}

	var conf = getConfValue();
	createMatchOddsTable(conf);	
	stateListeners.add(stateChange);
	
	$('#btnRefresh').on('click', function(){
		$('#gridTable').soccerTable('destroy');
	});

	$('#hideChosen').on('click', function(){
		//layer.msg('Recovery');
		sorter.asc = !sorter.asc;
		table.options.sorter = sorter;
		$('#gridTable').soccerTable(table);
	});
});
</script>