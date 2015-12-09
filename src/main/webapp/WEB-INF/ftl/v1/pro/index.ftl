
<#import "productownerlayout.ftl" as u>
<style>
	.pbPaymentBtn
	{
		font-family: verdana;
		font-size: 16px;
		font-weight: bold;
		padding: 0;
		text-decoration: none !important;
	}
	.pbModalCloseBtn
	{
		font-family: verdana;
    	font-weight: bold;
	}
</style>
<@u.productownerlayout>

        <!--Tab Menu-->
      <div class="dashboardTab"> 
       <div class="container dashboard">
					
                        	<div class="dbContentLeft activity">
                            	<div id="w" class="clearfix">
                                    <ul id="sidemenu">
                                    	<ul>
                                            <li class="listHead"><@spring.message "label.prohome.accounttodo" />:</li>
                                          
                                            <li><a href="#account" class="completeProfile"><@spring.message "label.prohome.completeprofile" /></a></li>
                                        </ul>
                                        <ul>
                                            <li class="listHead"><@spring.message "label.prohome.mypaketbum" /></li>
                                               <#assign inboxcount=0>
                                            <li><a class="msgInbox" href="#message" ><@spring.message "label.prohome.inbox" /></a><span class="countMsg" >  <#list model["retrieveMessages"] as retrieveMessage>
   	                                    <#assign inboxcount=inboxcount+retrieveMessage.inboxcount>
   	                                  
   	                                    </#list>  ${inboxcount}</span></li>
                                            <li><a href="#current" class="open"><@spring.message "label.prohome.activedeliveries" /></a></li>
                                            <li><a href="#accepted"><@spring.message "label.prohome.acceptedquotes" /></a></li>
                                            <li><a href="#expired"><@spring.message "label.prohome.expired" /></a></li>
                                            <li><a href="#feedback"><@spring.message "label.prohome.feedback" /></a></li>
                                        </ul>
                                    </ul>
                                    
                                    <div id="content">
                                        <div  class="contentblock">
                                        
                                        		<div class="dbContentRight contentblock hidden" id="account">
                                                    <form id="proprofileID">
                                                    <#list model["getUserDetails"] as getUserDetails>
                                                        <p>
                                                            <label><@spring.message "label.prohome.username" /></label>
                                                            <input type="text" class="textInput" name="shortname" id="shortname" value="${getUserDetails.shortname}" />                                    	
                                                        </p>
                                                        
                                                        <p>
                                                            <label><@spring.message "label.prohome.email" /></label>
                                                            <input type="text" class="textInput" name="email" id="email"  value="${getUserDetails.username}" disabled/>                                    	
                                                        </p>
                                                    
                                                        
                                                      
                                                        
                                                        <p>
                                                            <label><@spring.message "label.prohome.mobilenumber" /></label>
                                                            <input type="text" class="textInput" name="mobile" id="mobile" value="${getUserDetails.mobile}"/>                                    	
                                                        </p>
                                                        
                                                        </#list>
                                                        <p>
                                                        
                                                         <label><@spring.message "label.prohome.password" /></label>
                                                         <span class="" id="" style="color:blue;text-decoration:underline;cursor:pointer" onclick="changepasspopup()"><@spring.message "label.prohome.changepassword" /></span>
                                                        
                                                        
                                                        
                                                        </p>
                                                        
                                                        <p>
                                                     <label>&nbsp;</label>
                                                         <span class="combtn" id="updateProProfileID" ><@spring.message "label.prohome.updateaccount" /></span>
                                                           </p>
                                                        
                                                    </form>
                                                </div>
                                     <div class="messages contentblock hidden" id="message"> 
                                                	<div class="messageTop">
                                                    	<p class="messageView"><@spring.message "label.prohome.message" /> <a href="#">[<@spring.message "label.prohome.view" /> <@spring.message "label.prohome.inbox" />]</a></p>
                                                        <div class="selectMessage">
                                                        	<div class="select-style message">
                                                              <select>
                                                                <option><@spring.message "label.prohome.read" /><@spring.message "label.prohome.message" /></option>
                                                                <option><@spring.message "label.prohome.unread" /><@spring.message "label.prohome.message" /></option>
                                                                <option><@spring.message "label.prohome.delete" /></option>
                                                              </select>
                                                            </div>
                                                            <p><button><@spring.message "label.prohome.go" /></button></p>
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
                                                                                
                                                <div id="current">
                                                    <div class="listQuotes">
                                                        <h2><@spring.message "label.prohome.activedeliveries" /></h2>
                                                        <ul>
                                                            <li><@spring.message "label.vclhome.filter" /></li>
                                                            <li>:</li>
                                                            <li class="newest"><@spring.message "label.vclhome.newest" /></li>
                                                            <li><a href=""><img src="/paketbum/assets/img/btn_downarrow.png" width="6" height="3" /></a></li>
                                                        </ul>
                                                    </div>
                                                    
                                                    <div class="quotesTable">
                                                        <table class="dashboardTable deliveries">
                                                        <#if model["retrieveItems"]?has_content>
                                                              <#list model["retrieveItems"] as retrieveItemList>					
					      
                                                            <tr class="pbParentDataContent">
                                                                <td class="width1">
                                                                	<p><strong><@spring.message "label.vclhome.item" />:</strong> <a href="proitemdetail.html?id=${retrieveItemList.id}">${retrieveItemList.description}</a></p>
                                                                    <p><strong><@spring.message "label.vclhome.quote" />:</strong> <a href="proitemdetail.html?id=${retrieveItemList.id}">${retrieveItemList.numquote}</a></p>
                                                                </td>
                                                                <td class="width2">
                                                                	<p class="pbFromContent" pk_ID="${retrieveItemList.id}"><strong><@spring.message "label.vclhome.from" />:</strong> ${retrieveItemList.coladdress}</p>
                                                                    <p class="pbToContent"><strong><@spring.message "label.vclhome.to" />:</strong>${retrieveItemList.deladdress}</p>
                                                                </td>
                                                                <td class="width3">
                                                                	<p>
                                                                    	<a href="#" onclick="deleteItem('${retrieveItemList.id}')" class="btn_delete"><@spring.message "label.prohome.delete" /></a>
                                                                        <a href="#" PK_ID="${retrieveItemList.id}" class="btn_editing pbEditProLbl"><@spring.message "label.prohome.edit" /></a>
                                                                        <a href="javascript:void(0)" PK_ID="${retrieveItemList.id}" class="btn_editing pbUpdateProLbl" style="display: none;"><@spring.message "label.prohome.update" /></a>
                                                                    </p>
                                                                    <p >
                                                                    	<a href="#" onclick="upgradePopup('${retrieveItemList.id}')" class="<@spring.message "label.pro.upgrade" />"></a>
                                                                    </p>
                                                                </td>                                                                
                                                            </tr>
                                                            
                                                            </#list>  
                                                              <#else>
                                                         <tr class="boldbg" style="background-color:#f4f4f4;" >
                                                        	<td colspan="3"><@spring.message "label.prohome.nodelfound" /></td>
                                                           
                                                          </tr>
                                                            </#if>
                                                              </table>
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
                                                    
                                                        <div class="quotesTable">
                                                           <table class="dashboardTable deliveries">
                                                        <#if model["retrieveQuoteIsAccept"]?has_content>
                                                          <#list model["retrieveQuoteIsAccept"] as retrieveQuoteIsAccept>
                                           
                                                          <#if (retrieveQuoteIsAccept.isaccept == 1)>	                                                
                                                                                                 
                                                            
                                                            <tr class="">
                                                                <td class="width1">
                                                                	<p><strong><@spring.message "label.vclhome.item" />:</strong>  <a href="proitemdetail.html?id=${retrieveQuoteIsAccept.itemid}">${retrieveQuoteIsAccept.description}</a></p>
                                                                    <p><strong><@spring.message "label.prohome.transporter" />:</strong> <a href="../feedback.html?profile=${retrieveQuoteIsAccept.shortname}">${retrieveQuoteIsAccept.shortname}</a></p>
                                                                </td>
                                                                <td class="width2">
                                                                	<p><strong><@spring.message "label.vclhome.from" />:</strong> ${retrieveQuoteIsAccept.coladdress}</p>
                                                                    <p><strong><@spring.message "label.vclhome.to" />:</strong>${retrieveQuoteIsAccept.deladdress}</p>
                                                                </td>
                                                                <td class="width3">
                                                                	<p class="expired"><@spring.message "label.prohome.amount" />:</span>  �${retrieveQuoteIsAccept.amount}</p>
                                                                    <p >
                                                                    	<a  href="proitemdetail.html?id=${retrieveQuoteIsAccept.itemid}" class="btn_details"></a>
                                                                    </p>
                                                                </td>                                                                
                                                            </tr>
                                                                
                                                       
                                                        </#if>
                                                          </#list>
                                                          
                                                           <#else>
                                                         <tr class="boldbg" style="background-color:#f4f4f4;" >
                                                        	<td colspan="3"><@spring.message "label.prohome.noaccept" /></td>
                                                           
                                                          </tr>
                                                            </#if>
                                                           </table>
                                                    </div>
                                                </div>
                                                
                                                <div id="expired" class="contentblock hidden"> 
                                                    <div class="listQuotes" >
                                                        <h2><@spring.message "label.prohome.expired" /></h2>
                                                        <ul>
                                                            <li><@spring.message "label.vclhome.filter" /></li>
                                                            <li>:</li>
                                                            <li class="newest"><@spring.message "label.vclhome.newest" /></li>
                                                            <li><a href="#"><img src="/paketbum/assets/img/btn_downarrow.png" width="6" height="3" /></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="quotesTable">
                                                        <table class="dashboardTable deliveries">
                                                             <#if model["retrieveExpiredQuote"]?has_content>
                                                           <#list model["retrieveExpiredQuote"] as retrieveQuoteIsAccept>
                                           
                                                                                                
                                                                                                 
                                                            
                                                            <tr class="">
                                                                <td class="width1">
                                                                	<p><strong><@spring.message "label.vclhome.item" />:</strong>  <a href="proitemdetail.html?id=${retrieveQuoteIsAccept.id}">${retrieveQuoteIsAccept.description}</a></p>
                                                                    <p><strong><@spring.message "label.prohome.transporter" />:</strong> <a href="../feedback.html?profile=${retrieveQuoteIsAccept.shortname}">${retrieveQuoteIsAccept.shortname}</a></p>
                                                                </td>
                                                                <td class="width2">
                                                                	<p><strong><@spring.message "label.vclhome.from" />:</strong> ${retrieveQuoteIsAccept.coladdress}</p>
                                                                    <p><strong><@spring.message "label.vclhome.to" />:</strong>${retrieveQuoteIsAccept.deladdress}</p>
                                                                </td>
                                                                <td class="width3">
                                                                	<p class="expired"><span><@spring.message "label.vclhome.currentquote" /><@spring.message "label.prohome.amount" />:</span>  �${retrieveQuoteIsAccept.amount}</p>
                                                                    <p >
                                                                    	<a  href="proitemdetail.html?id=${retrieveQuoteIsAccept.id}" class="btn_details"></a>
                                                                    </p>
                                                                </td>                                                                
                                                            </tr>
                                                                
                                                       
                                                   
                                                          </#list>
                                                          
                                                           <#else>
                                                         <tr class="boldbg" style="background-color:#f4f4f4;" >
                                                        	<td colspan="3"><@spring.message "label.prohome.noexp" /></td>
                                                           
                                                          </tr>
                                                            </#if>
                                                             </table>
                                                    </div>
                                                 </div>
                                                 
                                               <div class="contentblock hidden" id="feedback" > 
                                                    <div class="listQuotes">
                                                        <h2><@spring.message "label.prohome.feedback" /></h2>
                                                        <ul>
                                                            <li><@spring.message "label.vclhome.filter" /></li>
                                                            <li>:</li>
                                                            <li class="newest"><@spring.message "label.vclhome.newest" /></li>
                                                            <li><a href="#"><img width="6" height="3" src="/paketbum/assets/img/btn_downarrow.png"></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="quotesTable deliveries">
                                                       <#if model["retrieveAcceptQuoteForFeedback"]?has_content>
                                                     <#list model["retrieveAcceptQuoteForFeedback"] as retrieveQuoteIsAccept>
                                           
                                                          <#if (retrieveQuoteIsAccept.isaccept == 1)>	                                                
                                                                   
                                                    
                                                        <div class="userDeliveries">
                                                                <div class="userOption">
                                                                    <div class="nameQuotes">
                                                                        <p><strong><@spring.message "label.vclhome.item" />:</strong> <a   href="proitemdetail.html?id=${retrieveQuoteIsAccept.itemid}">${retrieveQuoteIsAccept.description}</a></p>
                                                                        <p><strong><@spring.message "label.vclhome.user" />:</strong> <a href="../feedback.html?profile=${retrieveQuoteIsAccept.vclid}">${retrieveQuoteIsAccept.shortname}</a></p>
                                                                       
                                                                    </div>                                                                  
                                                                    <p data-rating-max="5" id="rating_${retrieveQuoteIsAccept.id}" class="ratingstar" data-id="${retrieveQuoteIsAccept.id}"><ul class="star" data="${retrieveQuoteIsAccept.id}"><li class="hover"></li><li class="hover"></li><li class="hover"></li><li class="hover"></li><li class="hover"></li></ul></p>
                                                                     <!--<p class="ratingstar" data-rating-max="6" style="visibility:hidden;"></p>-->
                                                                     
                                                                     	<textarea id="comment_${retrieveQuoteIsAccept.id}"></textarea>
                                                                        
                                                                    
                                                                    
                                                                </div>
                                                                <div class="optionRight">
                                                                    <p><a class="btn_feedback" href="#" onclick="starRating('${retrieveQuoteIsAccept.id}');"></a></p>
                                                                </div>
                                                        </div>
                                                        
                                                        </#if>
                                                          </#list>
                                                      
                                                  <#else>
                                                         <div class="userDeliveries">
                                                   <@spring.message "label.prohome.wait" />
                                                       
                                                       </div>
                                                            </#if>
                                                        
                                                      </div>
                                                 </div>
                                                               
                                            </div>
                                        </div><!--@end Activity-->
                                        
                                    </div><!-- @end #content -->
                                  </div><!-- @end #w -->
                            
                            
        
         </div><!--end tab container-->
         
         </div>
 
       

            <script src="../assets/js/star-rating.js" type="text/javascript"></script>
                      <script>
                      
                      function upgradeItem(id){
                    	  AppUtil.showAjaxLoader();
                    	  if(id>0){
                      		var url=AppUtil.getWebServiceURL()+"updateItemUpgrade/"+id; 
                      		
                      		// console.log("numstar"+url);
                      		$.get(url);
                      		alert("Item Upgrade");
                      	  }
                      	  AppUtil.removeAjaxLoader();
                      	  
                      	  
                      	 location.reload();
                    	  
                      }
                      
                      
                      
                      
                    
                      
                      function upgradePopup(id){
                    	  
                    	  
                    	  var html="<div class='container_signup'>";
              		    html+="<div class='login'>";
              		    html+="<div class='sigin'>";
              		    html+="<h2>UpGrade Your Item</h2>";
              		    html+="<div class='sign_text'>";
              		    html+="<p>  </p>";
              		  //  html+="<p><input type='password' placeholder='Password' class='username' id='username' name='j_password'/></p>";
              		  //  html+="<p style='text-align:center;'>";	
              		 //   html+="<input type='checkbox' class='checkbox' id='checkbo' />";
              		//    html+="<label>Keep Me Loged In</label>";
              		//    html+="</p>";
              		    <!--html+="<button type='button' class='cmnbtn' data='"+id+"'  id='upgradeID' > Click to Upgrade</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp";-->
              		    html+="<a class=\"pbPaymentBtn\" style=\"padding:0px;\" href=\"/paketbum/payment/paymente24/index.jsp?amount=50\" target=\"_balnk\">Pay with bankart</a>&nbsp;&nbsp;&nbsp;";
              		    html+="<button type='button'  class='pbModalCloseBtn' > close </button>";
              		    html+="</div>";
              		    html+="</div>";
              		   
              		    html+="</div>";
              		    html+="</div>";
              		    html+="</div>";
              		    html+="</div>";
              		
              			var popUp = "";
              		
              		  config = {
              					"body": html,
              					"title": '',
              					"top":'16%',
              					"width":'26%',
              					"right":'26%',
              					"doneCbk":function(){
              					
              						   $('.pbModalCloseBtn').click(function(){
              	            				popUp.removeModal();
              	            			});     	
              						
              						$("#upgradeID").click(function(){
              							
              							
              							var id=$(this).attr("data");
              							
              							 AppUtil.showAjaxLoader();
              	                    	  if(id>0){
              	                      		var url=AppUtil.getWebServiceURL()+"updateItemUpgrade/"+id; 
              	                      		
              	                      		// console.log("numstar"+url);
              	                      		$.get(url);
              	                      		alert("Item Upgrade");
              	                      	  }
              	                      	  AppUtil.removeAjaxLoader();
              	                      	  
              	                      	  
              	                      	 location.reload();
              							
              						})
              				
              					}
              		           };
              		  
              				popUp = new PopUp(config);
              				popUp.render();
              	
              	         	  
                    	  
                    	  
                      }
                      
                      
                      function deleteItem(value){
                    	  
                    	  AppUtil.showAjaxLoader();
                    	  if(value > 0)
                    	  {
								if(confirm("Are you sure delete this one"))
								{
									var url=AppUtil.getWebServiceURL() + "updateItemRemoved/" + value; 
									$.get(url);
									alert("Item Removed");
									location.reload();
								}	
								
                      	  }
                      	  AppUtil.removeAjaxLoader();
                      	  
                      }
                      
                      function popupInit(){
                    	  console.log("done");
                    	  
                    	 
                    	  
                    	  
                      }
                     
                      
                 
                      
                      function starRating(value){
                    	  
                    	  console.log("done"+value);
                    	  
                    	 var numstar=$("#rating_"+value).attr("data-val");  
                    	 var comments=$("textarea#comment_"+value).val();
                    	 console.log("dsdfsdf"+comments);
                    	  AppUtil.showAjaxLoader();
                    	  if(numstar!=' '&&comments!=' '){
                      		var url=AppUtil.getWebServiceURL()+"updateFeedback/"+value+"/"+numstar+"/"+comments; 
                      		
                      		 console.log("numstar"+url);
                      		 
                      		 $.ajax({ 
                                 type: "GET",
                              //   dataType: "json",
                                 url: url,
                                 success: function(data){        
                                    alert("updated FeedBack");
                                    location.reload();
                                 }
                             });
                      		//$.get(url);
                      	  }
                      	  AppUtil.removeAjaxLoader();
                      	
                    	 
                    //	 console.log("numstar"+numstar);
                    	  
                    	  
                      }
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
              					"top":'16%',
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
                    	
                    	  $("#updateProProfileID").click(function(){
                    		  
                    	  //   var email=$("#email").val();
                    	     var shortname=$("#shortname").val();
                    	     var mobile=$("#mobile").val();
                    	  var url="profile.html";
                    	  
                    	     
                    	     if(shortname!=''&&mobile!=''){
                    	    	 
                    	    	 
                    	    		$.ajax({ 
                                        type: "POST",
                                     //   dataType: "json",
                                        url: url,
                                        data:{shortname:shortname,mobile:mobile},
                                        success: function(data){        
                                         
                                        	alert("update Successfully");
                                           location.reload();
                                        }
                                    });
                    	    	 
                    	     }
                    	  
                    	  });
                    	  
                    	  
                    		$(".ratingstar").starRating({
                    			minus: true // step minus button
                    			}); 
                    	  
                    	  
                      })
                      
                      $('.pbUpdateProLbl').click(function(){
                    		var tObj = $(this).parents().eq(2),
                            	tObj1 = $(tObj).children().eq(1);
                          	$('.pbEditProLbl', tObj).show();
                    		$('.pbUpdateProLbl', tObj).hide();
                    		$('.pbFromContent', tObj1).removeAttr('contenteditable');
                    		$('.pbToContent', tObj1).removeAttr('contenteditable'); 
                    		var fromContent = $('.pbFromContent', tObj1).text().split(":")[1],
                    			toContent = $('.pbToContent', tObj1).text().split(":")[1],
                    			ID = $(this).attr("PK_ID");
                    			
                       });
                      $('.pbEditProLbl').click(function(){
                            var tObj = $(this).parents().eq(2);
                            var tObj1 = $(tObj).children().eq(1);
                            var ITEM_ID = $(this).attr('PK_ID');
                      		var html ='<div class="pbMainContainer collection_detail">'+
                    	  					'<div class="pbContainer" style="margin-bottom: 20px; font-family: verdana;">'+
                    	  						'<select class="pbCommonFontFamily_V" style="font-family: verdana;">'+
                    	  							'<option value="Select Collection City">'+
                    	  								'Select Collection City'+
                    	  							'</option>'+
                    	  							'<option value="Slovenia">'+
                    	  								'Slovenia'+
                    	  							'</option>'+
                    	  						'</select>'+
											'</div>'+
											'<div>'+
												'<input value="Slovenia" disabled type="text" style="color: #000000; margin-bottom: 20px; width: 165px; font-family: verdana;">'+
											'</div>'+
											'<div>'+
												'<input type="text" placeholder="Collection Postal Code" class="pbColPostalCode" style="margin-bottom: 20px; color: #000000; width: 165px; font-family: verdana;">'+
											'</div>'+
											'<div>'+
												'<input type="text" placeholder="Delivery Postal Code" class="pbDelPostalCode" style="margin-bottom: 20px; color: #000000; width: 165px; font-family: verdana;">'+
											'</div>'+
											'<div style="margin-bottom: 20px; color: #000000; width: 165px; font-family: verdana;">'+
												'<a class="btn_upgrade pbUpgradePostalCodeBtn"  href="#"></a>'+
											'</div>'+
                    	  	   		'</div>';
                    	  	   		 var config = {
		              					"body": html,
		              					"title": 'Update Details',
		              					"top":'16%',
		              					"width":'62%',
		              					"right":'18%',
		              					"doneCbk":function(){
		              						$('.pbUpgradePostalCodeBtn').click(function(){
		              							var colPostalCode = $('.pbColPostalCode').val(),
		              								delPostalCode = $('.pbDelPostalCode').val();
		              							if(colPostalCode && delPostalCode && delPostalCode.length > 0
		              											&& colPostalCode.length > 0)
		              							{	
			              							var url=AppUtil.getWebServiceURL() + "updateItemAddress/" + ITEM_ID + "/" + colPostalCode + "/" + delPostalCode; 
													$.get(url);
							                      	AppUtil.removeAjaxLoader();
							                    }
							                    else
							                    {
							                    	alert("Please enter your datas");
							                    } 	
		              						});
		              						
		              					}
		              				};	
									var popUp = new PopUp(config);
									popUp.render();
                    		
                    		
                      })
              </script>
                       
          
    
    
	
	</@u.productownerlayout> 