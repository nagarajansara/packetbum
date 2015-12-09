<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>

	
	<#if model["login"]?? && (model["login"] == "true")>
        	
         
<script>
		$(function(){
			
			alert("Your Account Active Successfully");
			$( "#loginID" ).trigger( "click" );
			
		});
</script>

</#if>
        
        <div class="banner_left">
        	<div class="banner_right">
            	<div class="banner_bg">
            		<div class="container">
                          
                          <div class="banner">
                          	<iframe src="https://player.vimeo.com/video/131645702" width="100%" title="How It Works" height="400px" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                          		<!--<div class="banner_quotes">
                                	<div class="quotes">
                                    	<h1><span><@spring.message "label.neque" /></span> <br /><b><@spring.message "label.deliveryquotes" /></b> </h1>
                                       
										<a href="#" class="banner_btn"><@spring.message "label.howitworks" /></a>
                                    </div>
                                </div>-->
                                <!--<div class="banner_form">
                                	<div class="<@spring.message 'label.getcheaper' />">
                                    	<p><@spring.message "label.fromover" /> 7,000 <@spring.message "label.rateddelivery" /> </p>
                                    </div>
                                    <form action="getquote.html" method="GET">
                                  
                                	<div class="select_box" style=" margin-left: -20px;" >
                                    	
                                        
                                        <select class="styled sel_sec" name="colcountry">
                                              <option><@spring.message "label.collectioncountry" /></option>
                                                <option Value="Slovenia">Slovenia</option> 
                  
                                        </select>
                                        
                                        <select class="styled sel_fir" id="category" name="delcountry">
                                           <option><@spring.message "label.deliverycountry" /></option>
                                                 <option Value="Slovenia">Slovenia</option> 
                                        </select>
                                        
                                              
                                    </div>
                                    <div class="btn_quotes" style=" margin-left: -20px;">
                                    	<input type="submit" class='<@spring.message "label.getfreequotes" />' value=""/>
                                    </div>
                                      </form>
                                </div>-->
                          </div>
                                   	
                    </div>                    
                </div>
            </div>
        </div>
        
        <!--<div class="container">
        	<div class="content">
            	<ul>
                	<li style="padding: 15px 10px;"><a href="#"><img src='assets/img/<@spring.message "label.listdelivery" />' width="278" height="38" /></a></li>
                    <li style="padding: 15px 27px;"><a href="#"><img src='assets/img/<@spring.message "label.comparefreequotes" />' width="306" height="38" /></a></li>
                    <li><a href="#"><img src='assets/img/<@spring.message "label.chooseyourfavorite" />' width="245" height="38" /></a></li>
                </ul>
                
                <p class="para_content"><@spring.message "label.home.para_content" /></p>
                
                <div class="key_points">
                	<div class="<@spring.message 'label.fastandeasy' />">
                    	<div>
           	    	   		 <img src="assets/img/fast.gif" width="56" height="66" />
                        </div>
                    	<p><@spring.message "label.fastandeasydesc" /></p>
                    </div>
                    <div class="<@spring.message 'label.greatprices' />">
                    	<div>
                   	    	<img src="assets/img/price.gif" width="66" height="66" /> 
                        </div>
                   	  <p><@spring.message "label.greatpricesdesc" /></p>
                    </div>
                    <div class="<@spring.message 'label.trustworthy' />">
                    	<div>
           	    	     	<img src="assets/img/trust.gif" width="55" height="67" />
                        </div>
                    	<p><@spring.message "label.trustworthdesc" /></p>
                    </div>
                    <div class="<@spring.message 'label.helpful' />">
                        <div>
                   	    	<img src="assets/img/help.gif" width="66" height="66" /> 
                        </div> 
                   	  <p><@spring.message "label.helpfuldesc" /></p>
                   </div>                
                </div>
                
            </div>        	
        </div>-->
        
        <div class="happy_users_bg">
        	
                
                
</@u.trucklayout>
<script type="text/javascript">
	$('.pbCommonMain_Menu a').removeClass('selected');
	$('.pbHowToWrk_Menu a').addClass('selected');
</script> 