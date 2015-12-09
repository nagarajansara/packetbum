package com.truck.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.truck.dao.ProductDAO;
import com.truck.dao.VehicleDAO;
import com.truck.dao.WebDAO;
import com.truck.domain.Items;
import com.truck.domain.Messages;
import com.truck.domain.Quote;
import com.truck.domain.Userdetails;
import com.truck.domain.Users;
import com.truck.mailservice.MailService;
import com.truck.util.ConstException;
@Controller
public class VehicleOwnerController extends BaseController {


	private static final Logger LOGGER = Logger.getLogger(VehicleOwnerController.class);

	@Autowired
	private WebDAO webdao;
	
	@Autowired
	private ProductDAO productdao;
		
	@Autowired
	private VehicleDAO vehicledao;
		
	private final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	Date date = new Date();



	@RequestMapping(value = { "/vcl/index" }, method = RequestMethod.GET)
	public ModelAndView vclindexpage(@ModelAttribute("model") ModelMap model,Integer login_error,Integer login,HttpServletRequest request) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		 responseMap.put("retrieveItems",webdao.retriveItems());
		   //LOGGER.info("datas"+dao.retriveItems());
		 LOGGER.info("isAthenticate -:"+SecurityContextHolder.getContext().getAuthentication());
		 LOGGER.info("isAthenticat id-:"+SecurityContextHolder.getContext().getAuthentication().getName());		  
		 long userid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
			
		 responseMap.put("username",(int)userid);
		 String username="";
		 for(Users user: webdao.getShortnameByMailID(SecurityContextHolder.getContext().getAuthentication().getName())){
			  //  System.out.println("item id: "+item.getItemtypeid());
			 username=user.getShortname();
			    
			}
		 responseMap.put("usershortname",username);
		 request.getSession().setAttribute("username",SecurityContextHolder.getContext().getAuthentication().getName());
		 
		 responseMap.put("retrieveQuoteIsAccept",vehicledao.retriveAcceptQuoteByUserID((int)userid));
		 
		 
		 responseMap.put("retrieveExpiredQuote",vehicledao.retriveExpiredQuoteByUserID((int)userid));
		 
		 
		// LOGGER.info("retrieveQuoteIsAccept -:"+vehicledao.retriveAcceptQuoteByUserID((int)userid));
			
		 responseMap.put("retrieveMessages",webdao.retriveMessageByVCLID((int)userid));
		 
		 responseMap.put("getUserDetails",vehicledao.getVclOwnerDetailsByID((int)userid));
		 
		 Locale locale = LocaleContextHolder.getLocale();		
		  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "index");
		 
		 return new ModelAndView("/vcl/index", "model", responseMap);
		
		
		
	}
	
	@RequestMapping(value = { "/vcl/listitem" }, method = RequestMethod.GET)
	public ModelAndView listitempage(@ModelAttribute("model") ModelMap model,Integer login_error,Integer login,HttpServletRequest request) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		// responseMap.put("retrieveItems",webdao.retriveItems());
		 
		 int page=1;
			
			try{
				 page=Integer.parseInt(request.getParameter("page"));

			   LOGGER.info("count"+page);
			   
			}catch(Exception e){
				 page=1;
			}
			 int totalcount=webdao.getItemTotalCount();
			 
			 responseMap.put("totalcount",totalcount);
			 
		   int c=totalcount/10;
		   
		   if((totalcount%10)!=0)
			   c++;
			 responseMap.put("totalpages",c);
			 
			 responseMap.put("page",page);
			String Search=request.getParameter("search");
			
			if(Search.equals("true")){
				
		
				
				try {
					List<String> colcountry = (List<String>) getSessionAttr(request, "colcountry");
					List<String> delcountry=(List<String>) getSessionAttr(request, "delcountry");
					List<String> itemtype=(List<String>) getSessionAttr(request, "itemtype");
					responseMap.put("retrieveItems",webdao.retriveCountrySearchItems(colcountry,delcountry,itemtype,page,10));
				} catch (ConstException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
				
				
				
				
			}else{
				 responseMap.put("retrieveItems",webdao.retriveItems(page,10));
			}
			
			 String username="";
			 for(Users user: webdao.getShortnameByMailID(SecurityContextHolder.getContext().getAuthentication().getName())){
				  //  System.out.println("item id: "+item.getItemtypeid());
				 username=user.getShortname();
				    
				}
			 responseMap.put("usershortname",username);
			// responseMap.put("totalpages",webdao.getItemTotalCount()%10);
			 
			 responseMap.put("retrieveUpgradeItems",webdao.retriveUpgradeItems());
			 responseMap.put("retrieveCountry",webdao.getCountries());
		//	 responseMap.put("totalcount",webdao.getItemTotalCount());
			 
			// responseMap.put("page",page);
		   //LOGGER.info("datas"+dao.retriveItems());
		 LOGGER.info("isAthenticate -:"+SecurityContextHolder.getContext().getAuthentication());
		 LOGGER.info("isAthenticat id-:"+SecurityContextHolder.getContext().getAuthentication().getName());		  
		 long userid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
			
		 responseMap.put("username",	(int)userid);
		 
		 request.getSession().setAttribute("username",SecurityContextHolder.getContext().getAuthentication().getName());
		 
		 
		 
		 Locale locale = LocaleContextHolder.getLocale();		
		  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "listitem");
		 
	
		 return new ModelAndView("/vcl/listitem", "model", responseMap);
		
		
		
	}
	@RequestMapping(value = { "/vcl/vclitemdetail" }, method = RequestMethod.GET)
	public ModelAndView vclitemdetailpage(@ModelAttribute("model") ModelMap model, Integer id) {
				 
		 Map<String, Object> responseMap = new HashMap<String, Object>();
			
		 LOGGER.info("id:"+id);
		 responseMap.put("retrieveItem",webdao.getItem(id));
		 LOGGER.info("item:"+webdao.getItem(id));
		 
		 responseMap.put("retrieveQuote",vehicledao.retriveQuoteByItemID(id));
		 
		
		 
		 LOGGER.info("retrieveQuote:"+vehicledao.retriveQuoteByItemID(id));
		 
		// responseMap.put("lowestPrice",vehicledao.getQuoteLowestPriceByItemID(id));
		 
		// responseMap.put("lowestPrice","dsfsd");
		 
		//Items ite=(Items) dao.getItem(id);
		 int ItemID = 0;	
		 int ItemTypeID=0;
		 
		 for(Items item: webdao.getItem(id)){
			  //  System.out.println("item id: "+item.getItemtypeid());
			    ItemID=item.getId();
			    ItemTypeID=item.getItemtypeid();
			}
           
		 Locale locale = LocaleContextHolder.getLocale();
			
		 String defaultLanguage=locale.getDisplayLanguage();
		  
			if(ItemTypeID==1){
				 responseMap.put("retrieveItemsDetail",webdao.getFurnitureByItemID(ItemID));
				 responseMap.put("itemtype","furniture");
				 if(defaultLanguage=="Slovenian"){					
					  responseMap.put("ItemTypeID","Pohištvo");					 
				 }else{					 
					  responseMap.put("ItemTypeID","Furniture");
					  }
				
				  
				 
			}else if(ItemTypeID==2){
				 responseMap.put("retrieveItemsDetail",webdao.getGeneralByItemID(ItemID));
				 responseMap.put("itemtype","general");
				 if(defaultLanguage=="Slovenian"){					
					  responseMap.put("ItemTypeID","Splošni");					 
				 }else{					 
					  responseMap.put("ItemTypeID","General");
					  }
				
				 
			}else if(ItemTypeID==3){
				 responseMap.put("retrieveItemsDetail",webdao.getCarByItemID(ItemID));
				 responseMap.put("itemtype","car");
				 if(defaultLanguage=="Slovenian"){					
					  responseMap.put("ItemTypeID","Avto");					 
				 }else{					 
					  responseMap.put("ItemTypeID","Car");
					  }
				
				 LOGGER.info("item type car");
			}else if(ItemTypeID==4){
				 responseMap.put("retrieveItemsDetail",webdao.getMotorcyclesByItemID(ItemID));
				 responseMap.put("itemtype","motorcycle");
				 if(defaultLanguage=="Slovenian"){					
					  responseMap.put("ItemTypeID","Motor Cycle");					 
				 }else{					 
					  responseMap.put("ItemTypeID","Motor");
					  }
				 LOGGER.info("item type Motorcycle");
			}else if(ItemTypeID==5){
				 responseMap.put("retrieveItemsDetail",webdao.getVechicleandpartsByItemID(ItemID));
				 responseMap.put("itemtype","VechicleAndParts");
				 responseMap.put("ItemTypeID","VechicleAndParts ");
				 LOGGER.info("item type VechicleAndParts");
			}else if(ItemTypeID==6){
				 responseMap.put("retrieveItemsDetail",webdao.getHomeByItemID(ItemID));
				 responseMap.put("itemtype","Home");
				 responseMap.put("ItemTypeID","Home ");
				 LOGGER.info("item type VechicleAndParts");
			}else if(ItemTypeID==7){
				 responseMap.put("retrieveItemsDetail",webdao.getBoatByItemID(ItemID));
				 responseMap.put("itemtype","Boats");
				 responseMap.put("ItemTypeID","Boats ");
				 LOGGER.info("item type VechicleAndParts");
			}else if(ItemTypeID==8){
				 responseMap.put("retrieveItemsDetail",webdao.getHaulageByItemID(ItemID));
				 responseMap.put("itemtype","Haulage");
				 responseMap.put("ItemTypeID","Haulage ");
				 LOGGER.info("item type VechicleAndParts");
			}else if(ItemTypeID==9){
				 responseMap.put("retrieveItemsDetail",webdao.getHaulageByItemID(ItemID));
				 responseMap.put("itemtype","FragileGoods");
				 responseMap.put("ItemTypeID","FragileGoods ");
				 LOGGER.info("item type VechicleAndParts");
			}else if(ItemTypeID==10){
				 responseMap.put("retrieveItemsDetail",webdao.getLivestockByItemID(ItemID));
				 responseMap.put("itemtype","Livestock");
				 responseMap.put("ItemTypeID","Livestock ");
				 LOGGER.info("item type VechicleAndParts");
			}else if(ItemTypeID==11){
				 responseMap.put("retrieveItemsDetail",webdao.getOtherItem(id));
				 responseMap.put("itemtype","others");
				 responseMap.put("ItemTypeID","others ");
				 LOGGER.info("item type VechicleAndParts");
			}
		 responseMap.put("retrieveItemsImages",webdao.retriveItemImagesByItemID(ItemID));
		
		
		 String username="";
		 for(Users user: webdao.getShortnameByMailID(SecurityContextHolder.getContext().getAuthentication().getName())){
			  //  System.out.println("item id: "+item.getItemtypeid());
			 username=user.getShortname();
			    
			}
		 responseMap.put("usershortname",username);
	//	 responseMap.put("username",webdao.getShortnameByMailID(SecurityContextHolder.getContext().getAuthentication().getName()));
	
		 LOGGER.info("item type car"+username);
		
		 responseMap.put("itemid",id);
		 long userid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
		 responseMap.put("userid",(int)userid);
		 
		 responseMap.put("retrieveMessages",webdao.retriveMessageByItemVclID(id, (int)userid));
		 
		 responseMap.put("retrieveQuestMessages",webdao.retriveMessageByItemID(id));
		 
		// Locale locale = LocaleContextHolder.getLocale();		
		//  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "itemdetail");
	     
		return new ModelAndView("vcl/vclitemdetail", "model", responseMap);
	}


	@RequestMapping(value = { "/vcl/vclitemdetail" }, method = RequestMethod.POST)
	public ModelAndView addQuotepage(@ModelAttribute("quoteform") Quote quote) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		
		if(quote.getColfromdate()== ""){
			quote.setColfromdate("00/00/000");
		}
		if(quote.getColtodate()== ""){
			quote.setColtodate("00/00/000");
		}
		
		if(quote.getDelfromdate()== ""){
			quote.setDelfromdate("00/00/000");
		}
		if(quote.getDeltodate()== ""){
			quote.setDeltodate("00/00/000");
		}
		
	     long val=vehicledao.addQuote(quote);
	     
	     if(val>0){
	    	 /*System.out.println("add successfully");*/
	    	 
	    	 }else{
	    		 /*System.out.println("add faild...");*/
	    	 }
					
	     Locale locale = LocaleContextHolder.getLocale();		
		  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "itemdetail");
		return new ModelAndView("vcl/vclitemdetail", "model", responseMap);
	}



	@RequestMapping(value = { "/vcl/myaccount" }, method = RequestMethod.GET)
	public ModelAndView vclmyaccountpage(@ModelAttribute("model") ModelMap model) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
				
		//vehicledao
		
		 int getUserid;
		 responseMap.put("username",SecurityContextHolder.getContext().getAuthentication().getName());
		 getUserid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
		 
		 System.out.print("getUserid"+getUserid);
		 
		 responseMap.put("retrieveQuote",vehicledao.retriveQuoteByVCLUserID(getUserid));	
		 Locale locale = LocaleContextHolder.getLocale();		
		  responseMap.put("defaultLanguage", locale.getDisplayLanguage());
		  
		  responseMap.put("curpage", "myaccount");
	
		return new ModelAndView("vcl/myaccount", "model", responseMap);
	}
	
	
	
	/*@RequestMapping(value = { "/vcl/myaccount" }, method = RequestMethod.POST)
	public ModelAndView vcladdmyaccountpage(@ModelAttribute("model") ModelMap model,Integer quoteid) {
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
		 responseMap.put("retrieveQuote",vehicledao.retriveQuoteByUserID(getUserid));
		
		return new ModelAndView("vcl/myaccount", "model", responseMap);
	}*/

	@RequestMapping(value = { "/vcl/reply" }, method = RequestMethod.GET)
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
	   
		return new ModelAndView("vcl/reply", "model", responseMap);
		
      }
	
	
	@RequestMapping(value = { "/vcl/reply" }, method = RequestMethod.POST)
	public ModelAndView messageReply(@ModelAttribute("messageReplyForm")Messages messages,@ModelAttribute("model") ModelMap model) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	   /*System.out.println("message"+messages.getMessage());*/
	   responseMap.put("retrieveMessages",webdao.getMessageByMessageID(Integer.parseInt(messages.getMessageuid())));	
	   int getUserid;
	   getUserid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
	   messages.setUserid(String.valueOf(getUserid));
	   webdao.addMessageDetails(messages);
	   responseMap.put("messageid",messages.getMessageid());	
	   responseMap.put("messageuid",messages.getMessageuid());
	   
		return new ModelAndView("vcl/reply", "model", responseMap);
		}

	
	@RequestMapping(value = { "/vcl/askquestion" }, method = RequestMethod.GET)
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
		 
		
		 responseMap.put("usershortname",username);
	   	
		return new ModelAndView("vcl/askquestion", "model", responseMap);
		
      }
	
	
	@RequestMapping(value = { "/vcl/search" }, method = RequestMethod.POST)
	public ModelAndView searchpage(@ModelAttribute("model") ModelMap model,Integer login_error,Integer login,HttpServletRequest request,@RequestParam("colcountry[]") List<String> colcountry,@RequestParam("delcountry[]") List<String> delcountry,@RequestParam("itemtype[]") List<String> itemtype) throws ConstException {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		
		 String username="";
		 for(Users user: webdao.getShortnameByMailID(SecurityContextHolder.getContext().getAuthentication().getName())){
			  //  System.out.println("item id: "+item.getItemtypeid());
			 username=user.getShortname();
			    
			}
		 responseMap.put("usershortname",username);
		// responseMap.put("retrieveItems",webdao.retriveItems());
		 
		/* int page=1;
			
			try{
				 page=Integer.parseInt(request.getParameter("page"));

			   LOGGER.info("count"+page);
			   
			}catch(Exception e){
				 page=1;
			}*/
			
			String searchtype=request.getParameter("typeofsearch");
			  LOGGER.info("searchtype"+searchtype);
			setSessionAttr(request, "searchtype", searchtype);
			
			
			
			if(searchtype.equalsIgnoreCase("country")){
				  LOGGER.info("colcountry"+colcountry.get(0)+"delcountry"+delcountry.get(0)+"itemtype"+itemtype.get(0));
				
						setSessionAttr(request, "colcountry", colcountry);
						setSessionAttr(request, "delcountry", delcountry);
						setSessionAttr(request, "itemtype", itemtype);				
					
					 
					 responseMap.put("retrieveItems",webdao.retriveCountrySearchItems(colcountry, delcountry, itemtype,1,10));
					 
					 int totalcount=webdao.getCountrySearchItemTotalCount(colcountry, delcountry, itemtype);
					 
					 responseMap.put("totalcount",totalcount);
					 
					   int c=totalcount/10;
					   
					   if((totalcount%10)!=0)
						   c++;
						 responseMap.put("totalpages",c);
						 
						 //responseMap.put("page",page);
					 
					// responseMap.put("totalcount",);
					 
					 
					 
					 
			}else if(searchtype.equalsIgnoreCase("route")){					
				String colpostcode=request.getParameter("colpostcode");
				String delpostcode=request.getParameter("delpostcode");
				String km=request.getParameter("km");
					    removeSessionAttr(request, "colcountry");
					    removeSessionAttr(request, "delcountry");
					    removeSessionAttr(request, "itemtype");
					   
						setSessionAttr(request, "colcountry", colcountry);
						setSessionAttr(request, "delcountry", delcountry);
						setSessionAttr(request, "itemtype", itemtype);
						setSessionAttr(request, "colpostcode", colpostcode);
						setSessionAttr(request, "delpostcode", delpostcode);
						setSessionAttr(request, "itemtype", itemtype);	
						setSessionAttr(request, "km", km);						 
					   responseMap.put("retrieveItems",webdao.retriveRouteSearchItems(colcountry, delcountry, itemtype, colpostcode,delpostcode,km, 1, 10));
					   int totalcount=webdao.getCountryRouteItemTotalCount(colcountry, delcountry, itemtype, colpostcode, delpostcode, km);
						 
						
					   responseMap.put("totalcount",totalcount);
					   int c=totalcount/10;
					   
					   if((totalcount%10)!=0)
						   c++;
						 responseMap.put("totalpages",c);
					   
			}else if(searchtype.equalsIgnoreCase("local")){			
				String postcode=request.getParameter("postcode");
				String km=request.getParameter("km");
				
				    removeSessionAttr(request, "itemtype");
				    removeSessionAttr(request, "colcountry");
				    removeSessionAttr(request, "delcountry");
				    removeSessionAttr(request, "itemtype");
				    removeSessionAttr(request, "colpostcode");
				    removeSessionAttr(request, "delpostcode");
				    removeSessionAttr(request, "km");
					setSessionAttr(request, "itemtype", itemtype);					
				    setSessionAttr(request, "postcode",postcode);
					setSessionAttr(request, "km", km);
					responseMap.put("retrieveItems",webdao.retriveLocalSearchItems(itemtype,postcode,km, 1, 10));
					
					
					 int totalcount=webdao.getCountryLocalItemTotalCount(itemtype, postcode, km, 1, 10);
					 
					 responseMap.put("totalcount",totalcount);
					 
						
					 
					   int c=totalcount/10;
					   
					   if((totalcount%10)!=0)
						   c++;
						 responseMap.put("totalpages",c);
					   
						
			}
			
			
			
			  
			
			 
			 responseMap.put("retrieveUpgradeItems",webdao.retriveUpgradeItems());
			 
			
			 
			 responseMap.put("page",1);
		   //LOGGER.info("datas"+dao.retriveItems());
		 LOGGER.info("isAthenticate -:"+SecurityContextHolder.getContext().getAuthentication());
		 LOGGER.info("isAthenticat id-:"+SecurityContextHolder.getContext().getAuthentication().getName());		  
		 long userid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
			
		 responseMap.put("username",(int)userid);
		 
		 request.getSession().setAttribute("username",SecurityContextHolder.getContext().getAuthentication().getName());
	
		 return new ModelAndView("/vcl/search", "model", responseMap);
		
		
		
	}
	
	@RequestMapping(value = { "/vcl/changepass" }, method = RequestMethod.POST)
	public ModelAndView changepassVcl(@ModelAttribute("model") ModelMap model,String oldpass,String newpass) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	
		
		String user=SecurityContextHolder.getContext().getAuthentication().getName();
	 try{
		webdao.updatePassword(user, newpass);
		 responseMap.put("message","true");
	 }catch(Exception e){
		 responseMap.put("message","false");
	 }
		return new ModelAndView("vcl/changepass", "model", responseMap);
		
      }
	
	
	@RequestMapping(value = { "/vcl/profile" }, method = RequestMethod.POST)
	public ModelAndView profile(@ModelAttribute("vclprofile") Userdetails userdetails,String mobile,String shortname) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	
		 long userid=productdao.checkUserExits(SecurityContextHolder.getContext().getAuthentication().getName());
			
	 try{
		 productdao.updateUsername(userdetails.getShortname(),(int)userid);
		 vehicledao.updateVclProfile(userdetails, (int)userid);
		 responseMap.put("message","true");
	 }catch(Exception e){
		 responseMap.put("message","false");
	 }
		return new ModelAndView("vcl/profile", "model", responseMap);
		
     }
	
	
	@RequestMapping(value = { "/vcl/report" }, method = RequestMethod.POST)
	public ModelAndView report(String itemid,String message,String id) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	
		String content="";
		content+="<p>Dear Admin</p><br>";
		content+="<p>The following message has been reported by the user</p><br>";		
		content+="<table cellspacing='10' cellpadding='10'><tr><td>Item ID</td>"+itemid+"<td></td></tr><tr><td>Message</td>"+message+"<td></td></tr></table></br>";
		//content+="Message:<b>'"+message+"'</b>";       			
		        	 
        			
		 MailService.sendMail("connecttosavan@gmail.com", "saravanan@bytemindz.com", "Report", content);
	
		return new ModelAndView("vcl/report", "model", responseMap);
		
      }

}
