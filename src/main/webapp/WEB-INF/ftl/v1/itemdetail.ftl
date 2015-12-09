
<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>


<div class="">
  
      <div class="banner_left">
        	<div class="banner_right">
            	<div class="ser_banner_bg">
            		<div class="container">
                          
                         <div class="ser_banner">
                                <!--  <div class="banner_sea">
                                   	<a href="" class="btn_bsearch">Back to search</a>
                                    
                                 </div>
                                 <div class="btn_banner_sea">
                           	        <p><span>Are you a transport company?</span><br /> You can quote on this work<br /> with no sign up or subscription fees.</p>
                                    <a href="#" class="btn_learn">Learn More</a>
                                 </div> -->
                          </div>
                                                             	
                    </div>                    
                </div>
            </div>
        </div>
 
        <div class="container QuotesList">
        
        	<div class="quotesDetails">
        	
            	<div class="itemID" style="overflow: hidden;">
                    <ul>
                      <#-- Furniture -->
	   
	    <#list model["retrieveItem"] as retrieveItem>
	      <li><strong><@spring.message 'label.itemdetail.itemid' />:</strong> ${retrieveItem.id}</li>
                        <li>|</li>
                        <li><strong>${retrieveItem.description}</strong></li>
	
	  
                    </ul>
                    <p><a href="#" class="flag"><@spring.message 'label.itemdetail.reortitem' /></a></p>
                </div>
                <div class="quotesAddress">
                	<p><strong><@spring.message 'label.vclhome.from' />:</strong> ${retrieveItem.coladdress}</p>
                    <p><strong><@spring.message 'label.vclhome.to' />:</strong> ${retrieveItem.deladdress}</p>
                </div><!--quotesAddress-->
                
               </#list>
               
           
                
                <div class="listingInformation">
                    <div class="listInfo">
                    	<h3><@spring.message 'label.itemdetail.listinginfo' /></h3>
                      <div class="generalItems">
                        	<div class="generalImg">
                            	<div id="container">
                                                         
                                     <div id="carousel">
                                     
                                    
                                      <#list model["retrieveItemsImages"] as  retrieveItemsImages>
                                        <div id="slide${retrieveItemsImages.id}" class="slide">
                                            <img src="${retrieveItemsImages.imagename}" style="height: 138px;padding-left: 38px;width: 213px;"/>
                                            <div class="text">
						                        
                                            </div>
                                        </div>
                                         </#list>
                                        		
                                    </div>
                                    <a href="#" id="ui-carousel-next">&gt;</a>
                                    <a href="#" id="ui-carousel-prev">&lt;</a>
                                    <h1>${model["ItemTypeID"]}</h1>
                                    
                                </div><!--end Caurosel-->
                                    
                                  <p style="margin: 30px 0 0;"><@spring.message 'label.itemdetail.totalnumberofitem' />:<#assign y=model["retrieveItemsDetail"]?size> ${y} </p>
                                    
                                </div>
                          
                            
                            <div class="user">
                            	<ul>
                            	  <#list model["retrieveItem"] as retrieveItem>
                                	<li><strong><@spring.message 'label.vclhome.user' />  </strong><span>: ${retrieveItem.shortname}</span></li>
                                    <li><strong><@spring.message 'label.itemdetail.datelist' /></strong><span>: ${retrieveItem.creates?datetime?string["dd-MM-YYY"]}</span></li>
                                    <li><strong><@spring.message 'label.itemdetail.dateupdated' /> </strong><span>: ${retrieveItem.creates?datetime?string["dd-MM-YYY"]}</span></li>
                                    <li><strong><@spring.message 'label.itemdetail.ends' /></strong><span>: 18h 14m</span></li>
                                  
                                  <#--   <li>Low Quote<span>:&#163 <#list model["lowestPrice"] as lowestPrice>${lowestPrice.amount}</#list></span></li>
                                  -->   <li><strong># <@spring.message 'label.itemdetail.ofquote' /> </strong><span>:	<#assign x=model["retrieveQuote"]?size> ${x} </span></li>
                                    <!-- <li><strong>Transport Messages</strong><span>: 0 (View)</span></li> -->
                                       </#list>
                                </ul>
                               
                            </div>
                      </div>
                    </div>
                    
                    <div class="map">
                     <#list model["retrieveItem"] as retrieveItem>
                    	<p style="margin: 1px 2px 18px;"><img src="${retrieveItem.map}" width="250" height="253" /></p>
                    	 
                    	
                    <#--    <p class="location"><strong>Collection :</strong> ${retrieveItem.coladdress}</p>
                        <p class="location"><strong>Delivery :</strong> ${retrieveItem.deladdress}</p> -->
                        <p class="location distance"><strong><@spring.message 'label.itemdetail.distance' /> :</strong> Approx ${retrieveItem.millage} Kilometer</p>
                       <#--  <p class="location time"><strong><@spring.message 'label.itemdetail.timescale' />:</strong> </p>-->
                        
                         </#list>
                    </div>
                    
                </div><!--listingInformation-->
                
                <div class="itemDetails">
                	<p style="margin: 15px 0 19px; background:url(img/bg_fav.png) no-repeat"><img src="assets/img/<@spring.message 'label.getquote.itemdetails' />" width="108" height="14" /></p>
                	
                	
                	<#include "itemsublist.ftl">
                  
					
              </div>
                    
                
            </div><!--QuotesDetails listing information-->
            
        	<div class="container-fluid dashboard quotesList">
                <ul class="nav nav-tabs droptabs dashboard quotesList">
                  <!--   <li class="active always-visible"><a href="#home" data-toggle="tab"><img src="assets/img/db_activity.png" width="120" height="29" /></a></li>
                    <li ><a href="#settings1" data-toggle="tab"><img src="assets/img/db_messages.png" width="138" height="29" /></a></li>
                    <li><a href="#settings2" data-toggle="tab" ><img src="assets/img/db_accounts.png" width="135" height="29" /></a></li>
                    -->
                    <li class="active always-visible"><a href="#home" data-toggle="tab"><img src="assets/img/<@spring.message 'label.itemdetail.activequote' />" width="181" height="29" /></a></li>
                    <li ><a href="#settings1" data-toggle="tab"><img src="assets/img/<@spring.message 'label.itemdetail.otherquote' />" width="175" height="29" /></a></li>
                    <li><a href="#settings2" data-toggle="tab" ><img src="assets/img/<@spring.message 'label.itemdetail.question' />" width="140" height="29" /></a></li>
                   
                   
                    
                    <!--<li class="dropdown pull-right">
                        <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                            <li class="always-dropdown"><a href="#settings4" data-toggle="tab">Always in dropdown</a></li>
                        </ul>
                 </li>-->
                </ul>
			<div class="row-fluid ">
				<div class="row-fluid">
					<div class="tab-content span4">
                        <div class="tab-pane active dashboard quotesList" id="home">
                        	<div class="activeQuots">
                            	<table>
                                	<tr>
                                    	<th><@spring.message 'label.itemdetail.transportprovider' /></th>
                                        <th><@spring.message 'label.itemdetail.quoteamount' /></th>
                                        <th><@spring.message 'label.prohome.message' /></th>
                                        <th><@spring.message 'label.itemdetail.details' /></th>
                                    </tr>
                                    <#if model["retrieveQuote"]?has_content>
                                   <#list model["retrieveQuote"] as retrieveQuote>
        <tr>
         <td><a href="feedback.html?profile=${retrieveQuote.shortname}">${retrieveQuote.shortname}</a></td>
           <td>&#163 ${retrieveQuote.amount}</td>
           <#if model["msgCount"]??>
            <td> ${model["msgCount"]} <@spring.message 'label.prohome.message' /></td>
           <#else>
            <td> 0 <@spring.message 'label.prohome.message' /></td> 
           </#if>
         
         <td><a href="#div${retrieveQuote.id}" class="navLink btn_viewimg"></a></td>
                                    </tr>
                                    <tr>
                                    	<td colspan="4" class="nopadding">
                                        	<div id="div1" class="page">
                                               <div class="pageLeft">
                                               		<p>-<@spring.message 'label.itemdetail.nomessagedisplay' />-</p>
                                               </div>
                                               <div class="pageRight">
                                               		<h1><@spring.message 'label.itemdetail.quoteinfo' /></h1>
                                                    <ul>
                                                    	<li><strong><@spring.message 'label.itemdetail.transportprovider' />:</strong> <span><a href="feedback.html?profile=${retrieveQuote.shortname}">${retrieveQuote.shortname}</a></span></li>
                                                        <li><strong><@spring.message 'label.vclhome.quote' />:</strong> <span>&euro;${retrieveQuote.amount}(Fully enclusive, no extra fees or card changes)</span></li>
                                                        <li><strong><@spring.message 'label.itemdetail.vechile' />:</strong> <span>${retrieveQuote.vehicle}</span></li>
                                                        <li><strong><@spring.message 'label.itemdetail.nooforter' />:</strong> <span>2</span></li>
                                                        <li><strong><@spring.message 'label.itemdetail.willloadunload' />:</strong> <span>yes</span></li>
                                                        <li><strong><@spring.message 'label.itemdetail.packunpack' />:</strong> <span>Yes</span></li>
                                                        <li><strong><@spring.message 'label.itemdetail.timescale' />:</strong> <span>${retrieveQuote.timescale}</span></li>
                                                    </ul>
                                               </div>                                              
                                            </div>
                                        </td>
                                    </tr>
       
        
        </#list>
        <#else>
                                                         <tr class="boldbg" style="background-color:#f4f4f4;" >
                                                        	<td colspan="4"><@spring.message 'label.itemdetail.noquoteyet' /></td>
                                                           
                                                        </tr>
                                                            </#if>
                                </table>
                            </div>
                        </div>	<!--END HOME-->
                        
                        <div class="tab-pane dashboard quotesList" id="settings1">
                        	<div class="activeQuots">
                            	<table>
                                	<tr>
                                    	<th><@spring.message 'label.itemdetail.transportprovider' /></th>
                                        <th><@spring.message 'label.itemdetail.quoteamount' /></th>
                                        <th><@spring.message 'label.prohome.message' /></th>
                                        <th><@spring.message 'label.itemdetail.details' /></th>
                                    </tr>
                                      <tr class="boldbg" style="background-color:#f4f4f4;" >
                                                        	<td colspan="4"><@spring.message 'label.itemdetail.noquoteyet' /></td>
                                                           
                                                        </tr>
                                </table>
                            </div>
                        </div><!--@end Message-->
                        
                        <div class="tab-pane dashboard quotesList" id="settings2">
                        	<div class="activeQuots">
                            	<table>
                                	
                                       <tr>
                                    	<th colspan="4"><@spring.message 'label.itemdetail.questionfromtransporter' /> </th>
                                        
                                    </tr>
                                     <#if model["retrieveQuestMessages"]?has_content>
                            	<#list model["retrieveQuestMessages"] as retrieveMessage>
   	                                 
   	                           
   	                                 <tr>
                                    	   	
                                        <td colspan="3"> ${retrieveMessage.shortname} <span>(0)</span> <span> ${retrieveMessage.creates?datetime?string["MM/dd hh:mm a"]}</span></td>
                                        <td><a class="navLink btn_viewimg" href="#div${retrieveMessage.id}" data-href="${retrieveMessage.messageuid}" onclick="loadMessage('${retrieveMessage.id}','${retrieveMessage.messageuid}')"></a></td>
                                    </tr>  
   	                           
   	                          
   	                         
                                    <tr>
                                    	<td class="nopadding" colspan="4">
                                        	<div class="" id="div${retrieveMessage.id}" style="display: none;">
                                            	
                                                                               
                                            </div>
                                        </td>
                                    </tr>  
                                    
                                       </#list>   
                                        <#else>
                                                         <tr class="boldbg" style="background-color:#f4f4f4;" >
                                                        	<td colspan="4"><@spring.message 'label.itemdetail.noquestion' /></td>
                                                           
                                                        </tr>
                                                            </#if>                          
                                </table>
                            </div>
                        </div><!-- @end Accounts-->
                        
                      
				  </div>
			    </div>
		   </div>
	      </div>
                      <#if model["username"]??>
<script>



function loadMessage(divid,messageid){                        	
   	console.log("value");
  // 	$("#cmdBox").hide();
   	$("#div"+divid).load("pro/askquestion.html?messageid="+divid+"&messageuid="+messageid);                     	
   	
      }	
</script>
<#else>
<script>



function loadMessage(divid,messageid){                        	
   	console.log("value");
  // 	$("#cmdBox").hide();
   	$("#div"+divid).load("askquestion.html?messageid="+divid+"&messageuid="+messageid);                     	
   	
      }	
</script>


</#if>
<script src="assets/js/jquery.droptabs.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="assets/js/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="assets/js/jcarousel.basic.js"></script>
 
<script src="assets/js/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript" src="assets/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="assets/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="assets/js/jquery.ui.rcarousel.js"></script>

<script type="text/javascript">

			jQuery(function($){
				function generatePages(){
					var _total, i, _link;
					
					_total = $("#carousel").rcarousel("getTotalPages");
					
					for (i = 0;i< _total;i++) {
						_link = $("<a href='#'></a>");
						
						$(_link)
							.bind("click",{page: i},
								function(event) {
									$("#carousel").rcarousel("goToPage", event.data.page);
									event.preventDefault();
								}
							)
							.addClass("bullet off")
							.appendTo("#pages");
					}
					
					// mark first page as active
					$("a:eq(0)","#pages")
						.removeClass("off")
						.addClass("on")
						.css("background-image","url(images/page-on.png)");

				}

				function pageLoaded(event,data){
					$("a.on","#pages")
						.removeClass("on")
						.css("background-image","url(images/page-off.png)");

					$("a","#pages")
						.eq(data.page)
						.addClass("on")
						.css("background-image","url(images/page-on.png)");
				}
				
				$("#carousel").rcarousel(
					{
						visible: 1,
						step: 1,
						speed: 700,
						auto: {
							enabled: false
						},
						width: 255,
						height: 200,
						start: generatePages,
						pageLoaded: pageLoaded
					}
				);
				
				$("#ui-carousel-next")
					.add("#ui-carousel-prev")
					.add(".bullet")
					.hover(
						function(){
							$(this).css("opacity", 0.7);
						},
						function(){
							$(this).css("opacity",1.0);
						}
					);
			});// end of caurosel
			
			
</script> 


  
<script type="text/javascript">
	$(".droptabs").droptabs({
		development:true
	});
	 $(function(){
 $("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
 $("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
 });
</script>

<script type="text/javascript">
 $('.navLink').on('click',function(e){
    e.preventDefault();
    var targetDiv = $($(this).attr('href'));
    if(!targetDiv.is(':visible')){
    	 $('.page').show();
        targetDiv.slideDown();
    }else{
        $('.page').hide();
    }
});
</script> 

	<!-- /.panel-body -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
      <link rel="stylesheet" href="assets/css/bootstrap.theme.min.css"/>
      <style>
      
      .wrapper {
      min-height: 100px;
      width:225px;
      }
    .page {
    display: none;
}
.activeQuots table .nopadding {
    border: medium none;
    margin: 0;
    padding: 0;
}
.pageLeft {
    float: left;
    overflow: hidden;
    width: 60%;
}
.pageLeft p {
    border-bottom: 1px solid #eee;
    border-right: 1px solid #eee;
    margin: 0;
    padding: 10px;
}
.pageRight {
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    float: left;
    overflow: hidden;
    padding: 10px;
    width: 40%;
}
.pageRight h1 {
    font-size: 16px;
    margin: 15px 0;
}
.pageRight ul {
    overflow: hidden;
}
.pageRight ul li {
    text-align: left;
}
.pageRight ul li strong {
    clear: both;
    display: block;
    float: left;
    width: 130px;
}
.pageRight ul li span {
    display: block;
    overflow: hidden;
}
.pageRight p a {
    background: none repeat scroll 0 0 #ff7f00;
    color: #fff;
    display: block;
    font-weight: bold;
    padding: 10px 0;
}
.pageRight p a:hover {
    background: none repeat scroll 0 0 #333;
}
.ser_banner_bg.inner {
    background: url("../img/bg_inner.jpg") no-repeat scroll center 0 rgba(0, 0, 0, 0);
}
#container {
    border: 1px solid #eee;
    margin: 0 auto;
    position: relative;
    width: 255px;
}
#carousel {
    margin: 0 auto;
    width: 780px;
}
#ui-carousel-next, #ui-carousel-prev {
    display: block;
    font-family: "Comic Sans MS",cursive;
    font-size: 35px;
    position: absolute;
    top: 90px;
    z-index: 100;
}
#ui-carousel-next {
    right: 0;
}
#ui-carousel-next:hover, #ui-carousel-prev:hover {
    color: #ff7f00;
}
#ui-carousel-prev {
    left: 0;
}
#ui-carousel-next > span, #ui-carousel-prev > span {
    display: none;
}
.slide {
    margin: 0;
    position: relative;
}
.slide img {
    height: 100px;
    width: 100px;
}
#container h1 {
    bottom: 0px;
    color: #ff7f00;
    font-size: 18px;
    left: 56px;
    position: absolute;
}
#slide01 > img, #slide02 > img, #slide03 > img, #slide04 > img, #slide05 > img, #slide06 > img {
    left: 70px;
    position: absolute;
    top: 30px;
}
#slide01 > .text, #slide02 > .text, #slide03 > .text, #slide04 > .text, #slide05 > .text, #slide06 > .text {
    bottom: 20px;
    left: 50px;
    position: absolute;
}
#pages {
    margin: 0 auto;
    width: 150px;
}
      </style>
	</@u.trucklayout> 