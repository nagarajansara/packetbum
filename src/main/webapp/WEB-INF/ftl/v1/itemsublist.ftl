    <#if model["itemtype"] == "furniture">
              <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
                	<div class="itemSpec">
                	
                   	  <h2><strong><@spring.message 'label.item' /></strong></h2>	
                        <ul>
                        
                        	<li><strong><@spring.message 'label.getquote.description' /> :</strong> ${retrieveItemDetailList.description}</li>
                            <li><strong><@spring.message 'label.itemdetail.length' />  :</strong> ${retrieveItemDetailList.length}</li>
                            <li><strong><@spring.message 'label.itemdetail.width' />  :</strong> ${retrieveItemDetailList.width}</li>
                            <li><strong><@spring.message 'label.itemdetail.height' />  :</strong> ${retrieveItemDetailList.height}</li>
                            <li><strong><@spring.message 'label.itemdetail.weight' />  :</strong> ${retrieveItemDetailList.weight}</li>
                        </ul>
                  </div>
                   </#list>
   <#-- genral item -->
   <#elseif model["itemtype"] == "general">
  
	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	    	<div class="itemSpec">
                	
                   	  <h2><strong><@spring.message 'label.item' /></strong></h2>	
                        <ul>
                        
                        	<li><strong><@spring.message 'label.getquote.description' /> :</strong> ${retrieveItemDetailList.description}</li>
                            <li><strong><@spring.message 'label.itemdetail.length' /> :</strong> ${retrieveItemDetailList.length}</li>
                            <li><strong><@spring.message 'label.itemdetail.width' />  :</strong> ${retrieveItemDetailList.width}</li>
                            <li><strong><@spring.message 'label.itemdetail.height' /> :</strong> ${retrieveItemDetailList.height}</li>
                            <li><strong><@spring.message 'label.itemdetail.weight' /> :</strong> ${retrieveItemDetailList.weight}</li>
                        </ul>
                  </div>
	  </#list>
	<#elseif model["itemtype"] == "car">
  
  
 

	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	    <div class="itemSpec">
                	
                   	  <h2><strong><@spring.message 'label.item' /> </strong></h2>	
                        <ul>
                        <li><strong><@spring.message 'label.getquote.description' /> :</strong> ${retrieveItemDetailList.description}</li>
                            <li><strong><@spring.message 'label.getquote.carmake' />:</strong> ${retrieveItemDetailList.make}</li>
                            <li><strong><@spring.message 'label.getquote.carmodel' />:</strong> ${retrieveItemDetailList.model}</li>
	                          <li><strong><@spring.message 'label.itemdetail.modeofmoving' /> :</strong> ${retrieveItemDetailList.modeofmoving}</li>
	                    </ul>
                  </div></#list>
	 <#elseif model["itemtype"] == "motorcycle">
  
	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	     <div class="itemSpec">
                	
                   	  <h2><strong><@spring.message 'label.item' /> </strong></h2>	
                        <ul>
                        <li><strong><@spring.message 'label.getquote.description' /> :</strong> ${retrieveItemDetailList.description}</li>
                            <li><strong><@spring.message 'label.getquote.motorcyclemake' />:</strong> ${retrieveItemDetailList.make}</li>
                            <li><strong><@spring.message 'label.getquote.motorcyclemodel' />:</strong> ${retrieveItemDetailList.model}</li>
	                          <li><strong><@spring.message 'label.itemdetail.modeofmoving' />:</strong> ${retrieveItemDetailList.modeofmoving}</li>
	  
	  
	    </ul>
                  </div></#list>
	  <#elseif model["itemtype"] == "VechicleAndParts"> 
 

	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	     <div class="itemSpec">
                	
                   	  <h2><strong><@spring.message 'label.item' /></strong></h2>	
                        <ul>
                        
                        	<li><strong><@spring.message 'label.getquote.description' /> :</strong> ${retrieveItemDetailList.description}</li>
                            <li><strong><@spring.message 'label.itemdetail.length' /> :</strong> ${retrieveItemDetailList.length}</li>
                            <li><strong><@spring.message 'label.itemdetail.width' /> :</strong> ${retrieveItemDetailList.width}</li>
                            <li><strong><@spring.message 'label.itemdetail.height' /> :</strong> ${retrieveItemDetailList.height}</li>
                            <li><strong><@spring.message 'label.itemdetail.weight' /> :</strong> ${retrieveItemDetailList.weight}</li>
                            <li><strong>ontrailer :</strong> ${retrieveItemDetailList.ontrailer}</li>
                        </ul>
                  </div>
                  </#list>
	  <#elseif model["itemtype"] == "Boats">  
 

	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	    <div class="itemSpec">
                	
                   	  <h2><strong><@spring.message 'label.item' /></strong></h2>	
                        <ul>
                        <li><strong><@spring.message 'label.getquote.description' /> :</strong> ${retrieveItemDetailList.description}</li>
                            <li><strong>Type Of Boat:</strong> ${retrieveItemDetailList.typeofboat}</li>
                            <li><strong>Type Of Keel:</strong> ${retrieveItemDetailList.typeofkeel}</li>
	                          <li><strong>Boat Already in Trailer:</strong> ${retrieveItemDetailList.ontrailer}</li>
	  
	  
	    </ul>
                  </div></#list>
	 <#elseif model["itemtype"] == "Haulage"> 
 

	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	     <div class="itemSpec">
                	
                   	  <h2><strong><@spring.message 'label.item' /></strong></h2>	
                        <ul>
                        <li><strong><@spring.message 'label.getquote.description' /> :</strong> ${retrieveItemDetailList.description}</li>
                        <li><strong>Relevant Item Dimension:</strong> ${retrieveItemDetailList.relevantitem}</li>
                             <li><strong>Total <@spring.message 'label.itemdetail.weight' />:</strong> ${retrieveItemDetailList.weight}</li>
	  
	  
	    </ul>
                  </div></#list>
	 <#elseif model["itemtype"] == "FragileGoods">
  
  
	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	     <div class="itemSpec">
                	
                   	  <h2><strong><@spring.message 'label.item' /></strong></h2>	
                        <ul>
                       
                        	<li><strong><@spring.message 'label.getquote.description' /> :</strong> ${retrieveItemDetailList.description}</li>
                            <li><strong><@spring.message 'label.itemdetail.length' /> :</strong> ${retrieveItemDetailList.length}</li>
                            <li><strong><@spring.message 'label.itemdetail.width' /> :</strong> ${retrieveItemDetailList.width}</li>
                            <li><strong><@spring.message 'label.itemdetail.height' /> :</strong> ${retrieveItemDetailList.height}</li>
                            <li><strong><@spring.message 'label.itemdetail.weight' /> :</strong> ${retrieveItemDetailList.weight}</li>
	    </ul>
                  </div></#list>
	  <#elseif model["itemtype"] == "Livestock">
  
  
	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	     <div class="itemSpec">
                	
                   	  <h2><strong><@spring.message 'label.item' /></strong></h2>	
                        <ul>
                       
                        	<li><strong><@spring.message 'label.getquote.description' /> :</strong> ${retrieveItemDetailList.description}</li>
                        	<li><strong><@spring.message 'label.getquote.pets.breed' /> :</strong> ${retrieveItemDetailList.breed}</li>
                            <li><strong><@spring.message 'label.itemdetail.length' /> :</strong> ${retrieveItemDetailList.length}</li>
                            <li><strong><@spring.message 'label.itemdetail.width' /> :</strong> ${retrieveItemDetailList.width}</li>
                            <li><strong><@spring.message 'label.itemdetail.height' /> :</strong> ${retrieveItemDetailList.height}</li>
                            <li><strong><@spring.message 'label.itemdetail.weight' /> :</strong> ${retrieveItemDetailList.weight}</li>
	    </ul>
                  </div></#list>
	 <#elseif model["itemtype"] == "others">
  
  
 

	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	     <div class="itemSpec">
                	
                   	  <h2><strong><@spring.message 'label.item' /></strong></h2>	
                        <ul>
                       
                        	<li><strong><@spring.message 'label.getquote.description' /> :</strong> ${retrieveItemDetailList.description}</li>
                        
                            <li><strong><@spring.message 'label.itemdetail.length' /> :</strong> ${retrieveItemDetailList.length}</li>
                            <li><strong><@spring.message 'label.itemdetail.width' /> :</strong> ${retrieveItemDetailList.width}</li>
                            <li><strong><@spring.message 'label.itemdetail.height' /> :</strong> ${retrieveItemDetailList.height}</li>
                            <li><strong><@spring.message 'label.itemdetail.weight' /> :</strong> ${retrieveItemDetailList.weight}</li>
	    </ul>
                  </div></#list>
	 <#else>
	  <h2><strong><@spring.message 'label.item' /></strong></h2>	
                        <ul>
                       
                        	<li><strong>No <@spring.message 'label.item' /> :</strong></li>
                        
                         
	    </ul>
                  </div>
	  </#if>
	  