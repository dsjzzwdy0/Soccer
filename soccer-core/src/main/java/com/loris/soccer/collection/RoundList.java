/**  
 * All rights Reserved, Designed By www.loris.com
 * @Title:  RoundList.java   
 * @Package com.loris.soccer.collection   
 * @Description: 本项目用于天津东方足彩数据的存储、共享、处理等   
 * @author: 东方足彩    
 * @date:   2019年1月28日 下午8:59:32   
 * @version V1.0.0
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司传阅，禁止外泄以及用于其他的商业目
 */
package com.loris.soccer.collection;

import com.loris.soccer.collection.base.DataList;
import com.loris.soccer.model.Round;

/**   
 * @ClassName:  RoundList    
 * @Description: 联赛比赛的轮次数据  
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 *     
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
public class RoundList extends DataList<Round>
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * 通过联赛编号、赛季、轮次等数据获得轮次数据
	 * @param lid
	 * @param season
	 * @param round
	 * @return
	 */
	public Round getRound(String lid, String season, String round)
	{
		for(Round r : this)
		{
			if(r.equals(lid, season, round)) return r;
		}
		return null;
	}
}
