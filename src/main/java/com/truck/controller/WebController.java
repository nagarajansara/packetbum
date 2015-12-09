package com.truck.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.truck.dao.OrderDAO;
import com.truck.dao.ProductDAO;
import com.truck.dao.VehicleDAO;
import com.truck.dao.WebDAO;
import com.truck.domain.Boatitem;
import com.truck.domain.Caritem;
import com.truck.domain.Common;
import com.truck.domain.Fragilegoodsitem;
import com.truck.domain.Furnitureitem;
import com.truck.domain.Generalitem;
import com.truck.domain.Haulageitem;
import com.truck.domain.Items;
import com.truck.domain.Livestockitem;
import com.truck.domain.Messages;
import com.truck.domain.Motorcyclesitem;
import com.truck.domain.Otheritem;
import com.truck.domain.Starrating;
import com.truck.domain.Userdetails;
import com.truck.domain.Users;
import com.truck.domain.Vechicleandparts;
import com.truck.domain.Vechicleowner;
import com.truck.mailservice.MailService;
import com.truck.mapper.CountryMaster;
import com.truck.security.Encryption;
import com.truck.util.ConstException;
import com.truck.util.ConstProp;
import com.truck.util.Crawl;
import com.truck.util.GoogleGeoCode;
import com.truck.util.TruckUtil;

@Controller
public class WebController extends BaseController
{
	private static final Logger LOGGER = Logger.getLogger(WebController.class);

	@Autowired
	private WebDAO webdao;

	@Autowired
	private OrderDAO orderdao;

	@Autowired
	private ProductDAO productdao;

	@Autowired
	private VehicleDAO vehicledao;

	String saveDirectory = ConstProp.getItemImagePath();

	String commonImageName = "";

	String webPath = "http://" + ConstProp.getServerHost() + "/"
			+ ConstProp.getContextName(); // Need to modify NTM

	Encryption encpSha = new Encryption();

	private final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	Date date = new Date();

	// protected AuthenticationManager authenticationManager;
	@Autowired
	@Qualifier("truckAuthManager")
	// @Autowired
	// @Qualifier("org.springframework.security.authenticationManager")
	private AuthenticationManager authenticationManager;

	@RequestMapping(value =
	{ "/login" }, method = RequestMethod.GET)
	public String login(@ModelAttribute("model") ModelMap model,
			Integer login_error, Integer login)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		return "login";
	}

	@RequestMapping(value =
	{ "/pay" }, method = RequestMethod.GET)
	public ModelAndView paypage(@ModelAttribute("model") ModelMap model,
			String qid, String amount, Integer id)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());
		String ConfirmationID =
				orderdao.generateConfirmationIDByUser(userid, qid, amount);
		responseMap.put("ConfirmationID", ConfirmationID);
		responseMap.put("curpage", "pay");
		responseMap.put("curDate",
				TruckUtil.getCurrentDateCustomFormat("dd-MMM-yyyy"));
		responseMap.put("amount", Integer.parseInt(amount) / 10);
		responseMap.put("retrieveItem", webdao.getItem(id));
		return new ModelAndView("pay", "model", responseMap);

	}

	@RequestMapping(value =
	{ "/purchase" }, method = RequestMethod.GET)
	public ModelAndView activationpage(@ModelAttribute("model") ModelMap model,
			String ConfirmationID)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		responseMap.put("ConfirmationID", ConfirmationID);

		responseMap.put("orderdata", orderdao.getOrder(ConfirmationID));

		return new ModelAndView("purchase", "model", responseMap);

	}

	@RequestMapping(value =
	{ "/confirm94en7f" }, method = RequestMethod.GET)
	public ModelAndView activationpage(@ModelAttribute("model") ModelMap model,
			String ConfirmationID, String ConfirmationSignature,
			String TARIFFICATIONERROR)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		orderdao.updateOrder(ConfirmationID, ConfirmationSignature,
				TARIFFICATIONERROR);

		return new ModelAndView("confirm94en7f", "model", responseMap);

	}

	@RequestMapping(value =
	{ "/activation" }, method = RequestMethod.GET)
	public ModelAndView activationpage(@ModelAttribute("model") ModelMap model,
			String token1, String token2, HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		LOGGER.info("token1-" + TruckUtil.base64UrlDecode(token1));
		LOGGER.info("token2-" + token2);
		int id = productdao.checkUserExits(TruckUtil.base64UrlDecode(token1));

		try
		{
			webdao.ActiveAccountByToken(token2, String.valueOf(id));
			responseMap.put("login", "true");
			LOGGER.info("Your Account Active Successfully");
			responseMap.put("message", "Your Account Active Successfully");
		} catch (Exception e)
		{
			LOGGER.info("Your Session is closed");
		}
		Locale locale = LocaleContextHolder.getLocale();
		responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		responseMap.put("curpage", "activation");

		return new ModelAndView("index", "model", responseMap);

	}

	@RequestMapping(value =
	{ "/index" }, method = RequestMethod.GET)
	public ModelAndView indexpage(@ModelAttribute("model") ModelMap model,
			Integer login_error, HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		commonImageName = "tel";
		LOGGER.info("Going to create new Great app" + commonImageName);

		String login = "3";

		try
		{
			login = request.getParameter("login");

			if (Integer.parseInt(login) == 0)
			{
				responseMap.put("loginError", "failed");
				responseMap.put("loginMsg", " ");
			} else if (Integer.parseInt(login) == 1)
			{
				responseMap.put("loginError", "failed");
				responseMap.put("loginMsg", "true");
			}

		} catch (Exception e)
		{

		}

		// System.out.println(System.getProperty("catalina.home"));
		// String result = this.context.getRealPath("");
		createSession(request);
		try
		{
			setSessionAttr(request, "targeturl", "null");
			String username = (String) getSessionAttr(request, "username");
			String role = (String) getSessionAttr(request, "role");
			if (username != null)
			{
				responseMap.put("username", username);
				responseMap.put("role", role);
			}
		} catch (ConstException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		responseMap.put("curpage", "home");

		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		responseMap.put("retrieveRecentDelivery",
				webdao.retriveRecentDeliverys());
		responseMap.put("retrieveCountry", webdao.retrieveCountries());
		return new ModelAndView("index", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/qfurniture" }, method = RequestMethod.GET)
	public String qfurniturepage(@ModelAttribute("model") ModelMap model,
			Integer login_error, Integer login)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");

		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		return "qfurniture";

	}

	@RequestMapping(value =
	{ "/qfurniture" }, method = RequestMethod.POST)
	public ModelAndView qfurniture(
			@ModelAttribute("furnitureform") Furnitureitem furnitureitem,
			HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		String saveDirectory = ConstProp.getItemImagePath();

		int formCount = Integer.parseInt(request.getParameter("numForms"));

		LOGGER.info("formCount:" + formCount);

		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		// String saveDirectory =
		// "/usr/local/tomcat7/webapps/upload/truck/images/furniture/";

		String serverPath = ConstProp.getItemImageDbPath();

		LOGGER.info("image:" + furnitureitem.getDescription());
		MultipartFile photoFiles = furnitureitem.getPhotosmultipart();
		String fileName =
				TruckUtil.getUUID() + "-F" + photoFiles.getOriginalFilename();

		System.out.println("image:" + photoFiles.getOriginalFilename());

		TruckUtil.uploadFiles(photoFiles, saveDirectory, fileName);

		furnitureitem.setPhotos(saveDirectory + fileName);
		// long furnitureid=webdao.addFurniture(furnitureitem);

		// adding dummy variable

		long furnitureid = 0;

		LOGGER.info("furnitureid-" + furnitureid);
		int getUserid;
		try
		{
			getUserid = productdao.checkUserExits(furnitureitem.getEmail());
		} catch (EmptyResultDataAccessException e)
		{
			LOGGER.info("empty:" + e.getMessage());
			getUserid = 0;
		}
		UsernamePasswordAuthenticationToken auth;

		LOGGER.info("userid" + getUserid);
		Boolean isAthenticateByServer = false;
		Users users = new Users();
		if (getUserid == 0)
		{
			users.setUsername(users.getEmail());
			Encryption ecncode = new Encryption();
			// users.setPassword(ecncode.encode(String.valueOf(123),
			// furnitureitem.getEmail()));

			users.setPassword(String.valueOf(123));
			users.setEmail(furnitureitem.getEmail());
			getUserid = (int) productdao.addProductOwner(users);
			LOGGER.info("new userid" + getUserid);

			String content =
					"<p> Thank you for Register with us please keep the username,password safe</p><br>"
							+

							"<p>Login ID:"
							+ users.getEmail()
							+ "</p><br>"
							+ "<p>PASSWORD:123</p><br>";

			MailService.sendMail("connecttosavan@gmail.com", users.getEmail(),
					"Registration", content);
			// authenticateUserAndSetSession(users, request);
			LOGGER.info("user mail:" + users.getEmail());
			LOGGER.info("pass-:" + users.getPassword());
			auth =
					new UsernamePasswordAuthenticationToken(users.getEmail(),
							123);
			authenticationManager.authenticate(auth);
			if (SecurityContextHolder.getContext().getAuthentication()
					.isAuthenticated())
			{
				SecurityContextHolder.getContext().setAuthentication(auth);
				isAthenticateByServer = true;
			}
			LOGGER.info("isAthenticateByServer:" + isAthenticateByServer);
			LOGGER.info("isAthenticateBy-:"
					+ SecurityContextHolder.getContext().getAuthentication()
							.isAuthenticated());
			LOGGER.info("isAthenticate -:"
					+ SecurityContextHolder.getContext().getAuthentication()
							.getName());

		}
		String[] collatlongValue =
				GoogleGeoCode.getLatLong(furnitureitem.getColpostcode() + ""
						+ furnitureitem.getColcountry());

		String[] dellatlongValue =
				GoogleGeoCode.getLatLong(furnitureitem.getDelpostcode() + ""
						+ furnitureitem.getDelcountry());

		String colLat = null, colLong = null, delLat = null, delLong = null, coladdress =
				null, deladdress = null;

		// getting Lattitute,Longtitue value For Collection Country
		colLat = collatlongValue[0];
		colLong = collatlongValue[1];
		coladdress = collatlongValue[2];

		// getting Lattitute,Longtitue value For Delivery Country

		delLat = dellatlongValue[0];
		delLong = dellatlongValue[1];
		deladdress = dellatlongValue[2];

		String GoogleMap =
				"http://maps.googleapis.com/maps/api/staticmap?size=250x253&maptype=roadmap&markers=color:green|label:|"
						+ colLat
						+ ","
						+ colLong
						+ "&markers=color:red|color:red|label:|"
						+ delLat
						+ ","
						+ delLong
						+ "&path=color:0x0000ff|weight:5|"
						+ colLat
						+ ","
						+ colLong
						+ "|"
						+ delLat
						+ ","
						+ delLong
						+ "&sensor=false&language=en";

		Items item = new Items();
		item.setDescription(furnitureitem.getDescription());
		item.setPhotos(serverPath + fileName);
		item.setMillage(String.valueOf((int) TruckUtil.distance(
				Double.parseDouble(colLat), Double.parseDouble(colLong),
				Double.parseDouble(delLat), Double.parseDouble(delLong), 'K')));
		item.setColcountry(String.valueOf(CountryMaster.COUNTRYMASTER_MAP
				.get(furnitureitem.getColcountry())));
		item.setColpostcode(furnitureitem.getColpostcode());
		item.setDelcountry(String.valueOf(CountryMaster.COUNTRYMASTER_MAP
				.get(furnitureitem.getDelcountry())));
		item.setDelpostcode(furnitureitem.getDelpostcode());
		item.setItemdetailsid((int) furnitureid);
		item.setUserid(10);
		item.setMap(GoogleMap);
		item.setColaddress(coladdress);
		item.setDeladdress(deladdress);
		item.setItemtypeid(1);
		long itemid = webdao.addItems(item);
		// /webdao.addFurniture(furnitureitem);

		furnitureitem.setItemid((int) itemid);
		webdao.addFurniture(furnitureitem);
		for (int i = 2; i < formCount; i++)
		{

			furnitureitem.setDescription(request.getParameter("description_"
					+ i));
			furnitureitem.setLength(request.getParameter("length_" + i));
			furnitureitem.setItem_length_un(request
					.getParameter("item_length_un_" + i));
			furnitureitem.setHeight(request.getParameter("height" + i));
			furnitureitem.setItem_height_un(request
					.getParameter("item_height_un_" + i));
			furnitureitem.setWidth(request.getParameter("width_" + i));
			furnitureitem.setItem_width_un(request
					.getParameter("item_width_un_" + i));
			furnitureitem.setWeight(request.getParameter("weight_" + i));
			furnitureitem.setItem_weight_un(request
					.getParameter("item_weight_un_" + i));

			webdao.addFurniture(furnitureitem);
			// System.out.println("value"+request.getParameter("description_"+i));
		}

		LOGGER.info("GoogleMap-" + GoogleMap);
		responseMap.put("retrieveItems", webdao.retriveItems());
		responseMap.put("curpage", "listitem");
		// return "pro/listitem";
		if (isAthenticateByServer)
		{
			return new ModelAndView("listitem", "model", responseMap);
		}
		return new ModelAndView("listitem", "model", responseMap);

	}

	@RequestMapping(value =
	{ "/listitem" }, method = RequestMethod.GET)
	public ModelAndView listitempage(@ModelAttribute("model") ModelMap model,
			HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		int page = 1;

		try
		{
			page = Integer.parseInt(request.getParameter("page"));

			LOGGER.info("count" + page);

		} catch (Exception e)
		{
			page = 1;
		}

		responseMap.put("retrieveItems", webdao.retriveItems(page, 10));

		responseMap.put("retrieveUpgradeItems", webdao.retriveUpgradeItems());

		int totalcount = webdao.getItemTotalCount();

		responseMap.put("totalcount", totalcount);

		int c = totalcount / 10;

		if ((totalcount % 10) != 0)
			c++;
		responseMap.put("totalpages", c);

		responseMap.put("page", page);
		String role = "";
		// NTM
		try
		{
			setSessionAttr(request, "targeturl", "null");
			String username = (String) getSessionAttr(request, "username");
			role = (String) getSessionAttr(request, "role");
			if (username != null)
			{
				responseMap.put("username", username);
				responseMap.put("role", role);
			}
		} catch (ConstException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		responseMap.put("curpage", "listitem");
		responseMap.put("role", role);

		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/hwtowrk" }, method = RequestMethod.GET)
	public ModelAndView htWrk(@ModelAttribute("model") ModelMap model,
			HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		commonImageName = "tel";
		LOGGER.info("Going to create new Great app" + commonImageName);

		String login = "3";

		try
		{
			login = request.getParameter("login");

			if (Integer.parseInt(login) == 0)
			{
				responseMap.put("loginError", "failed");
				responseMap.put("loginMsg", " ");
			} else if (Integer.parseInt(login) == 1)
			{
				responseMap.put("loginError", "failed");
				responseMap.put("loginMsg", "true");
			}

		} catch (Exception e)
		{

		}

		// System.out.println(System.getProperty("catalina.home"));
		// String result = this.context.getRealPath("");
		createSession(request);
		try
		{
			setSessionAttr(request, "targeturl", "null");
			String username = (String) getSessionAttr(request, "username");
			String role = (String) getSessionAttr(request, "role");
			if (username != null)
			{
				responseMap.put("username", username);
				responseMap.put("role", role);
			}
		} catch (ConstException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		responseMap.put("curpage", "home");

		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		responseMap.put("retrieveRecentDelivery",
				webdao.retriveRecentDeliverys());
		// return "index";

		return new ModelAndView("hwtowrk", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/itemdetail" }, method = RequestMethod.GET)
	public ModelAndView itemdetailpage(@ModelAttribute("model") ModelMap model,
			Integer id, HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		LOGGER.info("id:" + id);
		responseMap.put("retrieveItem", webdao.getItem(id));

		LOGGER.info("item:" + webdao.getItem(id));
		responseMap.put("retrieveQuote", vehicledao.retriveQuoteByItemID(id));
		// responseMap.put("lowestPrice",vehicledao.getQuoteLowestPriceByItemID(id));
		// responseMap.put("quoteSize",vehicledao.retriveQuoteByItemID(id).size());
		// LOGGER.info("no of quote"+vehicledao.retriveQuoteByItemID(id).size());

		// Items ite=(Items) dao.getItem(id);
		int ItemID = 0;
		int ItemTypeID = 0;

		for (Items item : webdao.getItem(id))
		{
			ItemID = item.getId();
			ItemTypeID = item.getItemtypeid();
		}
		Locale locale = LocaleContextHolder.getLocale();

		String defaultLanguage = locale.getDisplayLanguage();

		if (ItemTypeID == 1)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getFurnitureByItemID(ItemID));
			responseMap.put("itemtype", "furniture");
			if (defaultLanguage == "Slovenian")
			{
				responseMap.put("ItemTypeID", "Pohištvo");
			} else
			{
				responseMap.put("ItemTypeID", "Furniture");
			}

		} else if (ItemTypeID == 2)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getGeneralByItemID(ItemID));
			responseMap.put("itemtype", "general");
			if (defaultLanguage == "Slovenian")
			{
				responseMap.put("ItemTypeID", "Splošni");
			} else
			{
				responseMap.put("ItemTypeID", "General");
			}

		} else if (ItemTypeID == 3)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getCarByItemID(ItemID));
			responseMap.put("itemtype", "car");
			if (defaultLanguage == "Slovenian")
			{
				responseMap.put("ItemTypeID", "Avto");
			} else
			{
				responseMap.put("ItemTypeID", "Car");
			}
			LOGGER.info("item type car");
		} else if (ItemTypeID == 4)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getMotorcyclesByItemID(ItemID));
			responseMap.put("itemtype", "motorcycle");
			if (defaultLanguage == "Slovenian")
			{
				responseMap.put("ItemTypeID", "Motor Cycle");
			} else
			{
				responseMap.put("ItemTypeID", "Motor");
			}
			LOGGER.info("item type Motorcycle");
		} else if (ItemTypeID == 5)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getVechicleandpartsByItemID(ItemID));
			responseMap.put("itemtype", "VechicleAndParts");
			responseMap.put("ItemTypeID", "VechicleAndParts Item");
			LOGGER.info("item type VechicleAndParts");
		} else if (ItemTypeID == 6)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getHomeByItemID(ItemID));
			responseMap.put("itemtype", "Home");
			responseMap.put("ItemTypeID", "Home Item");
			LOGGER.info("item type VechicleAndParts");
		} else if (ItemTypeID == 7)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getBoatByItemID(ItemID));
			responseMap.put("itemtype", "Boats");
			responseMap.put("ItemTypeID", "Boats Item");
			LOGGER.info("item type Boats");
		} else if (ItemTypeID == 8)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getHaulageByItemID(ItemID));
			responseMap.put("itemtype", "Haulage");
			responseMap.put("ItemTypeID", "Haulage Item");
			LOGGER.info("item type Haulage");
		} else if (ItemTypeID == 9)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getFragilegoodsByItemID(ItemID));
			responseMap.put("itemtype", "FragileGoods");
			responseMap.put("ItemTypeID", "FragileGoods Item");
			LOGGER.info("item type FragileGoods");
		} else if (ItemTypeID == 10)
		{
			responseMap.put("retrieveItemsDetail",
					webdao.getLivestockByItemID(ItemID));
			responseMap.put("itemtype", "Livestock");
			responseMap.put("ItemTypeID", "Livestock Item");
			LOGGER.info("item type Livestock");
		} else if (ItemTypeID == 11)
		{
			responseMap.put("retrieveItemsDetail", webdao.getOtherItem(id));
			responseMap.put("itemtype", "others");
			responseMap.put("ItemTypeID", "others Item");
			LOGGER.info("item type others");
		}

		try
		{
			setSessionAttr(request, "targeturl", "null");
			String username = (String) getSessionAttr(request, "username");
			String role = (String) getSessionAttr(request, "role");
			if (username != null)
			{
				responseMap.put("username", username);
				responseMap.put("role", role);
			}
		} catch (ConstException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		responseMap.put("retrieveItemsImages",
				webdao.retriveItemImagesByItemID(id));
		responseMap.put("retrieveQuestMessages",
				webdao.retriveMessageByItemID(id));
		responseMap.put("curpage", "itemdetails");
		// System.out.println("item type Detail id"+responseMap.get("retrieveItem"));

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		// LOGGER.info("item list"+webdao.getFurnitureByItemID(ItemID));

		return new ModelAndView("itemdetail", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/signup" }, method = RequestMethod.GET)
	public String signuppage(@ModelAttribute("model") ModelMap model,
			Integer login_error, Integer login)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");
		return "signup";
	}

	@RequestMapping(value =
	{ "/signup" }, method = RequestMethod.POST)
	public String signup(
			@ModelAttribute("tpsignupform") Vechicleowner vechicleowner)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		webdao.addSignupTP(vechicleowner);
		LOGGER.info("Going to add signup");
		return "signup";
	}

	@RequestMapping(value =
	{ "/regcustomer" }, method = RequestMethod.GET)
	public ModelAndView regcustomer(@ModelAttribute("regcustomer") Users users,
			@ModelAttribute("model") ModelMap model)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("curpage", "regcustomer");
		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		// return "regcustomer";
		return new ModelAndView("regcustomer", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/contactus" }, method = RequestMethod.GET)
	public ModelAndView contactus(@ModelAttribute("model") ModelMap model,
			HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("curpage", "contactus");
		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		// return "regcustomer";
		// NTM
		try
		{
			setSessionAttr(request, "targeturl", "null");
			String username = (String) getSessionAttr(request, "username");
			String role = (String) getSessionAttr(request, "role");
			if (username != null)
			{
				responseMap.put("username", username);
				responseMap.put("role", role);
			}
		} catch (ConstException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		responseMap.put("curpage", "contactus");

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		return new ModelAndView("contactus", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/terms" }, method = RequestMethod.GET)
	public ModelAndView terms(@ModelAttribute("model") ModelMap model)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("curpage", "terms");
		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		// return "regcustomer";
		return new ModelAndView("terms", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/regcustomer" }, method = RequestMethod.POST)
	public String addregcustomer(@ModelAttribute("regcustomer") Users users,
			@ModelAttribute("model") ModelMap model)
	{
		Locale locale = LocaleContextHolder.getLocale();
		String localLanguage = locale.getDisplayLanguage().toString();
		Map<String, Object> responseMap = new HashMap<String, Object>();
		users.setUsername(users.getEmail());
		users.setRole("proOwner");
		long id = 0;
		String duplicate = "";
		try
		{
			id = webdao.addUser(users);
		} catch (Exception e)
		{
			duplicate = "User already register";
		}
		String token = encpSha.encode(users.getPassword(), users.getEmail());
		if (id > 0)
		{
			users.setId((int) id);
			webdao.addUserDetails(users);
			String token1 = TruckUtil.base64UrlEncode((users.getEmail()));

			String token2 = token;

			String href =
					webPath + "/activation.html?token1=" + token1 + "&token2="
							+ token2;

			String content = "";
			if (localLanguage.equals("sl") || localLanguage.indexOf("sl") >= 0)
			{
				content += "<p>Spo&#x161;tovani</p><br>";
				content += "<p>Hvala za registracijo!</p><br>";
				content +=
						"<a href='"
								+ href
								+ "'> Klikni tukaj za aktivacijo va&#x161;ega ra&#x10d;una</a><br><br>";

				String content1 =
						"<p> Hvala za registracijo, prosimo vas, da si shranite va&#x161;o uporabni&#x161;ko ime in geslo!</p><br>"
								+

								"<p>Uporabni&#x161;ko ime:"
								+ users.getEmail()
								+ "</p><br>"
								+ "<p>Geslo:"
								+ users.getPassword() + "</p><br>";
				MailService.sendMail("connecttosavan@gmail.com",
						users.getEmail(), "Activation", content);

				MailService.sendMail("connecttosavan@gmail.com",
						users.getEmail(), "Registration", content1);
				model.put("messagetype", "Success");
				model.put(
						"message",
						"Uspeh! Uspe&#x161;no ste se registrirali <br> Prosimo preverite Va&#x161;o e-po&#x161;to in aktivirajte Va&#x161; ra&#x10d;un!");
			} else
			{
				content += "<p>Dear User</p><br>";
				content += "<p>Thank for Register with As </p><br>";
				content +=
						"<a href='"
								+ href
								+ "'> Click below link to active your account</a><br><br>";

				String content1 =
						"<p> Thank you for Register with us please keep the username,password safe</p><br>"
								+

								"<p>Login ID:"
								+ users.getEmail()
								+ "</p><br>"
								+ "<p>PASSWORD:"
								+ users.getPassword()
								+ "</p><br>";
				MailService.sendMail("connecttosavan@gmail.com",
						users.getEmail(), "Activation", content);

				MailService.sendMail("connecttosavan@gmail.com",
						users.getEmail(), "Registration", content1);
				model.put("messagetype", "Success");
				model.put("message",
						"User Register Successfully <br>Please check your Mail And Active your Account");
			}

			/*
			 * if(localLanguage.equals("sl") || localLanguage.indexOf("sl") >=
			 * 0) { model.put( "message",
			 * "Uspeh! Uspe&#x161;no ste se registrirali <br> Prosimo preverite Va&#x161;o e-po&#x161;to in aktivirajte Va&#x161; ra&#x10d;un!"
			 * ); } else { model.put( "message",
			 * "User Register Successfully <br>Please check your Mail And Active your Account"
			 * ); }
			 */
			LOGGER.info("User Register Successfully");
		} else
		{
			model.put("messagetype", "Failed");
			model.put("message",
					"User Registration Failed . User with the same Email Id already exists" // TO-DO
							+ duplicate);
			LOGGER.info("User Register Failed");
		}

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		responseMap.put("curpage", "activation");
		return "regcustomer";
	}

	@RequestMapping(value =
	{ "/regtransporter" }, method = RequestMethod.GET)
	public ModelAndView regtransporter(
			@ModelAttribute("regcustomer") Users users,
			@ModelAttribute("model") ModelMap model)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		// model.put("retrieveCountry", webdao.retrieveCountries());
		responseMap.put("retrieveCountry", webdao.retrieveCountries());
		responseMap.put("curpage", "regtransporter");
		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		return new ModelAndView("regtransporter", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/regtransporter" }, method = RequestMethod.POST)
	public ModelAndView addregtransporter(
			@ModelAttribute("regtransporter") Userdetails userdetails,
			@ModelAttribute("model") ModelMap model)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		String token =
				encpSha.encode(userdetails.getPassword(),
						userdetails.getEmail());
		Users users = new Users();
		users.setPassword(userdetails.getPassword());
		users.setRole("vclOwner");
		users.setShortname(userdetails.getShortname());
		users.setEmail(userdetails.getEmail());
		users.setUsername(userdetails.getEmail());
		long id = 0;
		String duplicate = "";
		try
		{
			id = webdao.addUser(users);
		} catch (DuplicateKeyException e)
		{
			duplicate =
					"User Registration Failed – User with the same Email Id already exists";
		}

		if (id > 0)
		{
			userdetails.setId((int) id);
			webdao.addUserDetailsTP(userdetails);

			String token1 = TruckUtil.base64UrlEncode((users.getEmail()));

			String token2 = token;

			String href =
					webPath + "/activation.html?token1=" + token1 + "&token2="
							+ token2;

			String content = "";
			content += "<p>Dear User</p><br>";
			content += "<p>Thank for Register with us </p><br>";
			content +=
					"<a href='"
							+ href
							+ "'> Click below link to active your account</a><br><br>";

			String content1 =
					"<p> Thank you for Registering with us, please keep your username and password safe</p><br>"
							+

							"<p>Login ID:"
							+ users.getEmail()
							+ "</p><br>"
							+ "<p>PASSWORD:" + users.getPassword() + "</p><br>";
			MailService.sendMail("connecttosavan@gmail.com", users.getEmail(),
					"Activation", content);
			MailService.sendMail("connecttosavan@gmail.com", users.getEmail(),
					"Registration", content1);
			responseMap.put("messagetype", "Success");
			responseMap
					.put("message",
							"User Register Successfully <br>Please check your Mail And Active your Account");
			LOGGER.info("User Register Successfully");
		} else
		{
			responseMap.put("messagetype", "Failed");
			responseMap.put("message", duplicate);
			LOGGER.info("User Register Failed" + duplicate);
		}

		responseMap.put("retrieveCountry", webdao.retrieveCountries());

		Locale locale = LocaleContextHolder.getLocale();
		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		responseMap.put("curpage", "activation");

		return new ModelAndView("regtransporter", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/forgotpassword" }, method = RequestMethod.GET)
	public ModelAndView forgotpasswordpage(
			@ModelAttribute("model") ModelMap model)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		// LOGGER.info("Going to create new Great app");

		Locale locale = LocaleContextHolder.getLocale();
		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		responseMap.put("curpage", "activation");
		return new ModelAndView("forgotpassword", "model", responseMap);
		// return "forgotpassword";
	}

	@RequestMapping(value =
	{ "/forgotpassword" }, method = RequestMethod.POST)
	public ModelAndView forgotpassword(
			@Valid @ModelAttribute("forgotpassword") Users user)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		String email = user.getEmail();
		LOGGER.info("mail" + email);
		int id = 0;
		try
		{
			id = productdao.checkUserExits(email);
		} catch (Exception e)
		{

		}

		if (id > 0)
		{

			String pass = String.valueOf(TruckUtil.getID());
			webdao.updatePassword(email, pass);
			LOGGER.info("New Password" + pass);
			String content =
					"<p> As Per Your Request Your Password Has been changed</p><br>"
							+

							"<p>USERNAME:" + email + "</p><br>"
							+ "<p>PASSWORD:" + pass + "</p><br>";

			MailService.sendMail("connecttosavan@gmail.com", email,
					"Registration", content);
			LOGGER.info("Password changed sucessfully");
			responseMap.put("messagetype", "Success");
			responseMap.put("message", "Password Send To Your Mail");

		} else
		{

			responseMap.put("messagetype", "Failed");
			responseMap.put("message", "UserName Invalid");

		}
		Locale locale = LocaleContextHolder.getLocale();
		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		responseMap.put("curpage", "activation");
		return new ModelAndView("forgotpassword", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/getquote" }, method = RequestMethod.GET)
	public ModelAndView getquoteage(@ModelAttribute("model") ModelMap model,
			HttpServletRequest request)
	{

		Map<String, Object> responseMap = new HashMap<String, Object>();

		responseMap.put("retrieveCategory", webdao.retriveCategory());
		// LOGGER.info("Going to create new Great app");
		// return "";
		createSession(request);
		try
		{
			if (getSessionAttr(request, "username") == null)
			{
				LOGGER.info("No session available");
				setSessionAttr(request, "targeturl", "getquote");
			} else
			{
				LOGGER.info("This is old session");
				setSessionAttr(request, "targeturl", "null");
				String username = (String) getSessionAttr(request, "username");
				String role = (String) getSessionAttr(request, "role");
				if (username != null)
				{
					responseMap.put("username", username);
					responseMap.put("role", role);
				}
			}
		} catch (ConstException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.getSession().setAttribute("targeturl", "/getquote.html");
			responseMap.put("loginError", "failed");
		}
		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		responseMap.put("curpage", "getquote");
		responseMap.put("retrieveCountry", webdao.getCountries());

		return new ModelAndView("getquote", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/furniture" }, method = RequestMethod.GET)
	public String furniturePage(@ModelAttribute("model") ModelMap model)
	{

		return "furniture";
	}

	@RequestMapping(value =
	{ "/generalitem" }, method = RequestMethod.GET)
	public String generalitemPage(@ModelAttribute("model") ModelMap model)
	{

		return "generalitem";
	}

	@RequestMapping(value =
	{ "/cars" }, method = RequestMethod.GET)
	public String carsPage(@ModelAttribute("model") ModelMap model)
	{

		return "cars";
	}

	@RequestMapping(value =
	{ "/motorcycle" }, method = RequestMethod.GET)
	public String motorcyclePage(@ModelAttribute("model") ModelMap model)
	{

		return "motorcycle";
	}

	@RequestMapping(value =
	{ "/vechicleparts" }, method = RequestMethod.GET)
	public String vechiclepartPage(@ModelAttribute("model") ModelMap model)
	{

		return "vechicleparts";
	}

	@RequestMapping(value =
	{ "/movinghome" }, method = RequestMethod.GET)
	public String movinghomePage(@ModelAttribute("model") ModelMap model)
	{

		return "movinghome";
	}

	@RequestMapping(value =
	{ "/boats" }, method = RequestMethod.GET)
	public String boatsPage(@ModelAttribute("model") ModelMap model)
	{

		return "boats";
	}

	@RequestMapping(value =
	{ "/haulage" }, method = RequestMethod.GET)
	public String haulagePage(@ModelAttribute("model") ModelMap model)
	{

		return "haulage";
	}

	@RequestMapping(value =
	{ "/fragilegoods" }, method = RequestMethod.GET)
	public String fragilegoodsPage(@ModelAttribute("model") ModelMap model)
	{

		return "fragilegoods";
	}

	@RequestMapping(value =
	{ "/livestocks" }, method = RequestMethod.GET)
	public String livestockPage(@ModelAttribute("model") ModelMap model)
	{

		return "livestocks";
	}

	@RequestMapping(value =
	{ "/blank" }, method = RequestMethod.GET)
	public String blankPage(@ModelAttribute("model") ModelMap model)
	{

		return "blank";
	}

	@RequestMapping(value =
	{ "/others" }, method = RequestMethod.GET)
	public String otherPage(@ModelAttribute("model") ModelMap model)
	{

		return "others";
	}

	@RequestMapping(value =
	{ "/furniture" }, method = RequestMethod.POST)
	public ModelAndView furniture(
			@ModelAttribute("furniture") Furnitureitem furnitureitem,
			HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));

		LOGGER.info("formCount:"
				+ furnitureitem.getCommon().getDeleteImageName());

		// furnitureitem.getCommon().setDeleteImageName(deleteImageName.);

		// Arrays.asList(yourArray).contains(yourChar)

		LOGGER.info("formCount:");

		furnitureitem.setDescription(request.getParameter("description_1"));
		furnitureitem.setLength(request.getParameter("length_1"));
		// furnitureitem.setItem_length_un(request.getParameter("dimension"+i));
		furnitureitem.setHeight(request.getParameter("height_1"));
		// furnitureitem.setItem_height_un(request.getParameter("dimension_"+i));
		furnitureitem.setWidth(request.getParameter("width_1"));
		// furnitureitem.setItem_width_un(request.getParameter("dimension"+i));
		furnitureitem.setWeight(request.getParameter("weight_1"));
		// furnitureitem.setItem_weight_un(request.getParameter("weight_type_"+i));
		furnitureitem.setDimension(request.getParameter("dimension_1"));
		furnitureitem.setWeight_type(request.getParameter("weight_type_1"));

		LOGGER.info("values:" + furnitureitem.getDescription()
				+ furnitureitem.getLength() + furnitureitem.getHeight()
				+ furnitureitem.getWidth() + furnitureitem.getWeight());
		// String fileName =
		// TruckUtil.getUUID()+"-F"+photoFiles.getOriginalFilename();
		// TruckUtil.uploadFiles(photoFiles, saveDirectory,fileName);

		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		String imageFile = "/assets/img/category/furniture.png";

		long itemid =
				addItem(furnitureitem.getCommon(),
						furnitureitem.getDescription(), 1, userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);
		// /webdao.addFurniture(furnitureitem);

		furnitureitem.setItemid((int) itemid);
		long itemdetailid = webdao.addFurniture(furnitureitem);

		List<MultipartFile> files = furnitureitem.getCommon().getItemimage();

		int ImageCount = 0;
		if (null != files && files.size() > 0)
		{
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_1"));
		}

		// furnitureitem.setItem_1(request.getParameter("item_1"));

		uploadImages(files, formCount, itemid, itemdetailid, furnitureitem
				.getCommon().getDeleteImageName(), imageFile);

		for (int i = 2; i < formCount; i++)
		{

			int count = ImageCount;
			if (null != files && files.size() > 0)
			{
				ImageCount =
						Integer.parseInt(request.getParameter("itemNumImage_"
								+ i));
			}
			int totalCount = count + ImageCount;
			furnitureitem.setDescription(request.getParameter("description_"
					+ i));
			furnitureitem.setLength(request.getParameter("length_" + i));
			// furnitureitem.setItem_length_un(request.getParameter("dimension"+i));
			furnitureitem.setHeight(request.getParameter("height_" + i));
			// furnitureitem.setItem_height_un(request.getParameter("dimension_"+i));
			furnitureitem.setWidth(request.getParameter("width_" + i));
			// furnitureitem.setItem_width_un(request.getParameter("dimension"+i));
			furnitureitem.setWeight(request.getParameter("weight_" + i));
			// furnitureitem.setItem_weight_un(request.getParameter("weight_type_"+i));
			furnitureitem.setDimension(request.getParameter("dimension_" + i));
			furnitureitem.setWeight_type(request.getParameter("weight_type_"
					+ i));

			itemdetailid = webdao.addFurniture(furnitureitem);
			// System.out.println("value"+request.getParameter("description_"+i));commonImageName

			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								furnitureitem.getCommon().getDeleteImageName())
								.contains(multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;
							System.out.println("commonImageName test:"
									+ commonImageName);

							if (s == 0 && commonImageName == "")
							{
								// commonImageName=;
								webdao.updateItemImage(
										ConstProp.getItemImageDbPath()
												+ fileName, (int) itemid);
								LOGGER.info("Image added Success:"
										+ ConstProp.getItemImageDbPath()
										+ fileName);
							}
						}

					}

				}
			}

			ImageCount = count;

		}
		// LOGGER.info("commonImageName"+commonImageName);

		responseMap.put("retrieveItems", webdao.retriveItems());

		LOGGER.info("description:" + furnitureitem.getDescription());
		LOGGER.info("length:" + furnitureitem.getLength());
		LOGGER.info("width:" + furnitureitem.getWidth());
		LOGGER.info("height:" + furnitureitem.getHeight());
		Locale locale = LocaleContextHolder.getLocale();

		responseMap.put("defaultLanguage", locale.getDisplayLanguage());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/generalitem" }, method = RequestMethod.POST)
	public
			ModelAndView generalitem(
					@ModelAttribute("generalitem") Generalitem generalitem,
					@ModelAttribute("model") ModelMap model,
					HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));
		LOGGER.info("formCount:" + formCount);

		LOGGER.info("generalitem:" + generalitem.getCommon().getColcountry());
		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		generalitem.setDescription(request.getParameter("description_1"));
		generalitem.setLength(request.getParameter("length_1"));
		generalitem.setHeight(request.getParameter("height_1"));
		generalitem.setWidth(request.getParameter("width_1"));
		generalitem.setWeight(request.getParameter("weight_1"));
		generalitem.setDimension(request.getParameter("dimension_1"));
		generalitem.setWeight_type(request.getParameter("weight_type_1"));

		LOGGER.info("values:" + generalitem.getDescription()
				+ generalitem.getLength() + generalitem.getHeight()
				+ generalitem.getWidth() + generalitem.getWeight());

		String imageFile = "/assets/img/category/general.png";

		long itemid =
				addItem(generalitem.getCommon(), generalitem.getDescription(),
						2, userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);
		// /webdao.addFurniture(furnitureitem);

		generalitem.setItemid((int) itemid);
		generalitem.setSubcategory(request.getParameter("subcategory"));

		long itemdetailid = webdao.addGeneralitem(generalitem);

		List<MultipartFile> files = generalitem.getCommon().getItemimage();

		int ImageCount = 0;
		if (null != files && files.size() > 0)
		{
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_1"));

		}
		LOGGER.info("ImageCount:" + ImageCount);

		uploadImages(files, formCount, itemid, itemdetailid, generalitem
				.getCommon().getDeleteImageName(), imageFile);

		// furnitureitem.setItem_1(request.getParameter("item_1"));

		for (int i = 2; i < formCount; i++)
		{
			int count = ImageCount;
			if (null != files && files.size() > 0)
			{
				ImageCount =
						Integer.parseInt(request.getParameter("itemNumImage_"
								+ i));
			}
			int totalCount = count + ImageCount;
			generalitem
					.setDescription(request.getParameter("description_" + i));
			generalitem.setLength(request.getParameter("length_" + i));
			generalitem.setHeight(request.getParameter("height" + i));
			generalitem.setWidth(request.getParameter("width_" + i));
			generalitem.setWeight(request.getParameter("weight_" + i));
			generalitem.setDimension(request.getParameter("dimension" + i));
			generalitem
					.setWeight_type(request.getParameter("weight_type_" + i));

			itemdetailid = webdao.addGeneralitem(generalitem);
			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								generalitem.getCommon().getDeleteImageName())
								.contains(multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;

							if (s == 0 && commonImageName.isEmpty())
							{
								webdao.updateItemImage(
										ConstProp.getItemImageDbPath()
												+ fileName, (int) itemid);

							}
						}
						LOGGER.info("Image added Success:" + fileName);
					}

				}
			}

			ImageCount = count;

		}
		// webdao.updateItemImage(commonImageName, (int)itemid);

		responseMap.put("retrieveItems", webdao.retriveItems());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/cars" }, method = RequestMethod.POST)
	public
			ModelAndView carsitem(@ModelAttribute("caritem") Caritem caritem,
					@ModelAttribute("model") ModelMap model,
					HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));
		LOGGER.info("formCount:" + formCount);

		caritem.setDescription(request.getParameter("description_1"));
		caritem.setMake(request.getParameter("make_1"));
		caritem.setModel(request.getParameter("model_1"));
		caritem.setModeofmoving(request.getParameter("modeofmoving_1"));

		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		String imageFile = "/assets/img/category/car.png";

		long itemid =
				addItem(caritem.getCommon(), caritem.getDescription(), 3,
						userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);
		// /webdao.addFurniture(furnitureitem);

		caritem.setItemid((int) itemid);

		long itemdetailid = webdao.addCaritem(caritem);

		List<MultipartFile> files = caritem.getCommon().getItemimage();
		int ImageCount = 0;
		if (null != files && files.size() > 0)
		{
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_1"));
		}

		LOGGER.info("ImageCount:" + ImageCount);

		// furnitureitem.setItem_1(request.getParameter("item_1"));

		uploadImages(files, formCount, itemid, itemdetailid, caritem
				.getCommon().getDeleteImageName(), imageFile);

		for (int i = 2; i < formCount; i++)
		{
			int count = ImageCount;
			if (null != files && files.size() > 0)
			{
				ImageCount =
						Integer.parseInt(request.getParameter("itemNumImage_"
								+ i));
			}
			int totalCount = count + ImageCount;
			caritem.setDescription(request.getParameter("description_" + i));
			caritem.setMake(request.getParameter("make_" + i));
			caritem.setModel(request.getParameter("model_" + i));
			caritem.setModeofmoving(request.getParameter("modeofmoving_" + i));

			itemdetailid = webdao.addCaritem(caritem);

			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								caritem.getCommon().getDeleteImageName())
								.contains(multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;

							if (s == 0 && commonImageName.isEmpty())
							{
								webdao.updateItemImage(
										ConstProp.getItemImageDbPath()
												+ fileName, (int) itemid);

							}
						}
						LOGGER.info("Image added Success:" + fileName);
					}

				}
			}

			ImageCount = count;

		}
		// webdao.updateItemImage(commonImageName, (int)itemid);

		responseMap.put("retrieveItems", webdao.retriveItems());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/motorcycle" }, method = RequestMethod.POST)
	public
			ModelAndView
			motorcycle(
					@ModelAttribute("motorcycle") Motorcyclesitem motorcyclesitem,
					@ModelAttribute("model") ModelMap model,
					HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));
		LOGGER.info("formCount:" + formCount);

		motorcyclesitem.setDescription(request.getParameter("description_1"));
		motorcyclesitem.setMake(request.getParameter("make_1"));
		motorcyclesitem.setModel(request.getParameter("model_1"));
		motorcyclesitem.setModeofmoving(request.getParameter("modeofmoving_1"));

		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		String imageFile = "/assets/img/category/motorcycle.png";

		long itemid =
				addItem(motorcyclesitem.getCommon(),
						motorcyclesitem.getDescription(), 4, userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);
		// /webdao.addFurniture(furnitureitem);

		motorcyclesitem.setItemid((int) itemid);

		long itemdetailid = webdao.addmotorcycle(motorcyclesitem);

		List<MultipartFile> files = motorcyclesitem.getCommon().getItemimage();
		// LOGGER.info("ImageCount:"+ImageCount);
		int ImageCount = 0;
		if (null != files && files.size() > 0)
		{
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_1"));
		}

		// furnitureitem.setItem_1(request.getParameter("item_1"));

		uploadImages(files, formCount, itemid, itemdetailid, motorcyclesitem
				.getCommon().getDeleteImageName(), imageFile);

		for (int i = 2; i < formCount; i++)
		{
			int count = ImageCount;
			if (null != files && files.size() > 0)
			{
				ImageCount =
						Integer.parseInt(request.getParameter("itemNumImage_"
								+ i));
			}
			int totalCount = count + ImageCount;
			motorcyclesitem.setDescription(request.getParameter("description_"
					+ i));
			motorcyclesitem.setMake(request.getParameter("make_" + i));
			motorcyclesitem.setModel(request.getParameter("model_" + i));
			motorcyclesitem.setModeofmoving(request
					.getParameter("modeofmoving_" + i));

			itemdetailid = webdao.addmotorcycle(motorcyclesitem);

			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								motorcyclesitem.getCommon()
										.getDeleteImageName()).contains(
								multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;

							if (s == 0 && commonImageName.isEmpty())
							{
								commonImageName =
										ConstProp.getItemImageDbPath()
												+ fileName;

							}
						}
						LOGGER.info("Image added Success:" + fileName);
					}

				}
			}

			ImageCount = count;

		}
		// webdao.updateItemImage(commonImageName, (int)itemid);

		responseMap.put("retrieveItems", webdao.retriveItems());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/vechicleparts" }, method = RequestMethod.POST)
	public
			ModelAndView
			vechicleparts(
					@ModelAttribute("vechicleparts") Vechicleandparts vechicleandparts,
					@ModelAttribute("model") ModelMap model,
					HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));
		LOGGER.info("formCount:" + formCount);

		String length = request.getParameter("length_1");
		LOGGER.info("Length1:" + String.valueOf(length));

		vechicleandparts.setDescription(request.getParameter("description_1"));
		vechicleandparts.setLength(length);

		vechicleandparts.setHeight(request.getParameter("height_1"));
		vechicleandparts.setWidth(request.getParameter("width_1"));
		vechicleandparts.setWeight(request.getParameter("weight_1"));
		vechicleandparts.setDimension(request.getParameter("dimension_1"));
		vechicleandparts.setWeight_type(request.getParameter("weight_type_1"));
		vechicleandparts.setOntrailer(request.getParameter("ontrailer_1"));
		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		String imageFile = "/assets/img/category/vechicleandparts.png";

		long itemid =
				addItem(vechicleandparts.getCommon(),
						vechicleandparts.getDescription(), 5, userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);
		// /webdao.addFurniture(furnitureitem);

		vechicleandparts.setItemid((int) itemid);

		vechicleandparts.setSubcategory(request.getParameter("subcategory"));

		long itemdetailid = webdao.addvechicleandparts(vechicleandparts);

		List<MultipartFile> files = vechicleandparts.getCommon().getItemimage();

		int ImageCount = 0;
		if (null != files && files.size() > 0)
		{
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_1"));
		}
		LOGGER.info("ImageCount:" + ImageCount);

		// furnitureitem.setItem_1(request.getParameter("item_1"));

		uploadImages(files, formCount, itemid, itemdetailid, vechicleandparts
				.getCommon().getDeleteImageName(), imageFile);

		for (int i = 2; i < formCount; i++)
		{
			int count = ImageCount;

			if (null != files && files.size() > 0)
			{
				ImageCount =
						Integer.parseInt(request.getParameter("itemNumImage_"
								+ i));
			}
			int totalCount = count + ImageCount;

			vechicleandparts.setDescription(request.getParameter("description_"
					+ i));
			vechicleandparts.setLength(request.getParameter("length_" + i));
			vechicleandparts.setHeight(request.getParameter("height" + i));
			vechicleandparts.setWidth(request.getParameter("width_" + i));
			vechicleandparts.setWeight(request.getParameter("weight_" + i));
			vechicleandparts
					.setDimension(request.getParameter("dimension" + i));
			vechicleandparts.setWeight_type(request.getParameter("weight_type_"
					+ i));
			vechicleandparts.setOntrailer(request
					.getParameter("ontrailer_" + i));
			itemdetailid = webdao.addvechicleandparts(vechicleandparts);

			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								vechicleandparts.getCommon()
										.getDeleteImageName()).contains(
								multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;

							if (s == 0 && commonImageName.isEmpty())
							{
								commonImageName =
										ConstProp.getItemImageDbPath()
												+ fileName;

							}
						}
						LOGGER.info("Image added Success:" + fileName);
					}

				}
			}

			ImageCount = count;

		}
		// webdao.updateItemImage(commonImageName, (int)itemid);

		responseMap.put("retrieveItems", webdao.retriveItems());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/moveinghome" }, method = RequestMethod.POST)
	public ModelAndView moveinghome(
			@ModelAttribute("moveinghome") Furnitureitem furnitureitem,
			HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));

		LOGGER.info("formCount:"
				+ furnitureitem.getCommon().getDeleteImageName());

		// furnitureitem.getCommon().setDeleteImageName(deleteImageName.);

		// Arrays.asList(yourArray).contains(yourChar)

		LOGGER.info("formCount:");

		furnitureitem.setDescription(request.getParameter("description_1"));
		furnitureitem.setLength(request.getParameter("length_1"));
		// furnitureitem.setItem_length_un(request.getParameter("dimension"+i));
		furnitureitem.setHeight(request.getParameter("height_1"));
		// furnitureitem.setItem_height_un(request.getParameter("dimension_"+i));
		furnitureitem.setWidth(request.getParameter("width_1"));
		// furnitureitem.setItem_width_un(request.getParameter("dimension"+i));
		furnitureitem.setWeight(request.getParameter("weight_1"));
		// furnitureitem.setItem_weight_un(request.getParameter("weight_type_"+i));
		furnitureitem.setDimension(request.getParameter("dimension_1"));
		furnitureitem.setWeight_type(request.getParameter("weight_type_1"));

		LOGGER.info("values:" + furnitureitem.getDescription()
				+ furnitureitem.getLength() + furnitureitem.getHeight()
				+ furnitureitem.getWidth() + furnitureitem.getWeight());
		// String fileName =
		// TruckUtil.getUUID()+"-F"+photoFiles.getOriginalFilename();
		// TruckUtil.uploadFiles(photoFiles, saveDirectory,fileName);

		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		String imageFile = "/assets/img/category/home.png";

		long itemid =
				addItem(furnitureitem.getCommon(),
						furnitureitem.getDescription(), 6, userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);
		// /webdao.addFurniture(furnitureitem);

		furnitureitem.setItemid((int) itemid);
		long itemdetailid = webdao.addFurniture(furnitureitem);

		int ImageCount =
				Integer.parseInt(request.getParameter("itemNumImage_1"));

		LOGGER.info("ImageCount:" + ImageCount);

		List<MultipartFile> files = furnitureitem.getCommon().getItemimage();
		// furnitureitem.setItem_1(request.getParameter("item_1"));

		uploadImages(files, formCount, itemid, itemdetailid, furnitureitem
				.getCommon().getDeleteImageName(), imageFile);

		for (int i = 2; i < formCount; i++)
		{

			int count = ImageCount;
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_" + i));
			int totalCount = count + ImageCount;
			LOGGER.info("2ImageCount:" + count);
			LOGGER.info("ImagetotalCount:" + totalCount);
			furnitureitem.setDescription(request.getParameter("description_"
					+ i));
			furnitureitem.setLength(request.getParameter("length_" + i));
			// furnitureitem.setItem_length_un(request.getParameter("dimension"+i));
			furnitureitem.setHeight(request.getParameter("height_" + i));
			// furnitureitem.setItem_height_un(request.getParameter("dimension_"+i));
			furnitureitem.setWidth(request.getParameter("width_" + i));
			// furnitureitem.setItem_width_un(request.getParameter("dimension"+i));
			furnitureitem.setWeight(request.getParameter("weight_" + i));
			// furnitureitem.setItem_weight_un(request.getParameter("weight_type_"+i));
			furnitureitem.setDimension(request.getParameter("dimension_" + i));
			furnitureitem.setWeight_type(request.getParameter("weight_type_"
					+ i));

			itemdetailid = webdao.addFurniture(furnitureitem);
			// System.out.println("value"+request.getParameter("description_"+i));commonImageName

			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								furnitureitem.getCommon().getDeleteImageName())
								.contains(multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;
							LOGGER.info("commonImageName test:"
									+ commonImageName);

							if (s == 0 && commonImageName == "")
							{
								// commonImageName=;
								webdao.updateItemImage(
										ConstProp.getItemImageDbPath()
												+ fileName, (int) itemid);
								LOGGER.info("Image added Success:"
										+ ConstProp.getItemImageDbPath()
										+ fileName);
							}
						}

					}

				}
			}

			ImageCount = count;

		}
		// LOGGER.info("commonImageName"+commonImageName);

		responseMap.put("retrieveItems", webdao.retriveItems());

		LOGGER.info("description:" + furnitureitem.getDescription());
		LOGGER.info("length:" + furnitureitem.getLength());
		LOGGER.info("width:" + furnitureitem.getWidth());
		LOGGER.info("height:" + furnitureitem.getHeight());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/boats" }, method = RequestMethod.POST)
	public
			ModelAndView boats(@ModelAttribute("boats") Boatitem boatitem,
					@ModelAttribute("model") ModelMap model,
					HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));
		LOGGER.info("formCount:" + formCount);

		boatitem.setDescription(request.getParameter("description_1"));
		boatitem.setTypeofboat(request.getParameter("typeofboat_1"));
		boatitem.setTypeofkeel(request.getParameter("typeofkeel_1"));
		boatitem.setOntrailer(request.getParameter("ontrailer_1"));
		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		String imageFile = "/assets/img/category/boat.png";
		long itemid =
				addItem(boatitem.getCommon(), boatitem.getDescription(), 7,
						userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);
		// /webdao.addFurniture(furnitureitem);

		boatitem.setItemid((int) itemid);

		boatitem.setSubcategory(request.getParameter("subcategory"));

		long itemdetailid = webdao.addboats(boatitem);

		// int
		// ImageCount=Integer.parseInt(request.getParameter("itemNumImage_1"));

		// LOGGER.info("ImageCount:"+ImageCount);

		List<MultipartFile> files = boatitem.getCommon().getItemimage();
		int ImageCount = 0;
		if (null != files && files.size() > 0)
		{
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_1"));
		}

		// furnitureitem.setItem_1(request.getParameter("item_1"));

		uploadImages(files, formCount, itemid, itemdetailid, boatitem
				.getCommon().getDeleteImageName(), imageFile);

		for (int i = 2; i < formCount; i++)
		{
			int count = ImageCount;
			if (null != files && files.size() > 0)
			{
				ImageCount =
						Integer.parseInt(request.getParameter("itemNumImage_"
								+ i));
			}
			int totalCount = count + ImageCount;

			boatitem.setDescription(request.getParameter("description_" + i));
			boatitem.setTypeofboat(request.getParameter("typeofboat_" + i));
			boatitem.setTypeofkeel(request.getParameter("typeofkeel_" + i));
			boatitem.setOntrailer(request.getParameter("ontrailer_" + i));
			itemdetailid = webdao.addboats(boatitem);

			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								boatitem.getCommon().getDeleteImageName())
								.contains(multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;

							if (s == 0 && commonImageName.isEmpty())
							{
								commonImageName =
										ConstProp.getItemImageDbPath()
												+ fileName;

							}
						}
						LOGGER.info("Image added Success:" + fileName);
					}

				}
			}

			ImageCount = count;

		}
		// webdao.updateItemImage(commonImageName, (int)itemid);
		responseMap.put("retrieveItems", webdao.retriveItems());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/fragilegoods" }, method = RequestMethod.POST)
	public
			ModelAndView
			fragilegoods(
					@ModelAttribute("fragilegoods") Fragilegoodsitem fragilegoodsitem,
					@ModelAttribute("model") ModelMap model,
					HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));

		LOGGER.info("formCount:"
				+ fragilegoodsitem.getCommon().getDeleteImageName());

		fragilegoodsitem.setDescription(request.getParameter("description_1"));
		fragilegoodsitem.setLength(request.getParameter("length_1"));
		fragilegoodsitem.setHeight(request.getParameter("height_1"));

		fragilegoodsitem.setWidth(request.getParameter("width_1"));

		fragilegoodsitem.setWeight(request.getParameter("weight_1"));

		fragilegoodsitem.setDimension(request.getParameter("dimension_1"));
		fragilegoodsitem.setWeight_type(request.getParameter("weight_type_1"));

		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		String imageFile = "/assets/img/category/fragile.png";

		long itemid =
				addItem(fragilegoodsitem.getCommon(),
						fragilegoodsitem.getDescription(), 9, userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);

		fragilegoodsitem.setItemid((int) itemid);

		fragilegoodsitem.setSubcategory(request.getParameter("subcategory"));
		long itemdetailid = webdao.addFragilegoods(fragilegoodsitem);

		List<MultipartFile> files = fragilegoodsitem.getCommon().getItemimage();

		int ImageCount = 0;
		if (null != files && files.size() > 0)
		{
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_1"));
		}
		uploadImages(files, formCount, itemid, itemdetailid, fragilegoodsitem
				.getCommon().getDeleteImageName(), imageFile);

		for (int i = 2; i < formCount; i++)
		{

			int count = ImageCount;
			if (null != files && files.size() > 0)
			{
				ImageCount =
						Integer.parseInt(request.getParameter("itemNumImage_"
								+ i));
			}
			int totalCount = count + ImageCount;
			LOGGER.info("2ImageCount:" + count);
			LOGGER.info("ImagetotalCount:" + totalCount);
			fragilegoodsitem.setDescription(request.getParameter("description_"
					+ i));
			fragilegoodsitem.setLength(request.getParameter("length_" + i));
			// furnitureitem.setItem_length_un(request.getParameter("dimension"+i));
			fragilegoodsitem.setHeight(request.getParameter("height_" + i));
			// furnitureitem.setItem_height_un(request.getParameter("dimension_"+i));
			fragilegoodsitem.setWidth(request.getParameter("width_" + i));
			// furnitureitem.setItem_width_un(request.getParameter("dimension"+i));
			fragilegoodsitem.setWeight(request.getParameter("weight_" + i));
			// furnitureitem.setItem_weight_un(request.getParameter("weight_type_"+i));
			fragilegoodsitem.setDimension(request
					.getParameter("dimension_" + i));
			fragilegoodsitem.setWeight_type(request.getParameter("weight_type_"
					+ i));

			itemdetailid = webdao.addFragilegoods(fragilegoodsitem);
			// System.out.println("value"+request.getParameter("description_"+i));commonImageName

			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								fragilegoodsitem.getCommon()
										.getDeleteImageName()).contains(
								multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;
							LOGGER.info("commonImageName test:"
									+ commonImageName);

							if (s == 0 && commonImageName == "")
							{
								// commonImageName=;
								webdao.updateItemImage(
										ConstProp.getItemImageDbPath()
												+ fileName, (int) itemid);
								LOGGER.info("Image added Success:"
										+ ConstProp.getItemImageDbPath()
										+ fileName);
							}
						}

					}

				}
			}

			ImageCount = count;

		}
		// LOGGER.info("commonImageName"+commonImageName);

		responseMap.put("retrieveItems", webdao.retriveItems());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/haulage" }, method = RequestMethod.POST)
	public
			ModelAndView haulage(
					@ModelAttribute("haulageitem") Haulageitem haulageitem,
					@ModelAttribute("model") ModelMap model,
					HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));
		LOGGER.info("formCount:" + formCount);

		haulageitem.setDescription(request.getParameter("description_1"));
		haulageitem.setPackagedescription(request
				.getParameter("packagedescription_1"));
		haulageitem
				.setRelevantitem(request.getParameter("relevantdimension_1"));
		haulageitem.setWeight(request.getParameter("weight_1")
				+ request.getParameter("weight_type_1"));
		// boatitem.set(request.getParameter("ontrailer_1"));
		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		String imageFile = "/assets/img/category/haulage.png";

		long itemid =
				addItem(haulageitem.getCommon(), haulageitem.getDescription(),
						8, userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);
		// /webdao.addFurniture(furnitureitem);

		haulageitem.setItemid((int) itemid);

		haulageitem.setSubcategory(request.getParameter("subcategory"));

		long itemdetailid = webdao.addhaulage(haulageitem);

		List<MultipartFile> files = haulageitem.getCommon().getItemimage();
		// furnitureitem.setItem_1(request.getParameter("item_1"));

		int ImageCount = 0;
		if (null != files && files.size() > 0)
		{
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_1"));
		}

		uploadImages(files, formCount, itemid, itemdetailid, haulageitem
				.getCommon().getDeleteImageName(), imageFile);

		for (int i = 2; i < formCount; i++)
		{
			int count = ImageCount;
			if (null != files && files.size() > 0)
			{
				ImageCount =
						Integer.parseInt(request.getParameter("itemNumImage_"
								+ i));
			}
			int totalCount = count + ImageCount;
			// packagedescription_1 relevantdimension_1 weight_1 weight_type_1
			haulageitem
					.setDescription(request.getParameter("description_" + i));
			haulageitem.setPackagedescription(request
					.getParameter("packagedescription_" + i));
			haulageitem.setRelevantitem(request
					.getParameter("relevantdimension_" + i));
			haulageitem.setWeight(request.getParameter("weight_" + i)
					+ request.getParameter("weight_type_" + i));

			itemdetailid = webdao.addhaulage(haulageitem);

			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								haulageitem.getCommon().getDeleteImageName())
								.contains(multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;

							if (s == 0 && commonImageName.isEmpty())
							{
								commonImageName =
										ConstProp.getItemImageDbPath()
												+ fileName;

							}
						}
						LOGGER.info("Image added Success:" + fileName);
					}

				}
			}

			ImageCount = count;

		}
		// webdao.updateItemImage(commonImageName, (int)itemid);

		responseMap.put("retrieveItems", webdao.retriveItems());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/message" }, method = RequestMethod.POST)
	public ModelAndView message(@ModelAttribute("question") Messages messages,
			@ModelAttribute("model") ModelMap model)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		System.out.println("message" + messages.getMessage());

		String status = messages.getStatus();
		long messageid = TruckUtil.getID();
		System.out.println("message1");

		if (status.equals("no"))
		{
			messages.setMessageid(String.valueOf(messageid));
			System.out.println("already");

		} else
		{
			messages.setMessageid(status);
			messageid = Integer.parseInt(messages.getMessageid());

		}
		long id = webdao.addMessage(messages);

		messages.setMessageuid(messages.getMessageid());
		messages.setMessageid(String.valueOf(id));

		webdao.addMessageDetails(messages);

		if ((int) id > 0)
		{

			System.out.println("done");

			responseMap.put("retriveMessages",
					webdao.retriveMessageByMessageID((int) messageid));

		} else
		{
			System.out.println("buse");
		}

		return new ModelAndView("message", "model", responseMap);
		// return "";
	}

	@RequestMapping(value =
	{ "/livestocks" }, method = RequestMethod.POST)
	public ModelAndView livestocks(
			@ModelAttribute("livestocks") Livestockitem livestockitem,
			HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));

		LOGGER.info("formCount:" + formCount);

		livestockitem.setDescription(request.getParameter("description_1"));
		livestockitem.setLength(request.getParameter("length_1"));
		// furnitureitem.setItem_length_un(request.getParameter("dimension"+i));
		livestockitem.setHeight(request.getParameter("height_1"));
		// furnitureitem.setItem_height_un(request.getParameter("dimension_"+i));
		livestockitem.setWidth(request.getParameter("width_1"));
		// furnitureitem.setItem_width_un(request.getParameter("dimension"+i));
		livestockitem.setWeight(request.getParameter("weight_1"));
		// furnitureitem.setItem_weight_un(request.getParameter("weight_type_"+i));
		livestockitem.setDimension(request.getParameter("dimension_1"));
		livestockitem.setWeight_type(request.getParameter("weight_type_1"));
		livestockitem.setBreed(request.getParameter("breed_1"));
		// LOGGER.info("values:"+livestockitem.getDescription()+livestockitem.getLength()+livestockitem.getHeight()+livestockitem.getWidth()+livestockitem.getWeight());
		// String fileName =
		// TruckUtil.getUUID()+"-F"+photoFiles.getOriginalFilename();
		// TruckUtil.uploadFiles(photoFiles, saveDirectory,fileName);

		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		String imageFile = "/assets/img/category/livestock.png";

		long itemid =
				addItem(livestockitem.getCommon(),
						livestockitem.getDescription(), 10, userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);
		// /webdao.addFurniture(furnitureitem);

		livestockitem.setItemid((int) itemid);
		livestockitem.setSubcategory(request.getParameter("subcategory"));
		long itemdetailid = webdao.addLivestock(livestockitem);

		List<MultipartFile> files = livestockitem.getCommon().getItemimage();

		int ImageCount = 0;
		if (null != files && files.size() > 0)
		{
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_1"));
		}

		// furnitureitem.setItem_1(request.getParameter("item_1"));

		uploadImages(files, formCount, itemid, itemdetailid, livestockitem
				.getCommon().getDeleteImageName(), imageFile);

		for (int i = 2; i < formCount; i++)
		{

			int count = ImageCount;
			if (null != files && files.size() > 0)
			{
				ImageCount =
						Integer.parseInt(request.getParameter("itemNumImage_"
								+ i));
			}
			int totalCount = count + ImageCount;
			LOGGER.info("2ImageCount:" + count);
			LOGGER.info("ImagetotalCount:" + totalCount);
			livestockitem.setDescription(request.getParameter("description_"
					+ i));
			livestockitem.setLength(request.getParameter("length_" + i));
			// furnitureitem.setItem_length_un(request.getParameter("dimension"+i));
			livestockitem.setHeight(request.getParameter("height_" + i));
			// furnitureitem.setItem_height_un(request.getParameter("dimension_"+i));
			livestockitem.setWidth(request.getParameter("width_" + i));
			// furnitureitem.setItem_width_un(request.getParameter("dimension"+i));
			livestockitem.setWeight(request.getParameter("weight_" + i));
			// furnitureitem.setItem_weight_un(request.getParameter("weight_type_"+i));
			livestockitem.setDimension(request.getParameter("dimension_" + i));
			livestockitem.setWeight_type(request.getParameter("weight_type_"
					+ i));
			livestockitem.setBreed(request.getParameter("breed_" + i));

			itemdetailid = webdao.addLivestock(livestockitem);
			// System.out.println("value"+request.getParameter("description_"+i));

			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								livestockitem.getCommon().getDeleteImageName())
								.contains(multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;

							if (s == 0)
							{
								commonImageName =
										ConstProp.getItemImageDbPath()
												+ fileName;

							}
						}
						LOGGER.info("Image added Success:" + fileName);
					}

				}
			}

			ImageCount = count;

		}
		// webdao.updateItemImage(commonImageName, (int)itemid);

		responseMap.put("retrieveItems", webdao.retriveItems());

		LOGGER.info("description:" + livestockitem.getDescription());
		LOGGER.info("length:" + livestockitem.getLength());
		LOGGER.info("width:" + livestockitem.getWidth());
		LOGGER.info("height:" + livestockitem.getHeight());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/others" }, method = RequestMethod.POST)
	public ModelAndView furniture(
			@ModelAttribute("others") Otheritem otheritem,
			HttpServletRequest request)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		int formCount = Integer.parseInt(request.getParameter("numForms"));

		LOGGER.info("formCount:" + otheritem.getCommon().getDeleteImageName());

		// furnitureitem.getCommon().setDeleteImageName(deleteImageName.);

		// Arrays.asList(yourArray).contains(yourChar)

		LOGGER.info("formCount:");

		otheritem.setDescription(request.getParameter("description_1"));
		otheritem.setLength(request.getParameter("length_1"));
		// furnitureitem.setItem_length_un(request.getParameter("dimension"+i));
		otheritem.setHeight(request.getParameter("height_1"));
		// furnitureitem.setItem_height_un(request.getParameter("dimension_"+i));
		otheritem.setWidth(request.getParameter("width_1"));
		// furnitureitem.setItem_width_un(request.getParameter("dimension"+i));
		otheritem.setWeight(request.getParameter("weight_1"));
		// furnitureitem.setItem_weight_un(request.getParameter("weight_type_"+i));
		otheritem.setDimension(request.getParameter("dimension_1"));
		otheritem.setWeight_type(request.getParameter("weight_type_1"));

		int userid =
				productdao.checkUserExits(SecurityContextHolder.getContext()
						.getAuthentication().getName());

		String imageFile = "/assets/img/category/other.png";

		long itemid =
				addItem(otheritem.getCommon(), otheritem.getDescription(), 11,
						userid, imageFile);

		LOGGER.info("Item added Successfully:" + itemid);
		// /webdao.addFurniture(furnitureitem);

		otheritem.setItemid((int) itemid);
		long itemdetailid = webdao.addOthers(otheritem);

		List<MultipartFile> files = otheritem.getCommon().getItemimage();

		int ImageCount = 0;
		if (null != files && files.size() > 0)
		{
			ImageCount =
					Integer.parseInt(request.getParameter("itemNumImage_1"));
		}
		// furnitureitem.setItem_1(request.getParameter("item_1"));

		uploadImages(files, formCount, itemid, itemdetailid, otheritem
				.getCommon().getDeleteImageName(), imageFile);

		for (int i = 2; i < formCount; i++)
		{

			int count = ImageCount;
			if (null != files && files.size() > 0)
			{
				ImageCount =
						Integer.parseInt(request.getParameter("itemNumImage_"
								+ i));
			}
			int totalCount = count + ImageCount;
			LOGGER.info("2ImageCount:" + count);
			LOGGER.info("ImagetotalCount:" + totalCount);
			otheritem.setDescription(request.getParameter("description_" + i));
			otheritem.setLength(request.getParameter("length_" + i));
			// furnitureitem.setItem_length_un(request.getParameter("dimension"+i));
			otheritem.setHeight(request.getParameter("height_" + i));
			// furnitureitem.setItem_height_un(request.getParameter("dimension_"+i));
			otheritem.setWidth(request.getParameter("width_" + i));
			// furnitureitem.setItem_width_un(request.getParameter("dimension"+i));
			otheritem.setWeight(request.getParameter("weight_" + i));
			// furnitureitem.setItem_weight_un(request.getParameter("weight_type_"+i));
			otheritem.setDimension(request.getParameter("dimension_" + i));
			otheritem.setWeight_type(request.getParameter("weight_type_" + i));

			itemdetailid = webdao.addOthers(otheritem);
			// System.out.println("value"+request.getParameter("description_"+i));commonImageName

			int s = 0;
			if (null != files && files.size() > 0)
			{

				for (MultipartFile multipartFile : files)
				{
					if (count < totalCount)
					{
						MultipartFile multipartFile1 = files.get(count);
						String fileName =
								TruckUtil.getUUID() + "-F"
										+ multipartFile1.getOriginalFilename();
						if (!Arrays.asList(
								otheritem.getCommon().getDeleteImageName())
								.contains(multipartFile1.getOriginalFilename()))
						{

							TruckUtil.uploadFiles(multipartFile1,
									saveDirectory, fileName);
							webdao.addItemImage(ConstProp.getItemImageDbPath()
									+ fileName, (int) itemid,
									(int) itemdetailid);
							count++;
							LOGGER.info("commonImageName test:"
									+ commonImageName);

							if (s == 0 && commonImageName == "")
							{
								// commonImageName=;
								webdao.updateItemImage(
										ConstProp.getItemImageDbPath()
												+ fileName, (int) itemid);
								LOGGER.info("Image added Success:"
										+ ConstProp.getItemImageDbPath()
										+ fileName);
							}
						}

					}

				}
			}

			ImageCount = count;

		}
		// LOGGER.info("commonImageName"+commonImageName);

		responseMap.put("retrieveItems", webdao.retriveItems());

		return new ModelAndView("listitem", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/askquestion" }, method = RequestMethod.GET)
	public ModelAndView askquestionweb(@ModelAttribute("model") ModelMap model,
			String messageid, String messageuid)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();

		responseMap.put("retrieveMessages",
				webdao.getMessageByMessageID(Integer.parseInt(messageuid)));

		responseMap.put("messageid", messageid);
		responseMap.put("messageuid", messageuid);

		return new ModelAndView("askquestion", "model", responseMap);

	}

	@RequestMapping(value =
	{ "/feedback" }, method = RequestMethod.GET)
	public ModelAndView feedback(@ModelAttribute("model") ModelMap model,
			Integer login_error, int profile)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("profile:" + profile);
		int VCL_ID = profile; // TODO get the user details from URL
		List<Userdetails> userDetails = webdao.getFeedBackUserDetails(VCL_ID);
		List<Starrating> starRatings = webdao.getStartRating(VCL_ID);
		List<Starrating> comments = webdao.getStartRatingComments(VCL_ID);
		responseMap.put("userDetails", userDetails);
		responseMap.put("starratings", starRatings);
		responseMap.put("commentsDetails", comments);
		responseMap.put("curpage", "feedback");
		Locale locale = LocaleContextHolder.getLocale();
		responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		return new ModelAndView("feedback", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/sendmail" }, method = RequestMethod.GET)
	public ModelAndView sendmail(@ModelAttribute("model") ModelMap model,
			String username, String message)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		// LOGGER.info("profile:"+profile);

		String content =
				"<p>Following User share Mobile Number </p><br>" +

				"<p>UserName:" + username + "</p><br>" + "<p>Message:"
						+ message + "</p><br>";

		MailService.sendMail("connecttosavan@gmail.com", "bytemindz@gmail.com",
				"Mobile Number Sharing", content);
		// LOGGER.info("Password changed sucessfully");

		// return "feedback";
		return new ModelAndView("feedback", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/transporter" }, method = RequestMethod.GET)
	public ModelAndView transporter(@ModelAttribute("model") ModelMap model,
			Integer login_error, String profile) throws IOException
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("profile:" + profile);

		String url1 =
				"http://www.timocom.co.uk/The-Freight-Exchange/Freight-offers";

		Document doc;
		try
		{
			doc =
					Jsoup.parse(
							new File(
									"F://bytemindz//dsd/dsd//A sample of international vehicle offers_ Great Britain - all countries_ Peterhead (Great Britain) - london _ Kent (all countries).html"),
							"ISO-8859-1");

			Element table = doc.select("table").get(1); // select the first
														// table.
			Elements rows = table.select("tr");
			Crawl tmp = new Crawl();
			for (int i = 1; i < rows.size(); i++)
			{ // first row is the col
				// names so skip it.
				Element row = rows.get(i);
				Elements cols = row.select("td");

				tmp.setDeadline(cols.get(0).text());
				tmp.setTpfrom(cols.get(1).text());
				tmp.setTpto(cols.get(2).text());
				tmp.setLength(cols.get(3).text());
				tmp.setWeight(cols.get(4).text());
				tmp.setSetup(cols.get(5).text());

				webdao.addTpDaetails(tmp);

			}
		} catch (MalformedURLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		responseMap.put("retrieveTpdateils", webdao.retriveTpDetails());

		// return "feedback";
		return new ModelAndView("transporter", "model", responseMap);
	}

	public long addItem(Common common, String description, int itemtypeid,
			int userid, String photo)
	{

		String[] collatlongValue =
				GoogleGeoCode.getLatLong(common.getColpostcode() + ""
						+ common.getColcountry());

		String[] dellatlongValue =
				GoogleGeoCode.getLatLong(common.getDelpostcode() + ""
						+ common.getDelcountry());

		String colLat = null, colLong = null, delLat = null, delLong = null, coladdress =
				null, deladdress = null;

		// getting Lattitute,Longtitue value For Collection Country
		colLat = collatlongValue[0];
		colLong = collatlongValue[1];
		coladdress = collatlongValue[2];

		// getting Lattitute,Longtitue value For Delivery Country

		delLat = dellatlongValue[0];
		delLong = dellatlongValue[1];
		deladdress = dellatlongValue[2];

		String GoogleMap =
				"http://maps.googleapis.com/maps/api/staticmap?size=250x253&maptype=roadmap&markers=color:green|label:|"
						+ colLat
						+ ","
						+ colLong
						+ "&markers=color:red|color:red|label:|"
						+ delLat
						+ ","
						+ delLong
						+ "&path=color:0x0000ff|weight:5|"
						+ colLat
						+ ","
						+ colLong
						+ "|"
						+ delLat
						+ ","
						+ delLong
						+ "&sensor=false&language=en";

		LOGGER.info("GoogleMap:" + GoogleMap);

		Items item = new Items();
		item.setDescription(description);
		item.setPhotos(webPath + photo);
		item.setMillage(String.valueOf((int) TruckUtil.distance(
				Double.parseDouble(colLat), Double.parseDouble(colLong),
				Double.parseDouble(delLat), Double.parseDouble(delLong), 'K')));
		item.setColcountry(String.valueOf(CountryMaster.COUNTRYMASTER_MAP
				.get(common.getColcountry())));
		item.setColpostcode(common.getColpostcode());
		item.setDelcountry(String.valueOf(CountryMaster.COUNTRYMASTER_MAP
				.get(common.getDelcountry())));
		item.setDelpostcode(common.getDelpostcode());
		item.setItemdetailsid(0);
		item.setUserid(userid);
		item.setMap(GoogleMap);
		item.setColaddress(coladdress);
		item.setDeladdress(deladdress);
		item.setItemtypeid(itemtypeid);

		long itemid = webdao.addItems(item);

		return itemid;

	}

	public void uploadImages(List<MultipartFile> files, int ImageCount,
			long itemid, long itemdetailid, String[] deleteImageName,
			String commonImageFile)
	{

		if (null != files && files.size() > 0)
		{

			System.out.println("filesize:" + files.size());
			int i = 0;
			int p = 0;
			for (MultipartFile multipartFile : files)
			{
				if (i < ImageCount)
				{

					String fileName =
							TruckUtil.getUUID() + "-F"
									+ multipartFile.getOriginalFilename();
					System.out.println("fileName:" + fileName);
					if (!Arrays.asList(deleteImageName).contains(
							multipartFile.getOriginalFilename()))
					{

						TruckUtil.uploadFiles(multipartFile, saveDirectory,
								fileName);
						webdao.addItemImage(ConstProp.getItemImageDbPath()
								+ fileName, (int) itemid, (int) itemdetailid);
						if (p == 0)
						{
							p++;

							webdao.updateItemImage(
									ConstProp.getItemImageDbPath() + fileName,
									(int) itemid);
							System.out
									.println("commonImageNameasdsa:"
											+ ConstProp.getItemImageDbPath()
											+ fileName);
							commonImageName =
									ConstProp.getItemImageDbPath() + fileName;
							// LOGGER.info("commonImageNameasdsa:"+commonImageName);
						}

					}

				}

				i++;
			}

		} else
		{
			webdao.addItemImage(webPath + commonImageFile, (int) itemid,
					(int) itemdetailid);
		}

	}

}
