/**  
 * All rights Reserved, Designed By www.loris.com
 * @Title:  MenuTree.java   
 * @Package com.loris.auth.model.view   
 * @Description: 本项目用于天津东方足彩数据的存储、共享、处理等   
 * @author: 东方足彩    
 * @date:   2019年1月28日 下午8:59:32   
 * @version V1.0.0
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司传阅，禁止外泄以及用于其他的商业目
 */
package com.loris.auth.model.view;

import com.baomidou.mybatisplus.annotation.TableName;
import com.loris.auth.model.node.MenuNode;

/**   
 * @ClassName:  MenuTree    
 * @Description: 菜单数据树结构 
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 *     
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
@TableName("sys_menu_node")
public class MenuNodeEntity extends MenuNode
{
	private String roleid;

	public String getRoleid()
	{
		return roleid;
	}

	public void setRoleid(String roleid)
	{
		this.roleid = roleid;
	}
}
