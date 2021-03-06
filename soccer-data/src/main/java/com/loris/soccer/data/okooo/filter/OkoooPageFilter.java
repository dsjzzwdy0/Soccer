/**  
 * All rights Reserved, Designed By www.loris.com
 * @Title:  @OkoooPageFilter.java   
 * @Package com.loris.soccer.data.okooo.filtercom.loris.soccer.model   
 * @Description: 本项目用于天津东方足彩数据的存储、共享、处理等   
 * @author: 东方足彩    
 * @date:   2019年1月28日 下午8:59:32   
 * @version V1.0.0
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司传阅，禁止外泄及用于其他的商业目的
 */
package com.loris.soccer.data.okooo.filter;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import com.loris.client.model.WebPage;
import com.loris.soccer.filter.WebPageFilter;
import com.loris.soccer.model.base.MatchItem;

/**   
 * @ClassName:  OkoooPageFilter.java   
 * @Description: 澳客网页面的过滤器 
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 *     
 * @Copyright: 2019 www.tydic.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄及用于其他的商业目的 
 */
public class OkoooPageFilter extends WebPageFilter
{
	/**
	 *  (non-Javadoc)
	 * @see com.loris.soccer.filter.WebPageFilter#accept(com.loris.client.model.WebPage, java.lang.Object)
	 */
	@Override
	public <T> boolean accept(WebPage page, T source)
	{
		//不是澳客的数据下载器，则不能进行处理
		if(!StringUtils.equals(page.getSource(), this.getSource()))
		{
			return false;
		}
		
		//比赛数据
		if(source instanceof MatchItem)
		{
			Date matchtime = ((MatchItem)source).getMatchtime();
			if(matchtime == null) return false;
			if(start != null)
				if(start.getTime() >= matchtime.getTime()) return false;
			if(end != null)
				if(end.getTime() <= matchtime.getTime()) return false;
		}
		return true;
	}
}
