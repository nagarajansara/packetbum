package com.truck.domain;

public class Starrating
{

	private int id;

	private int quoteid;

	private int numstar;

	private String username;

	private int completedjob;

	public int getCompletedjob()
	{
		return completedjob;
	}

	public void setCompletedjob(int completedjob)
	{
		this.completedjob = completedjob;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	private String comments;

	public int getOneStart()
	{
		return oneStart;
	}

	public void setOneStart(int oneStart)
	{
		this.oneStart = oneStart;
	}

	public int getTwoStart()
	{
		return twoStart;
	}

	public void setTwoStart(int twoStart)
	{
		this.twoStart = twoStart;
	}

	public int getThreeStart()
	{
		return threeStart;
	}

	public void setThreeStart(int threeStart)
	{
		this.threeStart = threeStart;
	}

	public int getFourStart()
	{
		return fourStart;
	}

	public void setFourStart(int fourStart)
	{
		this.fourStart = fourStart;
	}

	public int getFiveStart()
	{
		return fiveStart;
	}

	public void setFiveStart(int fiveStart)
	{
		this.fiveStart = fiveStart;
	}

	private int oneStart;
	private int twoStart;
	private int threeStart;
	private int fourStart;
	private int fiveStart;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public int getQuoteid()
	{
		return quoteid;
	}

	public void setQuoteid(int quoteid)
	{
		this.quoteid = quoteid;
	}

	public int getNumstar()
	{
		return numstar;
	}

	public void setNumstar(int numstar)
	{
		this.numstar = numstar;
	}

	public String getComments()
	{
		return comments;
	}

	public void setComments(String comments)
	{
		this.comments = comments;
	}

}
