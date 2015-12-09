
<#import "productownerlayout.ftl" as u>
<@u.productownerlayout>

<div class="">
  
      
 
        <div class="container QuotesList">
        
        	<div class="quotesDetails">
        	
            	<div class="itemID" style="overflow: hidden;">
                    <ul>
                      <#-- Furniture -->
	   
	    <#list model["retrieveItem"] as retrieveItem>
	    <#assign itemid=retrieveItem.id >
	      <li><strong>Item Id:</strong> ${retrieveItem.id}</li>
                        <li>|</li>
                        <li><strong>${retrieveItem.description}</strong></li>
	
	  
                    </ul>
                    <p><a href="#" class="flag">Report Item</a></p>
                </div>
                <div class="quotesAddress">
                	<p><strong>From:</strong> ${retrieveItem.coladdress}</p>
                    <p><strong>To:</strong> ${retrieveItem.deladdress}</p>
                </div><!--quotesAddress-->
                
               </#list>
                <div class="listingInformation">
                    <div class="listInfo">
                    	<h3>Listing Information</h3>
                      <div class="generalItems">
                        	<div class="generalImg">
                            	<div id="container">
                                                         
                                     <div id="carousel">
                                     
                                    
                                      <#list model["retrieveItemsImages"] as  retrieveItemsImages>
                                        <div id="slide${retrieveItemsImages.id}" class="slide">
                                            <img src="${retrieveItemsImages.imagename}" style="height: 138px;padding-left: 12px;width: 213px;"/>
                                            <div class="text">
						                        
                                            </div>
                                        </div>
                                         </#list>
                                        		
                                    </div>
                                    <a href="#" id="ui-carousel-next">&gt;</a>
                                    <a href="#" id="ui-carousel-prev">&lt;</a>
                                    <h1>General Items</h1>
                                    
                                </div><!--end Caurosel-->
                                    
                                 <p style="margin: 30px 0 0;">Total number of items To move:<#assign y=model["retrieveItemsDetail"]?size> ${y} </p>
                                    
                                </div>
                          
                            
                            <div class="user">
                            	<ul>
                            	  <#list model["retrieveItem"] as retrieveItem>
                                	<li>User<span>: ${retrieveItem.shortname}(0)</span></li>
                                    <li>Date Listed<span>: ${retrieveItem.creates}</span></li>
                                    <li>Date Updated<span>:  ${retrieveItem.creates}</span></li>
                                    <li>Ends<span>: 18h 14m</span></li>
                                       <#--  <li>Low Quote<span>: &#163 <#list model["lowestPrice"] as lowestPrice>${lowestPrice.amount}</#list></span></li>   -->                           
                                    <li># of Quote<span>:<#assign x=model["retrieveQuote"]?size> ${x}</span></li>
                                    <li>Transport Messages<span>: 0(View)</span></li>
                                       </#list>
                                </ul>
                             
                            </div>
                      </div>
                    </div>
                    
                    <div class="map">
                     <#list model["retrieveItem"] as retrieveItem>
                    	<p style="margin: 0 0 20px;"><img src="${retrieveItem.map}" width="250" height="253" /></p>
                    	 
                    	
                        <p class="location"><strong>Collection :</strong> ${retrieveItem.coladdress}</p>
                        <p class="location"><strong>Delivery :</strong> ${retrieveItem.deladdress}</p>
                        <p class="location distance"><strong>Distance :</strong> Approx ${retrieveItem.millage} Kilometer</p>
                        <p class="location time"><strong>Time Scale :</strong> 5hr 23mins</p>
                        
                         </#list>
                    </div>
                    
                </div><!--listingInformation-->
                
                <div class="itemDetails">
                	<p style="margin:0 0 20px; padding: 4px 25px; background:url(../assets/img/bg_fav.png) no-repeat"><img src="../assets/img/item_details.png" width="108" height="14" /></p>
                	<#list model["retrieveItemsDetail"] as retrieveItemDetailList>
                	<div class="itemSpec">
                	
                   	  <h2>Item</h2>	
                        <ul>
                        
                        	<li><strong>Description :</strong> ${retrieveItemDetailList.description}</li>
                            <li><strong>Length :</strong>${retrieveItemDetailList.length}</li>
                            <li><strong>width :</strong> ${retrieveItemDetailList.width}</li>
                            <li><strong>height :</strong> ${retrieveItemDetailList.height}</li>
                            <li><strong>weight :</strong>${retrieveItemDetailList.weight}</li>
                        </ul>
                  </div>
                   </#list>
                  
					
              </div>
                    
                
            </div><!--QuotesDetails listing information-->
            
        	<div class="container-fluid dashboard quotesList">
                <ul class="nav nav-tabs droptabs dashboard quotesList">
                    <!-- <li class="active always-visible"><a href="#home" data-toggle="tab"><img src="../assets/img/db_activity.png" width="120" height="29" /></a></li>
                    <li ><a href="#settings1" data-toggle="tab"><img src="../assets/img/db_messages.png" width="138" height="29" /></a></li>
                    <li><a href="#settings2" data-toggle="tab" ><img src="../assets/img/db_accounts.png" width="135" height="29" /></a></li>
                    -->
                    <li class="active always-visible"><a href="#home" data-toggle="tab"><img src="../assets/img/activeQuote.png" width="181" height="29" /></a></li>
                    <li ><a href="#settings1" data-toggle="tab"><img src="../assets/img/declinedAndExpired.png" width="175" height="29" /></a></li>
                    <li><a href="#settings2" data-toggle="tab" ><img src="../assets/img/transportQuestion.png" width="140" height="29" /></a></li>
                   
                   
                    
                    <!--<li class="dropdown pull-right">
                        <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                            <li class="always-dropdown"><a href="#settings4" data-toggle="tab">Always in dropdown</a></li>
                        </ul>
                 </li>-->
                </ul>
			<div class="row-fluid ">
				<div class="row-fluid">
					<div class="tab-content span12">
                        <div class="tab-pane active dashboard quotesList" id="home">
                        	<div class="activeQuots">
                            	<table>
                                	<tr>
                                    	<th>Transport Provider</th>
                                        <th>Quote Amount</th>
                                        <th>Messages</th>
                                        <th>Details</th>
                                    </tr>
                                   <#list model["retrieveQuote"] as retrieveQuote>
        <tr>
         <td>${retrieveQuote.shortname}</td>
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
                                        	<div id="div${retrieveQuote.id}" class="page">
                                               <div class="pageLeft">
                                               		<p>-no messages display-</p>
                                               </div>
                                               <div class="pageRight">
                                               		<h1>Quote Information</h1>
                                                    <ul>
                                                     
                                                    	<li><strong>Transport Provider:</strong> <span><a href="#">${retrieveQuote.shortname}</a></span></li>
                                                        <li><strong>Quote:</strong> <span>&euro;${retrieveQuote.amount}(Fully enclusive, no extra fees or card changes)</span></li>
                                                        <li><strong>Vehicle:</strong> <span>${retrieveQuote.vehicle}</span></li>
                                                        <li><strong>No. of porter's:</strong> <span>2</span></li>
                                                        <li><strong>Will load/unload:</strong> <span>yes</span></li>
                                                        <li><strong>Will pack/unpack:</strong> <span>Yes</span></li>
                                                       <li><a class="combtn" style="padding: 0px !important" id="" href="../pay.html?qid=${retrieveQuote.id}&amount=${retrieveQuote.amount}&id=${itemid}">Pay and Accept Quote</a></li>
                                                    </ul>
                                               </div>                                              
                                            </div>
                                        </td>
                                    </tr>
       
        
        </#list>
                                </table>
                            </div>
                        </div>	<!--END HOME-->
                        
                        <div class="tab-pane dashboard quotesList" id="settings1">
                        	<div class="activeQuots">
                            	<table>
                                	<tr>
                                    	<th>Transport Provider</th>
                                        <th>Quote Amount</th>
                                        <th>Messages</th>
                                        <th>Details</th>
                                    </tr>
                                   
                                </table>
                            </div>
                        </div><!--@end Message-->
                        
                        <div class="tab-pane dashboard quotesList" id="settings2">
                        	<div class="activeQuots">
                            	<table>
                                	
                               <div class="tab-pane dashboard quotesList" id="settings2">
                        
                        	<div class="askquestion activeQuots" id="">
                        	
                        	
                        		<table>
                                	<tbody><tr>
                                    	<th colspan="4">Questions From The Transporter </th>
                                        
                                    </tr>
                                   
                            	<#list model["retrieveQuestMessages"] as retrieveMessage>
   	                                 
   	                           
   	                                 <tr>
                                    	   	
                                        <td colspan="3"> ${retrieveMessage.shortname} <span>(0)</span> <span> ${retrieveMessage.creates}</span></td>
                                        <td><a class="navLink btn_viewimg" href="#div${retrieveMessage.id}" data-href="${retrieveMessage.messageuid}" onclick="loadMessage('${retrieveMessage.id}','${retrieveMessage.messageuid}')"></a></td>
                                    </tr>  
   	                           
   	                          
   	                         
                                    <tr>
                                    	<td class="nopadding" colspan="4">
                                        	<div class="" id="div${retrieveMessage.id}" style="display: none;">
                                            	
                                                                               
                                            </div>
                                        </td>
                                    </tr>  
                                    
                                       </#list>
                                                     
                                </tbody></table>
                        	
                        	
                            	
                            	        </div>            	
                            </div>
                        </div><!-- @end Accounts-->
                        
                       <script>
                        
                       
                        
                        function loadMessage(divid,messageid){                        	
        	               	console.log("value");
        	              // 	$("#cmdBox").hide();
        	               	$("#div"+divid).load("askquestion.html?messageid="+divid+"&messageuid="+messageid);                     	
        	               	
        	                  }	
                        
                        
                            	$(function(){
                        
                            		
                            		
                            		
                            		$("#askQuestion").click(function(){
                            			
                            			$("#cmdBox").show();
                            		
                            		
                            		});
                            		
                            		
                            	$("#submit").click(function(){
                            	
                            	var message=$("#question").val();
                            	
                            	$("#displayMessages").append("<p>"+message+"</p>");
                            	
                            	
                            	$.post( "../message.html",$("#questions").serialize(), function( data ) {
                            		
                            		//alert("send successfully");
                            		
                            	//	$("#displayMessages").html(data)
                            		location.reload();
                            		
                            		});
                            	
                            	
                            	});
                            	
                            	});
                            	
                            	</script> 
				  </div>
			    </div>
		   </div>
	      </div>

          
<script src="../assets/js/jquery.droptabs.js"></script>
<script src="../assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="../assets/js/jcarousel.basic.js"></script>
 
<script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
<script type="text/javascript" src="../assets/js/jquery.ui.core.js"></script>
<script type="text/javascript" src="../assets/js/jquery.ui.widget.js"></script>
<script type="text/javascript" src="../assets/js/jquery.ui.rcarousel.js"></script>

<script type="text/javascript">
			jQuery(function($){
				
				
				 $("#colfromdate").datepicker();
					$("#coltodate").datepicker()
					$("#delfromdate").datepicker();
					$("#deltodate").datepicker();
					$("#expdate").datepicker();
					
				
		          var link="myaccount.html";
		          
		         
		          
		          
		          $("#acceptQuoteID").click(function(){
		        	  
		        	  var quoteid=$(this).attr("data-quote");
		          	
		        	  console.log("quoteid:" + quoteid);
		        	  AppUtil.showAjaxLoader();
		            	$.post(link,  { quoteid: quoteid}, function(data) {
		                   // console.log("data:" + data);
		                   // $("#truckbody").innerHTML=data;
		                  //  $("#quoteform").reset();
		                  
		                    AppUtil.removeAjaxLoader();
		                    alert("quote Accept successfully");
		                 
		                 });
		        	  
		        	  
		          });

		       

				
		   	function generatePages(){
				var _total, i, _link;
				
				_total = $("#carousel").rcarousel("getTotalPages");
				
				for (i = 0;i< _total;i++) {
					_link = $("<a href='#'></a>");
					
					$(_link)
						.bind("click",{page: i},
							function(event){
								$("#carousel").rcarousel("goToPage",event.data.page);
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
							$(this).css("opacity",0.7);
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
        $('.page').slideUp();
        targetDiv.slideDown();
    }else{
        $('.page').slideUp();
    }
});
</script> 

 

   
   
      <style>
      .bcolor{
      
      color:#333;
      
      }
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
    bottom: 20px;
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

#placeQuoteID{
    padding-left: 153px;
    width: 600px;
}
p {
  
    font-size: 13px;
    
}
#acceptQuoteID{
background-color: #f4f4f4;
    border: 1px solid #333;
    cursor: pointer;
    height: 50px;
    margin-left: 111px;
   
    width: 300px;

}

</style>

    
   
      
	</@u.productownerlayout> 