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

import org.apache.commons.lang3.StringUtils;

import com.baomidou.mybatisplus.annotation.TableName;
import com.loris.common.bean.AutoIdEntity;

/**   
 * @ClassName:  League   
 * @Description: 联赛信息描述类  
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 *     
 * @Copyright: 2019 www.tydic.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
@TableName("soccer_league")
public class League extends AutoIdEntity
{
	/***/
	private static final long serialVersionUID = 1L;
	
	protected String lid;				//联赛编号
	protected String name;				//联赛名称
	protected String type;				//赛事类型： league（联赛）、cup（杯赛）
	protected String country;			//所属国家
	protected String continent;			//所属洲: 世界、亚洲、欧洲、美洲等
	protected String introduction;		//介绍
	
	public String getLid()
	{
		return lid;
	}
	public void setLid(String lid)
	{
		this.lid = lid;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getCountry()
	{
		return country;
	}
	public void setCountry(String country)
	{
		this.country = country;
	}
	public String getContinent()
	{
		return continent;
	}
	public void setContinent(String continent)
	{
		this.continent = continent;
	}
	public String getIntroduction()
	{
		return introduction;
	}
	public void setIntroduction(String introduction)
	{
		this.introduction = introduction;
	}
	
	/**
	 *  (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj)
	{
		if(obj == this)
		{
			return true;
		}
		if(obj == null || !(obj instanceof League))
		{
			return false;
		}
		return StringUtils.isNotBlank(lid) && lid.equalsIgnoreCase(((League)obj).getLid());
	}
	
	@Override
	public String toString()
	{
		return "League [lid=" + lid + ", name=" + name + ", type=" + type + ", country=" + country + ", continent="
				+ continent + ", id=" + id + "]";
	}
}
