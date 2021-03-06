/**  
 * All rights Reserved, Designed By www.loris.com
 * @Title:  ZgzcwMatchResultDataPlugin.java   
 * @Package com.loris.soccer.data   
 * @Description: 本项目用于天津东方足彩数据的存储、共享、处理等   
 * @author: 东方足彩    
 * @date:   2019年1月28日 下午8:59:32   
 * @version V1.0.0
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司传阅，禁止外泄以及用于其他的商业目
 */
package com.loris.soccer.data;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.loris.client.task.context.TaskPluginContext;
import com.loris.common.util.DateUtil;
import com.loris.soccer.collection.LeagueList;
import com.loris.soccer.constant.SoccerConstants;
import com.loris.soccer.data.conf.WebPageProperties;
import com.loris.soccer.data.zgzcw.filter.ZgzcwRoundPageFilter;
import com.loris.soccer.filter.RoundInfoFilter;
import com.loris.soccer.filter.SeasonInfoFilter;
import com.loris.soccer.model.League;
import com.loris.soccer.model.Season;
import com.loris.soccer.model.view.MatchInfo;
import com.loris.soccer.model.view.RoundInfo;
import com.loris.soccer.model.view.SeasonInfo;

/**   
 * @ClassName: ZgzcwMatchResultDataPlugin   
 * @Description: 中国足彩网比赛结果数据的下载管理器
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 * @Copyright: 2019 www.tydic.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
@Component
public class ZgzcwMatchResultDataPlugin extends ZgzcwBasePlugin
{
	private static Logger logger = Logger.getLogger(ZgzcwMatchResultDataPlugin.class);
	
	/** 每次最大的数据下载量 */
	protected int maxSize = 500;
	
	/** 开始的赛季数据 */
	protected String startSeason = "2018";
	
	/** 日期 */
	protected String startDate = "2018-07-01";
	
	/**
	 * Create a new instance of ZgzcwMatchResultDataPlugin
	 */
	public ZgzcwMatchResultDataPlugin()
	{
		this("比赛结果数据下载", new WebPageProperties());
	}

	/**
	 * Create a new instance of ZgzcwMatchResultDataPlugin
	 * @param name
	 */
	public ZgzcwMatchResultDataPlugin(String name, WebPageProperties webPageConf)
	{
		super(name, webPageConf);
		webPageFilter = new ZgzcwRoundPageFilter();
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.data.ZgzcwBasePlugin#produce(com.loris.client.task.context.TaskPluginContext)
	 */
	@Override
	public void produce(TaskPluginContext context) throws IOException, SQLException
	{
		List<SeasonInfo> seasons = leagueService.getSeasonInfos(startSeason, null);
		List<RoundInfo> rounds = leagueService.getRoundInfos(startSeason, null);
		
		int taskSize = 0;
		
		//注册过滤器
		SeasonInfoFilter seasonFilter = new SeasonInfoFilter(rounds);		
		for (SeasonInfo season : seasons)
		{
			if(!seasonFilter.accept(season))
			{
				continue;
			}
			// logger.info("Create League season senter Task: " + season);
			if (createLeagueSeasonCenterTask(season, false))
			{
				taskSize++;
				if (taskSize >= maxSize)
				{
					logger.info("There are " + taskSize + " page to be downloaded.");
					return;
				}
			}
		}
		
		//联赛轮次数据下载
		RoundInfoFilter roundInfoFilter = new RoundInfoFilter();
		for (RoundInfo roundInfo : rounds)
		{
			if(!roundInfoFilter.accept(roundInfo))
			{
				continue;
			}
			
			if(createLeagueRoundTask(roundInfo, false))
			{
				taskSize ++;
				if(taskSize >= maxSize)
				{
					logger.info("There are " + taskSize + " page to be downloaded.");
					return;
				}
			}
		}
		
		// 比赛数据
		List<MatchInfo> matchInfos = matchService.getMatchInfos(DateUtil.tryToParseDate(startDate), 
				new Date(), new Boolean(false));
		List<League> leagues = leagueService.list();
		LeagueList leagueList = new LeagueList(leagues);
		
		for (MatchInfo matchInfo : matchInfos)
		{
			String lid = matchInfo.getLid();
			String season = matchInfo.getSeason();
			
			if(StringUtils.isEmpty(lid) || StringUtils.isEmpty(season))
			{
				continue;
			}
			
			League league = leagueList.getLeague(lid);
			if(league == null)
			{
				continue;
			}
			
			//杯赛数据
			if(StringUtils.equals(league.getType(), SoccerConstants.LEAGUE_TYPE_CUP))
			{
				if(createLeagueCenterTask(league, season, false))
				{
					taskSize ++;
					if(taskSize >= maxSize)
					{
						logger.info("There are " + taskSize + " page to be downloaded.");
						return;
					}
				}
			}			
			else 
			{
				String round = matchInfo.getRound();
				if(StringUtils.isEmpty(round))
				{
					continue;
				}
				//联赛轮次数据
				RoundInfo roundInfo = new RoundInfo();
				roundInfo.setLid(lid);
				roundInfo.setLeaguetype(league.getType());
				roundInfo.setSeason(season);
				roundInfo.setRound(round);
				if(createLeagueRoundTask(roundInfo, false))
				{
					taskSize ++;
					if(taskSize >= maxSize)
					{
						logger.info("There are " + taskSize + " page to be downloaded.");
						return;
					}
				}
			}
		}
	}
	
	/**
	 * 检测是否已经下载了赛季轮次比赛数据
	 * @param season 赛季数据
	 * @param rounds 轮次比赛
	 * @return
	 */
	protected boolean hasRoundInfo(Season season, List<RoundInfo> rounds)
	{
		for (RoundInfo roundInfo : rounds)
		{
			if(roundInfo.isSameSeason(season)) return true;
		}
		return false;
	}
}
