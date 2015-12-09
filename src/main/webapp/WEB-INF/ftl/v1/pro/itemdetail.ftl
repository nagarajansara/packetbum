
<#import "productownerlayout.ftl" as u>
<@u.productownerlayout>

<div class="panel-body">

 
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
	  
	   
	  
	   <div class="col-md-6">
	   <h1>Item Details :  </h1>
	   <label>User:</label><p>${retrieveItem.username}</p></br>
	   </#list>
	    <#list model["retrieveItemsDetail"] as retrieveItemDetailList>
	   <label>Item Length:</label><p>${retrieveItemDetailList.length}</p></br>
	   <label>Item width:</label><p>${retrieveItemDetailList.width}</p></br>
	   <label>Item height:</label><p>${retrieveItemDetailList.height}</p></br>
	   <label>Item weigtht:</label><p>${retrieveItemDetailList.weight}</p></br>
	   </div>
	  
	  </#list>
	  
	  
	  </div>
	  
	  <div class="col-md-6">
	  
	  <#list model["retrieveItem"] as retrieveItem>
	  <div class="col-md-12">
	   
	  <img src="${retrieveItem.map}" style="width:250px;height:200px"/>
	 </br></br>
	  </div>
	 
	  
	  <div class="col-md-12">
	   
	  <img src="${retrieveItem.photos}" style="width:250px;height:200px" />
	 
	  </div>
	   </#list>
	  
	  
	  </div>
	  
	 
	  
	
	</div>
		<!-- /.table-responsive -->

	</div>
	<!-- /.panel-body -->
	
	</@u.productownerlayout> 