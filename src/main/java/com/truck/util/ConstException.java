package com.truck.util;




public class ConstException extends Exception
{
    public static int ERR_CODE_SUCCESS = 200;
    public static int ERR_CODE_UNKNOWN = -1;
	public static int ERR_CODE_DB_ERROR = 2;
	public static int ERR_CODE_INVALID_LOGIN = 3;
	public static int ERR_CODE_INVALID_IMG_SIZE = 4;
	
    public static String ERR_MSG_SUCCESS = "Success";
	public static String ERR_MSG_INVALID_LOGIN = "InvalidLogin";
	public static String ERR_MSG_SESSION_EXP = "Session Expried";
	public static String ERR_MSG_INVALID_IMG_SIZE = "Image size is very large";
	
    int code = this.ERR_CODE_UNKNOWN;

	public ConstException()
	{
		super();
	}
	public ConstException(String msg)
	{
		super(msg);
	}
	public ConstException(int code, String msg)
    {
        super(msg);
        setCode(code);
    }
	public int getCode() 
    {
        return code;
    }
    public void setCode(int code) 
    {
        this.code = code;
    }
}

