                                                     <div class="inboxClick">
                                                        <div class="msgInside">
                                                            <p class="MessageRespond"><strong>Message :</strong> Respond to message (1 of ${model["retrieveMessages"]?size}) </p>
                                                            <div class="inboxBack"><strong>Back </strong>: <a href="#">inbox</a></div>
                                                        </div>    
                                                         <#list model["retrieveMessages"] as retrieveMessage>
                                                         
                                                         <#assign x=retrieveMessage.subjects>
                                                         
                                                         </#list>
                                                         
                                                        <div class="messageSub"><strong>Subject :</strong> <a href="#">${x}</a></div>
                                                        
                                                        <div class="inboxView">
                                                        
                                                        <#list model["retrieveMessages"] as retrieveMessage>
   	                                  
   	                            
   	                             
   	                                                    <strong>${retrieveMessage.shortname} :</strong>  ${retrieveMessage.message}  <span><a href="#"></a>(${retrieveMessage.creates})</span>
                                                      <br>
   	                             
   	                                                      </#list>
                                                              </div>
                                                        
                                                        <div class="messageReply">
                                                           <form name="messageReplyForm" id="messageReplyForm">                                                           
                                                            <input type="hidden" name="messageid" value="${model['messageid']}"/>
                                                              <input type="hidden" name="username" id="username" value="${model['username']}"/>
                                                            <input type="hidden" name="messageuid" value="${model['messageuid']}"/>
                                                            <h3>Reply:</h3>
                                                            <p>
                                                                <textarea name="message" id="messageID"></textarea>
                                                            </p>
                                                            <p>
                                                                <strong>Marketplace Note:</strong> stay-safe do not type any contact information here. These details exchanged after you have accepted a quote on paketbum.
                                                            </p>
                                                            <p>
                                                                <a id="replyMessage" style="cursor:pointer;background: none repeat scroll 0 0 #f60;
    border: medium none;
    color: #fff;
    padding: 7px;">Send Message</a>
                                                            </p>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    
                                                    
    <script>
    
    $(function(){
    	
    	$("#replyMessage").click(function(){
    		var link="reply.html";
    		AppUtil.showAjaxLoader();
    		Regex = /\b[\d\+][\d\s\-\(\)]{6,}\d\b/;
    		var message=$("#messageID").val();
    		var username=$("#username").val();
    		   console.log("data:" + message);
    		if(Regex.test(message)){
    			var mail="../sendmail.html";
    			$.get(mail+"?username="+username+"&message="+message);
    			console.log("vettri");
    			
    		}
    		$.post(link, $("#messageReplyForm").serialize(),function(data){
                console.log("data:" + data);
                AppUtil.removeAjaxLoader();
                alert("Message Send Successfully");
                
                location.reload();
             
             });
    	
    	
    	
    	});
    	
    	
    });
    
    
    
    </script>
