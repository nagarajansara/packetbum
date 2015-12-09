<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>
	
     
      <div class="banner_left">
        	<div class="banner_right">
            	<div class="ser_banner_bg">
            		<div class="container">
                          
                          <div class="ser_banner">
                               <!--   <div class="banner_sea">
                                    <h1>Get Quote</h1>
                                    <p><span>9,780</span> deliveries</p>
                                 </div>
                                 <div class="btn_banner_sea">
                           	        <p><span></span><br /> <br /> </p>
                                    <a href="#" class="btn_learn">Learn More</a>
                                 </div> -->
                          </div>
                                                             	
                    </div>                    
                </div>
            </div>
        </div>
        
        
        <!--Content-->
      <div class="container">
      	
      		<div class="ser_con">
            	<div class="ser_info" style="font-family: verdana;">
           	    	<img src="assets/img/<@spring.message 'label.getquote.information' />" width="116" height="15" />
                    <p><@spring.message 'label.getquote.infodesc' /></p>
                </div>
                
              <div class="ser_deli">
                	<div class="deli_details">
               	  		<img src="assets/img/<@spring.message 'label.getquote.productdetails' />" width="141" height="39" />
                      
                    </div>
                    
                    <div style="width: 416px;float: left;">
                    <div class="pro_type" style="font-family: verdana; font-weight: bold;">
                    	<div class="select_box" id="categorySelectBoxID">
                    		<p><@spring.message 'label.getquote.categery' />:</p>
                    		 <#if model["username"]??>
                            <select name="" id="categoryID" style="font-family: verdana; font-weight: bold; font-size: 12px;" class="custom-select">
                             <#--  <#list model["retrieveCategory"] as retrieveCategory>
                                      <option value="${retrieveCategory.id}"> ${retrieveCategory.name}  </option>
                                      
                                       </#list> -->
                            </select>
                            </#if>
                        </div>
                        
                        <div class="select_box">
                    		<!--<p> <@spring.message 'label.getquote.sub' /> :</p> -->
                           <!-- <select name=""  id="subcategoryID" class="subcategory">
                                              
                            </select>-->
                             <input type="hidden" value="" id="subCategory" name="subcategory" style="height:34px;"/>
                        </div>
                        
                 
                      <div class="chk_box" style="display:none;">
                       	<p>Is this an eBay item?</p>
                        <input type="checkbox" class="btn_chkbox" />
                            <p>Yes <a href="#">Import details</a></p>
                      </div>
                    </div>
                        </div>
                       <div style="float: right;
border-left: 1px solid #d9d9d9;
padding-top: 18px;
width: 242px;
padding: 17px 42px 39px 10px;
height: 77px;">
                       
                       <div id="categoryImage"  style="">
                       
                       &nbsp;
                       
                       </div>
                        &nbsp;
                        	</div>
                        	
                        	
                    
              </div>
              <form id="quoteFormID" enctype="multipart/form-data" >
              <div id="hideFormID" style="display:none;">
              
              <div class="item_details" >
               <img src="assets/img/<@spring.message 'label.getquote.itemdetails' />" width="108" height="14" />
               	 <h3 id="noItemAddedID"><@spring.message 'label.getquote.noitem' /></h3>               	 
               	 <div id="itemDetailID">
               	 
               	 
               	 </div>
               	  <p id="addAnotherID" ><a ><@spring.message 'label.getquote.addanother' /></a></p>
              </div>
              
              <div id="dynamicFormID" style="font-weight: bold; font-family: verdana;">
              
              	  
              	  
              	  
              	<!--  <h3 id="noCategoryID">No Category Selected</h3> -->
              	
              
              </div>
            
              <div class="collection_detail">
              	  
				  <div class="col_det" style="font-weight: bold; font-family: verdana;">
                  	<img src="assets/img/<@spring.message 'label.getquote.collectiondetails' />" width="160" height="14" />
                     <select id="colcountry" name="common.colcountry"   class="custom-select_2">
                     <option selected='selected'><@spring.message 'label.getquote.select' /></option>
                     <#if  RequestParameters['colcountry']??>  
                      <option Value="${RequestParameters['colcountry']}">${RequestParameters['colcountry']}</option>
                     </#if>
                      <#list model["retrieveCountry"] as retrieveCountry>
                    	<option value="${retrieveCountry.country_name}">${retrieveCountry.country_name}</option>           
                      </#list>     
                     </select>
                    
                    <div>
                     <input type="text"  placeholder="<@spring.message 'label.getquote.postalcode' />" name="common.colpostcode" id="colpostcodeID"   class="post_code" />
                    <input type="text"  placeholder="<@spring.message 'label.getquote.earliestpickup' />" id="colearlist" name="common.colearliestpickup" class="pickup"/>
                    <input type="text"  placeholder="<@spring.message 'label.getquote.latestpickup' />" id="collatest" name="common.collatestpickup" class="pickup"/>
                    </div>
                  </div>
                  <div class="del_det">
                  	<img src="assets/img/<@spring.message 'label.getquote.deliverydetails' />" width="142" height="17" />
            		 <select id="delcountry" name="common.delcountry"   class="custom-select_2">
            		 <#if  RequestParameters['delcountry']??>  
                     
                      <option Value="${RequestParameters['delcountry']}">${RequestParameters['delcountry']}</option>
                     </#if>
                   <#list model["retrieveCountry"] as retrieveCountry>
                    	<option value="${retrieveCountry.country_name}">${retrieveCountry.country_name}</option>           
                      </#list>                      
                     </select>
                    
                    <div>
                         <input type="text" name="common.delpostcode" id="delpostcodeID"  placeholder="<@spring.message 'label.getquote.postalcode' />" class="post_code"/>
                    <input type="text" name="common.delearlistpickup"  placeholder="<@spring.message 'label.getquote.earliestdelivery' />" id="delearlist" class="pickup"/>
                    <input type="text" name="common.dellatestpickup"  placeholder="<@spring.message 'label.getquote.latestdelivery' />" id="dellatest" class="pickup"/>
                    </div>
                  </div>
              </div>
                  <div>
                  
                  	<input type="button" class="btn_continue <@spring.message 'label.getquote.submit' />"  id="quoteSubmitID"/>
                  </div>
                   
                    
                    </div>
                  </form>
                  
              </div>
            
            </div>
      </div>
      <script src="assets/js/jquery-ui.js" type="text/javascript"></script>
      <script type="text/javascript">
      $(function(){
    	  
    	  
    	   <#if  model["defaultLanguage"]??&&model["defaultLanguage"]=='Slovenian'>
 AppUtil.loadDropdowns(AppUtil.getCategoryURL(),"categoryID","category","SL");
  <#else> 
 AppUtil.loadDropdowns(AppUtil.getCategoryURL(),"categoryID","category","EN");
  </#if>
    	 
    	  
    	  AppUtil.dropdownDesign();
    	  var SubID;
    	$("#colearlist").datepicker();
  		$("#collatest").datepicker()
  		$("#delearlist").datepicker();
  		$("#dellatest").datepicker();
        $("#colearlist").datepicker("option","dateFormat","dd-mm-yy");
  		$("#collatest").datepicker("option","dateFormat","dd-mm-yy")
  		$("#delearlist").datepicker("option","dateFormat","dd-mm-yy");
  		$("#dellatest").datepicker("option","dateFormat","dd-mm-yy");
    		
    	 
    	  
    	$("#addAnotherID").hide();
    	  
      
		$("#quoteSubmitID").click(function(){
			
			 var colcountryID = $("#colcountry").val();
			 var colpostcodeID = $("#colpostcodeID").val();
			 var delcountryID = $("#delcountry").val();
			 var delpostcodeID = $("#delpostcodeID").val();
			 
			 var subcategory=$("#subCategory").val();
			 console.log(colcountryID+colpostcodeID+delcountryID+delpostcodeID)
			 
			// var imageValue=$('itemNumImage_1').val();
			
			 if(colcountryID!=''&&colpostcodeID!=''&&delcountryID!=''&&delpostcodeID!=' '){
				 
			 
			 var counter = $("#numForms").val();
			
			//
			
			AppUtil.showAjaxLoader();
			var formName=$('#quoteFormID').attr('name');
					
			var actionURL=formName+".html";
				
			 
			 var oMyForm = new FormData();
			 
			 /* var files;
			 
			 files = document.getElementById('itemImageFile_1').files;
			  //oMyForm.append("",files);
			  
			  for (i = 0, j = files.length; i < j; i++) {
				//  oMyForm.append('item_1', files[i]);
			    } */
			 
			  if(counter>0){

				  var imageFile;
				  var value=$("#itemFileImage_1").val();

				  console.log("asdasd"+value)

				  if(typeof value !== "undefined") {
				      // obj is a valid variable, do something here.
				 

				 for(i=1;i<counter;i++){					 
					 console.log("counter"+counter);
					 console.log("i-"+i);
					// files = document.getElementById('itemImageFile_1').files;	 				  
				     
					  imageFile=document.getElementById('itemFileImage_'+i).files;
					  
					 // oMyForm.append("item_"+i+"_image_"+j,imageFile);
					 
					  for (j = 0;j<imageFile.length;j++) {
				            oMyForm.append('common.itemimage', imageFile[j]);
				            console.log("image_1"+":"+imageFile[j].name);
			               }
                      
					//  oMyForm.append("photosmultipart",imageFile);
					 
				 }
				  }
				 
			 }
			
    		  
    		  xhr = new XMLHttpRequest();
    		  
    			xhr.onreadystatechange = function() 
    			{ 
    				
    				
    				if(xhr.readyState === 4 && xhr.status === 200)
    				{
    					
    					//   $("#truckbody").html(xhr.responseText);
    					AppUtil.removeAjaxLoader();
    					 alert("Item added successfully");
    					window.location.href=AppUtil.getBaseURL()+"listitem.html";
    				}	
    			}
    		  
    		   var  url = actionURL+"?" +$("#quoteFormID").serialize();
    		 
    			xhr.open("POST", url, true);
    			xhr.send(oMyForm);
    			
			 }else{
				 
				 
				 alert("Enter all details and click Submit");
			 }
    			
			
			
			/* $.post(actionURL, $("#quoteFormID").serialize(), function(data) {
                console.log("data:" + data);
               // console.log("Body:" + $("#fencebody").innerHTML);
             
             }); */
			
		
		});
		var className="category1";
		
		$("#categoryID").change(function(){
			
			
			 SubID=$(this).val();
			 $("#itemDetailID").html("");			
			 $("#categoryImage").removeClass();
			 $("#categoryImage").addClass("category"+SubID)
			 $("#hideFormID").show();
			
			$(".subcategoryDropDown").empty();
			
			//$('#subcategoryID').find('option:empty');
			
			//AppUtil.loadDropdowns(AppUtil.getSubCategoryURL()+SubID,"subcategoryID","Subcategory");
			
			$("#noCategoryID").hide();
			
			var formURL=AppUtil.getFormURLByID(SubID);
			
			  if(SubID>0){
				$("#subcategoryID").parent().addClass('disable');
				$("#dynamicFormID").show();
								
			    $("#dynamicFormID").load(formURL,function(){
				
				$(".custom-select_1").each(function(){
		            $(this).wrap("<span class='select-wrapper_1'></span>");
		            $(this).after("<span class='holder'></span>");
		        });
				
				$(".custom-select_1").change(function(){
		            var selectedOption = $(this).find(":selected").text();
		            $(this).next(".holder").text(selectedOption);
		        }).trigger('change');
				AppUtil.removeAjaxLoader();
				
			});
			AppUtil.showAjaxLoader();
			
			var formName = formURL.split(".",1);
			
			console.log("formName-"+formName);
			
			$("#quoteFormID").attr("name",formName);
			
			
			
			}else{
				$("#dynamicFormID").hide();
				$("#subcategoryID").parent().removeClass('disable');
			}
			
			
			
			
		});
		
		$("#categoryID1").change(function(){
			
			
			var thisval=$(this).val();
			
			$("#subCategory").val(thisval);
         var formURL=AppUtil.getFormURLByID(SubID);
			
		   console.log("form id"+thisval);
				
					if(thisval>0)	{		
						
						$("#dynamicFormID").show();
			$("#dynamicFormID").load(formURL,function(){
				
				$(".custom-select_1").each(function(){
		            $(this).wrap("<span class='select-wrapper_1'></span>");
		            $(this).after("<span class='holder'></span>");
		        });
				
				$(".custom-select_1").change(function(){
		            var selectedOption = $(this).find(":selected").text();
		            $(this).next(".holder").text(selectedOption);
		        }).trigger('change');
				AppUtil.removeAjaxLoader();
				
			});
			AppUtil.showAjaxLoader();
			
			var formName = formURL.split(".",1);
			
			console.log("formName-"+formName);
			
			$("#quoteFormID").attr("name",formName);
			
			
					}
		
			
			
		});
		
		
    })
</script>
</@u.trucklayout> 