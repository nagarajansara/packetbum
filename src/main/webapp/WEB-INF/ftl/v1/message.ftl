<#list model["retrieveMessages"] as retrieveMessage>
   	                                    <#assign messageid=retrieveMessage.messageid>
   	                            <p>
   	  
   	  
   	                              ${retrieveMessage.message}
   	                                  
   	                             </p>
   	                             
   	                            </#list>