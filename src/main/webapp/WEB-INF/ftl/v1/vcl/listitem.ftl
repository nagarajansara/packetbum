
<#import "vechicleownerlayout.ftl" as u>
<@u.vechicleownerlayout>
<style type="text/css">
	.ui-tabs-vertical { width:100%; height:210px; overflow:hidden; background: #fafafa; }
  .ui-tabs-vertical .ui-tabs-nav { float: left; width: 240px; }
  .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; height: 70px;/* border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0;*/ }
  .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
  .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; /*padding-right: .1em; border-right-width: 1px;*/ border:none; background:#fafafa; }
  .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 710px;}
</style>
   
    	
        <!--Tab Menu-->
      	
        <div class="container">
        	<div class="container-fluid ">
                <ul class="nav nav-tabs droptabs searchQuotes">
                    <li class="active always-visible"><a href="#home" data-toggle="tab"><img src="../assets/img/<@spring.message "label.vcllistitem.tab1" />" width="150" height="40" /></a></li>
                    <li ><a href="#settings1" data-toggle="tab"><img src="../assets/img/<@spring.message "label.vcllistitem.tab2" />" width="150" height="40" /></a></li>
                    <li><a href="#settings2" data-toggle="tab" ><img src="../assets/img/<@spring.message "label.vcllistitem.tab3" />" width="150" height="40" /></a></li>
                    <li><a href="#settings3" data-toggle="tab"><img src="../assets/img/<@spring.message "label.vcllistitem.tab4" />" width="90" height="40" /></a></li>
                   
                    
                    <!--<li class="dropdown pull-right">
                        <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                        <ul class="dropdown-menu" role="menu" aria-labelledby="myTabDrop1">
                            <li class="always-dropdown"><a href="#settings4" data-toggle="tab">Always in dropdown</a></li>
                        </ul>
                 </li>-->
                </ul>
			<div class="row-fluid ">
				<div class="row-fluid">
					<div class="tab-content span4">
                        <div class="tab-pane active" id="home">
                        	  <p><@spring.message "label.vcllistitem.tab1desc" /></p>
                      </div>
                        <div class="tab-pane" id="settings1">
                         <p><@spring.message "label.vcllistitem.tab2desc" /></p>   </div>
                      
                        <div class="tab-pane" id="settings2">
                        
                        	 <p><@spring.message "label.vcllistitem.tab3desc" /></p>  </div>
                        
                        <div class="tab-pane" id="settings3">
                        <p><@spring.message "label.vcllistitem.tab4desc" />(<a href="#"><@spring.message "label.vclhome.payment" /></a>)</p>   
                        </div>
                        
				  </div>
			    </div>
		   </div>
	      </div>
          
          <div id="tabs">
              <ul>
                <li data="country"><a href="#tabs-1"><img src="../assets/img/<@spring.message "label.vcllistitem.countrysearch" />" width="133" height="17" /></a></li>
                <li data="route"><a href="#tabs-2"><img src="../assets/img/<@spring.message "label.vcllistitem.routesearch" />" width="114" height="14" /></a></li>
                <li data="local"><a href="#tabs-3"><img src="../assets/img/<@spring.message "label.vcllistitem.localsearch" />" width="109" height="14" /></a></li>
              </ul>
            <div id="tabs-1">
                <div class="route_search">
                <form name="countrysearch" id="countrysearch">
                 <input type="hidden" id="search" value="false"/>
                
                <input type="hidden" id="formsearchid" value="country"/>
                	<div class="country_search">
                	
                    	<div class="country">
                        	<p style="float: left; font-weight: bold; font-size: 13px; margin: 10px 10px 0 0;"><@spring.message "label.vcllistitem.collection" /></p>
                        	<select name="colcountry[]" class="custom-select_3" >
                              <!-- <option Value="194">Slovenia</option>-->
                              <#list model["retrieveCountry"] as retrieveCountry>
                              	<option value="${retrieveCountry.id}">${retrieveCountry.country_name}</option>
                              </#list> 
                          </select>
                           
                         
                      </div>
                        <div class="country">
                        	<p style="float: left; font-weight: bold; font-size: 13px; margin: 10px 21px 0 0;"><@spring.message "label.vcllistitem.delivery" /> </p>
                        	<select name="delcountry[]" class="custom-select_3" >
                               <#list model["retrieveCountry"] as retrieveCountry>
                              		<option value="${retrieveCountry.id}">${retrieveCountry.country_name}</option>
                              </#list>           
                            </select>
                            </div>
                    </div>
                                       
                        <div class="route_checkbox">
                            <div class="checkbox_left">
                                <p><a  style="color:#F60; text-decoration: underline;cursor:pointer;" id="checkbxbtn"><@spring.message "label.category.clear" /></a></p>
                                <p><input type="checkbox" id="checkbox_3" name="itemtype[]" value="2" /><label for="checkbox_3"><@spring.message "label.category.general" /></label></p>
                                <p><input type="checkbox" id="checkbox_4" name="itemtype[]" value="1" /><label for="checkbox_4"><@spring.message "label.category.furniture" /></label></p>
                                <p><input type="checkbox" id="checkbox_5" name="itemtype[]" value="11" /><label for="checkbox_5"><@spring.message "label.category.others" /></label></p>
                                <p><input type="checkbox" id="checkbox_6" name="itemtype[]" value="3" /><label for="checkbox_6"><@spring.message "label.category.cars" /></label></p>
                                <p><input type="checkbox" id="checkbox_7"  name="itemtype[]" value="4" /><label for="checkbox_7"><@spring.message "label.category.motorcycle" /></label></p>
                                
                            </div>
                            <div>
                                <p><input type="checkbox" id="checkbox_8" name="itemtype[]" value="10" /><label for="checkbox_8"><@spring.message "label.category.livestock" /></label></p>
                                <p><input type="checkbox" id="checkbox_9" name="itemtype[]" value="5" /><label for="checkbox_9"><@spring.message "label.category.vechile" /></label></p>
                                <p><input type="checkbox" id="checkbox_10" name="itemtype[]" value="6" /><label for="checkbox_10"><@spring.message "label.category.home" /></label></p>
                                <p><input type="checkbox" id="checkbox_11" name="itemtype[]" value="7" /><label for="checkbox_11" ><@spring.message "label.category.boats" /></label></p>
                                <p><input type="checkbox" id="checkbox_12" name="itemtype[]" value="8" /><label for="checkbox_12"><@spring.message "label.category.haulage" /></label></p>
                                <p><input type="checkbox" id="checkbox_13" name="itemtype[]" value="9" /><label for="checkbox_13"><@spring.message "label.category.goods" /></label></p>
                            </div>
                        </div>
                    </form>
                    </div>
                
              </div>
              <div id="tabs-2">
                  <form name="routesearch" id="routesearch">
                	<div class="route_search">
                	<div class="select_search">
                    	<div class="collection">
                        	<p style="float: left; font-weight: bold; font-size: 13px; margin: 10px 10px 0 0;"><@spring.message "label.vcllistitem.collection" /></p>
                        	<select name="colcountry[]" class="custom-select_3" >
                              <#list model["retrieveCountry"] as retrieveCountry>
                              	<option value="${retrieveCountry.id}">${retrieveCountry.country_name}</option>
                              </#list>  
                          </select>
                            
                            <input type="text" name="colpostcode" placeholder="Town/Post code" class="ser_text" />
                            
                      </div>
                        <div class="collection">
                        	<p style="float: left; font-weight: bold; font-size: 13px; margin: 10px 21px 0 0;"> <@spring.message "label.vcllistitem.delivery" /></p>
                        	<select name="delcountry[]" class="custom-select_3" >
                             <#list model["retrieveCountry"] as retrieveCountry>
                              	<option value="${retrieveCountry.id}">${retrieveCountry.country_name}</option>
                              </#list>  
                          </select>
                            
                            <input type="text" name="delpostcode"  placeholder="Town/Post code" class="ser_text" />
                        </div>
                    </div>
                    <div class="route_radiobox">
                    	
                        <select name="km" class="custom-select_" style="color:#333;">
                                    <option>10</option>
                                    <option>20</option>
                                    <option>30</option>
                                    <option>40</option>
                                    <option>50</option>
                                    <option>60</option>
                                    <option>70</option>                  
                        </select>
                        <p>Max Miles Of Route</p>
                    </div>
                    
                    <div class="route_checkbox" style="width: 186px;">
                    	<div class="checkbox_left">
                                <p><a  style="color:#F60; text-decoration: underline;cursor:pointer;" id="checkbxbtn"><@spring.message "label.category.clear" /></a></p>
                                <p><input type="checkbox" id="checkbox_3" name="itemtype[]" value="2" /><label for="checkbox_3"><@spring.message "label.category.general" /></label></p>
                                <p><input type="checkbox" id="checkbox_4" name="itemtype[]" value="1" /><label for="checkbox_4"><@spring.message "label.category.furniture" /></label></p>
                                <p><input type="checkbox" id="checkbox_5" name="itemtype[]" value="11" /><label for="checkbox_5"><@spring.message "label.category.others" /></label></p>
                                <p><input type="checkbox" id="checkbox_6" name="itemtype[]" value="3" /><label for="checkbox_6"><@spring.message "label.category.cars" /></label></p>
                                <p><input type="checkbox" id="checkbox_7"  name="itemtype[]" value="4" /><label for="checkbox_7"><@spring.message "label.category.motorcycle" /></label></p>
                                
                            </div>
                            <div>
                                <p><input type="checkbox" id="checkbox_8" name="itemtype[]" value="10" /><label for="checkbox_8"><@spring.message "label.category.livestock" /></label></p>
                                <p><input type="checkbox" id="checkbox_9" name="itemtype[]" value="5" /><label for="checkbox_9"><@spring.message "label.category.vechile" /></label></p>
                                <p><input type="checkbox" id="checkbox_10" name="itemtype[]" value="6" /><label for="checkbox_10"><@spring.message "label.category.home" /></label></p>
                                <p><input type="checkbox" id="checkbox_11" name="itemtype[]" value="7" /><label for="checkbox_11" ><@spring.message "label.category.boats" /></label></p>
                                <p><input type="checkbox" id="checkbox_12" name="itemtype[]" value="8" /><label for="checkbox_12"><@spring.message "label.category.haulage" /></label></p>
                                <p><input type="checkbox" id="checkbox_13" name="itemtype[]" value="9" /><label for="checkbox_13"><@spring.message "label.category.goods" /></label></p>
                            </div>
                    </div>
                    
                  </div>
                  </form>
              </div>
              
              <div id="tabs-3">
               <form name="localsearch" id="localsearch">
                <div class="route_search">
                	<div class="select_search">
                    	<div class="collection">
                        	<p style="float: left; font-weight: bold; font-size: 13px; margin: 10px 10px 0 0;"><@spring.message "label.vcllistitem.collection" />/<@spring.message "label.vcllistitem.delivery" /></p>
                            <input type="hidden" name="colcountry[]" value="0"/>
                             <input type="hidden" name="delcountry[]" value="0"/>
                             
                            <input type="text" placeholder="Town/Post code" name="postcode" class="local_search" style="margin: 10px 0 0;" />
                            
                            <div style="overflow:hidden; margin: 20px 0px 0px 0px">
                            	<p >Search radius</p>
                            	 <select name="collection" class="custom-select_" style="color:#333;">
                                    <option>10</option>
                                    <option>20</option>
                                    <option>30</option>
                                    <option>40</option>
                                    <option>50</option>
                                    <option>60</option>
                                    <option>70</option>                
                                </select>
                               <p style="font-family: 'GothamRoundedLight'; font-size: 12px;"> Milage</p>
                        
                            </div>
                            
                      </div>
                       <!-- <div class="collection">
                        	<p style="float: left; font-weight: bold; font-size: 13px; margin: 10px 21px 0 0;"> Delivery</p>
                        	<select name="collection" class="custom-select_3">
                                <option>Select country</option>
                                <option>Driving</option>
                                <option>Internet</option>
                                <option>Movie</option>
                                <option>Music</option>
                                <option>Reading</option>
                                <option>Sports</option>                
                            </select>
                            
                            <input type="text" placeholder="Town/Post code" class="ser_text" />
                        </div>-->
                    </div>
                    <div class="route_radiobox">
                    	
                       
                    </div>
                    
                    <div class="route_checkbox" style="width: 238px;">
                    	<div class="checkbox_left">
                                <p><a  style="color:#F60; text-decoration: underline;cursor:pointer;" id="checkbxbtn"><@spring.message "label.category.clear" /></a></p>
                                <p><input type="checkbox" id="checkbox_3" name="itemtype[]" value="2" /><label for="checkbox_3"><@spring.message "label.category.general" /></label></p>
                                <p><input type="checkbox" id="checkbox_4" name="itemtype[]" value="1" /><label for="checkbox_4"><@spring.message "label.category.furniture" /></label></p>
                                <p><input type="checkbox" id="checkbox_5" name="itemtype[]" value="11" /><label for="checkbox_5"><@spring.message "label.category.others" /></label></p>
                                <p><input type="checkbox" id="checkbox_6" name="itemtype[]" value="3" /><label for="checkbox_6"><@spring.message "label.category.cars" /></label></p>
                                <p><input type="checkbox" id="checkbox_7"  name="itemtype[]" value="4" /><label for="checkbox_7"><@spring.message "label.category.motorcycle" /></label></p>
                                
                            </div>
                            <div>
                                <p><input type="checkbox" id="checkbox_8" name="itemtype[]" value="10" /><label for="checkbox_8"><@spring.message "label.category.livestock" /></label></p>
                                <p><input type="checkbox" id="checkbox_9" name="itemtype[]" value="5" /><label for="checkbox_9"><@spring.message "label.category.vechile" /></label></p>
                                <p><input type="checkbox" id="checkbox_10" name="itemtype[]" value="6" /><label for="checkbox_10"><@spring.message "label.category.home" /></label></p>
                                <p><input type="checkbox" id="checkbox_11" name="itemtype[]" value="7" /><label for="checkbox_11" ><@spring.message "label.category.boats" /></label></p>
                                <p><input type="checkbox" id="checkbox_12" name="itemtype[]" value="8" /><label for="checkbox_12"><@spring.message "label.category.haulage" /></label></p>
                                <p><input type="checkbox" id="checkbox_13" name="itemtype[]" value="9" /><label for="checkbox_13"><@spring.message "label.category.goods" /></label></p>
                            </div>
                    </div>
                    </div>
              </div>
              </form>
          </div>
          
          <div class="search_dates">
               
               <div class="<@spring.message "label.listitem.search" />"> 
               		<a href="#" id="searchFormSubmitID"></a>
               </div>
                
                      
          </div>


          
        </div>
    
    
    	<!--End Tab Menu-->
        <div id="table">
       
       <div class="banner_left">
        	<div class="banner_right">
            	<div class="ser_content_bg">
            		<div class="container">
                    	<div class="viewrs">
                    	<#function max x y>
                         <#if (x<y)><#return y><#else><#return x></#if>
                         </#function>
                         <#function min x y>
                         <#if (x<y)><#return x><#else><#return y></#if>
                         </#function>


<#macro pages totalPages p>
    <#assign size = totalPages?size>
    <#if (p<=5)> <#-- p among first 5 pages -->
        <#assign interval = 1..(min(5,size))>
    <#elseif ((size-p)<5)> <#-- p among last 5 pages -->
        <#assign interval = (max(1,(size-4)))..size >
    <#else>
        <#assign interval = (p-2)..(p+2)>
    </#if>
    <#if !(interval?seq_contains(1))>
     1 ... <#rt>
    </#if>
      <#assign prepage = p-1>
     <#assign nextpage =p +1>
     <#if (p>1)>
    	<li><a href="listitem.html?page=${prepage}&search=false" class="page_pre">&lt;</a></li>
    	 <#else>
      <li><a href="listitem.html?page=${p}&search=false" class="page_pre">&lt;</a></li>
    </#if>
    <#list interval as page>
   
        <#if page=p>
          <li><a href="listitem.html?page=${page}&search=false" class="page_1 active">${page}</a></li> <#t>
        <#else>
         <li><a href="listitem.html?page=${page}&search=false" class="page_1">${page}</a></li> <#t>
        </#if>
        
       
          
    </#list>
    
     <#if (model["totalpages"]< nextpage) >
    	<li><a href="#" class="page_pre">&lt;</a></li>
    	 <#else>
      <li><a href="listitem.html?page=${nextpage}&search=false" class="page_pre">&gt;</a></li>
    </#if>
    <#if !(interval?seq_contains(size))>
     ... ${size}<#lt>
    </#if>
</#macro>

                     
 <#assign start =1>
  <#assign end =model["retrieveItems"]?size>
 <#if (model["page"]>1)>
 <#assign livepage =model["page"]-1>
 <#assign start=livepage*10 >
 
  <#assign end=start+end >
 </#if>
                    	
                       	  <p style="color:#fff; padding: 16px 0;"><@spring.message "label.listitem.results" />:  ${start} - ${end} <@spring.message "label.listitem.of" /> ${model["totalcount"]} </p>
                        </div> 
                        <div class="pagination_table">
                        	<ul>
                        		 <@pages 1..model["totalpages"] model["page"] /> 
                            </ul>
                            
                        </div>                         	
                    </div>                    
                </div>
            </div>
      </div>
        
        	<div class="container">
       	    	<img src="../assets/img/<@spring.message "label.listitem.featuredelivery"/>" width="212" height="42" style="display:block; margin: 10px 0;" />
                <table class="table_1" style="width:960px;">
                	<tr>
                    	<th><@spring.message "label.item" /></th>
                        <th><@spring.message "label.collection" /></th>
                        <th><@spring.message "label.delivery" /></th>
                        <th><@spring.message "label.millage" /></th>
                        <th><@spring.message "label.listitem.dates" /></th>
                        <th><@spring.message "label.listitem.quotes" /></th>
                    </tr>
                    
                   <#list model["retrieveUpgradeItems"] as retrieveItemList>
					  	<tr class="row_1">
						<td class="width_1"><a href="vclitemdetail.html?id=${retrieveItemList.id}"><img src='${retrieveItemList.photos}' class="boxshadow"/> </a><a href="vclitemdetail.html?id=${retrieveItemList.id}" class="shortHead">${retrieveItemList.description}</a></td>
						<td class="width_1">${retrieveItemList.coladdress}</td>
						<td class="width_1">${retrieveItemList.deladdress}</td>
						<td class="width_2">${retrieveItemList.millage}</td>
						<td class="width_2">${retrieveItemList.diffdays}</td>
						<td class="width_2 bg_table2"><a href="vclitemdetail.html?id=${retrieveItemList.id}" style="color:#ffffff">${retrieveItemList.numquote}</a></td>
						</tr>
					  </#list>    
                    
                  
                 </table>
                 
                 <h3 class="head3" style="display:none;"><span><@spring.message "label.listitem.upgrade" /></span><@spring.message "label.listitem.delrequest" /></h3>
                 <table class="table_1">
                 
                     <#list model["retrieveItems"] as retrieveItemList>
					  	<tr class="even row_4">
						<td class="width_1"><a href="vclitemdetail.html?id=${retrieveItemList.id}"><img src='${retrieveItemList.photos}'  class="boxshadow"/></a><a href="vclitemdetail.html?id=${retrieveItemList.id}" class="shortHead"> ${retrieveItemList.description}</a></td>
						<td class="width_1">${retrieveItemList.coladdress}</td>
						<td class="width_1">${retrieveItemList.deladdress}</td>
						<td class="width_2">${retrieveItemList.millage}</td>
						<td class="width_2">${retrieveItemList.diffdays}</td>
						<td class="width_2 bg_table2"><a href="itemdetail.html?id=${retrieveItemList.id}" style="color:#ffffff">${retrieveItemList.numquote}</a></td>
						</tr>
					  </#list>      
                  
                    
                    
                    
                </table>
            </div>
            
            <div class="banner_left">
                <div class="banner_right">
                    <div class="ser_content_bg">
                        <div class="container">
                            <div>
                              <p style="color:#fff; padding: 16px 0; float: left;"><@spring.message "label.listitem.results" />: ${start} - ${end}  <@spring.message "label.listitem.of" /> ${model["totalcount"]} </p>
                            </div>    
                             <div class="pagination_table">
                                <ul>
                                 	 <@pages 1..model["totalpages"] model["page"] /> 
                                </ul>
                             </div>
                                             	
                        </div>                    
                    </div>
                </div>
     		</div>
      </div>
      <script src="../assets/js/bootstrap.min.js"></script>
      <script src="../assets/js/jquery.customSelect.js" type="text/javascript"></script>
      <script src="../assets/js/jquery.droptabs.js"></script>
      <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
  
<script type="text/javascript">
 $(function(){
	 
	 AppUtil.shortHeadByLength(20);
	 
	 
	 $("#formsearchid").val("country");
	 
	 //checkbxbtn,route_checkbox
	 $("#checkbxbtn").click(function(){
		    $(".route_checkbox input[type=checkbox]").each(function(){
		        $(this).attr('checked', false);
		    });
		})  ;
	 
	 
	 $("#searchFormSubmitID").click(function(){
		 
		 
		 $("#search").val("true");
		 
		 AppUtil.showAjaxLoader();
		
		 var typeofsearch= $("#formsearchid").val();
		 
		 console.log("search"+typeofsearch);
		 
		 var url="search.html";
		 
		if(typeofsearch==="country"){
			
			$.post(url,$("#countrysearch").serialize()+"&typeofsearch="+typeofsearch,function(response){
				 AppUtil.removeAjaxLoader();
				 $("#table").html(response);
			 });
		}else if(typeofsearch==="route"){
			$.post(url,$("#routesearch").serialize()+"&typeofsearch="+typeofsearch,function(response){
				 AppUtil.removeAjaxLoader();
				 $("#table").html(response);
			 });
			
		}else if(typeofsearch==="local"){
			
			$.post(url,$("#localsearch").serialize()+"&typeofsearch="+typeofsearch,function(response){
				 AppUtil.removeAjaxLoader();
				 $("#table").html(response);
			 });
		}
			 
			
			 
			 
			
		 
		 
		 
		 
		 
	 });
	 $("#tabs ul li").click(function(){
		 
		 var formsearchvalue=$(this).attr('data');
		 
	    $("#formsearchid").val(formsearchvalue);
	 
	 
	 });
	 	 
	 $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
	 $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
	 $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
	 $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
	 
	 $(".droptabs").droptabs({
			development:true
		});
 $('select.styled').customSelect();

		$(".custom-select_4").each(function(){
            $(this).wrap("<span class='select-wrapper_4'></span>");
            $(this).after("<span class='holder'></span>");
        });
		$(".custom-select_2").each(function(){
            $(this).wrap("<span class='select-wrapper_2'></span>");
            $(this).after("<span class='holder'></span>");
        });
      
		$(".custom-select_1").change(function(){
            var selectedOption = $(this).find(":selected").text();
            $(this).next(".holder").text(selectedOption);
        }).trigger('change');
		$(".custom-select_2").change(function(){
            var selectedOption = $(this).find(":selected").text();
            $(this).next(".holder").text(selectedOption);
        }).trigger('change');
 });
</script>

	</@u.vechicleownerlayout> 