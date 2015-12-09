                                                     
                                                     
                                                     
                                                     
                                                        	<div class="pageRight">
                                                    <ul style="float:left;" class="ul2">
                                                    
                                                      <!--   <p>Question : Can i get this thing shipped by next week or  mid of the week</p> -->
                                                         <#list model["retrieveMessages"] as retrieveMessage>
   	                                  <#assign user=retrieveMessage.proownerid>
   	                                <li><a href="#"><strong>${retrieveMessage.shortname} ${retrieveMessage.creates?datetime?string["MM/dd hh:mm a"]} :</strong></a><br> ${retrieveMessage.message}</li>
   	                             
   	                             
   	                                                      </#list>
                                                        
                                                      
                                                    
                                                        
                                                     
                                                     </ul>
                                                    
                                               </div> 
                                               
                                                    
                                                        </div>
                                                    </div>
                                                    
                                                    
 
