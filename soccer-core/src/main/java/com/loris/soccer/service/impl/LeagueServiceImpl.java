/**  
 * All rights Reserved, Designed By www.loris.com
 * @Title:  League.java   
 * @Package com.loris.soccer.model   
 * @Description: 本项目用于天津东方足彩数据的存储、共享、处理等   
 * @author: 东方足彩    
 * @date:   2019年1月28日 下午8:59:32   
 * @version V1.0.0
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司传阅，禁止外泄以及用于其他的商业目
 */
package com.loris.soccer.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.loris.common.filter.ObjectFilter;
import com.loris.common.service.SqlHelper;
import com.loris.soccer.constant.SoccerConstants;
import com.loris.soccer.dao.LeagueMapper;
import com.loris.soccer.dao.LogoMapper;
import com.loris.soccer.dao.RankMapper;
import com.loris.soccer.dao.RoundMapper;
import com.loris.soccer.dao.SeasonMapper;
import com.loris.soccer.dao.TeamMapper;
import com.loris.soccer.dao.TeamRfSeasonMapper;
import com.loris.soccer.dao.view.RoundInfoMapper;
import com.loris.soccer.dao.view.SeasonInfoMapper;
import com.loris.soccer.model.League;
import com.loris.soccer.model.Logo;
import com.loris.soccer.model.Rank;
import com.loris.soccer.model.Round;
import com.loris.soccer.model.Season;
import com.loris.soccer.model.Team;
import com.loris.soccer.model.TeamRfSeason;
import com.loris.soccer.model.view.RoundInfo;
import com.loris.soccer.model.view.SeasonInfo;
import com.loris.soccer.service.LeagueService;

/**
 * @ClassName: League
 * @Description: 联赛数据服务接口，包括联赛数据服务、球队数据服务、赛季数据服务、排名数据服务等
 * @author: 东方足彩
 * @date: 2019年1月28日 下午8:59:32
 * 
 * @Copyright: 2019 www.tydic.com Inc. All rights reserved.
 *             注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目
 */
@Service("leagueService")
public class LeagueServiceImpl extends ServiceImpl<LeagueMapper, League> implements LeagueService
{	
	@Autowired
	private SqlHelper sqlHelper;
	
	@Autowired
	private SeasonMapper seasonMapper;
	
	@Autowired
	private RoundMapper roundMapper;
	
	@Autowired
	private RoundInfoMapper roundInfoMapper;
	
	@Autowired
	private TeamMapper teamMapper;
	
	@Autowired
	private LogoMapper logoMapper;
	
	@Autowired
	private TeamRfSeasonMapper teamRfMapper;
	
	@Autowired
	private RankMapper rankMapper;
	
	@Autowired
	private SeasonInfoMapper seasonInfoMapper;

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertLeagues(java.util.List, boolean)
	 */
	@Override
	public boolean insertLeagues(List<League> leagues, boolean overwrite)
	{
		ObjectFilter<League> filter = new ObjectFilter<>();
		return SqlHelper.insertList(leagues, League.class, baseMapper, filter, 
				SoccerConstants.NAME_FIELD_LID, sqlHelper, overwrite);
	}
	
	/**
	 * (non-Javadoc)
	 * 
	 * @see com.loris.soccer.service.LeagueService#insertLeagues(java.util.List)
	 */
	@Override
	@Transactional
	public boolean insertLeagues(List<League> leagues)
	{
		return insertLeagues(leagues, false);		
	}

	/**
	 * 查询联赛数据
	 * 
	 * @param name 联赛名称或联赛编号
	 * @return 联赛数据
	 */
	@Override
	public League getLeague(String name)
	{
		QueryWrapper<League> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("name", name).or().eq("lid", name);
		return baseMapper.selectOne(queryWrapper);
	}
	
	/**
	 * 获得联赛数据的名称列表
	 * @return 联赛数据列表
	 */
	@Override
	@Cacheable(value=SoccerConstants.CAHE_ODDS_NAME, key="'leagues'")
	public List<League> list()
	{
		return baseMapper.selectList(new QueryWrapper<League>());
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertRounds(java.util.List)
	 */
	@Override
	public boolean insertRounds(List<Round> rounds)
	{
		return insertRounds(rounds, false);
	}
	
	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertRounds(java.util.List, boolean)
	 */
	public boolean insertRounds(List<Round> rounds, boolean overwrite)
	{
		ObjectFilter<Round> filter = new ObjectFilter<>();	
		return SqlHelper.insertList(rounds, Round.class, roundMapper, filter, SoccerConstants.NAME_FIELD_LID, 
				sqlHelper, overwrite);
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertLogos(java.util.List)
	 */
	@Override
	public boolean insertLogos(List<Logo> logos)
	{
		return insertLogos(logos, false);
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertLogos(java.util.List, boolean)
	 */
	@Override
	public boolean insertLogos(List<Logo> logos, boolean overwrite)
	{
		ObjectFilter<Logo> filter = new ObjectFilter<>();	
		return SqlHelper.insertList(logos, Logo.class, logoMapper, filter, "pid", 
				sqlHelper, overwrite);
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertTeamRfSeasons(java.util.List)
	 */
	@Override
	public boolean insertTeamRfSeasons(List<TeamRfSeason> teamRfSeasons)
	{
		return insertTeamRfSeasons(teamRfSeasons, false);
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertTeamRfSeasons(java.util.List, boolean)
	 */
	@Override
	public boolean insertTeamRfSeasons(List<TeamRfSeason> teamRfSeasons, boolean overwrite)
	{
		ObjectFilter<TeamRfSeason> filter = new ObjectFilter<>();	
		return SqlHelper.insertList(teamRfSeasons, TeamRfSeason.class, teamRfMapper, filter, "tid", 
				sqlHelper, overwrite);
	}

	/* (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertRanks(java.util.List)
	 */
	@Override
	public boolean insertRanks(List<Rank> ranks)
	{
		return insertRanks(ranks, true);
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertRanks(java.util.List, boolean)
	 */
	@Override
	public boolean insertRanks(List<Rank> ranks, boolean overwrite)
	{
		ObjectFilter<Rank> filter = new ObjectFilter<>();
		return SqlHelper.insertList(ranks, Rank.class, rankMapper, filter, SoccerConstants.NAME_FIELD_LID, 
				sqlHelper, overwrite);
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertSeasons(java.util.List)
	 */
	@Override
	public boolean insertSeasons(List<Season> seasons)
	{
		return insertSeasons(seasons, true);
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertSeasons(java.util.List, boolean)
	 */
	@Override
	public boolean insertSeasons(List<Season> seasons, boolean overwrite)
	{
		ObjectFilter<Season> filter = new ObjectFilter<>();
		return SqlHelper.insertList(seasons, Season.class, seasonMapper, filter, SoccerConstants.NAME_FIELD_LID, 
				sqlHelper, overwrite);
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#getRounds(java.lang.String, java.lang.String, java.lang.String)
	 */
	@Override
	public List<Round> getRounds(String startSeason, String endSeason)
	{
		QueryWrapper<Round> queryWrapper = new QueryWrapper<>();
		if(StringUtils.isNotBlank(startSeason))
		{
			queryWrapper.eq("season", startSeason).or().gt("season", startSeason);
		}
		if(StringUtils.isNotBlank(endSeason))
		{
			queryWrapper.and(wrapper->wrapper.eq("season", endSeason).or().lt("season", endSeason));
		}
		return roundMapper.selectList(queryWrapper);
	}

	/**
	 * 查询轮次数据的接口
	 */
	@Override
	public List<RoundInfo> getRoundInfos(String startSeason, String endSeason)
	{
		QueryWrapper<RoundInfo> queryWrapper = new QueryWrapper<>();
		if(StringUtils.isNotBlank(startSeason))
		{
			queryWrapper.eq("season", startSeason).or().gt("season", startSeason);
		}
		if(StringUtils.isNotBlank(endSeason))
		{
			queryWrapper.and(wrapper->wrapper.eq("season", endSeason).or().lt("season", endSeason));
		}
		return roundInfoMapper.selectList(queryWrapper);
	}

	/**
	 * 获得联赛赛季数据
	 */
	@Override
	public List<Season> getSeasons(String startSeason, String endSeason)
	{
		QueryWrapper<Season> queryWrapper = new QueryWrapper<>();
		if(StringUtils.isNotBlank(startSeason))
		{
			queryWrapper.eq("season", startSeason).or().gt("season", startSeason);
		}
		if(StringUtils.isNotBlank(endSeason))
		{
			queryWrapper.and(wrapper->wrapper.eq("season", endSeason).or().lt("season", endSeason));
		}
		return seasonMapper.selectList(queryWrapper);
	}

	/**
	 * 获得联赛赛季数据
	 */
	@Override
	public List<SeasonInfo> getSeasonInfos(String startSeason, String endSeason)
	{
		QueryWrapper<SeasonInfo> queryWrapper = new QueryWrapper<>();
		if(StringUtils.isNotBlank(startSeason))
		{
			queryWrapper.eq("season", startSeason).or().gt("season", startSeason);
		}
		if(StringUtils.isNotBlank(endSeason))
		{
			queryWrapper.and(wrapper->wrapper.eq("season", endSeason).or().lt("season", endSeason));
		}
		return seasonInfoMapper.selectList(queryWrapper);
	}
	
	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertTeams(java.util.List)
	 */
	@Override
	public boolean insertTeams(List<Team> teams)
	{
		return insertTeams(teams, false);
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.service.LeagueService#insertTeams(java.util.List, boolean)
	 */
	@Override
	public boolean insertTeams(List<Team> teams, boolean overwrite)
	{
		ObjectFilter<Team> filter = new ObjectFilter<>();	
		return SqlHelper.insertList(teams, Team.class, teamMapper, filter, SoccerConstants.NAME_FIELD_TID,
				sqlHelper, overwrite);
	}
}
