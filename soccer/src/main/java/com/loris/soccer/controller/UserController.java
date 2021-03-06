/**  
 * All rights Reserved, Designed By www.loris.com
 * @Title:  UserController.java   
 * @Package com.loris.soccer.controller   
 * @Description: 本项目用于天津东方足彩数据的存储、共享、处理等   
 * @author: 东方足彩    
 * @date:   2019年1月28日 下午8:38:55   
 * @version V1.0.0
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司传阅，禁止外泄以及用于其他的商业目
 */
package com.loris.soccer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.loris.common.web.BaseController;
import com.loris.common.web.wrapper.Rest;
import com.loris.soccer.model.OddsOp;
import com.loris.soccer.service.OddsService;


/**   
 * @ClassName:  UserController   
 * @Description: 用户信息管理控制器类 
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:38:55   
 *     
 * @Copyright: 2019 www.tydic.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController
{
	@Autowired
	private OddsService oddsService;
	
	/**
	 * 主页登录
	 * @param model
	 * @return
	 */
	@RequestMapping("/login")
	public String login(Model model)
	{
		model.addAttribute("user", "no");
		return "login";
	}
	
	@RequestMapping("/test/{page}")
	public String test(@PathVariable String page, Model model)
	{
		model.addAttribute("user", "TestUser");
		model.addAttribute("page", page);
		return "/user/test";
	}
	
	@ResponseBody
	@RequestMapping("/submit")
	public Rest submitOddsOp()
	{
		OddsOp op = new OddsOp();
		op.setWinodds(3.1f);
		op.setDrawodds(2.3f);
		op.setLoseodds(1.4f);
		
		oddsService.save(op);
		return Rest.okData(op);
	}
	
	@ResponseBody
	@RequestMapping("/users")
	public Rest getAllUsers()
	{
		List<OddsOp> ops = oddsService.selectOddsOp("10");
		return Rest.okData(ops);
	}
	
	@ResponseBody
	@RequestMapping("/update")
	public Rest updateUsers()
	{
		oddsService.updateOpList();
		return Rest.ok();
	}
}
