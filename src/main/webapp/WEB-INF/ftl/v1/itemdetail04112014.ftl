
<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>

<div class="">
  
      <div class="banner_left">
        	<div class="banner_right">
            	<div class="ser_banner_bg">
            		<div class="container">
                          
                          <div class="ser_banner">
                                 <div class="banner_sea">
                                    <h1>Search Deliveries</h1>
                                    <p><span>9,780</span> deliveries</p>
                                 </div>
                                 <div class="btn_banner_sea">
                           	        <p><span>Are you a transport company?</span><br /> You can quote on this work<br /> with no sign up or subscription fees.</p>
                                    <a href="#" class="btn_learn">Learn More</a>
                                 </div>
                          </div>
                                                             	
                    </div>                    
                </div>
            </div>
        </div>
 
	<div class="container">
	  
	  <div class="col-md-6">
	  <#list model["retrieveItem"] as retrieveItem>
	  <div class="col-md-6">
	  <h3>${retrieveItem.description}</h3>
	  
	  <label><h4>CollectionDetails:</h4></label><p>${retrieveItem.coladdress}</p></br>
	  
	   <label><h4>DeliveryDetails:</h4></label><p>${retrieveItem.deladdress}</p></br>
	   
	    <label><h4>Distance:</h4></label><p>${retrieveItem.millage} Miles</p></br>
	   
	   
	      <label><h4>Timescale:</h4></label><p>${retrieveItem.millage} hours</p></br>
	  </div>
	  
	   
	  
	  
	   <h1>Item Details :  </h1>
	   <label>User:</label><p>${retrieveItem.username}</p></br>
	   
	   </#list>
	    <#-- Furniture -->
	    <#if model["itemtype"] == "furniture">
	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	     <div class="col-md-6">
	     <label>Item Discription:</label><p>${retrieveItemDetailList.description}</p></br>
	   <label>Item Length:</label><p>${retrieveItemDetailList.length}</p></br>
	   <label>Item width:</label><p>${retrieveItemDetailList.width}</p></br>
	   <label>Item height:</label><p>${retrieveItemDetailList.height}</p></br>
	   <label>Item weigtht:</label><p>${retrieveItemDetailList.weight}</p></br>
	   </div></#list>
	  </#if>
	    <#-- General item -->
	    <#if model["itemtype"] == "general">
	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	     <div class="col-md-6">
	     <label>Item Discription:</label><p>${retrieveItemDetailList.description}</p></br>
	   <label>Item Length:</label><p>${retrieveItemDetailList.length}</p></br>
	   <label>Item width:</label><p>${retrieveItemDetailList.width}</p></br>
	   <label>Item height:</label><p>${retrieveItemDetailList.height}</p></br>
	   <label>Item weigtht:</label><p>${retrieveItemDetailList.weight}</p></br>
	   </div></#list>
	  </#if>
	  
	    <#-- Car item -->
	    <#if model["itemtype"] == "car">
	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	     <div class="col-md-6">
	    
	   <label>Car Make:</label><p>${retrieveItemDetailList.make}</p></br>
	   <label>Car Model:</label><p>${retrieveItemDetailList.model}</p></br>
	   <label>Mode Of Moving:</label><p>${retrieveItemDetailList.modeofmoving}</p></br>
	  
	   </div></#list>
	  </#if>
	  
	      <#-- Motorcycle item -->
	    <#if model["itemtype"] == "car">
	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	     <div class="col-md-6">
	    
	   <label>Car Make:</label><p>${retrieveItemDetailList.make}</p></br>
	   <label>Car Model:</label><p>${retrieveItemDetailList.model}</p></br>
	   <label>Mode Of Moving:</label><p>${retrieveItemDetailList.modeofmoving}</p></br>
	  
	   </div></#list>
	  </#if>
	  </div>
	  
	  <div class="col-md-6">
	  
	  <#list model["retrieveItem"] as retrieveItem>
	  <div class="col-md-12">
	   
	  <img src="${retrieveItem.map}" style="width:250px;height:200px"/>
	 </br></br>
	  </div>
	  </#list>
	 
	  <div class="col-md-12">
	    <#list model["retrieveItemsImages"] as retrieveItemsImage>
	  <img src="${retrieveItemsImage.imagename}" style="width:100px;height:100px" />
	  </#list>
	  </div>
	  
	
	  
	  </div>
	  
	 
	  
	
	</div>
	
	
	<div class="col-md-6">
	
	<table class="table table-bordered table-striped">
       <#list model["retrieveQuote"] as retrieveQuote>
        <tr>
        
           <td>£${retrieveQuote.amount}</td>
           <td>${retrieveQuote.email}</td>
            <td>
              <button type="button" class="btn" data-toggle="collapse" data-target="#collapse${retrieveQuote.id}">
                view Quote
              </button>
            </td>
        </tr>
        <tr id="collapse${retrieveQuote.id}" class="collapse out"><td colspan="3"><div><label>Vehicle :</label><h4>${retrieveQuote.vehicle}</h4><br>
        <label>TimeScale :</label><h4>${retrieveQuote.timescale}</h4><br>
        <label>Information :</label><h4>${retrieveQuote.information}</h4><br>
        </div></td></tr>
        
        </#list>
        
    </table>
	
	</div>
		<!-- /.table-responsive -->

	</div>
	
	<script type="text/javascript" src="assets/js/collapse.js"></script>

<!--

//-->
</script>
	<!-- /.panel-body -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="assets/css/bootstrap.theme.min.css">
	</@u.trucklayout> 