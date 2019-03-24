/**  
 * All rights Reserved, Designed By www.loris.com
 * @Title:  ZgzcwLeagueDataPlugin.java   
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.loris.client.model.WebPage;
import com.loris.client.task.context.TaskPluginContext;
import com.loris.common.util.DateUtil;
import com.loris.soccer.data.filter.DownloadedWebPageFilter;
import com.loris.soccer.data.zgzcw.ZgzcwConstants;
import com.loris.soccer.data.zgzcw.ZgzcwPageCreator;
/**   
 * @ClassName: ZgzcwLeagueDataPlugin   
 * @Description: 联赛数据中心页面下载 
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 * @Copyright: 2019 www.tydic.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
@Component
public class ZgzcwLeagueDataPlugin extends ZgzcwBasePlugin
{
	private static Logger logger = Logger.getLogger(ZgzcwLeagueDataPlugin.class);
	
	/**
	 * @param name
	 */
	public ZgzcwLeagueDataPlugin()
	{
		super("联赛信息下载");
	}
	
	/**
	 * 初始化任务产生器
	 * 
	 * @param context 插件任务运行环境
	 * @throws IOException 在任务产生过程中出现异常
	 */
	@Override
	public void initialize(TaskPluginContext context) throws IOException
	{
		super.initialize(context);
		
		List<String> types = new ArrayList<>();
		types.add(ZgzcwConstants.PAGE_LEAGUE_LEAGUE);
		types.add(ZgzcwConstants.PAGE_LEAGUE_CUP);
		
		webPageFilter = new DownloadedWebPageFilter(types, 
				ZgzcwConstants.SOURCE_ZGZCW, 
				DateUtil.addDateNum(new Date(), - webPageConf.getDayNumOfGetPages()), null);
		webPageFilter.initialize();
	}

	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.data.ZgzcwBasePlugin#produce(com.loris.client.task.context.TaskPluginContext)
	 */
	@Override
	public void produce(TaskPluginContext context) throws IOException, SQLException
	{
		try
		{
			WebPage webPage = ZgzcwPageCreator.createZgzcwWebPage(ZgzcwConstants.PAGE_CENTER);
			if (!createTaskFromWebPage(context, webPage))
			{
				logger.warn("No task produce from WebPage: " + webPage.getName());
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			logger.warn("Warn: produce task list error info > " + e.getMessage());
		}
	}

}
