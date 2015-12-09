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
                          		<div class="banner_quotes">
                                	<div class="quotes">
                                    	<h1><span><@spring.message "label.neque" /></span> <br /><b><@spring.message "label.deliveryquotes" /></b> </h1>
                                       
										<a href="#" class="banner_btn"><@spring.message "label.howitworks" /></a>
                                    </div>
                                </div>
                                <div class="banner_form">
                                	<div class="<@spring.message 'label.getcheaper' />">
                                    	<p><@spring.message "label.fromover" /> 7,000 <@spring.message "label.rateddelivery" /> </p>
                                    </div>
                                    <form action="getquote.html" method="GET">
                                  
                                	<div class="select_box" style=" margin-left: -20px;" >
                                    	
                                        
                                        <select class="styled sel_sec" name="colcountry">
                                              <option><@spring.message "label.collectioncountry" /></option>
                                              <#list model["retrieveCountry"] as retrieveCountry>
                                             	<option value="${retrieveCountry.id}">${retrieveCountry.country_name}</option>
                                             </#list> 
                                        </select>
                                        
                                        <select class="styled sel_fir" id="category" name="delcountry">
                                           <option><@spring.message "label.deliverycountry" /></option>
                                                <#list model["retrieveCountry"] as retrieveCountry>
                                             		<option value="${retrieveCountry.id}">${retrieveCountry.country_name}</option>
                                             </#list>  
                                        </select>
                                        
                                              
                                    </div>
                                    <div class="btn_quotes" style=" margin-left: -20px;">
                                    	<input type="submit" class='<@spring.message "label.getfreequotes" />' value=""/>
                                    </div>
                                      </form>
                                </div>
                          </div>
                                   	
                    </div>                    
                </div>
            </div>
        </div>
        
        <div class="container">
        	<div class="content pbCommonFontFamily_V">
            	<ul>
                	<li style="padding: 15px 10px;"><a href="#"><img src='assets/img/<@spring.message "label.listdelivery" />' width="278" height="38" /></a></li>
                    <li style="padding: 15px 27px;"><a href="#"><img src='assets/img/<@spring.message "label.comparefreequotes" />' width="306" height="38" /></a></li>
                    <li><a href="#"><img src='assets/img/<@spring.message "label.chooseyourfavorite" />' width="245" height="38" /></a></li>
                </ul>
                
                <p class="para_content"><@spring.message "label.home.para_content" /></p>
                
                <div class="key_points pbCommonFontFamily_V">
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
        </div>
        
        <div class="happy_users_bg">
        	<div class="container">
            
            	<div style="padding:20px 0;">  
                
                	          	
                    <div class="happy_users" style="width: 625px !important;">
                          <h3></h3>
                          <p class="img_para"><img src="assets/img/<@spring.message 'label.happyuser' />" width="183" height="29" /></p>
                          
                          <div class="jcarousel-wrapper">
                                    <div class="jcarousel">
                                        <ul>
                                            <li>
                                                <div class="hpy_users_para">
                                                    <img src="assets/img/<@spring.message 'label.home.happyuser' />" width="103" height="103" />
                                                    <div>
                                                        <p style=" width:603px;">Predsednik sekcije za promet pri Obrtno-podjetni&#x161;ki zbornici Slovenije

(OZS) Andrej Klobasa glavni problem vidi v tujih prevoznikih, ki v

Sloveniji opravljajo prevoze in po njegovi oceni niso dovolj nadzorovani.

</p>
                                                        <h3>- Andrej Klobasa, Predsednik sekcije za promet</span></h3>                            
                                                    </div>
                                                </div>
                                 			</li>
                                            <li>
                                                <div class="hpy_users_para">
                                                    <img src="assets/img/<@spring.message 'label.home.happyuser' />" width="103" height="103" />
                                                    <div>
                                                        <p style=" width:603px;">Predsednik sekcije za promet pri Obrtno-podjetniški zbornici Slovenije

(OZS) Andrej Klobasa glavni problem vidi v tujih prevoznikih, ki v

Sloveniji opravljajo prevoze in po njegovi oceni niso dovolj nadzorovani.

</p>
                                                        <h3>- Andrej Klobasa, Predsednik sekcije za promet</span></h3>                          
                                                    </div>
                                                </div>
                                 			</li>
                                            <li>
                                                <div class="hpy_users_para">
                                                    <img src="assets/img/<@spring.message 'label.home.happyuser' />" width="103" height="103" />
                                                    <div>
                                                        <p style=" width:603px;">Predsednik sekcije za promet pri Obrtno-podjetniški zbornici Slovenije

(OZS) Andrej Klobasa glavni problem vidi v tujih prevoznikih, ki v

Sloveniji opravljajo prevoze in po njegovi oceni niso dovolj nadzorovani.

</p>
                                                        <h3>- Andrej Klobasa, Predsednik sekcije za promet</span></h3>                            
                                                    </div>
                                                </div>
                                 			</li>
                                                                                        
                                        </ul>
                                    </div> 
                                    
               						 <p class="jcarousel-pagination"></p>
           						 </div>
                          
                                  
                    </div>
                    <div class="how_works">
                         <!--<img src="assets/img/<@spring.message 'label.home.howitwork' />" />-->
                         <span style="font-family: verdana; font-weight: bold; color: #FF7F00">How It Works</span>
                         <iframe src="https://player.vimeo.com/video/131645702" width="100%" title="How It Works" height="auto" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
                    </div>
                </div>
                
                <div class="delivery_report pbCommonFontFamily_V pbCommonFontWeight_B">
                	<div class="recent_delivery">
                    	<img src="assets/img/<@spring.message 'label.recentdelivery' />" style="display:block; padding: 0 0 0 10px;"/>
						<table>
           	 				<tr>
                            	<th style="height: 20px;"><@spring.message "label.item" /></th>
                                <th style="height: 20px;"><@spring.message "label.collection" /></th>
                                <th style="height: 20px;"><@spring.message "label.delivery" /></th>
                                <th style="height: 20px;"><@spring.message "label.millage" /></th>
                            </tr>
                              <#list model["retrieveRecentDelivery"] as retrieveRecentDelivery>
					  	<tr >
						<td style="padding:10px"><a href="itemdetail.html?id=${retrieveRecentDelivery.id}"  style="color:#333;"> </a><a href="itemdetail.html?id=${retrieveRecentDelivery.id}" class="shortHead">${retrieveRecentDelivery.description}</a></td>
						<td style="padding:10px"><span class="shortHead">${retrieveRecentDelivery.coladdress}</span></td>
						<td style="padding:10px"><span class="shortHead">${retrieveRecentDelivery.deladdress}</span></td>
						<td style="padding:10px">${retrieveRecentDelivery.millage}</td>
						</tr>
					  </#list>      
                          
                        </table>
                    	<p style=" margin:20px 0 0;"><img src="assets/img/<@spring.message 'label.index.counter' />" width="279" height="237" /></p>
                     </div>
                    <div class="count"></div>
                </div>
                
                
</@u.trucklayout> 