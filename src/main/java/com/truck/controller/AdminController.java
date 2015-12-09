package com.truck.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.truck.dao.AdminDAO;
import com.truck.dao.ProductDAO;
import com.truck.dao.VehicleDAO;
import com.truck.dao.WebDAO;
import com.truck.domain.Category;
import com.truck.domain.Subcategory;
import com.truck.util.ConstProp;
import com.truck.util.TruckUtil;

@Controller
public class AdminController
{
	private static final Logger LOGGER = Logger
			.getLogger(AdminController.class);

	@Autowired
	private WebDAO webdao;

	@Autowired
	private ProductDAO productdao;

	@Autowired
	private VehicleDAO vehicledao;

	@Autowired
	private AdminDAO admindao;

	private final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	Date date = new Date();

	// protected AuthenticationManager authenticationManager;
	@Autowired
	@Qualifier("truckAuthManager")
	// @Autowired
	// @Qualifier("org.springframework.security.authenticationManager")
	private AuthenticationManager authenticationManager;

	@RequestMapping(value =
	{ "/admin/index" }, method = RequestMethod.GET)
	public String indexpage(@ModelAttribute("model") ModelMap model,
			Integer login_error, Integer login)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");

		// System.out.println(System.getProperty("catalina.home"));
		// String result = this.context.getRealPath("");

		return "admin/index";
	}

	@RequestMapping(value =
	{ "/admin/category" }, method = RequestMethod.GET)
	public ModelAndView Categorypage(@ModelAttribute("model") ModelMap model,
			Integer id, String flag)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("id" + id);
		LOGGER.info("flag" + flag);

		if (flag.equals("edit"))
		{
			responseMap.put("edit", "true");
			responseMap.put("getCategory", admindao.getCategoryByID(id));

		} else if (flag.equals("delete"))
		{
			responseMap.put("edit", "false");
			admindao.deleteCategoryByID(id);
			responseMap.put("messagetype", "Success");
			responseMap.put("message", "Category Delete Successfully");
		} else
		{
			responseMap.put("edit", "false");
		}

		responseMap.put("retrieveCategory", admindao.retriveCategoryAd());

		return new ModelAndView("admin/category", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/admin/category" }, method = RequestMethod.POST)
	public ModelAndView Category(
			@ModelAttribute("categoryform") Category category,
			@ModelAttribute("model") ModelMap model, String edit,
			@RequestParam("file") MultipartFile file)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		// LOGGER.info("id"+id);
		String saveDirectory = ConstProp.getItemImagePath();
		LOGGER.info("edit" + edit);

		if (edit.equals("true"))
		{

			// MultipartFile file=(MultipartFile)
			// category.getCommon().getItemimage();
			// MultipartFile file=null;
			LOGGER.info("file" + file);

			if (!file.isEmpty())
			{
				TruckUtil.uploadFiles(file, saveDirectory,
						file.getOriginalFilename());

				LOGGER.info("file" + ConstProp.getItemImageDbPath()
						+ file.getOriginalFilename());
				category.setIcon(ConstProp.getItemImageDbPath()
						+ file.getOriginalFilename());
			}

			admindao.updateCategory(category);

			responseMap.put("messagetype", "Success");
			responseMap.put("message", "Category Updated Successfully");

		} else
		{

			TruckUtil.uploadFiles(file, saveDirectory,
					file.getOriginalFilename());
			category.setIcon(ConstProp.getItemImageDbPath()
					+ file.getOriginalFilename());
			admindao.addCategory(category);

			responseMap.put("messagetype", "Success");
			responseMap.put("message", "Category Added Successfully");
		}

		responseMap.put("edit", "false");

		responseMap.put("retrieveCategory", admindao.retriveCategoryAd());

		return new ModelAndView("admin/category", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/admin/subcategory" }, method = RequestMethod.GET)
	public ModelAndView SubCategorypage(
			@ModelAttribute("model") ModelMap model, Integer id, String flag)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("id" + id);
		LOGGER.info("flag" + flag);

		if (flag.equals("edit"))
		{
			responseMap.put("edit", "true");
			responseMap.put("getSubCategory", admindao.getSubCategoryByID(id));

		} else if (flag.equals("delete"))
		{
			responseMap.put("edit", "false");
			admindao.deleteSubCategoryByID(id);

			responseMap.put("messagetype", "Success");
			responseMap.put("message", "Sub Category Deleted Successfully");
		} else
		{
			responseMap.put("edit", "false");
		}

		responseMap.put("retrieveCategory", admindao.retriveCategoryAd());

		responseMap.put("retrieveSubCategory", admindao.retriveSubCategoryAd());

		return new ModelAndView("admin/subcategory", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/admin/subcategory" }, method = RequestMethod.POST)
	public ModelAndView subCategory(
			@ModelAttribute("subcategoryform") Subcategory subcategory,
			@ModelAttribute("model") ModelMap model, String edit,
			@RequestParam("file") MultipartFile file)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		// LOGGER.info("id"+id);
		String saveDirectory = ConstProp.getItemImagePath();
		LOGGER.info("edit" + edit);

		if (edit.equals("true"))
		{

			LOGGER.info("file" + file.isEmpty());

			if (!file.isEmpty())
			{
				TruckUtil.uploadFiles(file, saveDirectory,
						file.getOriginalFilename());
				// subcategory.setIcon(file.getOriginalFilename());
				subcategory.setIcon(ConstProp.getItemImageDbPath()
						+ file.getOriginalFilename());
			}

			admindao.updateSubCategory(subcategory);

			responseMap.put("messagetype", "Success");
			responseMap.put("message", "Sub Category Updated Successfully");

		} else
		{

			TruckUtil.uploadFiles(file, saveDirectory,
					file.getOriginalFilename());
			subcategory.setIcon(ConstProp.getItemImageDbPath()
					+ file.getOriginalFilename());
			admindao.addSubCategory(subcategory);

			responseMap.put("messagetype", "Success");
			responseMap.put("message", "Sub Category Added Successfully");
		}

		responseMap.put("edit", "false");

		responseMap.put("retrieveCategory", admindao.retriveCategoryAd());
		responseMap.put("retrieveSubCategory", admindao.retriveSubCategoryAd());

		return new ModelAndView("admin/subcategory", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/admin/transporter" }, method = RequestMethod.GET)
	public ModelAndView transporterpage(
			@ModelAttribute("model") ModelMap model, Integer login_error,
			Integer login)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");

		responseMap.put("retrieveTransporter", admindao.retriveTransporter());

		return new ModelAndView("admin/transporter", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/admin/productowner" }, method = RequestMethod.GET)
	public ModelAndView productownerpage(
			@ModelAttribute("model") ModelMap model, Integer login_error,
			Integer login)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");

		responseMap.put("retrieveProductOwner", admindao.retriveProductOwner());

		return new ModelAndView("admin/productowner", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/admin/message" }, method = RequestMethod.GET)
	public ModelAndView messages(@ModelAttribute("model") ModelMap model,
			Integer login_error, Integer login)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");

		responseMap.put("retrieveMessages",
				admindao.retriveMessagesGroupByMessageID());

		return new ModelAndView("admin/message", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/admin/viewmsg" }, method = RequestMethod.GET)
	public ModelAndView viewmsg(@ModelAttribute("model") ModelMap model,
			Integer login_error, Integer msgid)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");

		responseMap.put("retrieveMessages",
				webdao.retriveMessageByMessageID(msgid));

		return new ModelAndView("admin/viewmsg", "model", responseMap);
	}

	@RequestMapping(value =
	{ "/admin/viewmsg" }, method = RequestMethod.POST)
	public ModelAndView viewmsgupdate(@ModelAttribute("model") ModelMap model,
			Integer login_error, Integer id)
	{
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");

		admindao.updateflag(id);

		return new ModelAndView("admin/viewmsg", "model", responseMap);
	}
}
