/**  
 * All rights Reserved, Designed By www.loris.com
 * @Title:  Rest.java   
 * @Package com.loris.soccer.wrapper   
 * @Description: 本项目用于天津东方足彩数据的存储、共享、处理等   
 * @author: 东方足彩    
 * @date:   2019年1月28日 下午9:22:03   
 * @version V1.0.0
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司传阅，禁止外泄以及用于其他的商业目
 */
package com.loris.soccer.web.wrapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**   
 * @ClassName:  Rest   
 * @Description:TODO(这里用一句话描述这个类的作用)   
 * @author: 东方足彩
 * @date:   2019年1月28日 下午9:22:03   
 *     
 * @Copyright: 2019 www.tydic.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
public class Rest
{
	private int status;
	private boolean render;
	private String msg;
	private Object data;
	private int pages;
	private String url;
	private String details;

	public int getStatus()
	{
		return status;
	}

	public void setStatus(int status)
	{
		this.status = status;
	}

	public boolean isRender()
	{
		return render;
	}

	public void setRender(boolean render)
	{
		this.render = render;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public Object getData()
	{
		return data;
	}

	public void setData(Object data)
	{
		this.data = data;
	}

	public int getPages()
	{
		return pages;
	}

	public void setPages(int pages)
	{
		this.pages = pages;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public String getDetails()
	{
		return details;
	}

	public void setDetails(String details)
	{
		this.details = details;
	}

	public Rest(int status, boolean render, String msg, Object data, Integer pages, String url, String details)
	{
		super();
		this.status = status;
		this.render = render;
		this.msg = msg;
		this.data = data;
		this.pages = pages;
		this.url = url;
		this.details = details;
	}

	public Rest()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	public static Rest ok()
	{
		Rest rest = new Rest();
		rest.setStatus(200);
		rest.setMsg("操作成功");
		return rest;
	}

	public static Rest ok(String msg)
	{
		Rest rest = ok();
		rest.setMsg(msg);
		return rest;
	}

	public static Rest ok(String msg, String url)
	{
		Rest rest = ok();
		rest.setMsg(msg);
		rest.setUrl(url);
		return rest;
	}

	public static Rest okReload(String msg)
	{
		Rest rest = ok();
		rest.setMsg(msg);
		rest.setUrl("reload");
		return rest;
	}

	public static Rest okData(Object data)
	{
		Rest rest = ok();
		rest.setData(data);
		return rest;
	}

	public static Rest okList(List<?> list, int pages)
	{
		Rest rest = ok();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		rest.setData(map);
		rest.setPages(pages);
		return rest;
	}

	public static Rest failure(int status, String msg, Object data, String details)
	{
		Rest rest = new Rest();
		rest.setStatus(status);
		rest.setMsg(msg);
		rest.setData(data);
		rest.setDetails(details);
		return rest;
	}

	public static Rest failure(String msg)
	{
		Rest rest = new Rest();
		rest.setStatus(500);
		rest.setMsg(msg);
		return rest;
	}

}
