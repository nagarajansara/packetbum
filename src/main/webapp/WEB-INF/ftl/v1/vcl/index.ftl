
<#import "vechicleownerlayout.ftl" as u>
<@u.vechicleownerlayout>

      
        <!--Tab Menu-->
      <div class="dashboardTab"> 
       <div class="container dashboard">
							
                        	<div class="dbContentLeft activity">
                            	<div id="w" class="clearfix">
                                    <ul id="sidemenu">
                                    	<ul>
                                            <li class="listHead"><@spring.message "label.prohome.accounttodo" />:</li>
                                            <li><a href=""><@spring.message "label.vclhome.verfiyacc" /></a></li>
                                            <li><a href="#account" class="completeProfile"><@spring.message "label.prohome.completeprofile" /></a></li>
                                        </ul>
                                        <ul>
                                            <li class="listHead"><@spring.message "label.prohome.mypaketbum" /></li>
                                              <#assign inboxcount=0>
                                            <li><a class="msgInbox" href="#message" ><@spring.message "label.prohome.inbox" /></a><span class="countMsg" >  <#list model["retrieveMessages"] as retrieveMessage>
   	                                    <#assign inboxcount=inboxcount+retrieveMessage.inboxcount>
   	                                  
   	                                    </#list>   ${inboxcount}</span></li>
                                            <li><a href="#current" class="open"><@spring.message "label.vclhome.currentquote" /></a></li>
                                            <li><a href="#accepted"><@spring.message "label.prohome.acceptedquotes" /></a></li>
                                            <li><a href="#unsuccussful"><@spring.message "label.vclhome.unsuccesfulquotes" /></a></li>
                                           
                                            <li><a href="#"><@spring.message "label.vclhome.quoterequest" /></a></li>
                                            <li><a href="#"><@spring.message "label.vclhome.watching" /></a></li>
                                            <li><a href="#"><@spring.message "label.vclhome.savedsearches" /></a></li>
                                           
                                        </ul>
                                    </ul>
                                    <div id="content">
                                     <div  class="contentblock">
                                        
                                        		<div class="dbContentRight contentblock hidden" id="account">
                                        		  <#list model["getUserDetails"] as getUserDetails>
                                                    <form id="vclprofileID" name="vclprofile">
                                                    
                                                     <p>
                                                            <label><@spring.message "label.prohome.username" /></label>
                                                            <input type="text" class="textInput" name="shortname" id="shortname" value="${getUserDetails.shortname}" />                                    	
                                                        </p>
                                                        <p>
                                                            <label><@spring.message "label.transporter.firstname" /></label>
                                                            <input type="text" class="textInput" id="firstname" name="firstname" value="${getUserDetails.firstname}" />                                    	
                                                        </p>
                                                        
                                                        <p>
                                                            <label><@spring.message "label.transporter.lastname" /></label>
                                                            <input type="text" class="textInput" id="lastname" name="lastname" value="${getUserDetails.lastname}"/>                                    	
                                                        </p>
                                                        
                                                                                                              
                                                        <p>
                                                            <label><@spring.message "label.transporter.companyname" /></label>
                                                            <input type="text" class="textInput" id="companyname" name="companyname"  value="${getUserDetails.companyname}"/>                                    	
                                                        </p>
                                                        
                                                         <p>
                                                            <label><@spring.message "label.transporter.taxnumber" /> </label>
                                                            <input type="text" class="textInput" id="taxnumber" name="taxnumber"  value="${getUserDetails.address1}"/>                                    	
                                                        </p>
                                                        
                                                        <p>
                                                            <label><@spring.message "label.transporter.vechilenumber" /> </label>
                                                            <input type="text" class="textInput" id="vehiclenumber" name="vehiclenumber"  value="${getUserDetails.address2}"/>                                    	
                                                        </p>                                                   
                                                       
                                                        <p>
                                                            <label><@spring.message "label.transporter.mobile" /></label>
                                                            <input type="text" class="textInput" id="mobile" name="mobile"  value="${getUserDetails.mobile}"/>                                    	
                                                        </p>
                                                        
                                                        <p>
                                                            <label><@spring.message "label.transporter.companyaddress" /></label>
                                                            <input type="text" class="textInput" id="address1" name="address1"  value="${getUserDetails.address1}"/>                                    	
                                                        </p>
                                                        
                                                        <p>
                                                            <label><@spring.message "label.transporter.privateaddress" /></label>
                                                            <input type="text" class="textInput" id="address2" name="address2"  value="${getUserDetails.address2}"/>                                    	
                                                        </p>
                                                        
                                                        <p>
                                                            <label><@spring.message "label.transporter.city" /></label>
                                                            <input type="text" class="textInput" id="city" name="city"  value="${getUserDetails.city}"/>                                    	
                                                        </p>
                                                        
                                                       
                                                        
                                                        <p>
                                                            <label><@spring.message "label.transporter.postcode" /></label>
                                                            <input type="text" class="textInput" id="postcode" name="postcode"  value="${getUserDetails.postcode}"/>                                    	
                                                        </p>
                                                        
                                                          <p>
                                                           <label><@spring.message "label.prohome.password" /></label>
                                                         <span class="" style="color:blue;text-decoration:underline;cursor:pointer" id="" onclick="changepasspopup()"><@spring.message "label.prohome.changepassword" /></span>
                                                           </p>
                                                          </#list>
                                                          
                                                           <p>
                                                           <label>&nbsp;</label>
                                                         <span class="combtn" id="updateVclProfileID" ><@spring.message "label.prohome.updateaccount" /></span>
                                                           </p>
                                                          
                                                    </form>
                                                    
                                                </div>
                                                
                                                <div class="messages contentblock hidden" id="message"> 
                                                	<div class="messageTop">
                                                    	<p class="messageView"><@spring.message "label.prohome.message" /> <a href="#">[<@spring.message "label.prohome.view" /> <@spring.message "label.prohome.inbox" />]</a></p>
                                                        <div class="selectMessage">
                                                        	<div class="select-style message">
                                                              <select>
                                                                <option><@spring.message "label.prohome.read" /> <@spring.message "label.prohome.message" /></option>
                                                                <option><@spring.message "label.prohome.unread" /> <@spring.message "label.prohome.message" /></option>
                                                                <option><@spring.message "label.prohome.delete" /></option>
                                                              </select>
                                                            </div>
                                                            <p><button>Go</button></p>
                                                        </div>
                                                    </div> 
                                                    <table>
                                                    	<tr>
                                                        	<th><input type="checkbox" id="selectall" /></th>
                                                            <th><@spring.message "label.prohome.from" /></th>
                                                            <th><@spring.message "label.prohome.subject" /></th>
                                                            <th><@spring.message "label.prohome.received" /></th>
                                                        </tr>
                                                          <#if model["retrieveMessages"]?has_content>
                                                        <#list model["retrieveMessages"] as retrieveMessage>
   	                                    <#assign messageid=retrieveMessage.messageuid>
   	                                    
   	                                    <#assign read=retrieveMessage.readmsg>
   	                                    
   	                                 
   	                                                      <#if read=='1'>
   	                                                 <tr style="background-color:#fff;">
                                                        	<td><input type="checkbox" id="checkbox7" class="case" name="case" value="7"/></td>
                                                            <td class="name"><a href="#">  ${retrieveMessage.shortname}</a></td>
                                                            <td class="middle"><a style="cursor:pointer" onclick="replyMsg('${retrieveMessage.id}','${retrieveMessage.messageuid}','no');"  id="replyMsg" data-mid="" data-muid="">${retrieveMessage.subjects}</a></td>
                                                            <td class="end">${retrieveMessage.creates}</td>
                                                        </tr>
   	                                                    <#else>
   	                                                     <tr class="boldbg" style="background-color:#f4f4f4;">
                                                        	<td><input type="checkbox" id="checkbox7" class="case" name="case" value="7"/></td>
                                                            <td class="name"><a href="#">  ${retrieveMessage.shortname}</a></td>
                                                            <td class="middle"><a style="cursor:pointer" onclick="replyMsg('${retrieveMessage.id}','${retrieveMessage.messageuid}','${retrieveMessage.msgdetailid}');"  id="replyMsg" data-mid="" data-muid="">${retrieveMessage.subjects}</a></td>
                                                            <td class="end">${retrieveMessage.creates}</td>
                                                        </tr>
   	                                                    </#if>
   	                             
   	                                               </#list>
                                                       <#else>
                                                         <tr class="boldbg" style="background-color:#f4f4f4;" >
                                                        	<td colspan="4"><@spring.message "label.prohome.nomsgyet" /></td>
                                                           
                                                        </tr>
                                                            </#if>
                                                    </table>                              
                                                </div>
                                                                                
                                          
                                                    <div  class="dbContentRight contentblock  listQuotes" id="current">
                                                          <div class="listQuotes">
                                                        <h2><@spring.message "label.vclhome.currentquote" /></h2>
                                                        
                                                        <ul>
                                                            <li><@spring.message "label.vclhome.filter" /> </li>
                                                            <li>:</li>
                                                            <li class="newest"><@spring.message "label.vclhome.newest" /></li>
                                                            <li><a href=""><img src="/paketbum/assets/img/btn_downarrow.png" width="6" height="3" /></a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    <div class="quotesTable deliveries">
                                            <#if model["retrieveQuoteIsAccept"]?has_content>
					      <#list model["retrieveQuoteIsAccept"] as retrieveQuoteIsAccept>
                                           
                                            <#if (retrieveQuoteIsAccept.isaccept == 0)>	
                                                        <div class="userDeliveries">
                                                        	<div class="userOption">
                                                            	<div class="nameQuotes">
                                                                	<p><strong><@spring.message "label.vclhome.item" />:</strong> <a href="vclitemdetail.html?id=${retrieveQuoteIsAccept.itemid}">${retrieveQuoteIsAccept.description}</a></p>
                                                                    <p><strong><@spring.message "label.vclhome.user" />:</strong> <a href="../feedback.html?profile=${retrieveQuoteIsAccept.shortname}">${retrieveQuoteIsAccept.shortname}</a></p>
                                                                   
                                                                </div>
                                                                <p><strong><@spring.message "label.vclhome.from" />:</strong><span>${retrieveQuoteIsAccept.coladdress}</span></p>
                                                                <p><strong><@spring.message "label.vclhome.to" />:</strong><span>${retrieveQuoteIsAccept.deladdress}</span></p>
                                                            </div>
                                                            <div class="optionRight">
                                                            	<p><strong><@spring.message "label.vclhome.quote" />:</strong> ${retrieveQuoteIsAccept.amount}</p>
                                                                <p style="clear:both">
                                                                    <a href="#" class="<@spring.message "label.vclhome.btn_upgrade" />"></a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                   </#if>
                                                        
                                              </#list> 
                                                         <#else>
                                                        <div class="userDeliveries"><@spring.message "label.prohome.noaccept" /> </div>
                                                            </#if>
                                                    </div>
                                                     </div>
                                             
                                                
                                                <div id="accepted" class="contentblock hidden">
                                                    <div class="listQuotes">
                                                        <h2><@spring.message "label.prohome.acceptedquotes" /></h2>
                                                        <ul>
                                                            <li><@spring.message "label.vclhome.filter" /></li>
                                                            <li>:</li>
                                                            <li class="newest"><@spring.message "label.vclhome.newest" /></li>
                                                            <li><a href="#"><img src="/paketbum/assets/img/btn_downarrow.png" width="6" height="3" /></a></li>
                                                        </ul>
                                                    </div>
                                                        <div class="quotesTable deliveries">
                                                         <#if model["retrieveQuoteIsAccept"]?has_content>
                                                         	<#list model["retrieveQuoteIsAccept"] as retrieveQuoteIsAccept>
                                                             
					                                <#if (retrieveQuoteIsAccept.isaccept == 1)>	
					 
                                                         <div class="userDeliveries">
                                                        	<div class="userOption">
                                                            	<div class="nameQuotes">
                                                                	<p><strong><@spring.message "label.vclhome.item" />:</strong> <a href="vclitemdetail.html?id=${retrieveQuoteIsAccept.itemid}">${retrieveQuoteIsAccept.description}</a></p>
                                                                    <p><strong><@spring.message "label.vclhome.user" />:</strong> <a href="../feedback.html?profile=${retrieveQuoteIsAccept.shortname}">${retrieveQuoteIsAccept.shortname}</a></p>
                                                                   
                                                                </div>
                                                                <p><strong><@spring.message "label.vclhome.from" />:</strong><span>${retrieveQuoteIsAccept.coladdress}</span></p>
                                                                <p><strong><@spring.message "label.vclhome.to" />:</strong><span>${retrieveQuoteIsAccept.deladdress}</span></p>
                                                            </div>
                                                            <div class="optionRight">
                                                            	<p><span style="color:green; font-size: 14px;"><strong><@spring.message "label.prohome.accepted" /></strong></span></p>
                                                                <p style="clear:both">
                                                                    <a href="#" class="<@spring.message "label.vclhome.btn_upgrade" />"></a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                                </#if>
                                                         </#list> 
                                                         <#else>
                                                        <div class="userDeliveries"><@spring.message "label.prohome.noaccept" /> </div>
                                                            </#if>


                                                             
                                                        </div>
                                                </div>
                                                
                                                <div id="unsuccussful" class="contentblock hidden"> 
                                                    <div class="listQuotes" >
                                                        <h2><@spring.message "label.vclhome.unsuccesfulquotes" /></h2>
                                                        <ul>
                                                            <li><@spring.message "label.vclhome.filter" /></li>
                                                            <li>:</li>
                                                            <li class="newest"><@spring.message "label.vclhome.newest" /></li>
                                                            <li><a href="#"><img src="/paketbum/assets/img/btn_downarrow.png" width="6" height="3" /></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="quotesTable deliveries">
                                                     <#if model["retrieveExpiredQuote"]?has_content>
                                                      	<#list model["retrieveExpiredQuote"] as retrieveQuoteIsAccept>
                                                             
					                           
                                                        <div class="userDeliveries">
                                                        	<div class="userOption">
                                                            	<div class="nameQuotes">
                                                                		<p><strong><@spring.message "label.vclhome.item" />:</strong> <a href="vclitemdetail.html?id=${retrieveQuoteIsAccept.itemid}">${retrieveQuoteIsAccept.description}</a></p>
                                                                    <p><strong><@spring.message "label.vclhome.user" />:</strong> <a href="../feedback.html?profile=${retrieveQuoteIsAccept.shortname}">${retrieveQuoteIsAccept.shortname}</a></p>
                                                                   
                                                                </div>
                                                                <p><strong><@spring.message "label.vclhome.from" />:</strong><span>${retrieveQuoteIsAccept.coladdress}</span></p>
                                                                <p><strong><@spring.message "label.vclhome.to" />:</strong><span>${retrieveQuoteIsAccept.deladdress}</span></p>
                                                            </div>
                                                            <div class="optionRight">
                                                            	<p><span style=" color:#F00; font-size: 14px;"><strong>Unsuccessful</strong></span></p>
                                                                <p style="clear:both">
                                                                    <a href="#" class="<@spring.message "label.vclhome.btn_upgrade" />"></a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                      
                                                         </#list> 
                                                        <#else>
                                                        <div class="userDeliveries"><@spring.message "label.prohome.noaccept" /> </div>
                                                            </#if>
                                                        
                                                    </div>
                                                 </div>
                                                 
                                                 
                                                 <div id="completed" class="contentblock hidden"> 
                                                    <div class="listQuotes" >
                                                        <h2><@spring.message "label.prohome.noaccept" /></h2>
                                                        <ul>
                                                            <li><@spring.message "label.vclhome.filter" /></li>
                                                            <li>:</li>
                                                            <li class="newest"><@spring.message "label.vclhome.newest" /></li>
                                                            <li><a href="#"><img src="/paketbum/assets/img/btn_downarrow.png" width="6" height="3" /></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="quotesTable deliveries">
                                                     <#if model["retrieveQuoteIsAccept"]?has_content>
                                                      <#list model["retrieveQuoteIsAccept"] as retrieveQuoteIsAccept>
                                                             
					                                <#if (retrieveQuoteIsAccept.isaccept == 1)>	
					 
                                                         <div class="userDeliveries">
                                                        	<div class="userOption">
                                                            	<div class="nameQuotes">
                                                                	<p><strong><@spring.message "label.vclhome.item" />:</strong> <a href="vclitemdetail.html?id=${retrieveQuoteIsAccept.itemid}">${retrieveQuoteIsAccept.description}</a></p>
                                                                    <p><strong><@spring.message "label.vclhome.user" />:</strong> <a href="../feedback.html?profile=${retrieveQuoteIsAccept.shortname}">${retrieveQuoteIsAccept.shortname}</a></p>
                                                                   
                                                                </div>
                                                                <p><strong><@spring.message "label.vclhome.from" />:</strong><span>${retrieveQuoteIsAccept.coladdress}</span></p>
                                                                <p><strong><@spring.message "label.vclhome.to" />:</strong><span>${retrieveQuoteIsAccept.deladdress}</span></p>
                                                            </div>
                                                            <div class="optionRight">
                                                            	<p><span style="color:green; font-size: 14px;"><strong>Accepted</strong></span></p>
                                                                <p style="clear:both">
                                                                    <a href="#" class="<@spring.message "label.vclhome.btn_upgrade" />"></a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                                </#if>
                                                         </#list>                                         
                                                         <#else>
                                                        <div class="userDeliveries"><@spring.message "label.prohome.noaccept" /> </div>
                                                            </#if>
                                                        
                                                    </div>
                                                 </div>
                                                 
                                          
                                                 
                                                 
                                                
                                                
                                                                    
                                            </div>
                                        </div><!--@end Activity-->
                                        
                                        
                                      
                                        
                                    </div><!-- @end #content -->
                                  </div><!-- @end #w -->
                            
                            
        
         </div><!--end tab container-->
         
         </div><!--end containertab-->
                                    
                                    
                                 
                       <script>
                      
                      function replyMsg(messageid,messageuid,readmsg){
                    	  
                    	  
                    	  $("#message").empty();
                    	  AppUtil.showAjaxLoader();
                    	  $("#message").load("reply.html?messageid="+messageid+"&messageuid="+messageuid);
                    	  console.log("read"+readmsg);
                    	  if(readmsg!='no'){
                    		var url=AppUtil.getReadMsgURL()+messageuid;                    		
                    		$.get(url);
                    	  }
                    	  
                    	  AppUtil.removeAjaxLoader();
                      }
 function changepasspopup(){
                    	  
                    	  
                    	  var html="<div class='container_signup'>";
              		    html+="<div class='login'>";
              		    html+="<div class='sigin'>";
              		    html+="<h2>Change Password</h2>";
              		    html+="<form name='changepass' id='changepass'><div class='sign_text'>";
              		 
              		    html+="<p><input type='password' placeholder='New Password' class='username' id='newpass' name='newpass'/></p>";
              		    html+="<p><input type='password' placeholder='Confirm New Password' class='username' id='connewpass' name='connewpass'/></p>";
              		 //   html+="<p style='text-align:center;'>";	
              		//    html+="<input type='checkbox' class='checkbox' id='checkbo' />";
              		  // html+="<label>Keep Me Loged In</label>";
              		//   html+="</p>";
              		   html+="<button type='button' class='combtn' id='popupChangeID' > Change</button>";
              		    html+="</div></form>";
              		    html+="</div>";
              		   
              		    html+="</div>";
              		    html+="</div>";
              		    html+="</div>";
              		    html+="</div>";
              		
              	
              		
              		  config = {
              					"body": html,
              					"title": '',
              					"top":'158%',
              					"width":'62%',
              					"right":'18%',
              					"doneCbk":function(){
              						
              						 $("#popupChangeID").click(function(){                   		 
                               		  
              							 
              							 var url="changepass.html";
              							 
              							 var newpass=$("#newpass").val();
              							 var connewpass=$("#connewpass").val();
              							 if(newpass==connewpass&&newpass!=''&&connewpass!=''){
              							 
              							$.ajax({ 
                                            type: "POST",
                                         //   dataType: "json",
                                            url: url,
                                            data:{newpass:newpass},
                                            success: function(data){        
                                               alert("Password Updated Successfully");
                                               $('.lsModalClose').trigger('click');
                                               //location.reload();
                                            }
                                        });
              							 }else{
              								 alert(" Verify Your Password");
              							 }
                               		 // console.log("sdf");
                               		  
                               	  });
              						
              					}
              		           };
              		  
              				popUp = new PopUp(config);
              				popUp.render();
                    	  
                    	  
                      }
                     $(function(){
                    	 
                     
                    	 
                    	 $("#updateVclProfileID").click(function(){
                    		 
                    	 
                    	 
                    	 
                    		 var shortname,firstname,lastname,phone,mobile,city,country,address1,address2,postcode,url;
                         	
                         	url="profile.html";
                         	shortname=$("#shortname").val();
                         	
                         	mobile=$("#mobile").val();
                         	//firstname,lastname,phone,mobile,city,country,address1,address2,postcode
                         	firstname=$("#firstname").val();
                         	lastname=$("#lastname").val();
                         	phone=$("#phone").val();
                         	city=$("#city").val();
                         	country=$("#country").val();
                         	address1=$("#address1").val();
                         	address2=$("#address2").val();
                         	postcode=$("#postcode").val();
                    		 
                    		 
                         	if(firstname!=''&&lastname!=''&&phone!=''&&mobile!=''&&city!=''&&country!=''&&address1!=''&&address2!=''&&postcode!=''){
                				
                    			
                         	/* 	$.ajax({ 
                                    type: "POST",
                                 //   dataType: "json",
                                    url: url,
                                    data:{$("#vclprofileID").serialize()},
                                    success: function(data){        
                                     
                                    	
                                    	if(data==="true"){
                                    		alert("Updated Successfully");
                                    	}
                                       //location.reload();
                                    }
                                }); */
                    			
            	    $.post(url,$("#vclprofileID").serialize(),function(data){
            	    	if(data==="true"){
                    		alert("Updated Successfully");
                    	}
            	    });
                    				
                    				
                    			}else{
                    				alert("All the fields are Mandatory");
                            		//$("#mobile").focus();
                            		return false;
                    			}
                         	
                         	
                    	 
                    	 
                    	 });
                    	 
                     
                     });
                     
                      
                      </script>      
                     
    
	
	</@u.vechicleownerlayout> 