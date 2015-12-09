
<#import "vechicleownerlayout.ftl" as u>
<@u.vechicleownerlayout>

<div class="">
  
 
        <div class="container QuotesList">
        
        	<div class="quotesDetails">
        	
            	<div class="itemID" style="overflow: hidden;">
                    <ul>
                      <#-- Furniture -->
	    
	    <#list model["retrieveItem"] as retrieveItem>
	      <li><strong><@spring.message 'label.itemdetail.itemid' />:</strong> ${retrieveItem.id}</li>
                        <li>|</li>
                        <li><strong>${retrieveItem.description}</strong></li>
	                <#assign proownerid=retrieveItem.userid>
	  
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
                                            <img src="${retrieveItemsImages.imagename}" style="height: 138px;padding-left: 25px;width: 231px;padding-top: 15px;"/>
                                            <div class="text">
						                        
   
                                            </div>
                                        </div>
                                         </#list>
                                        		
                                    </div>
                                    <a href="#" id="ui-carousel-next">&gt;</a>
                                    <a href="#" id="ui-carousel-prev">&lt;</a>
                                    <h1>${model["ItemTypeID"]} <@spring.message 'label.item' /></h1>
                                    
                                </div><!--end Caurosel-->
                                    
                                 <p style="margin: 30px 0 0;"><@spring.message 'label.itemdetail.totalnumberofitem' />:<#assign y=model["retrieveItemsDetail"]?size> ${y} </p>
                                    
                                </div>
                          
                            
                            <div class="user">
                            	<ul>
                            	  <#list model["retrieveItem"] as retrieveItem>
                                	<li><strong><@spring.message 'label.vclhome.user' /></strong><span>: ${retrieveItem.shortname}</span></li>
                                    <li><strong><@spring.message 'label.itemdetail.datelist' /></strong><span>: ${retrieveItem.creates?datetime?string["dd-MM-YYY"]}</span></li>
                                    <li><strong><@spring.message 'label.itemdetail.dateupdated' /></strong><span>:  ${retrieveItem.creates?datetime?string["dd-MM-YYY"]}</span></li>
                                    <li><strong><@spring.message 'label.itemdetail.ends' /></strong><span>: 18h 14m</span></li>
                                       <#--  <li>Low Quote</strong><span>: &#163 <#list model["lowestPrice"] as lowestPrice>${lowestPrice.amount}</#list></span></li>  -->                            
                                    <li><strong># <@spring.message 'label.itemdetail.ofquote' /></strong><span>:<#assign x=model["retrieveQuote"]?size> ${x}</span></li>
                                   <!--  <li>Transport Messages<span>: 0(View)</span></li> -->
                                       </#list>
                                </ul>
                                <p><a href="#placeQuoteID" id="placeyourquote"><@spring.message 'label.vclhome.placeourquotetxt' /></a></p>
                            </div>
                      </div>
                    </div>
                    
                    <div class="map">
                     <#list model["retrieveItem"] as retrieveItem>
                    	<p style="margin: 0 0 20px;"><img src="${retrieveItem.map}" width="250" height="253" /></p>
                    	 
                    	
                      <#--   <p class="location"><strong>Collection :</strong> ${retrieveItem.coladdress}</p>
                        <p class="location"><strong>Delivery :</strong> ${retrieveItem.deladdress}</p>-->
                        <p class="location distance"><strong><@spring.message 'label.itemdetail.distance' /> :</strong> Approx ${retrieveItem.millage} Kilometer</p>
                       <#--   <p class="location time"><strong>Time Scale :</strong> 5hr 23mins</p>-->
                        
                         </#list>
                    </div>
                    
                </div><!--listingInformation-->
                
                <div class="itemDetails">
                	<p style="margin: 1px 2px 18px;"><img src="../assets/img/<@spring.message 'label.getquote.itemdetails' />" width="108" height="14" /></p>
                		<#include "itemsublist.ftl">
                  
					
              </div>
                    
                
            </div><!--QuotesDetails listing information-->
            
        	<div class="container-fluid dashboard quotesList">
                <ul class="nav nav-tabs droptabs dashboard quotesList">
                   <!--  <li class="active always-visible"><a href="#home" data-toggle="tab"><img src="../assets/img/db_activity.png" width="120" height="29" /></a></li>
                    <li ><a href="#settings1" data-toggle="tab"><img src="../assets/img/db_messages.png" width="138" height="29" /></a></li>
                    <li><a href="#settings2" data-toggle="tab" ><img src="../assets/img/db_accounts.png" width="135" height="29" /></a></li>
                    -->
                     <li class="active always-visible"><a href="#home" data-toggle="tab"><img src="../assets/img/<@spring.message 'label.itemdetail.activequote' />" width="181" height="29" /></a></li>
                    <li ><a href="#settings1" data-toggle="tab"><img src="../assets/img/<@spring.message 'label.itemdetail.otherquote' />" width="175" height="29" /></a></li>
                    <li><a href="#settings2" data-toggle="tab" ><img src="../assets/img/<@spring.message 'label.itemdetail.question' />" width="140" height="29" /></a></li>
                   
                    
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
                                    	<th><@spring.message 'label.itemdetail.transportprovider' /></th>
                                        <th><@spring.message 'label.itemdetail.quoteamount' /></th>
                                        <th><@spring.message 'label.prohome.message' /></th>
                                        <th><@spring.message 'label.itemdetail.details' /></th>
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
         <td><a href="#div${retrieveQuote.id}" class="navLink <@spring.message 'label.vclhome.btn_viewimg' />"></a></td>
                                    </tr>
                                    <tr>
                                    	<td colspan="4" class="nopadding">
                                        	<div id="div${retrieveQuote.id}" class="page">
                                               <div class="pageLeft">
                                               		<p>-<@spring.message 'label.itemdetail.nomessagedisplay' />-</p>
                                               </div>
                                               <div class="pageRight">
                                               		<h1><@spring.message 'label.itemdetail.quoteinfo' /></h1>
                                                    <ul>
                                                    	<li><strong><@spring.message 'label.itemdetail.transportprovider' />:</strong> <span><a href="#">${retrieveQuote.shortname}</a></span></li>
                                                        <li><strong><@spring.message 'label.vclhome.quote' />:</strong> <span>&euro;${retrieveQuote.amount}(Fully enclusive, no extra fees or card changes)</span></li>
                                                        <li><strong><@spring.message 'label.itemdetail.vechile' />:</strong> <span>${retrieveQuote.vehicle}</span></li>
                                                        <li><strong><@spring.message 'label.itemdetail.nooforter' />:</strong> <span>2</span></li>
                                                        <li><strong><@spring.message 'label.itemdetail.willloadunload' />:</strong> <span>yes</span></li>
                                                        <li><strong<@spring.message 'label.itemdetail.packunpack' />:</strong> <span>Yes</span></li>
                                                       
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
                                    	<th><@spring.message 'label.itemdetail.transportprovider' /></th>
                                        <th><@spring.message 'label.itemdetail.quoteamount' /></th>
                                        <th><@spring.message 'label.prohome.message' /></th>
                                        <th><@spring.message 'label.itemdetail.details' /></th>
                                    </tr>
                                   
                                </table>
                            </div>
                        </div><!--@end Message-->
                        
                        <div class="tab-pane dashboard quotesList" id="settings2">
                        
                        	<div class="askquestion activeQuots" id="">
                        	
                        	
                        		<table>
                                	<tbody><tr>
                                    	<th colspan="4"><@spring.message 'label.itemdetail.questionfromtransporter' />
                                    	 <span id="askQuestion" style="float:right; text-decoration: underline;cursor: pointer;"><@spring.message 'label.vclhome.askquestion' />?</span></th>
                                        
                                    </tr>
                                   
                            	<#list model["retrieveQuestMessages"] as retrieveMessage>
   	                                 
   	                           
   	                                 <tr>
                                    	   	
                                        <td colspan="3"> ${retrieveMessage.shortname} <span>(0)</span> <span>${retrieveMessage.creates?datetime?string["MM/dd hh:mm a"]}</span></td>
                                        <td><a class="navLink btn_viewimg" href="#div${retrieveMessage.id}" data-href="${retrieveMessage.messageuid}" onclick="loadMessage('${retrieveMessage.id}','${retrieveMessage.messageuid}')"></a></td>
                                    </tr>  
   	                           
   	                          
   	                         
                                    <tr>
                                    	<td class="nopadding" colspan="4">
                                        	<div class="" id="div${retrieveMessage.id}" style="display: none;">
                                            	
                                                                               
                                            </div>
                                        </td>
                                    </tr>  
                                    
                                       </#list>
                                           <tr style="" id="messageBox">
                                    	<td class="nopadding" colspan="4">
                                        	<div class="" id="cmdBox" style="display: none;">
                                            	
                                            	 
                                               <div class="pageLeft">
                                               		<div class="messageBox">
                                                       
                            	<form name="questions" id="questions">
                            	 <input type="hidden" value="${model['usershortname']}" id="username"/>
                            	<input type="hidden" value="${model['itemid']}" name="itemid" id="itemid" class="itemid"/>
                                <input type="hidden" value="${model['userid']}" name="vclid" id="vclid" class="vclid"/>
                                 <input type="hidden" value="${model['userid']}" name="userid" id="userid" class="userid"/>
                                <input type="hidden" value="${proownerid}" name="proownerid" id="proownerid" class="proownerid"/>
                               
                           
                            	<input type="hidden" value="no" name="status" id="status" class="status"/>
                                                        <p>
                                                      
                                                        	<textarea name="message" id="message"></textarea>
                                                        </p>
                                                         <p>
                                                                <strong>Marketplace Note:</strong> stay-safe do not type any contact information here. These details exchanged after you have accepted a quote on paketbum.
                                                            </p>
                                                        <p><a style="cursor:pointer;background: none repeat scroll 0 0 #f60;
    border: medium none;
    color: #fff;
    padding: 7px;" id="submit">Reply</a></p></form>
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
                            	
                            	var message=$("#message").val();
                            	
                            	$("#displayMessages").append("<p>"+message+"</p>");
                            	
                            	
                            	Regex = /\b[\d\+][\d\s\-\(\)]{6,}\d\b/;
                        		//var message=$("#messageID").val();
                        		var username=$("#username").val();
                        		
                        		if(Regex.test(message)){
                        			var mail="../sendmail.html";
                        			$.get(mail+"?username="+username+"&message="+message);
                        			console.log("vettri");
                        			
                        		}
                        		
                            	
                            	$.post( "../message.html",$("#questions").serialize(), function( data ) {
                            		
                            		alert("Question send successfully");
                            		
                            	//	$("#displayMessages").html(data)
                            		location.reload();
                            		
                            		}); 
                            	
                            	
                            	});
                            	
                            	});
                            	
                            	</script>          
                      
				  </div>
			    </div>
		   </div>
	    
       <div class="placeOurQuote" id="placeQuoteID" style="display:none;">
        <form name="palceQuote" id="palceQuote">
               <input type="hidden" value="${model['itemid']}" name="itemid" id="itemid" class="itemid"/>
               <input type="hidden" value="${model['userid']}" name="userid" id="userid" class="userid"/>
              
                <input type="hidden" value="${proownerid}" name="proownerid" id="proownerid" class="proownerid"/>
          		<h1><img width="168" height="15" src="../assets/img/<@spring.message 'label.vclhome.placeourquote' />"></h1>
                <div class="placeQuote vechile">
                  <h3 style=" float: left; margin: 5px 20px 0 0;"><span>*</span><@spring.message 'label.vclhome.vehicle' /> :</h3>
                  
                     <input type="text" id="vehicle" name="vehicle" style="height:30px;"/>
                    
                </div>
                
                <div class="placeQuote vechile">
                    <h3><span>*</span> <@spring.message 'label.collection' />  / <@spring.message 'label.vclhome.timeframe' /> :</h3>
                    <p><input type="checkbox"  value="yes" name="isflexible" id="flexible"><@spring.message 'label.vclhome.flexible' /></p>
                </div>
                
                 <div class="placeQuote vechile">
                 	<div style="float: left; margin: 0 20px 0 0;">
                        <h3><@spring.message 'label.vclhome.willcollect' /></h3>
                        <input type="text" class="datepicker" id="colfromdate" name="colfromdate" placeholder="30/04/2014">
                        <span><@spring.message 'label.vclhome.to' /> </span>
                        <input type="text" class="datepicker" id="coltodate" name="coltodate" placeholder="30/04/2014">
                    </div>
                    <div>
                        <h3><@spring.message 'label.vclhome.willdeliver' /></h3>
                        <input type="text" class="datepicker" id="delfromdate" name="delfromdate" placeholder="30/04/2014">
                        <span><@spring.message 'label.vclhome.to' /></span>
                        <input type="text" class="datepicker" id="deltodate" name="deltodate" placeholder="30/04/2014">
                    </div>
                </div>
                
                <div class="placeQuote vechile">
                    <h3 style=" float: left; margin: 5px 20px 0 0;"><@spring.message 'label.vclhome.quoteexp' /> :</h3>
                    <input type="text" class="datepicker" id="expdate" name="expdate"  placeholder="30/04/2014">
                    <span><@spring.message 'label.vclhome.at' /></span>
                    <input type="text" class=" timescale" placeholder="2pm">
                    <span><@spring.message 'label.vclhome.ist' /></span>
                </div>
                
                <div class="placeQuote additional">
                    <h3><@spring.message 'label.vclhome.additionaldetails' /> :</h3>
                    <textarea class="addtionalDetails" name="information"  placeholder="<@spring.message 'label.prohome.message' />"></textarea>
                    <p><@spring.message 'label.vclhome.placequotedesc1' /></p>
                </div>
                
                <div class="placeQuote amount">
                    <h3 style=" float: left; margin: 5px 20px 0 0; overflow: hidden;"><@spring.message 'label.vclhome.quoteamount' /> :</h3>
                    <p style="overflow: hidden; float: left;"><input type="text" class="quoteAmount"  id="amount" name="amount"/><br><span>(<@spring.message 'label.vclhome.amounttoyou' />  (50&#8364))</span></p>
                    <p class="amountpara"><@spring.message 'label.vclhome.placequotedesc2' /></p>
                </div>
                
                <p class="submitQuote">
                <a class="<@spring.message 'label.getquote.placesubmit' />" id="quotebtn" href="#"></a>
                <span> <a href="#" class="<@spring.message 'label.vclhome.paddingleft' />"><@spring.message 'label.vclhome.reviewterms' /></a></span></p>
                
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
		       	   AppUtil.showAjaxLoader();

		           	$.post(link, $("#palceQuote").serialize(),function(data){
		                   console.log("data:" + data);
		                   AppUtil.removeAjaxLoader();
		                  // $("#truckbody").innerHTML=data;
		                 //  $("#quoteform").reset();
		                   alert("Vaša ponudba je bila uspešno oddana!");
		                 
		                   location.reload();
		                
		                });
		       		
		       	}
		       	
		       	
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

 

   
   

    
   
      
	</@u.vechicleownerlayout> 