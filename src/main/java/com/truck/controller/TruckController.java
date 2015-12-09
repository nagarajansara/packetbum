package com.truck.controller;


public class TruckController  {
/*	private static final Logger LOGGER = Logger.getLogger(TruckController.class);

	@Autowired
	private TruckDAO dao;

	
	private final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	Date date = new Date();
	
	
   // protected AuthenticationManager authenticationManager;
	@Autowired 
	@Qualifier("truckAuthManager")	
	
	//@Autowired @Qualifier("org.springframework.security.authenticationManager")
	private AuthenticationManager authenticationManager;
	
		
	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String login(@ModelAttribute("model") ModelMap model,Integer login_error,Integer login) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
	
		return "login";
	}
	
	@RequestMapping(value = { "/index" }, method = RequestMethod.GET)
	public String indexpage(@ModelAttribute("model") ModelMap model,Integer login_error,Integer login) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");
	
		System.out.println(System.getProperty("catalina.home"));
		 // String result = this.context.getRealPath("");
		
		return "index";
	}
	
	
	@RequestMapping(value = { "/qfurniture" }, method = RequestMethod.GET)
	public String qfurniturepage(@ModelAttribute("model") ModelMap model,Integer login_error,Integer login) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");
		return "qfurniture";
	}
   
	@RequestMapping(value = { "/qfurniture" }, method = RequestMethod.POST)
	public ModelAndView qfurniture(@ModelAttribute("furnitureform")Furnitureitem furnitureitem) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		 String saveDirectory = "F:/fence/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/webapps/upload/images/furniture/";
		 
		 String serverPath="/upload/images/furniture/";
		 
		 LOGGER.info("image:"+furnitureitem.getDescription());
	       MultipartFile photoFiles = furnitureitem.getPhotosmultipart();	 
	       String fileName = TruckUtil.getUUID()+"-F"+photoFiles.getOriginalFilename();
	       TruckUtil.uploadFiles(photoFiles, saveDirectory,fileName);
	     
	       furnitureitem.setPhotos(saveDirectory+fileName);  
	       long furnitureid=dao.addFurniture(furnitureitem);
	       LOGGER.info("furnitureid-"+furnitureid);
	       int getUserid;
	       try{
	    	    getUserid=dao.checkUserExits(furnitureitem.getEmail());
	       }catch(EmptyResultDataAccessException e){
	    	   LOGGER.info("empty:"+e.getMessage());
	    	   getUserid=0;
	       }
	       UsernamePasswordAuthenticationToken auth;
	       
	        LOGGER.info("userid"+getUserid);
	        Boolean isAthenticateByServer = false;
	    	Users users=new Users();
	        if(getUserid == 0){
	        	users.setUsername(users.getEmail());
	        	Encryption ecncode=new Encryption();
	           //  users.setPassword(ecncode.encode(String.valueOf(123), furnitureitem.getEmail()));
	        	
	        	users.setPassword(String.valueOf(123));
	        	users.setEmail(furnitureitem.getEmail());
	        	 getUserid =(int) dao.addProductOwner(users);
	        	 LOGGER.info("new userid"+getUserid);
	        	// authenticateUserAndSetSession(users, request);
	        	 LOGGER.info("user mail:"+users.getEmail());
	        	 LOGGER.info("pass-:"+users.getPassword());
	        	 auth = new UsernamePasswordAuthenticationToken(users.getEmail(),123);
	        	 authenticationManager.authenticate(auth);
	        	 if(SecurityContextHolder.getContext().getAuthentication().isAuthenticated()) {
	 	            SecurityContextHolder.getContext().setAuthentication(auth);
	 	           isAthenticateByServer=true;
	 	          }
	        	 LOGGER.info("isAthenticateByServer:"+isAthenticateByServer);
	        	 LOGGER.info("isAthenticateBy-:"+SecurityContextHolder.getContext().getAuthentication().isAuthenticated());
	        }
	        String [] collatlongValue=GoogleGeoCode.getLatLong(furnitureitem.getColpostcode()+""+furnitureitem.getColcountry());
	        
	        String [] dellatlongValue=GoogleGeoCode.getLatLong(furnitureitem.getDelpostcode()+""+furnitureitem.getDelcountry());
	        
	        
	        String colLat=null,colLong=null,delLat=null,delLong=null,coladdress=null,deladdress=null;
	        
	        //getting Lattitute,Longtitue value For Collection Country
	        colLat=collatlongValue[0];
	        colLong=collatlongValue[1];
	        coladdress=collatlongValue[2];
	        
	        //getting Lattitute,Longtitue value For Delivery Country
	        
	        delLat=dellatlongValue[0];
	        delLong=dellatlongValue[1];
	        deladdress=dellatlongValue[2];
	        
	        String GoogleMap="http://maps.googleapis.com/maps/api/staticmap?size=250x253&maptype=roadmap&markers=color:green|label:|"+colLat+
	        		","+colLong+"&markers=color:red|color:red|label:|"+delLat+","+delLong+"&path=color:0x0000ff|weight:5|"+colLat+","+colLong+"|"+delLat+","+delLong+"&sensor=false&language=en";
	        
	        Items item=new Items();
	        item.setDescription(furnitureitem.getDescription());
	        item.setPhotos(serverPath+fileName);
	        item.setMillage(String.valueOf((int)TruckUtil.distance(Double.parseDouble(colLat), Double.parseDouble(colLong), Double.parseDouble(delLat), Double.parseDouble(delLong),'M')));
	        item.setColcountry(String.valueOf(CountryMaster.COUNTRYMASTER_MAP.get(furnitureitem.getColcountry())));
	        item.setColpostcode(furnitureitem.getColpostcode());
	        item.setDelcountry(String.valueOf(CountryMaster.COUNTRYMASTER_MAP.get(furnitureitem.getDelcountry())));
	        item.setDelpostcode(furnitureitem.getDelpostcode());
	        item.setItemdetailsid((int)furnitureid);
	        item.setUserid((int)getUserid);
	        item.setMap(GoogleMap);
	        item.setColaddress(coladdress);
	        item.setDeladdress(deladdress);
	        item.setItemtypeid(1);
	        dao.addItems(item);
	        
	        LOGGER.info("GoogleMap-"+GoogleMap);
	        responseMap.put("retrieveItems",dao.retriveItems());
	        
		//return "pro/listitem";
	       if(isAthenticateByServer){
		      return new ModelAndView("listitem", "model", responseMap);
	       }
	       return new ModelAndView("listitem", "model", responseMap);
	}
	
	
	@RequestMapping(value = { "/listitem" }, method = RequestMethod.GET)
	public ModelAndView listitempage(@ModelAttribute("model") ModelMap model) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		 responseMap.put("retrieveItems",dao.retriveItems());
		   LOGGER.info("datas"+dao.retriveItems());
		
		return new ModelAndView("listitem", "model", responseMap);
	}
	
	
	@RequestMapping(value = { "/vcl/index" }, method = RequestMethod.GET)
	public ModelAndView vclindexpage(@ModelAttribute("model") ModelMap model,Integer login_error,Integer login) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
		 responseMap.put("retrieveItems",dao.retriveItems());
		   //LOGGER.info("datas"+dao.retriveItems());
		
		return new ModelAndView("/vcl/index", "model", responseMap);
		
		
		
	}
	@RequestMapping(value = { "/vcl/itemdetail" }, method = RequestMethod.GET)
	public ModelAndView vclitemdetailpage(@ModelAttribute("model") ModelMap model, Integer id) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
				
		 responseMap.put("retrieveItem",dao.getItem(id));
		//Items ite=(Items) dao.getItem(id);
		 int furnitureItemID = 0;	 
		 
		 for(Items item: dao.getItem(id)){
			  //  System.out.println("item id: "+item.getItemtypeid());
			    furnitureItemID=item.getItemdetailsid();
			}

		 // System.out.println("Item Value:"+ite.getItemtypeid());
		 
		
		 
		// System.out.println("item type Detail id"+responseMap.get("retrieveItem"));
		 
		 responseMap.put("retrieveItemsDetail",dao.getFurnitureItem(furnitureItemID));
		
		
		return new ModelAndView("vcl/itemdetail", "model", responseMap);
	}
	
	@RequestMapping(value = { "/itemdetail" }, method = RequestMethod.GET)
	public ModelAndView itemdetailpage(@ModelAttribute("model") ModelMap model, Integer id) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		
				
		 responseMap.put("retrieveItem",dao.getItem(id));
		//Items ite=(Items) dao.getItem(id);
		 int furnitureItemID = 0;	 
		 
		 for(Items item: dao.getItem(id)){
			  //  System.out.println("item id: "+item.getItemtypeid());
			    furnitureItemID=item.getItemdetailsid();
			}

		 // System.out.println("Item Value:"+ite.getItemtypeid());
		 
		
		 
		// System.out.println("item type Detail id"+responseMap.get("retrieveItem"));
		 
		 responseMap.put("retrieveItemsDetail",dao.getFurnitureItem(furnitureItemID));
		
		
		return new ModelAndView("itemdetail", "model", responseMap);
	}
	@RequestMapping(value = { "/signup" }, method = RequestMethod.GET)
	public String signuppage(@ModelAttribute("model") ModelMap model,Integer login_error,Integer login) {
		Map<String, Object> responseMap = new HashMap<String, Object>();
		LOGGER.info("Going to create new Great app");
		return "signup";
	}
	
	
	@RequestMapping(value = { "/signup" }, method = RequestMethod.POST)
	public String signup(@ModelAttribute("tpsignupform") Vechicleowner vechicleowner) {
		Map<String, Object> responseMap = new HashMap<String, Object>();		
		dao.addSignupTP(vechicleowner);
		LOGGER.info("Going to add signup");
		return "signup";
	}
	
	
	
	
	
	
	
	
*/	
}
