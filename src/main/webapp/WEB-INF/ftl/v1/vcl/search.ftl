
    
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
                    	
                       	  <p style="color:#fff; padding: 16px 0;"><@spring.message "label.listitem.results" />:  ${start} - ${end}  <@spring.message "label.listitem.of" /> ${model["totalcount"]} </p>
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
       	    	<img src="../assets/img/feature_delivery.png" width="212" height="42" style="display:block; margin: 10px 0;" />
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
						<td class="width_1"><a href="itemdetail.html?id=${retrieveItemList.id}"><img src='${retrieveItemList.photos}' class="boxshadow"/> ${retrieveItemList.description}</a></td>
						<td class="width_1">${retrieveItemList.coladdress}</td>
						<td class="width_1">${retrieveItemList.deladdress}</td>
						<td class="width_2">${retrieveItemList.millage}</td>
						<td class="width_2">${retrieveItemList.diffdays}</td>
						<td class="width_2 bg_table2"><a href="itemdetail.html?id=${retrieveItemList.id}" style="color:#ffffff">${retrieveItemList.numquote}</a></td>
						</tr>
					  </#list>    
                    
                  
                 </table>
                 
                 <h3 class="head3"><span><@spring.message "label.listitem.upgrade" /></span> <@spring.message "label.listitem.delrequest" /></h3>
                 <table class="table_1">
                   <#if model["retrieveItems"]?has_content>
                     <#list model["retrieveItems"] as retrieveItemList>
					  	<tr class="even row_4">
						<td class="width_1"><a href="vclitemdetail.html?id=${retrieveItemList.id}"><img src='${retrieveItemList.photos}'  class="boxshadow"/> ${retrieveItemList.description}</a></td>
						<td class="width_1">${retrieveItemList.coladdress}</td>
						<td class="width_1">${retrieveItemList.deladdress}</td>
						<td class="width_2">${retrieveItemList.millage}</td>
						<td class="width_2">${retrieveItemList.diffdays}</td>
						<td class="width_2 bg_table2"><a href="itemdetail.html?id=${retrieveItemList.id}" style="color:#ffffff">${retrieveItemList.numquote}</a></td>
						</tr>
					  </#list>           
                   <#else>
                                                         <tr class="boldbg" style="background-color:#f4f4f4;" >
                                                        	<td colspan="6"> <@spring.message "label.getquote.noitem" /></td>
                                                           
                                                        </tr>
                                                            </#if>
                    
                </table>
            </div>
            
             <div class="banner_left">
                <div class="banner_right">
                    <div class="ser_content_bg">
                        <div class="container">
                            <div>
                              <p style="color:#fff; padding: 16px 0; float: left;"><@spring.message "label.listitem.results" />: ${start} - ${end} <@spring.message "label.listitem.of" /> ${model["totalcount"]} </p>
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
     
