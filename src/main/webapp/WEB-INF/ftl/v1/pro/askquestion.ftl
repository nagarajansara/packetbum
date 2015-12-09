                                                     
                                                     
                                                     
                                                     
                                                        	<div class="pageRight">
                                                    <ul style="float:left;" class="ul2">
                                                    
                                                      <!--   <p>Question : Can i get this thing shipped by next week or  mid of the week</p> -->
                                                         <#list model["retrieveMessages"] as retrieveMessage>
   	                                  <#assign user=retrieveMessage.proownerid>
   	                                <li><strong><a href="#">${retrieveMessage.shortname}(0) :</a></strong> <span>${retrieveMessage.creates}</span> ${retrieveMessage.message}<a rel="nofollow" onclick="flagReport(this)" data-item-id="${retrieveMessage.itemid}" data-message="${retrieveMessage.message}" data-id="${retrieveMessage.messageid}" style=" margin-left: 13px; cursor:pointer;" class="flag flagReport">&nbsp;</a></li>
   	                             
   	                             
   	                                                      </#list>
                                                        
                                                      
                                                    
                                                        
                                                     
                                                     </ul>
                                                    
                                               </div> 
                                                <#assign userid=model['userid']?string.number>
                                               
                                               <#if user==userid>
                                               <div class="pageLeft">
                                               		<div class="messageBox">
                                               		
                                               		 <form name="messageReplyForm" id="messageReplyForm">                                                           
                                                            <input type="hidden" name="messageid" value="${model['messageid']}"/>
                                                            <input type="hidden" name="messageuid" value="${model['messageuid']}"/>
                                                            <input type="hidden" name="userid" value="${model['userid']}"/>
                                                        
                                                        <p>
                                                        
                                                        	 <textarea name="message"></textarea>
                                                        </p>
                                                         <p>
                                                                <strong>Marketplace Note:</strong> stay-safe do not type any contact information here. These details exchanged after you have accepted a quote on paketbum.
                                                            </p>
                                                        <p><a  id="replyMessage" onclick="submitValue();" style="  background: none repeat scroll 0 0 #333;
    border: 1px solid #efefef;
    color: #fff;
    display: block;
    float: left;
    margin: 20px 0 0 20px;
    padding: 3px;
    width: 100px;">Reply</a></p>
                                                        
                                                          </form>
                                                    </div>
                                               </div>
                                               </#if>
                                                    
                                                        </div>
                                                    </div>
                                                    
                                                    
    <script>
    
    function submitValue(){    	
    	
    //	alert("fdgdfgdf");    	
    	var link="reply.html";
		AppUtil.showAjaxLoader();
		
		$.post(link, $("#messageReplyForm").serialize(),function(data){
            console.log("data:" + data);
            AppUtil.removeAjaxLoader();
            alert("Message Send Successfully");
            
            location.reload();
         
         });
    	
    }
    
    function flagReport(val){
    	
 	   
 	   var con=confirm("By reporting this posting, you are alerting Paketbum. Please do be certain that the posting does actually breach Paketbum rules (listed below) before clicking ok"+

                             "\nIt is a breach to post:"+

"\nContact Information:"+

"\n- Company Name"+
"\n- Full Personal Name (First Name AND Second Name)"+
"\n- Email addresses"+
"\n- Web site URL's"+
"\n- Telephone numbers"+
"\n- Fax numbers"+
"\n- Any other direct contact information, implied or disguised contact information"+

"\n Other:"+

"\n- Any swearing, hostile or intimidatory language"+
"\n- Any postings which are not related to the delivery in question"+
"\n- Any postings which cite the Shiply fee, commission, deposit or similar phrases"+
"\n- Any postings which are directed at another transport provider"+
"\n- Any postings whose purpose is to attempt to direct a user away from shiply.com"+
"\n- Any postings which are directed at another transport provider"+

"\n-Please either click OK to report a breach or cancel to exit.");
 	   
 	   
 	   if(con){
 		   
 		   var link="report.html";
 		   var id=	$(val).attr("data-id");
 		  // var messageid=	$(val).attr("data-message-id");
 		   var itemid=$(val).attr("data-item-id")
 			var message=$(val).attr("data-message");
 		   
 		   $.post(link,{message: message, itemid:itemid });
 		   
 			console.log("id-"+id);
 		   
 	   }
 	
 	
 	
 }
      
    
    </script>
