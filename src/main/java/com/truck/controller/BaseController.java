package com.truck.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.truck.domain.Users;
import com.truck.util.ConstException;

public class BaseController
{

	private final String ATTR_USER_ID = "userId";
	public final String ATTR_NAME = "username";
	public final String ATTR_EMAIL = "email";
	public final String ATTR_ROLE = "role";
	public final String ATTR_PROFILE_IMG = "profileimage";

	public void setUserSession(HttpServletRequest request, Users users)
			throws ConstException
	{

		HttpSession session = request.getSession();
		session.setAttribute(ATTR_NAME, users.getUsername());
		session.setAttribute(ATTR_ROLE, users.getRole());
		/*
		 * session.setAttribute(ATTR_USER_ID, users.getId());
		 * session.setAttribute(ATTR_ROLE, users.getRole());
		 * session.setAttribute(ATTR_NAME, users.getUsername());
		 * session.setAttribute(ATTR_EMAIL, users.getEmail());
		 */
		// session.setAttribute(ATTR_PROFILE_IMG, users.getProfileimage());

	}

	public void createSession(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		if (session.isNew())
		{
			System.out.print("New session created");

		}
		else
		{
			System.out.print("old session ");
		}
	}

	public void setSessionAttr(HttpServletRequest request, String sessionid,
			String value) throws ConstException
	{

		HttpSession session = request.getSession();

		session.setAttribute(sessionid, value);

		// session.setAttribute(ATTR_PROFILE_IMG, users.getProfileimage());

	}

	public void setSessionAttr(HttpServletRequest request, String sessionid,
			List<String> value) throws ConstException
	{

		HttpSession session = request.getSession();

		session.setAttribute(sessionid, value);

		// session.setAttribute(ATTR_PROFILE_IMG, users.getProfileimage());

	}

	public void removeSessionAttr(HttpServletRequest request, String sessionid)
			throws ConstException
	{

		HttpSession session = request.getSession();

		session.removeAttribute(sessionid);

		// session.setAttribute(ATTR_PROFILE_IMG, users.getProfileimage());

	}

	public int getUserId(HttpServletRequest request) throws ConstException
	{
		int userId = 0;
		HttpSession session = request.getSession();
		if (session != null)
		{
			Object obj = session.getAttribute(ATTR_USER_ID);
			if (obj != null)
			{
				userId = ((Integer) obj).intValue();
			}
		}

		if (userId == 0)
		{
			throw new ConstException(ConstException.ERR_CODE_INVALID_LOGIN,
					ConstException.ERR_MSG_SESSION_EXP);
		}
		return userId;
	}

	public void setProfileImageSession(HttpServletRequest request, String url)
			throws ConstException
	{
		HttpSession session = request.getSession();
		Object profileImageUrl = url;
		if (session != null)
		{
			session.setAttribute(ATTR_PROFILE_IMG, profileImageUrl);
		}
	}

	public String getRole(HttpServletRequest request) throws ConstException
	{
		String role = null;
		HttpSession session = request.getSession();
		if (session != null)
		{
			Object obj = session.getAttribute(ATTR_ROLE);
			if (obj != null)
			{
				role = (String) obj;
			}
		}
		if (role == null)
		{
			throw new ConstException(ConstException.ERR_CODE_INVALID_LOGIN,
					ConstException.ERR_MSG_SESSION_EXP);
		}
		return role;
	}

	public Object getSessionAttr(HttpServletRequest request, String attr)
			throws ConstException
	{
		HttpSession session = request.getSession();
		String attrVal = null;
		if (session != null)
		{
			Object obj = session.getAttribute(attr);
			if (obj != null)
			{
				attrVal = ((String) obj);
			}
		}
		if (attrVal == null)
		{
			throw new ConstException(ConstException.ERR_CODE_INVALID_LOGIN,
					ConstException.ERR_MSG_SESSION_EXP);
		}
		return attrVal;
	}

	public void destroySession(HttpServletRequest request)
			throws ConstException
	{
		HttpSession session = request.getSession(false);
		if (session != null)
		{
			session.invalidate();
		}
	}

	public int getStartIdx(int currPage, int maxEntriesPerPage)
			throws ConstException
	{
		return (currPage * maxEntriesPerPage);
	}
}
