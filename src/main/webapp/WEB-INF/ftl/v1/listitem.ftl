
<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>


    	<!--End Tab Menu-->
        
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
    	<li><a href="listitem.html?page=${prepage}" class="page_pre">&lt;</a></li>
    	 <#else>
      <li><a href="listitem.html?page=${p}" class="page_pre">&lt;</a></li>
    </#if>
    <#list interval as page>
   
        <#if page=p>
          <li><a href="listitem.html?page=${page}" class="page_1 active">${page}</a></li> <#t>
        <#else>
         <li><a href="listitem.html?page=${page}" class="page_1">${page}</a></li> <#t>
        </#if>
        
       
          
    </#list>
    
     <#if (model["totalpages"]< nextpage) >
    	<li><a href="#" class="page_pre">&lt;</a></li>
    	 <#else>
      <li><a href="listitem.html?page=${nextpage}" class="page_pre">&gt;</a></li>
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
                    	
                       	  <p style="color:#fff; padding: 10px 0;"><@spring.message "label.listitem.results" />: ${start} - ${end}  <@spring.message "label.listitem.of" /> ${model["totalcount"]} </p>
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
       	    	<img src="assets/img/<@spring.message "label.listitem.featuredelivery" />" width="212" height="42" style="display:block; margin: 10px 0;" />
                <table class="table_1" style="width:960px;">
                	<tr style="height:43px;">
                    	<th><@spring.message "label.item" /></th>
                        <th><@spring.message "label.collection" /></th>
                        <th><@spring.message "label.delivery" /></th>
                        <th><@spring.message "label.millage" /></th>
                        <th><@spring.message "label.listitem.dates" /></th>
                        <th><@spring.message "label.listitem.quotes" /></th>
                    </tr>
                    <#assign aDateTime = .now>
                       <#list model["retrieveUpgradeItems"] as retrieveItemList>
					  	<tr class="row_1">
						<td class="width_1"><a href="itemdetail.html?id=${retrieveItemList.id}"  ><img src='${retrieveItemList.photos}' class="boxshadow" /> </a><a style="color:#fff;" href="itemdetail.html?id=${retrieveItemList.id}" class="shortHead">${retrieveItemList.description}</a></td>
						<td class="width_1">${retrieveItemList.coladdress}</td>
						<td class="width_1">${retrieveItemList.deladdress}</td>
						<td class="width_2">${retrieveItemList.millage}</td>
						<td class="width_2">${retrieveItemList.diffdays}</td>
						<td class="width_2 bg_table2"><a href="itemdetail.html?id=${retrieveItemList.id}" style="color:#ffffff">${retrieveItemList.numquote}</a></td>
						</tr>
					  </#list>      
                    
                
                    
                  
                 </table>
                 
           
                  <#if model["username"]?? && model["role"]=="proOwner"> 
                 <h3 class="head3" style="font-size: 14px;"><a href="pro/index.html"><span><@spring.message "label.listitem.upgrade" />  </span><@spring.message "label.listitem.delrequest" /> </a></h3>
                  <#else>         
                <h3 class="head3" <#if model["role"]=="vclOwner"> style="display:none;"  <#else> style="font-size: 14px;"  </#if> ><a href="index.html?login=0"><span><@spring.message "label.listitem.upgrade" /></span> <@spring.message "label.listitem.delrequest" /></a></h3>
                </#if>
                 <table class="table_1">
                 
                     <#list model["retrieveItems"] as retrieveItemList>
					  	<tr class="even row_4">
						<td class="width_1"><a href="itemdetail.html?id=${retrieveItemList.id}" style="text-decoration: underline;"><img src='${retrieveItemList.photos}' class="boxshadow" /></a><a href="itemdetail.html?id=${retrieveItemList.id}" class="shortHead"> ${retrieveItemList.description}</a></td>
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
                              <p style="color:#fff; padding: 16px 0; float: left;"><@spring.message "label.listitem.results" />: ${start} - ${end} <@spring.message "label.listitem.of" /> ${model["totalcount"]}  </p>
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
      <link rel="stylesheet" href="assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="assets/css/bootstrap.theme.min.css">
      <script src="assets/js/bootstrap.min.js"></script>
      <script src="assets/js/jquery.customSelect.js" type="text/javascript"></script>
      <script src="assets/js/jquery.droptabs.js"></script>
      <script src="assets/js/jquery-ui.js" type="text/javascript"></script>
  
<script type="text/javascript">



 $(function(){
	
	 AppUtil.shortHeadByLength(20);
	 
	 
	 $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
	 $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
	 $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
	 $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
	 
	 $(".droptabs").droptabs({
			development:true
		});
 $('select.styled').customSelect();
 $(".custom-select_3").each(function(){
            $(this).wrap("<span class='select-wrapper_3'></span>");
            $(this).after("<span class='holder'></span>");
        });
		$(".custom-select_4").each(function(){
            $(this).wrap("<span class='select-wrapper_4'></span>");
            $(this).after("<span class='holder'></span>");
        });
		$(".custom-select_2").each(function(){
            $(this).wrap("<span class='select-wrapper_2'></span>");
            $(this).after("<span class='holder'></span>");
        });
        $(".custom-select_3").change(function(){
            var selectedOption = $(this).find(":selected").text();
            $(this).next(".holder").text(selectedOption);
        }).trigger('change');
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

<style type="text/css">
	.ui-tabs-vertical { width:100%; height:210px; overflow:hidden; background: #fafafa; }
  .ui-tabs-vertical .ui-tabs-nav { float: left; width: 240px; }
  .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; height: 70px;/* border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0;*/ }
  .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
  .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; /*padding-right: .1em; border-right-width: 1px;*/ border:none; background:#fafafa; }
  .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 50em;}
</style>
	</@u.trucklayout> 