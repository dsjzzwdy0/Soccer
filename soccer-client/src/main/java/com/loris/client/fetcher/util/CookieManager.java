/*
 * @Author Irakli Nadareishvili
 * CVS-ID: $Id: CookieManager.java,v 1.1 2004/11/30 22:47:42 idumali Exp $
 *
 * Copyright (c) 2004 Development Gateway Foundation, Inc. All rights reserved.
 * This program and the accompanying materials are made available under the
 * terms of the Common Public License v1.0 which accompanies this
 * distribution, and is available at:
 * http://www.opensource.org/licenses/cpl.php
 *
 *****************************************************************************/
package com.loris.client.fetcher.util;

import java.net.MalformedURLException;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.net.URL;

import org.apache.commons.httpclient.Cookie;
import org.apache.commons.httpclient.HttpState;
import org.apache.commons.httpclient.cookie.CookiePolicy;
import org.apache.log4j.Logger;


/**
 *
 * <p>
 * Non-persistent cookie manager class. Cookies are kept
 * in-memory, only while the Crawler runs.
 * </p>
 *
 */
public class CookieManager
{

	private static Logger logger = Logger.getLogger(CookieManager.class);

	static
	{
		cookies = new HashMap<String, Collection<Cookie>>();
	}

	/**
	 * All cookies. Contains pair: domain - <code>list</code>. Where
	 * <code>list</code>
	 * is a collection of all cookies for that domain
	 */
	private static Map<String, Collection<Cookie>> cookies;

	/** Add a cookie to the cookie manager */
	public static void addCookie(Cookie cookie)
	{
		synchronized (Monitor.cookieWatch)
		{
			Collection<Cookie> domainCookies = getDomainCookies(cookie.getDomain());
			if (domainCookies == null)
			{
				domainCookies = Collections.synchronizedSet(new HashSet<Cookie>());
			}

			domainCookies.add(cookie);

			cookies.put(cookie.getDomain(), domainCookies);
		}
		logger.debug("Registering cookie " + cookie + " for domain " + cookie.getDomain());
	}

	/** Return all cookies for a particular domain */
	private static Collection<Cookie> getDomainCookies(String domain)
	{
		return (Collection<Cookie>) cookies.get(domain);
	}

	@SuppressWarnings("deprecation")
	public static HttpState getHttpState(String urlString)
	{
		HttpState httpState = new HttpState();

		// We agreed that cookie domains always begin with a dot.
		String domain = null;
		try
		{
			domain = new URL(urlString).getHost();

			Collection<Cookie> domainCookies;
			Cookie curCookie;

			synchronized (Monitor.cookieWatch)
			{
				domainCookies = getDomainCookies(domain);
			}
			if (domainCookies != null)
			{
				Iterator<Cookie> it = domainCookies.iterator();
				while (it.hasNext())
				{
					curCookie = (Cookie) it.next();
					httpState.addCookie(curCookie);
				}
			}

			httpState.setCookiePolicy(CookiePolicy.RFC2109);
		}
		catch (MalformedURLException ex)
		{
			logger.warn("Could not get domain for URL:" + urlString);
		}
		logger.debug("HTTP State for URL: " + urlString + "(" + domain + ") is :" + httpState.toString());
		return httpState;
	}

	public static void printAllCookies()
	{
		synchronized (Monitor.cookieWatch)
		{
			Set<String> set = cookies.keySet();

			if (set != null)
			{
				Iterator<String> it = set.iterator();

				while (it.hasNext())
				{
					String key = (String) it.next();
					logger.debug("Domain: " + key);

					Collection<Cookie> list = (Collection<Cookie>) cookies.get(key);
					Cookie cookie;

					if (list != null)
					{
						Iterator<Cookie> it2 = list.iterator();
						while (it2.hasNext())
						{
							cookie = (Cookie) (it2.next());
							printCookie(cookie);
						}
					}
				}
			}
		}

	}

	public static void printCookie(Cookie cookie)
	{
		logger.debug("   " + " Comment " + cookie.getComment() + " Domain " + cookie.getDomain() + " Date "
				+ cookie.getExpiryDate() + " Name " + cookie.getName() + " Value " + cookie.getValue() + " Path "
				+ cookie.getPath() + " Secure " + cookie.getSecure() + " Version " + cookie.getVersion() + "");

	}

}
