
<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>

<!--content-->
        
        <div class="container rating">
        	<div class="rating">
            	<div class="profile">
                  <#list model["getUserDetail"] as  getUserDetail>
                	<div class="profileName"><p class="userVisibleName">${getUserDetail.shortname}</p> <p class="ratingstar" data-rating-max="5"></p></div>
                    
                    <div class="regYear">
                    	<ul>
                            <li>Register since ${getUserDetail.creates}</li>
                            <li>Verified</li>
                            <li>Insurance</li>
                    	</ul>
                    </div>
                    
                     <div class="jobs">
                    	<ul>
                            <li><strong>Completed jobs :</strong> 150</li>
                            <li><strong>No.of drivers :</strong> 5</li>
                            <li><strong>Vechils :</strong> 4</li>
                            <li><strong>Insurance Coverage :</strong> Good Transit Upto &euro;10,000</li>
                            <li><strong>Payment Methods :</strong> cash, banh transfer, paypal/nochex, payment on delivery, payment up front, part payment at front</li>
                    	</ul>
                    </div>  
                                
                </div><!--end profile-->
                
                <div class="reviewAndRatings">
                	<p><img src="assets/img/review.png" width="194" height="19" /></p>
                    
                    <table>
                    	<tr>
                        	<th></th>
                            <th class="total">Total</th>
                            
                            <th>users</th>
                            
                        </tr>
                        <tr>
                        	<td><strong>5 Stars</strong></td>
                            <td class="alignLeft"><img src="assets/img/star5.png" width="84" height="15" /></td>
                            <td>${getUserDetail.star5}</td>
                            
                        </tr>
                        <tr>
                        	<td><strong>4 Stars</strong></td>
                            <td class="alignLeft"><img src="assets/img/star4.png" width="84" height="15" /></td>
                            <td>${getUserDetail.star4}</td>
                        </tr>
                        <tr>
                        	<td><strong>3 Stars</strong></td>
                            <td class="alignLeft"><img src="assets/img/star3.png" width="84" height="15" /></td>
                            <td>${getUserDetail.star3}</td>
                        </tr>
                        <tr>
                        	<td><strong>2 Stars</strong></td>
                            <td class="alignLeft"><img src="assets/img/star2.png" width="84" height="15" /></td>
                            <td>${getUserDetail.star2}</td>
                        </tr>
                        <tr>
                        	<td><strong>1 Stars</strong></td>
                            <td class="alignLeft"><img src="assets/img/star1.png" width="84" height="15" /></td>
                            <td>${getUserDetail.star1}</td>
                        </tr>
                    </table>
                </div>
                </#list>
                <div class="items">
                
                 <div class="pagenation top">
                    	<p><strong>showing:</strong> <span>1-20 0f 9666 Reviews</span></p>
                        <ul>
                        	<li><a href="#"><strong>&lt;</strong></a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#" class="activated">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><strong>&gt;</strong></a></li>
                        </ul>                        
                  </div>
                    
               	  <div class="item1">
                    	<div class="wroteCustomer"><p><a href="#">Saravanan</a> wrote: 07/08/2014</p>
                        	<p class="ratingstar" data-rating-max="5"></p>
                        </div>
                        <p class="customerStory">
                        	<strong>Item:2 furniture</strong><br />
                            <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                        </p>
                    </div>
                    <div class="item1">
                    	<div class="wroteCustomer"><p><a href="#">Saravanan</a> wrote: 07/08/2014</p>
                        	<p class="ratingstar" data-rating-max="5"></p>
                        </div>
                        <p class="customerStory">
                        	<strong>Item:2 furniture</strong><br />
                            <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                        </p>
                    </div>
                    <div class="item1">
                    	<div class="wroteCustomer"><p><a href="#">Saravanan</a> wrote: 07/08/2014</p>
                        	<p class="ratingstar" data-rating-max="5"></p>
                        </div>
                        <p class="customerStory">
                        	<strong>Item:2 furniture</strong><br />
                            <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                        </p>
                    </div>
                    <div class="item1">
                    	<div class="wroteCustomer"><p><a href="#">Saravanan</a> wrote: 07/08/2014</p>
                        	<p class="ratingstar" data-rating-max="5"></p>
                        </div>
                        <p class="customerStory">
                        	<strong>Item:2 furniture</strong><br />
                            <span>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span>
                        </p>
                    </div>
                    
                  <div class="pagenation">
                    	<p><strong>showing:</strong> <span>1-20 0f 9666 Reviews</span></p>
                        <ul>
                        	<li><a href="#"><strong>&lt;</strong></a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#" class="activated">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"><strong>&gt;</strong></a></li>
                        </ul>                        
                    </div>
                </div>
            </div>
            
            
        </div>
        
        <!--End content-->
      	
        
	</@u.trucklayout> 