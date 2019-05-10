/**  
 * All rights Reserved, Designed By www.loris.com
 * @Title:  DataReciever.java   
 * @Package com.loris.client.sender   
 * @Description: 本项目用于天津东方足彩数据的存储、共享、处理等   
 * @author: 东方足彩    
 * @date:   2019年1月28日 下午8:59:32   
 * @version V1.0.0
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司传阅，禁止外泄以及用于其他的商业目
 */
package com.loris.client.sender;

import com.alibaba.fastjson.JSONException;
import com.loris.client.exception.DataRecieveException;

/**   
 * @ClassName:  DataReciever    
 * @Description: 数据接收器   
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 *     
 * @Copyright: 2019 www.loris.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
public interface DataReciever
{
	/**
	 * 数据接收处理器
	 * @param json
	 * @return
	 * @throws JSONException
	 */
	boolean recieve(String text) throws DataRecieveException;
}
