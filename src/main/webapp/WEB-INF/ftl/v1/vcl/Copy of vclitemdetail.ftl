
<#import "vechicleownerlayout.ftl" as u>
<@u.vechicleownerlayout>

<div class="">
  
 
        <div class="container QuotesList">
        
        	<div class="quotesDetails">
        	
            	<div class="itemID" style="overflow: hidden;">
                    <ul>
                      <#-- Furniture -->
	    <#if model["itemtype"] == "furniture">
	    <#list model["retrieveItem"] as retrieveItem>
	      <li><strong>Item Id:</strong> 12345678</li>
                        <li>|</li>
                        <li><strong>${retrieveItem.description}</strong></li>
	                <#assign proownerid=retrieveItem.userid>
	  
                    </ul>
                    <p><a href="#" class="flag">Report Item</a></p>
                </div>
                <div class="quotesAddress">
                	<p><strong>From:</strong>${retrieveItem.coladdress}</p>
                    <p><strong>To:</strong> ${retrieveItem.deladdress}</p>
                </div><!--quotesAddress-->
                
               </#list>
                </#if>
                <div class="listingInformation">
                    <div class="listInfo">
                    	<h3>Listing Information</h3>
                      <div class="generalItems">
                        	<div class="generalImg">
                            	<div id="container">
                                                         
                                     <div id="carousel">
                                     
                                    
                                      <#list model["retrieveItemsImages"] as  retrieveItemsImages>
                                        <div id="slide${retrieveItemsImages.id}" class="slide">
                                            <img src="${retrieveItemsImages.imagename}" style="height: 138px;padding-left: 25px;width: 231px;padding-top: 15px;"/>
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
                                       <#--  <li>Low Quote<span>: &#163 <#list model["lowestPrice"] as lowestPrice>${lowestPrice.amount}</#list></span></li>  -->                            
                                    <li># of Quote<span>:<#assign x=model["retrieveQuote"]?size> ${x}</span></li>
                                    <li>Transport Messages<span>: 0(View)</span></li>
                                       </#list>
                                </ul>
                                <p><a href="#placeQuoteID" id="placeyourquote">Place Your Quote</a></p>
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
                   <!--  <li class="active always-visible"><a href="#home" data-toggle="tab"><img src="../assets/img/db_activity.png" width="120" height="29" /></a></li>
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
           <td>+2 Messages</td>           
      
        
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
                        	<div class="askquestion" id="askquestion">
                        	                        	
                        		<table>
                                	<tbody><tr>
                                    	<th colspan="4">Questions From The Transporter
                                    	
                                    	
                                    	
                                    	<span id="askQuestion">Ask Question</span>
                                    	</th>
                                        
                                    </tr>
                                    
                            
                            	<#list model["retrieveMessages"] as retrieveMessage>
   	                                 
   	                           
   	                                 <tr>
                                    	   	
                                        <td colspan="3"> ${retrieveMessage.shortname} <span>(0)</span> <span> ${retrieveMessage.creates}</span></td>
                                        <td><a class="navLink btn_viewimg" href="#div${retrieveMessage.id}" data-href="${retrieveMessage.messageuid}" onclick="loadMessage('${retrieveMessage.id}','${retrieveMessage.messageuid}')"></a></td>
                                    </tr>  
   	                           
   	                          
   	                         
                                    <tr>
                                    	<td class="nopadding" colspan="4">
                                        	<div class="page" id="div${retrieveMessage.id}" style="display: none;">
                                            	
                                                                               
                                            </div>
                                        </td>
                                    </tr>  
                                    
                                       </#list>
                                           <tr style="display:none;" id="messageBox">
                                    	<td class="nopadding" colspan="4">
                                        	<div class="page" id="" style="display: block;">
                                            	
                                            	 
                                               <div class="pageLeft">
                                               		<div class="messageBox">
                                                       
                            	<form name="questions" id="questions">
                            	
                            	<input type="hidden" value="${model['itemid']}" name="itemid" id="itemid" class="itemid"/>
                                <input type="hidden" value="${model['userid']}" name="vclid" id="vclid" class="vclid"/>
                                 <input type="hidden" value="${model['userid']}" name="userid" id="userid" class="userid"/>
                                <input type="hidden" value="${proownerid}" name="proownerid" id="proownerid" class="proownerid"/>
                               
                           
                            	<input type="hidden" value="no" name="status" id="status" class="status"/>
                                                        <p>
                                                        	<span class="spanTrans"><a href="#">${model['username']}</a></span>
                                                        	<textarea name="message" id="message"></textarea>
                                                        </p>
                                                        <p><button id="submit">Reply</button></p>
                                                    </div>
                                               </div>
                                                                                            
                                            </div>
                                        </td>
                                    </tr>                       
                                </tbody></table>
                        	
                        	
                            	
                            	        </div>            	
                            </div>
                        </div><!-- @end Accounts-->
                        <script>
                        
                       
                        
                        
                        
                        
                            	$(function(){
                        
                            		
                            		
                            		
                            		$("#askQuestion").click(function(){
                            			
                            			$("#messageBox").show();
                            		
                            		
                            		});
                            		
                            		
                            	$("#submit").click(function(){
                            	
                            	var message=$("#question").val();
                            	
                            	$("#displayMessages").append("<p>"+message+"</p>");
                            	
                            	
                            	$.post( "../message.html",$("#questions").serialize(), function( data ) {
                            		
                            		//alert("send successfully");
                            		
                            	//	$("#displayMessages").html(data)
                            		
                            		
                            		});
                            	
                            	
                            	});
                            	
                            	});
                            	
                            	</script>          
                      
				  </div>
			    </div>
		   </div>
	      </div>
       <div class="placeOurQuote" id="placeQuoteID" style="display:none;">
        <form name="palceQuote" id="palceQuote">
               <input type="hidden" value="${model['itemid']}" name="itemid" id="itemid" class="itemid"/>
               <input type="hidden" value="${model['userid']}" name="userid" id="userid" class="userid"/>
                <input type="hidden" value="${proownerid}" name="proownerid" id="proownerid" class="proownerid"/>
          		<h1><img width="168" height="15" src="../assets/img/placeourquote.png"></h1>
                <div class="placeQuote vechile">
                  <h3 style=" float: left; margin: 5px 20px 0 0;"><span>*</span>Vechile :</h3>
                  
                     <input type="text" id="vehicle" name="vehicle" style="height:30px;"/>
                    
                </div>
                
                <div class="placeQuote vechile">
                    <h3><span>*</span>Collection / Transport TimeFrame :</h3>
                    <p><input type="checkbox"  value="yes" name="isflexible" id="flexible">Flexible with the delivery and collection date</p>
                </div>
                
                 <div class="placeQuote vechile">
                 	<div style="float: left; margin: 0 20px 0 0;">
                        <h3>Will collect between</h3>
                        <input type="text" class="datepicker" id="colfromdate" name="colfromdate" placeholder="30/04/2014">
                        <span>to</span>
                        <input type="text" class="datepicker" id="coltodate" name="coltodate" placeholder="30/04/2014">
                    </div>
                    <div>
                        <h3>Will deliver between</h3>
                        <input type="text" class="datepicker" id="delfromdate" name="delfromdate" placeholder="30/04/2014">
                        <span>to</span>
                        <input type="text" class="datepicker" id="deltodate" name="deltodate" placeholder="30/04/2014">
                    </div>
                </div>
                
                <div class="placeQuote vechile">
                    <h3 style=" float: left; margin: 5px 20px 0 0;">Quote Expiry :</h3>
                    <input type="text" class="datepicker" id="expdate" name="expdate"  placeholder="30/04/2014">
                    <span>at</span>
                    <input type="text" class=" timescale" placeholder="2pm">
                    <span>Ist</span>
                </div>
                
                <div class="placeQuote additional">
                    <h3>Additional Details :</h3>
                    <textarea class="addtionalDetails" name="information"  placeholder="Message"></textarea>
                    <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>
                </div>
                
                <div class="placeQuote amount">
                    <h3 style=" float: left; margin: 5px 20px 0 0; overflow: hidden;">Quote Amount :</h3>
                    <p style="overflow: hidden; float: left;"><input type="text" class="quoteAmount"  id="amount" name="amount"/><br><span>(Amount to you (50$))</span></p>
                    <p class="amountpara">Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                </div>
                
                <p class="submitQuote">
                <a class="submit" id="quotebtn" href="#"></a>
                <span>Review Your <a href="#">Terms &amp; Condition</a></span></p>
                
          </div>
           </form>
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
					
				
		          var link="vclitemdetail.html";
		          
		         
		          
		          
		          $("#placeyourquote").click(function(){
		        	  $("#placeQuoteID").show();
		          });

		       $("#quotebtn").click(function(){
				    
		       	var amount,vehicle,timescale,information;
		       	
		       	
		       	amount=$("#amount").val();
		       	vehicle=$("#vehicle").val();
		       	expdate=$("#expdate").val();
		       	information=$("#information").val();
		       	isflexible=$("#isflexible").val();
		       	colfromdate=$("#colfromdate").val();
		       	coltodate=$("#coltodate").val();
		       	delfromdate=$("#delfromdate").val();
		       	deltodate=$("#deltodate").val();
		       	
		       	
		       	if(amount==''&&vehicle==''&&timescale==''&&information==''){
		       		
		       		alert("Enter all the value");
		       	}else{
		       	

		           	$.post(link, $("#palceQuote").serialize(),function(data){
		                   console.log("data:" + data);
		                  // $("#truckbody").innerHTML=data;
		                 //  $("#quoteform").reset();
		                   alert("quote added successfully");
		                   
		                   location.reload();
		                
		                });
		       		
		       	}
		       	
		       	
		       });
		       function loadMessage(divid,messageid){                        	
               	console.log("value");
		    	   
               	$("#div"+divid).load("askquestion.html?messageid="+divid+"&messageuid="+messageid);                     	
               	
                  }
               
				
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

 

   
   
      
    
   
      
	</@u.vechicleownerlayout> 