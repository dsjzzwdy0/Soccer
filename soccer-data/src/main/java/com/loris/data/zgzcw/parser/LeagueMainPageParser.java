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
package com.loris.data.zgzcw.parser;

import org.jsoup.nodes.Document;

import com.loris.client.exception.WebParserException;
import com.loris.client.page.WebPage;
import com.loris.client.parser.impl.AbstractWebPageParser;
import com.loris.soccer.wrapper.TableRecords;

/**   
 * @ClassName:  League   
 * @Description: 主页数据的解析器 
 * @author: 东方足彩
 * @date:   2019年1月28日 下午8:59:32   
 *     
 * @Copyright: 2019 www.tydic.com Inc. All rights reserved. 
 * 注意：本内容仅限于天津东方足彩有限公司内部传阅，禁止外泄以及用于其他的商业目 
 */
public class LeagueMainPageParser extends AbstractWebPageParser
{

	/**
	 *  (non-Javadoc)
	 * @see com.loris.client.parser.impl.AbstractWebPageParser#parse(com.loris.client.page.WebPage, org.jsoup.nodes.Document, com.loris.soccer.wrapper.TableRecords)
	 */
	@Override
	public TableRecords parse(WebPage page, Document document, TableRecords results) throws WebParserException
	{
		return null;
	}
}
