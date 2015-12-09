              <div id="errorMessageSection"></div>
              
                <div class="dimension" >
              <div id="generalItemForm">
              
            <div class="txt_area">
       		  		<textarea placeholder="<@spring.message 'label.getquote.description' />" name="description" id="descriptionID"></textarea>
       		  		 <div>
                    	<p>Add Photos (Optional)</p> <a id="showimageID">showImage</a>
                        <input type="file" class="btn_photo <@spring.message 'label.getquote.photos' />" id="btn_photo" multiple>
                         <div id="imageInput"></div>
                        <br>
                        <img id="ajaxLoaderID" src="assets/img/ajax-loader.gif" style="display:none;"/>
                        <br>
                        <p id="imageUploadSuccessID" style="display:none;">Image Upload Successfully</p>
                    </div>
       		  		
                </div>
                
                
                <div class="scale_dim">
                	<div class="dim_size">
                    	<div class="volume">
                            <label><@spring.message 'label.getquote.size' /></label>
                            <input type="text"  name="length" id="lengthID" class="size" placeholder="<@spring.message 'label.getquote.L' />"/>
                            <label>X</label>
                            <input type="text"  name="width" id="widthID" class="size" placeholder="<@spring.message 'label.getquote.W' />"/>
                            <label>X</label>
                            <input type="text" name="height" id="heightID" class="size" placeholder="<@spring.message 'label.getquote.H' />" />
                        </div>
                    	<select name="dimension" class="custom-select_1" id="dimensionID">
                                    <option>cm</option>
                                    <option>mm</option>
                                    <option>in</option>
                                </select>    
                        
                    </div>
                    <div class="weight">
                    	
                        	
                        		<p><@spring.message 'label.getquote.weight' /></p>
                                <input type="text" id="weightID" class="size" style="float:left;padding-right:10px;" placeholder="W"/>
                                <select name="weigth_type" id="weight_typeID" class="custom-select_1">
                                    <option>kg</option>
                                    <option>mg</option>
                                    <option>ml</option>
                                </select>
                            
                            
                            
                            	<label>Quantity</label>
                                <input type="text" class="size" name="quantity" id="quantityID"  placeholder="1"/>
                               
                          
                        
                    </div>
                    
                    
                </div>
                <div class="btns">
                
                    <input type="button" id="btn_cancelID" class="btn_cancel <@spring.message 'label.getquote.cancel' />" />
                    <input type="button"  class="btn_done <@spring.message 'label.getquote.done' />" id="doneID"/>
                     <input type="button" id="btn-updateID" class="btn_up" value="update" style="display:none"/>
                    
                      <input type="hidden" value="1" id="numForms" name="numForms"/>
                </div>
              </div>
              <div  id="displayImage" style="display:none">
              
              
               </div>  
               
               </div>
              <script src="assets/js/jquery.customSelect.js" type="text/javascript"></script>
              <script>
              
              $(function(){
            	  
            	  $('select.styled').customSelect();
            	  var resean="";
        		  var counter = $("#numForms").val();
        		  var imageItemCount=$("#numForms").val();
        		  
        		  var editItem;
        		  
        		  var subImageDiv="<div id='itemImage_"+counter+"'></div>";
        		  $("#displayImage").append(subImageDiv);
        		  
        		  
        		  $("#btn_cancelID").click(function(){
        			  $(".dimension").hide();
        			  $("#descriptionID").val('');
                		$("#lengthID").val('');
                		$("#heightID").val(''); 
                		$("#widthID").val(''); 
                		$("#weightID").val(''); 
        			  
        		  });
            	  $("#addAnotherID").click(function(){
            		 
            		  
            		  $(".dimension").show();
            			$("#funnitureForm").show();
            			
            			$("#descriptionID").val('');
                  		$("#lengthID").val('');
                  		$("#heightID").val(''); 
                  		$("#widthID").val(''); 
                  		$("#weightID").val(''); 
            		  
            		  
            		  
            	  });
            	  
            	  
            	  
            	  
            	  
            	  $("#showimageID").click(function(){
            		  
            		//  alert("dsfsdf");
            		
            	//var imageLength=$("#itemImage_"+counter+" > img").length;
            	
            	var imageLength=$("#itemImage_"+counter+" > input").length;

            	//var imageSrc=$('#itemImage_1').children('#image_0').val();
            
            		
            	console.log("length"+imageLength);
            	
            	 var html ="<ul id='imageulID'>";
            	
            	for(i=1;i<=imageLength;i++){
            		
            		var imageSrc=$("#itemImage_"+counter).children('#image_'+i).val();
            		
            		html+="<li><img src='"+imageSrc+"' style='width:100px;height:50px'/></li>";
            		
            	}
            	
            	html+="</ul>";
            		 
            	  
            		  config = {
            					"body": html,
            					"title": 'photos',
            					"top":'50%'
            		           };
            				popUp = new PopUp(config);
            				popUp.render();
            	  
            	              	  
            	  });
            	 
            	
            	  
            	  $("#btn_photo").change(function(){
            		 
            		  var imageURL=this.files;
            		  $('#imageUploadSuccessID').hide();
            		  $('#ajaxLoaderID').show();
            		  
            		 // var filesSelected = document.getElementById("btn_photo").files;
            		  
            		  console.log("image:"+imageURL.length);
            		  var imageLengthCount=$("#itemImage_"+counter+" > input").length;
            		  
            		  var imageLength=$("#itemImage_"+imageItemCount+" > input").length;
            		  
            		     var j=1;
            		  //
            		  
            		  if(imageURL && imageURL[0]) for(var i=0; i<imageURL.length; i++) {
            			  
            			 // console.log("files length"+imageURL[i]);		  
            		     AppUtil.readImage(imageURL[i],j,"itemImage_"+imageItemCount);
            		  
            		    j++;
            		  }
            		  
            		  var filesSelected = document.getElementById("btn_photo").files;
            		  subImageDiv+="<input type='file' id='itemImageFile_"+imageItemCount+"' value='"+filesSelected+"'  /> ";  
            		              		  
            		   $("#itemImage_"+imageItemCount).append(subImageDiv);
            		  $('#ajaxLoaderID').hide();
            		    
            		  $('#imageUploadSuccessID').show();
            			
            		  
            		 /*  AppUtil.readImage(imageURL, function(base64Img){
            		        //$('.output').find('img').attr('src', base64Img);            		        
            		        var subImageDiv="<div id='itemImage_'"+counter+">";
                  		  
                  		  subImageDiv+="<input type='hidden' id='image_'"+counter+"value='"+base64Img+"' /> </div>";              		  
                  		  
                  		  $("#displayImage").append(subImageDiv);
            		        
            		    });
            		   */
            		  
            		  
            		  
            	  });
            	  
            	  
            	  $("#doneID").click(function(){
            		  
            		  
            		  
            		 // alert("formcount"+counter);
            		 
            		 
            		var description=$("#descriptionID").val();
          		    
                  	var length=$("#lengthID").val();                            	
                  	
                  	var height=$("#heightID").val();    	
                  
                  	
                  	var width=$("#widthID").val();    
                  	
                  	var dimension=$("#dimensionID").val();
                  	
                  	var weight=$("#weightID").val();     
                  	
                  	var weight_type=$("#weight_typeID").val();
                  	
                  	var Quantity=$("#quantityID").val();
                  	
                  	console.log(description+length+height+width+dimension+weight+weight_type+Quantity)
                  	                  	
                  	resean +=AppValidation.descriptionValidation(description);        	
                  	
                  	resean +=AppValidation.lengthValidation(length);
                  	
                  	resean +=AppValidation.heightValidation(height);
                  
                  	resean +=AppValidation.widthValidation(width);
                  	
                  	resean +=AppValidation.weightValidation(weight);            
                  	
                  	
                  	$("#errorMessageSection").html(resean);       
                  	
                  	console.log(resean);
                  	
                  	if(resean==''){
                  		
                  		$("#noItemAddedID").hide();
                  		
                  		var addItem="<div class='item_1' id='itemID_"+counter+"'>";
                  		
                  		var dymensionCal="<li>"+length+dimension+" X "+height+dimension+" X "+width+dimension+"</li><li>"+weight+weight_type+", Qty:"+Quantity+"</li>";
                  		
                  		addItem+="<h4>Items</h4>";
                  		addItem+="<div class='item_fur'>";
                  		addItem+="<ul><li>"+description+"</li><li>"+length+dimension+" X "+height+dimension+" X "+width+dimension+"</li><li>"+weight+weight_type+", Qty:"+Quantity+"</li></ul>";
                  		addItem+="<ul class='edit_del'><li><a  id='editItem_"+counter+"' data='"+counter+"' class='btn_edit'></a></li><li><a  class='btn_del'  data='"+counter+"' id='removeItem_"+counter+"'></a></li></ul>";                   		
                  		addItem+="</div></div>";               		
                  		
                  		
                  		
                  		$("#itemDetailID").append(addItem);
                  		
                  		 $("#addAnotherID").show();
                  		
                  		var formVal="";
                  		
                  		
                  
                  		    formVal="<input  type='hidden'  id='description_"+counter+"' name='description_"+counter+"' value='"+description+"'/>";
                  			formVal+="<input type='hidden' id='length_"+counter+"' name='length_"+counter+"' value='"+length+"'/>";
                  			formVal+="<input type='hidden' id='width"+counter+"' name='width_"+counter+"' value='"+width+"'/>";
                  			formVal+="<input type='hidden' id='height_"+counter+"' name='height_"+counter+"' value='"+height+"'/>";
                  			formVal+="<input type='hidden' id='dimension_"+counter+"' name='dimension_"+counter+"' value='"+dimension+"'/>";
                  			formVal+="<input type='hidden' id='weight_"+counter+"' name='weight_"+counter+"' value='"+weight+"'/>";
                  			formVal+="<input type='hidden' id='weight_type_"+counter+"' name='weight_type_"+counter+"' value='"+weight_type+"'/>";
                  			formVal+="<input type='hidden' id='quantity_"+counter+"' name='quantity_"+counter+"' value='"+Quantity+"'/>";
                  		
                  		
                  		$("#itemID_"+counter).append(formVal);
                  		
                  		
                  		$("#removeItem_"+counter).on("click",function(event){
                  			
                  			 var deleteitem=$(this).attr('data');
                  			console.log("hi"+deleteitem);
                  			$("#itemID_" + deleteitem).remove();
                  			$("#addAnotherID").hide();
                  			
                  		});
                  		
                  		
                  		$("#editItem_"+counter).on("click",function(event){
                  			
                 			 //$("#itemID_" + counter).remove();                 			 
                 			             			 
                  			$("#funnitureForm").show();
                  			editItem=$(this).attr('data');
                  			
                  		
                  			 
                  			console.log("edit Item:"+editItem);
                  			
                  			//var editDescription=;                  			
                  			$("#descriptionID").val($("#description_"+editItem).val());
                  			$("#lengthID").val($("#length_"+editItem).val());
                  			$("#heightID").val($("#height_"+editItem).val());
                  			$("#widthID").val($("#width_"+editItem).val());
                  			$("#weightID").val($("#weight_"+editItem).val());
                  			$("#weight_typeID").val($("#weight_type_"+editItem).val());
                  			$("#quantityID").val($("#quantity_"+editItem).val());
                  			
                  			
                  			$("#btn_cancelID").hide();
                  			$("#doneID").hide();
                  			$("#btn-updateID").show();
                  			
                  				$("#addAnotherID").hide();
                          
                  			 $('#itemID_'+editItem).remove();  
                  			 
                  		
                  			
                 		});
                  		
                  		
                  		$("#funnitureForm").hide();
                  		
                  		counter++;
                  		
                  		$("#numForms").val(counter);
                  		
                  		$("#descriptionID").val('');
                  		$("#lengthID").val('');
                  		$("#heightID").val(''); 
                  		$("#widthID").val(''); 
                  		$("#weightID").val(''); 
                  		
                  		imageItemCount++;
            		  
            		  var subImageDiv="<div id='itemImage_"+imageItemCount+"'></div>";
            		  $("#displayImage").append(subImageDiv);
            		  
            		  $(".dimension").hide();
                  		
                  	}
                  	
                  	
            	  
            	  
            	  });
            	  
            	  
            	  $("#btn-updateID").click(function(){
            			
            		  
            		  var description=$("#descriptionID").val();
            		    
                    	var length=$("#lengthID").val();                            	
                    	
                    	var height=$("#heightID").val();    	
                    
                    	
                    	var width=$("#widthID").val();    
                    	
                    	var dimension=$("#dimensionID").val();
                    	
                    	var weight=$("#weightID").val();     
                    	
                    	var weight_type=$("#weight_typeID").val();
                    	
                    	var Quantity=$("#quantityID").val();
                    	
            			console.log("edit Item 2:"+editItem);
            			
            			
                         var addItem="<div class='item_1' id='itemID_"+editItem+"'>";
                  		
                  		var dymensionCal="<li>"+length+dimension+" X "+height+dimension+" X "+width+dimension+"</li><li>"+weight+weight_type+", Qty:"+Quantity+"</li>";
                  		
                  		addItem+="<h4>Items</h4>";
                  		addItem+="<div class='item_fur'>";
                  		addItem+="<ul><li>"+description+"</li><li>"+length+dimension+" X "+height+dimension+" X "+width+dimension+"</li><li>"+weight+weight_type+", Qty:"+Quantity+"</li></ul>";
                  		addItem+="<ul class='edit_del'><li><a  id='editItem_"+editItem+"' data='"+editItem+"' class='btn_edit'></a></li><li><a href='#' class='btn_del' id='removeItem_"+editItem+"'></a></li></ul>";                   		
                  		addItem+="</div></div>";   
            		  
            		  /*  $("#description_"+editItem).val($("#descriptionID").val());
                		$("#length_"+editItem).val($("#lengthID").val());
                		$("#height_"+editItem).val($("#heightID").val()); 
                		$("#width_"+editItem).val($("#widthID").val()); 
                		$("#weight_"+editItem).val($("#weightID").val()); 
                		$("#dimension_"+editItem).val($("#dimensionID").val()); 
                		$("#weight_type_"+editItem).val($("#weight_typeID").val()); 
                		$("#quantity_"+editItem).val($("#quantityID").val()); */
                		
                		
                		$("#itemDetailID").append(addItem);
                  		
                 		 $("#addAnotherID").show();
                 		
                 		var formVal="";                		
                 		
                 		    formVal="<input  type='hidden'  id='description_"+editItem+"' name='description_"+editItem+"' value='"+description+"'/>";
                 			formVal+="<input type='hidden' id='length_"+editItem+"' name='length_"+editItem+"' value='"+length+"'/>";
                 			formVal+="<input type='hidden' id='width"+editItem+"' name='width_"+editItem+"' value='"+width+"'/>";
                 			formVal+="<input type='hidden' id='height_"+editItem+"' name='height_"+editItem+"' value='"+height+"'/>";
                 			formVal+="<input type='hidden' id='dimension_"+editItem+"' name='dimension_"+editItem+"' value='"+dimension+"'/>";
                 			formVal+="<input type='hidden' id='weight_"+editItem+"' name='weight_"+editItem+"' value='"+weight+"'/>";
                 			formVal+="<input type='hidden' id='weight_type_"+editItem+"' name='weight_type_"+editItem+"' value='"+weight_type+"'/>";
                 			formVal+="<input type='hidden' id='quantity_"+editItem+"' name='quantity_"+editItem+"' value='"+Quantity+"'/>";
                 		
                 		
                 		$("#itemID_"+editItem).append(formVal);
                 		
                 		$("#removeItem_"+editItem).on("click",function(event){
                  			
                 			 var deleteitem=$(this).attr('data');
                 			console.log("hi"+deleteitem);
                 			$("#itemID_" + deleteitem).remove();
                 			$("#addAnotherID").hide();
                 			
                 		});
                 		
                 		
                 		$("#editItem_"+editItem).on("click",function(event){
                 			
                			 //$("#itemID_" + counter).remove();                 			 
                			             			 
                 			$("#funnitureForm").show();
                 			editItem1=$(this).attr('data');
                 			
                 		
                 			 
                 			console.log("edit Item:"+editItem1);
                 			
                 			//var editDescription=;                  			
                 			$("#descriptionID").val($("#description_"+editItem1).val());
                 			$("#lengthID").val($("#length_"+editItem1).val());
                 			$("#heightID").val($("#height_"+editItem1).val());
                 			$("#widthID").val($("#width_"+editItem1).val());
                 			$("#weightID").val($("#weight_"+editItem1).val());
                 			$("#weight_typeID").val($("#weight_type_"+editItem1).val());
                 			$("#quantityID").val($("#quantity_"+editItem1).val());
                 			
                 			
                 			$("#btn_cancelID").hide();
                 			$("#doneID").hide();
                 			$("#btn-updateID").show();
                 			
                 				$("#addAnotherID").hide();
                         
                 			 $('#itemID_'+editItem).remove();  
                 			
                		});
                		
            			$("#btn_cancelID").show();
            			$("#doneID").show();
            			
            			$("#btn-updateID").hide();
            			
            			$("#funnitureForm").hide();
            			$("#addAnotherID").show();
            		
            		});
            	  
            	  
            	  
            	  
              });
              
              
              
              
              </script>
          
            