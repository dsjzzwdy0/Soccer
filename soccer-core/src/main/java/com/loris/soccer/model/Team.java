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
package com.loris.soccer.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.loris.common.bean.AutoIdEntity;

/**   
 * @ClassName:  League   
 * @Description: 球队数据类   
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 *     
 * @Copyright: 2019 www.tydic.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
@TableName("soccer_team")
public class Team extends AutoIdEntity
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected String tid;			//球队编号
	protected String name;			//球队名称
	protected String country;		//所属国家
	public String getTid()
	{
		return tid;
	}
	public void setTid(String tid)
	{
		this.tid = tid;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getCountry()
	{
		return country;
	}
	public void setCountry(String country)
	{
		this.country = country;
	}
}
