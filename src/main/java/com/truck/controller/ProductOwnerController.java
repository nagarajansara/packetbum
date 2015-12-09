package com.truck.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.truck.dao.ProductDAO;
import com.truck.dao.VehicleDAO;
import com.truck.dao.WebDAO;
import com.truck.domain.Items;
import com.truck.domain.Messages;
import com.truck.domain.Users;
import com.truck.mailservice.MailService;

@Controller
public class ProductOwnerController {

	private static final Logger LOGGER = Logger.getLogger(ProductOwnerController.class);

	@Autowired
	private WebDAO webdao;
	
	@Autowired
	private ProductDAO productdao;
		
	@Autowired
	private VehicleDAO vehicledao; 

	
	private final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	Date date = new Date();
	
	
	
	
	


	@RequestMapping(value = { "/pro/message" }, method = RequestMethod.GET)
	public ModelAndView proMessagepage(@ModelAttribute("model") ModelMap model,Integer login_error,Integer login) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		// responseMap.put("retrieveItems",webdao.retriveItems());
		   //LOGGER.info("datas"+dao.retriveItems());
		 LOGGER.info("isAthenticate -:"+SecurityContextHolder.getContext().getAuthentication());
	        
		 
		 
		return new ModelAndView("/pro/message", "model", responseMap);
		
		
		
	}
	
	@RequestMapping(value = { "/pro/index" }, method = RequestMethod.GET)
	public ModelAndView vclindexpage(@ModelAttribute("model") ModelMap model,Integer login_error,Integer login,HttpServletRequest request) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		long id=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
		 
			 responseMap.put("retrieveItems",productdao.retriveItemsForActiveDelivery((int)id));
			 responseMap.put("retrieveMessages",webdao.retriveMessageByProID((int)id));
			 
			 responseMap.put("retrieveQuoteIsAccept",productdao.retriveAcceptQuoteByUserID((int)id));
			 
			 responseMap.put("retrieveAcceptQuoteForFeedback",vehicledao.retriveQuoteForFeedBack((int)id));
			 
			 responseMap.put("retrieveExpiredQuote",productdao.retriveExpiredItemsByUserID((int)id));
			 
			 responseMap.put("getUserDetails",productdao.getProOwnerDetailsByID((int)id));
	
		   //LOGGER.info("datas"+dao.retriveItems());
		 LOGGER.info("isAthenticate -:"+SecurityContextHolder.getContext().getAuthentication());
	        
		 String username="";
		 for(Users user: webdao.getShortnameByMailID(SecurityContextHolder.getContext().getAuthentication().getName())){
			  //  System.out.println("item id: "+item.getItemtypeid());
			 username=user.getShortname();
			    
			}
		 responseMap.put("username",username);
		 
		 request.getSession().setAttribute("username",SecurityContextHolder.getContext().getAuthentication().getName());

		 Locale locale = LocaleContextHolder.getLocale();		
		  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "index");
		  
		return new ModelAndView("/pro/index", "model", responseMap);
		
		
		
	}

	
	@RequestMapping(value = { "/pro/proitemdetail" }, method = RequestMethod.GET)
	public ModelAndView vclitemdetailpage(@ModelAttribute("model") ModelMap model, Integer id) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		 responseMap.put("retrieveItem",webdao.getItem(id));
		 LOGGER.info("item:"+webdao.getItem(id));
		 responseMap.put("retrieveQuote",vehicledao.retriveQuoteByItemID(id));
		// responseMap.put("lowestPrice",vehicledao.getQuoteLowestPriceByItemID(id));
		 
		// LOGGER.info("retrieveQuote:"+vehicledao.retriveQuoteByItemID(id));
		 
		//Items ite=(Items) dao.getItem(id);
		 int ItemID = 0;	
		 int ItemTypeID=0;
		 
		 for(Items item: webdao.getItem(id)){
			  //  System.out.println("item id: "+item.getItemtypeid());
			    ItemID=item.getId();
			    ItemTypeID=item.getItemtypeid();
			}

		  System.out.println("Item Value:"+ItemTypeID);
		 
		  if(ItemTypeID==1){
				 responseMap.put("retrieveItemsDetail",webdao.getFurnitureByItemID(ItemID));
				 responseMap.put("itemtype","furniture");
				  responseMap.put("ItemTypeID","Furniture Item");
				  
				 
			}else if(ItemTypeID==2){
				 responseMap.put("retrieveItemsDetail",webdao.getGeneralByItemID(ItemID));
				 responseMap.put("itemtype","general");
				  responseMap.put("ItemTypeID","General Item");
				 
			}else if(ItemTypeID==3){
				 responseMap.put("retrieveItemsDetail",webdao.getCarByItemID(ItemID));
				 responseMap.put("itemtype","car");
				 responseMap.put("ItemTypeID","Car Item");
				 LOGGER.info("item type car");
			}else if(ItemTypeID==4){
				 responseMap.put("retrieveItemsDetail",webdao.getMotorcyclesByItemID(ItemID));
				 responseMap.put("itemtype","motorcycle");
				 responseMap.put("ItemTypeID","Motorcycle Item");
				 LOGGER.info("item type Motorcycle");
			}else if(ItemTypeID==5){
				 responseMap.put("retrieveItemsDetail",webdao.getVechicleandpartsByItemID(ItemID));
				 responseMap.put("itemtype","VechicleAndParts");
				 responseMap.put("ItemTypeID","VechicleAndParts Item");
				 LOGGER.info("item type VechicleAndParts");
			}else if(ItemTypeID==6){
				 responseMap.put("retrieveItemsDetail",webdao.getHomeByItemID(ItemID));
				 responseMap.put("itemtype","Home");
				 responseMap.put("ItemTypeID","Home Item");
				 LOGGER.info("item type VechicleAndParts");
			}else if(ItemTypeID==7){
				 responseMap.put("retrieveItemsDetail",webdao.getBoatByItemID(ItemID));
				 responseMap.put("itemtype","Boats");
				 responseMap.put("ItemTypeID","Boats Item");
				 LOGGER.info("item type Boats");
			}else if(ItemTypeID==8){
				 responseMap.put("retrieveItemsDetail",webdao.getHaulageByItemID(ItemID));
				 responseMap.put("itemtype","Haulage");
				 responseMap.put("ItemTypeID","Haulage Item");
				 LOGGER.info("item type Haulage");
			}else if(ItemTypeID==9){
				 responseMap.put("retrieveItemsDetail",webdao.getFragilegoodsByItemID(ItemID));
				 responseMap.put("itemtype","FragileGoods");
				 responseMap.put("ItemTypeID","FragileGoods Item");
				 LOGGER.info("item type FragileGoods");
			}else if(ItemTypeID==10){
				 responseMap.put("retrieveItemsDetail",webdao.getLivestockByItemID(ItemID));
				 responseMap.put("itemtype","Livestock");
				 responseMap.put("ItemTypeID","Livestock Item");
				 LOGGER.info("item type Livestock");
			}else if(ItemTypeID==11){
				 responseMap.put("retrieveItemsDetail",webdao.getOtherItem(id));
				 responseMap.put("itemtype","others");
				 responseMap.put("ItemTypeID","others Item");
				 LOGGER.info("item type others");
			}
		 responseMap.put("retrieveItemsImages",webdao.retriveItemImagesByItemID(ItemID));
		 
		 String username="";
		 for(Users user: webdao.getShortnameByMailID(SecurityContextHolder.getContext().getAuthentication().getName())){
			  //  System.out.println("item id: "+item.getItemtypeid());
			 username=user.getShortname();
			    
			}
		 responseMap.put("username",username);
	//	 responseMap.put("username",webdao.getShortnameByMailID(SecurityContextHolder.getContext().getAuthentication().getName()));
	
		 LOGGER.info("item type car"+username);
		
		 responseMap.put("itemid",id);
		 
		 long userid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
		 responseMap.put("userid",(int)userid);
		 
		 responseMap.put("retrieveMessages",webdao.retriveMessageByItemProID(id, (int)userid));
		 
		 responseMap.put("retrieveQuestMessages",webdao.retriveMessageByItemID(id));
		
		// responseMap.put("username",SecurityContextHolder.getContext().getAuthentication().getName());
		 
		 responseMap.put("itemid",id);
		 
		 responseMap.put("userid",productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName()));
		 
		// responseMap.put("retrieveQuestMessages",webdao.retriveMessageByItemID(id));
		 responseMap.put("curpage", "itemdetails");
		 Locale locale = LocaleContextHolder.getLocale();		
		  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "activation");
		
		return new ModelAndView("pro/proitemdetail", "model", responseMap);
	}

	@RequestMapping(value = { "/pro/myaccount" }, method = RequestMethod.GET)
	public ModelAndView myaccountpage(@ModelAttribute("model") ModelMap model,Integer quoteid) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
				
		//vehicledao
		
		 int getUserid;
		 
		 getUserid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
		 
		 System.out.print("getUserid"+getUserid);
		 
		 responseMap.put("retrieveQuote",vehicledao.retriveQuoteByUserID(getUserid));	
		 Locale locale = LocaleContextHolder.getLocale();		
		  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "activation");
	
		return new ModelAndView("pro/myaccount", "model", responseMap);
	}
	
	@RequestMapping(value = { "/pro/myaccount" }, method = RequestMethod.POST)
	public ModelAndView addmyaccountpage(@ModelAttribute("model") ModelMap model,Integer quoteid) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		  int getUserid;
	       try{
	    	    getUserid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
	       }catch(EmptyResultDataAccessException e){
	    	   LOGGER.info("empty:"+e.getMessage());
	    	   getUserid=0;
	       }
	       System.out.print("quoteid"+quoteid);
		productdao.updateQuoteIsAccept(quoteid,getUserid);
		
		 Locale locale = LocaleContextHolder.getLocale();		
		  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "activation");
		return new ModelAndView("pro/proitemdetail", "model", responseMap);
	}
	
	@RequestMapping(value = { "/pro/reply" }, method = RequestMethod.GET)
	public ModelAndView message(@ModelAttribute("model") ModelMap model,String messageid,String messageuid) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	
	   responseMap.put("retrieveMessages",webdao.getMessageByMessageID(Integer.parseInt(messageuid)));	
	   
	   responseMap.put("messageid",messageid);	
	   responseMap.put("messageuid",messageuid);
	   
	   String username="";
		 for(Users user: webdao.getShortnameByMailID(SecurityContextHolder.getContext().getAuthentication().getName())){
			  //  System.out.println("item id: "+item.getItemtypeid());
			 username=user.getShortname();
			    
			}
		 responseMap.put("username",username);
		 
		 Locale locale = LocaleContextHolder.getLocale();		
		  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "activation");
	   	
		return new ModelAndView("pro/reply", "model", responseMap);
		
      }
	
	
	@RequestMapping(value = { "/pro/reply" }, method = RequestMethod.POST)
	public ModelAndView messageReply(@ModelAttribute("messageReplyForm")Messages messages,@ModelAttribute("model") ModelMap model) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	   System.out.println("message"+messages.getMessage());
	   responseMap.put("retrieveMessages",webdao.getMessageByMessageID(Integer.parseInt(messages.getMessageuid())));	
	   int getUserid;
	   
	   getUserid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
	   messages.setUserid(String.valueOf(getUserid));
	   
	   webdao.addMessageDetails(messages);
	   responseMap.put("messageid",messages.getMessageid());	
	   responseMap.put("messageuid",messages.getMessageuid());
	   
	   Locale locale = LocaleContextHolder.getLocale();		
	   responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
	   responseMap.put("curpage", "activation");
	   
		return new ModelAndView("pro/reply", "model", responseMap);
		
		
		}
	
	
	

	
	@RequestMapping(value = { "/pro/askquestion" }, method = RequestMethod.GET)
	public ModelAndView askquestion(@ModelAttribute("model") ModelMap model,String messageid,String messageuid) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	
	   responseMap.put("retrieveMessages",webdao.getMessageByMessageID(Integer.parseInt(messageuid)));	
	   
	   responseMap.put("messageid",messageid);	
	   responseMap.put("messageuid",messageuid);

		 String username="";
		 for(Users user: webdao.getShortnameByMailID(SecurityContextHolder.getContext().getAuthentication().getName())){
			  //  System.out.println("item id: "+item.getItemtypeid());
			 username=user.getShortname();
			    
			}
		 long userid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
		 responseMap.put("userid",(int)userid);
		 responseMap.put("username",username);
	   	
		 Locale locale = LocaleContextHolder.getLocale();		
		  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "activation");
		return new ModelAndView("pro/askquestion", "model", responseMap);
		
      }
	@RequestMapping(value = { "/pro/changepass" }, method = RequestMethod.POST)
	public ModelAndView changepass(@ModelAttribute("model") ModelMap model,String oldpass,String newpass) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	
		
		String user=SecurityContextHolder.getContext().getAuthentication().getName();
	 try{
		webdao.updatePassword(user, newpass);
		 responseMap.put("message","true");
	 }catch(Exception e){
		 responseMap.put("message","false");
	 }
		return new ModelAndView("pro/changepass", "model", responseMap);
		
      }
	
	
	
	@RequestMapping(value = { "/pro/profile" }, method = RequestMethod.POST)
	public ModelAndView profile(@ModelAttribute("model") ModelMap model,String mobile,String shortname) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	
		 long userid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
			
	 try{
		 productdao.updateUsername(shortname,(int)userid);
		 productdao.updateProfile(mobile, (int)userid);
		 responseMap.put("message","true");
	 }catch(Exception e){
		 responseMap.put("message","false");
	 }
		return new ModelAndView("pro/profile", "model", responseMap);
		
      }
	
	
	@RequestMapping(value = { "/pro/report" }, method = RequestMethod.POST)
	public ModelAndView report(String itemid,String message,String id) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	
		String content="";
		content+="<p>Dear Admin</p><br>";
		content+="<p>The following message has been reported by the user</p><br>";		
		content+="Item Id:"+itemid+"</br>";
		content+="Message:<b>'"+message+"'</b>";       			
		        	 
        			
		 MailService.sendMail("connecttosavan@gmail.com", "saravanan@bytemindz.com", "Report", content);
	
		return new ModelAndView("pro/report", "model", responseMap);
		
      }
	
}
