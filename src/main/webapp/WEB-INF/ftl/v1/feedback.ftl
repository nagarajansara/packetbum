
<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>

<!--content-->
        
        <div class="container rating">
        	<div class="rating">
            	<div class="profile">
                 <#if model["userDetails"]?has_content>
                 	<#list model["userDetails"] as userDetails>
                		<div class="profileName"><p class="userVisibleName"> ${userDetails.firstname}</p> <p class="ratingstar" data-rating-max="5"></p></div>
                		<div class="regYear">
                    	<ul>
                            <li><@spring.message "label.review.registersince" /> ${userDetails.creates}</li>
                            <li><@spring.message "label.review.verified" /></li>
                            <li><@spring.message "label.review.insurance" /></li>
                    	</ul>
                    </div>
                    <div class="jobs">
                    	<ul>
                            <li><strong><@spring.message "label.review.completedjobs" />:</strong> ${userDetails.total}</li>
                            <li><strong><@spring.message "label.review.noofdrivers" />:</strong>0</li>
                            <li><strong><@spring.message "label.review.vehicles" /> :</strong> 0</li>
                            <li><strong><@spring.message "label.review.insuranceconverage" />:</strong> Good Transit Upto &euro;10,000</li>
                            <li><strong><@spring.message "label.review.paymentmethods" /> :</strong> cash, banh transfer, paypal/nochex, payment on delivery, payment up front, part payment at front</li>
                    	</ul>
                    </div>
                	</#list>
                	<#else>
                		<span style="font-family: verdana; color: red; font-weight: bold"> No user details found</span>	
                   </#if> 
                     
                </div><!--end profile-->
                
                <div class="reviewAndRatings">
                	<p><img src="assets/img/<@spring.message "label.review.review" />" width="194" height="19" /></p>
                    
                    <table>
                    	<tr>
                        	<th></th>
                            <th class="total"> <@spring.message "label.feedback.total" /> </th>
                            
                            <th><@spring.message "label.review.users" /> </th>
                            
                        </tr>
                         <#if model["starratings"]?has_content>
                         	<#list model["starratings"] as starratings>
		                        <tr>
		                        	<td><strong>5 <@spring.message "label.feedback.star" /> </strong></td>
		                            <td class="alignLeft"><img src="assets/img/star5.png" width="84" height="15" /></td>
		                            <td>${starratings.oneStart}</td>
		                            
		                        </tr>
		                        <tr>
		                        	<td><strong>4 <@spring.message "label.feedback.star" /></strong></td>
		                            <td class="alignLeft"><img src="assets/img/star4.png" width="84" height="15" /></td>
		                            <td>${starratings.twoStart}</td>
		                        </tr>
		                        <tr>
		                        	<td><strong>3 <@spring.message "label.feedback.star" /></strong></td>
		                            <td class="alignLeft"><img src="assets/img/star3.png" width="84" height="15" /></td>
		                            <td>${starratings.threeStart}</td>
		                        </tr>
		                        <tr>
		                        	<td><strong>2 <@spring.message "label.feedback.star" /></strong></td>
		                            <td class="alignLeft"><img src="assets/img/star2.png" width="84" height="15" /></td>
		                            <td>${starratings.fourStart}</td>
		                        </tr>
		                        <tr>
		                        	<td><strong>1 <@spring.message "label.feedback.star" /></strong></td>
		                            <td class="alignLeft"><img src="assets/img/star1.png" width="84" height="15" /></td>
		                            <td>${starratings.fiveStart}</td>
		                        </tr>
	                       </#list> 
                        </#if>
                    </table>
                </div>
               
                <div class="items">
                
                 <!--<div class="pagenation top">
                    	<p><strong><@spring.message "label.review.showing" />:</strong> <span>1-20 <@spring.message "label.listitem.of" /> 9666 <@spring.message "label.feedback.review" /></span></p>
                        <ul>
                        	<li><a href="#"><strong>&lt;</strong></a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#" class="activated">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><strong>&gt;</strong></a></li>
                        </ul>                        
                  </div>-->
                   <#if model["commentsDetails"]?has_content>
                   		<#list model["commentsDetails"] as commentsDetails>
			               	  <div class="item1">
			                    	<div class="wroteCustomer"><p><a href="#">${commentsDetails.username}</a><@spring.message "label.feedback.wrote" />${commentsDetails.creates}</p>
			                        	<p class="ratingstar" data-rating-max="5"></p>
			                        </div>
			                        <p class="customerStory">
			                        	<strong><@spring.message "label.item" />:2 <@spring.message "label.feedback.furniture" /></strong><br />
			                            <span>${commentsDetails.username}</span>
			                        </p>
			                    </div>
			              </#list>
			              <#else>
			           		<div class="item1">
			                        <p class="customerStory">
			                        	<span style="font-family: verdana; color: red;">No comments found</span>
			                        </p>
			                    </div>	
                   </#if>
                    
                    <!--<div class="item1">
                    	<div class="wroteCustomer"><p><a href="#">Saravanan</a> <@spring.message "label.feedback.wrote" />: 07/08/2014</p>
                        	<p class="ratingstar" data-rating-max="5"></p>
                        </div>
                        <p class="customerStory">
                        	<strong><@spring.message "label.item" />:2 <@spring.message "label.feedback.furniture" /></strong><br />
                            <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                        </p>
                    </div>
                    <div class="item1">
                    	<div class="wroteCustomer"><p><a href="#">Saravanan</a> <@spring.message "label.feedback.wrote" />: 07/08/2014</p>
                        	<p class="ratingstar" data-rating-max="5"></p>
                        </div>
                        <p class="customerStory">
                        	<strong><@spring.message "label.item" />:2 <@spring.message "label.feedback.furniture" /></strong><br />
                            <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                        </p>
                    </div>
                    <div class="item1">
                    	<div class="wroteCustomer"><p><a href="#">Saravanan</a> <@spring.message "label.feedback.wrote" />: 07/08/2014</p>
                        	<p class="ratingstar" data-rating-max="5"></p>
                        </div>
                        <p class="customerStory">
                        	<strong><@spring.message "label.item" />:2 <@spring.message "label.feedback.furniture" /></strong><br />
                            <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                        </p>
                    </div>-->
                    
                  <!--<div class="pagenation">
                    	<p><strong><@spring.message "label.feedback.wrote" /><@spring.message "label.review.showing" />:</strong> <span>1-20 <@spring.message "label.listitem.of" /> 9666 <@spring.message "label.feedback.review" /></span></p>
                        <ul>
                        	<li><a href="#"><strong>&lt;</strong></a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#" class="activated">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><strong>&gt;</strong></a></li>
                        </ul>                        
                    </div>-->
                </div>
            </div>
            
            
        </div>
        
        <!--End content-->
      	
        
	</@u.trucklayout> 