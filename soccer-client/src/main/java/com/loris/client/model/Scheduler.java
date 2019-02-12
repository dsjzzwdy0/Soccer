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
package com.loris.client.model;

import java.util.ArrayList;
import java.util.List;

import com.loris.common.bean.AutoIdEntity;

/**   
 * @ClassName:  Scheduler  
 * @Description: 任务调度器状态信息
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 *     
 * @Copyright: 2019 www.tydic.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
public class Scheduler extends AutoIdEntity
{
	/** */
	private static final long serialVersionUID = 1L;

	private String name;
	private int threadIndex;
	private int maxActiveTaskThread;
	private int interval;
	private int randTimeSeed;
	private int type;
	private int total;			//总数
	private int leftsize;		//剩余数
	private int state;			//1表示处理完成、0表示创建、2表示暂停
	
	/** 插件数据 */
	private List<String> pluginClasses = new ArrayList<>();
	
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int getThreadIndex()
	{
		return threadIndex;
	}
	public void setThreadIndex(int threadIndex)
	{
		this.threadIndex = threadIndex;
	}
	public int getMaxActiveTaskThread()
	{
		return maxActiveTaskThread;
	}
	public void setMaxActiveTaskThread(int maxActiveTaskThread)
	{
		this.maxActiveTaskThread = maxActiveTaskThread;
	}
	public int getInterval()
	{
		return interval;
	}
	public void setInterval(int interval)
	{
		this.interval = interval;
	}
	public int getRandTimeSeed()
	{
		return randTimeSeed;
	}
	public void setRandTimeSeed(int randTimeSeed)
	{
		this.randTimeSeed = randTimeSeed;
	}
	public int getType()
	{
		return type;
	}
	public void setType(int type)
	{
		this.type = type;
	}
	public int getTotal()
	{
		return total;
	}
	public void setTotal(int total)
	{
		this.total = total;
	}
	public int getLeftsize()
	{
		return leftsize;
	}
	public void setLeftsize(int leftsize)
	{
		this.leftsize = leftsize;
	}
	public int getState()
	{
		return state;
	}
	public void setState(int state)
	{
		this.state = state;
	}
	
	public void setStatus(int total, int leftsize, int state)
	{
		this.total = total;
		this.leftsize = leftsize;
		this.state = state;
	}
	public List<String> getPluginClasses()
	{
		return pluginClasses;
	}
	public void setPluginClasses(List<String> pluginClasses)
	{
		this.pluginClasses = pluginClasses;
	}
	
	public void addPluginClass(String className)
	{
		pluginClasses.add(className);
	}
}
