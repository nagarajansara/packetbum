package com.truck.util;



import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;



public class ConstProp 
{
	public static Properties prop = new Properties();
	
	private static final Logger LOGGER = Logger.getLogger(ConstProp.class);
	
	public final static String propFileName = "truck.properties"; 

	public final static String ITEM_IMAGE_PATH = "item_image_path";
	public final static String ITEM_IMAGE_DB_PATH = "item_image_db_path";
	public final static String FREEMARKER_TEMPLATE_LOADING_PATH = "freemarker_template_loading_path";
	public final static String GET_E24PP_CGN_PATH = "e24PP_cgn_path";
	public final static String GET_E24PP_DATABASE_HOST = "e24PP_database_host";
	public final static String GET_E24PP_DATABASE_PORT = "e24PP_database_port";
	public final static String GET_E24PP_DATABASE_NAME = "e24PP_database_name";
	public final static String GET_E24PP_DATABASE_USER_NAME = "e24PP_database_user";
	public final static String GET_E24PP_DATABASE_PASSWORD = "e24PP_database_password";
	public final static String GET_E24PP_DATABASE_TABLE_NAME = "e24PP_table_name";
	public final static String GET_E24PP_TERMINAL_ALIAS = "e24PP_terminal_alias";
	public final static String GET_E24PP_SUCCESS_RESPONSE_URL = "e24PP_payment_success_response_URL";
	public final static String GET_E24PP_ERROR_RESPONSE_URL = "e24PP_payment_error_response_URL";
	public final static String GET_E24PP_RECEIPT_URL = "e24PP_payment_recepit_URL";
	public final static String GET_SERVER_HOST = "server_host";
	public final static String GET_CONTEXT_PATH = "context_path";
	
	
	
	public static  InputStream inputStream = ConstProp.class.getClassLoader().getResourceAsStream(propFileName);
	
	static 
	{
		try
		{	
			 prop.load(inputStream);
		    if (inputStream == null) 
			{
		    	throw new FileNotFoundException("property file '" + propFileName + "' not found in the classpath");
		    }
		}
		catch(Exception ex)
		{
			LOGGER.error(ex.getMessage());
		}

	
	
	}
	public static String getItemImagePath()
	{
		return (String)prop.get(ITEM_IMAGE_PATH);
	}

	public static String getItemImageDbPath()
	{
		return (String)prop.get(ITEM_IMAGE_DB_PATH);
	}
	public static String getFreemarkerTemplateLoadingPath()
	{
		return (String)prop.get(FREEMARKER_TEMPLATE_LOADING_PATH);
	}
	public static String getE24PPCGNPath()
	{
		return (String)prop.get(GET_E24PP_CGN_PATH);
	}
	public static String getE24PPDatabaseHost()
	{
		return (String)prop.get(GET_E24PP_DATABASE_HOST);
	}
	public static String getE24PPDatabasePort()
	{
		return (String)prop.get(GET_E24PP_DATABASE_PORT);
	}
	public static String getE24PPDatabaseName()
	{
		return (String)prop.get(GET_E24PP_DATABASE_NAME);
	}
	public static String getE24PPDatabaseUsername()
	{
		return (String)prop.get(GET_E24PP_DATABASE_USER_NAME);
	}
	public static String getE24PPDatabasePassword()
	{
		return (String)prop.get(GET_E24PP_DATABASE_PASSWORD);
	}
	public static String getE24PPDatabaseTableName()
	{
		return (String)prop.get(GET_E24PP_DATABASE_TABLE_NAME);
	}
	public static String getE24PPTerminalAlias()
	{
		return (String)prop.get(GET_E24PP_TERMINAL_ALIAS);
	}
	public static String getE24PPSuccessResponseURL()
	{
		return (String)prop.get(GET_E24PP_SUCCESS_RESPONSE_URL);		
	}
	public static String getE24PPErrorResponseURL()
	{
		return (String)prop.get(GET_E24PP_ERROR_RESPONSE_URL);		
	}
	public static String getE24PPReceiptURL()
	{
		return (String)prop.get(GET_E24PP_RECEIPT_URL);		
	}
	public static String getServerHost()
	{
		return (String)prop.get(GET_SERVER_HOST);		
	}
	public static String getContextName()
	{
		return (String)prop.get(GET_CONTEXT_PATH);
	}
}
