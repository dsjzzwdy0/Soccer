/**  
 * All rights Reserved, Designed By www.loris.com
 * @Title:  BaseController.java   
 * @Package com.loris.common.controller   
 * @Description: 本项目用于天津东方足彩数据的存储、共享、处理等   
 * @author: 东方足彩    
 * @date:   2019年1月28日 下午8:59:32   
 * @version V1.0.0
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司传阅，禁止外泄以及用于其他的商业目
 */
package com.loris.soccer.controller;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import com.loris.common.bean.LoginUser;
import com.loris.soccer.constant.SoccerConstants;
import com.loris.soccer.controller.util.CookieUtils;

/**   
 * @ClassName:  BaseController    
 * @Description: 基础控制Controller控制器
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 *     
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
public class BaseController
{
	
	/**
	 * 获得当前登录用户对象
	 * 
	 * @return
	 */
	public LoginUser getCurrentUser(HttpServletRequest request) 
	{
		LoginUser user = (LoginUser) request.getSession().getAttribute(SoccerConstants.SOCCER_SESSION_USER);
		return user;
	}
	
	/**
	 * 使用httpSession设置当前登录用户
	 * 
	 * @param user
	 * @param session
	 * @return
	 */
	public LoginUser setCurrentUser(LoginUser user, HttpServletRequest request)
	{
		request.getSession().setAttribute(SoccerConstants.SOCCER_SESSION_USER, user);
		return user;
	}
	
	/**
	 * 清除当前登录用户
	 * 
	 * @param user
	 * @return
	 */
	public void clearCurrentUser(HttpServletRequest request) 
	{
		request.getSession().setAttribute(SoccerConstants.SOCCER_SESSION_USER, null);
	}
	
	/**
	 * 使用httpSession设置当前登录时间
	 * 
	 * @param user
	 * @return
	 */
	public void setLoginTime(HttpServletRequest request) 
	{
		request.getSession().setAttribute(SoccerConstants.SOCCER_SESSION_LOGINTIME, new Date());
	}

	/**
	 * 获得当前登录时间
	 */
	public Date getLoginTime(HttpServletRequest request)
	{
		return (Date) request.getSession().getAttribute(SoccerConstants.SOCCER_SESSION_LOGINTIME);
	}
	
	/**
	 * 获得用户ip地址
	 * 
	 * @return
	 */
	public String getCurrentIp(HttpServletRequest request)
	{
		return request.getRemoteAddr();
	}
	
	/**
	 * 设置一个保存30天的cookie
	 * 
	 * @param cookieName
	 * @param value
	 */
	public void setCookie(String cookieName, String value, HttpServletResponse response)
	{
		Cookie cookie = new Cookie(cookieName, value);
		int expireday = 60 * 60 * 24 * 30; // 不设置的话，则cookies不写入硬盘,而是写在内存,只在当前页面有用,以秒为单位
		cookie.setMaxAge(expireday);
		response.addCookie(cookie);
	}

	/**
	 * 删除一个cookie
	 * 
	 * @param cookieName
	 * @param value
	 */
	public void delCookie(String cookieName, HttpServletRequest request, HttpServletResponse response)
	{
		CookieUtils.delCookie(request, response, cookieName);
	}
	
	/**
	 * 获得Cookie的值
	 * @param cookieName Cookie的名称
	 * @return Cookie的值
	 */
	public String getCookieValue(String cookieName, HttpServletRequest request)
	{
		Cookie cookie = CookieUtils.getCookie(request, cookieName);
		return cookie == null ? null : cookie.getValue();
	}
	
	/**
	 * 错误信息的处理
	 * @param result 错误信息
	 * @return 信息表
	 */
	public Map<String, String> errorInfos(BindingResult result)
	{
		if(result.hasErrors())
		{
			Map<String, String> errorInfoMap = new LinkedHashMap<>();
			for (FieldError error : result.getFieldErrors())
			{
				errorInfoMap.put(error.getField(), error.getDefaultMessage());
			}
			return errorInfoMap;
		}
		return null;
	}
}
