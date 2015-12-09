      <div id="errorMessageSection"></div>
              
                <div class="dimension" >
              <div id="funnitureForm">
              
            <div class="txt_area">
                    
       		  		<textarea placeholder="<@spring.message 'label.getquote.description' />" name="vechicledescription" id="descriptionID"></textarea>
       		  		 <div>
                    <!-- 	<p>Add Photos (Optional)</p> <a id="showimageID">showImage</a> -->
                       <input type="button" class="btn_photo <@spring.message 'label.getquote.photos' />" id="btn_browse" >
                        <div id="imageInput"></div>
                        <br>
                        <img id="ajaxLoaderID" src="assets/img/ajax-loader.gif" style="display:none;"/>
                        <br>
                      <!--   <p id="imageUploadSuccessID" style="display:none;">Image Upload Successfully</p> -->
                    </div>
       		  		
                </div>
                
                
                <div class="scale_dim">
                	<div class="dim_size">
                    	<div class="volume">
                            <label><@spring.message 'label.getquote.size' /></label>
                            <input type="text"   id="lengthID" class="size" placeholder="<@spring.message 'label.getquote.L' />"/>
                            <label>X</label>
                            <input type="text"   id="widthID" class="size" placeholder="<@spring.message 'label.getquote.W' />"/>
                            <label>X</label>
                            <input type="text"  id="heightID" class="size" placeholder="<@spring.message 'label.getquote.H' />" />
                        </div>
                    	<select  class="custom-select_1" id="dimensionID">
                                    <option>cm</option>
                                    <option>mm</option>
                                    <option>in</option>
                                </select>    
                                
                                 <div id="ImageThumnail" style="width:250px;float:right;">
                          <ul id='imageThumbnailulID'></ul>
                          </div>
                        
                    </div>
                    <div class="weight">
                    	
                        	   <div style="display:inline-block;">
                        		<p><@spring.message 'label.getquote.weight' /></p>
                                <input type="text" id="weightID" class="size" style="float:left;padding-right:10px;margin-right: 22px;" placeholder="W"/>
                                <select  id="weight_typeID" class="custom-select_1">
                                    <option>kg</option>
                                    <option>mg</option>
                                    <option>ml</option>
                                </select>
                                </div>
                            
                            
                               <div style="display:inline-block;">
                            	<label style="float:left;padding-right:10px;" ><@spring.message "label.vechicleparts.packed" /></label>
                            	  <select  id="ontrailerID" class="custom-select_1">
                                    <option><@spring.message "label.vechicleparts.yes" /></option>
                                    <option><@spring.message "label.vechicleparts.no" /></option>                                   
                                </select>
                                </div>
                                
                               
                          
                        
                    </div>
                    
                    
                </div>
                <div class="btns">
                
                    <input type="button" id="btn_cancelID" class="btn_cancel <@spring.message 'label.getquote.cancel' />" />
                    <input type="button"  class="btn_done <@spring.message 'label.getquote.done' />" id="doneID"/>
                     <input type="button" id="btn-updateID" class="btn_up" value="update" style="display:none"/>
                    
                      <input type="hidden" value="1" id="numForms" name="numForms"/>
                         <input type="hidden" value="" id="dateteImageName" name="common.deleteImageName"/>
                </div>
              </div>
              <div  id="displayImage" style="display:none">
              
              
               </div>  
               
               </div>
               <script>
              
              var dateteImageName=[];
              
              function imageRemove(val){
            	  
            	  console.log("callbck");
            	  
                
        			  
            		  var name=$(val).attr('data-name');
            		  
            		$(val).parent().hide();
            		  
            		  console.log("name"+name);
            		  
            		  dateteImageName.push(name)
            		  
            		  console.log(dateteImageName);
            		  
            		  $("#dateteImageName").val(dateteImageName);
            		  
            		  
            	  
            	}
              </script>
               <script>
               
               $(function(){
             	  
             	  $('select.styled').customSelect();
             	  var resean="";
         		  var counter = $("#numForms").val();
         		  var imageItemCount=$("#numForms").val();
         		  
         		  var editItem;
         		  
         		  var subImageDiv="<div id='itemImage_"+counter+"'></div>";
         		  $("#displayImage").append(subImageDiv);
         		  
         		  var counterImage =counter;
         		  
         		  
         		
         		  
         		  
         		  $("#btn_browse").click(function(){
         			
                         
         			  
         			  var inputFile="<input type='file' id='itemFileImage_"+counterImage+"' style='display:none;' multiple/>";
         			   
         			  var change=0;
         			  
         			  console.log("value:"+inputFile);
         			  
         			
         			    $("#imageInput").append(inputFile);
         			   
         			    $("#itemFileImage_"+counterImage).click();
         			    
         			    $("#itemFileImage_"+counterImage).change(function(){
                    		 
         			    	change++;
         			    	
                   		  var imageURL=this.files;
                   		  
                   		  console.log("imageURL"+imageURL);
                   		  $('#imageUploadSuccessID').hide();
                   		  $('#ajaxLoaderID').show();
                   		  
                   		 // var filesSelected = document.getElementById("btn_photo").files;
                   		  
                   		  console.log("image:"+imageURL.length);
                   		  var imageLengthCount=$("#itemImage_"+counter+" > input").length;
                   		  
                   		// console.log("imageLengthCount:"+imageLengthCount);
                   		  var imageLength=$("#itemImage_"+counter+" > input").length;
                   		 console.log("imageLength:"+imageLength);
                   		     var j=1;
                   		  //
                   		  
                   		   var imageLengthCount1=$("#itemImage_"+counter+" > input").length;
                   		  
                   		  if(imageURL && imageURL[0]) for(var i=0; i<imageURL.length; i++) {
                   			  
                   			  
                   			var filename = imageURL[i].name;
             			 	
            			 	// console.log("files name1"+filename);
                           var lastIndex = filename.lastIndexOf("\\");
                          if (lastIndex >= 0) {
                          filename = filename.substring(lastIndex + 1);
                           }
                         
                  		  
                   		 console.log("imageLengthCount:"+imageLengthCount1);
                        //  console.log("files name2"+filename);
            		           AppUtil.readImage(imageURL[i],imageLengthCount1,"itemImage_"+imageItemCount,filename);
            		  
                   			 // console.log("files length"+imageURL[i]);		  
                   		   //  AppUtil.readImage(imageURL[i],j,"itemImage_"+imageItemCount);
                   		  if(imageURL.length>1){
                   			imageLengthCount1++;
                   		  }
                   		    j++;
                   		  }
                   		  
                   		  
                   		 var inputNumImage="<input type='hidden' id='itemNumImage_"+counterImage+"' name='itemNumImage_"+counterImage+"' value='"+imageURL.length+"'/>";
           			     $("#imageInput").append(inputNumImage);
                   		  
                   	
                   		  $('#ajaxLoaderID').hide();
                   		    
                   		  $('#imageUploadSuccessID').show();
                   			
                   	
                   		       counterImage++;  
                   		       
                   		                 		       
                   		       
                   		       
                   		    }); 
                   		
         			    
         			
                     	
                     	
                   		  if(change==0){
                   			$("itemFileImage_"+counterImage).remove();
                   		  }
                   		  
                   		  
                   	  });
         			  
         		
         		  
         		  
         		  
         		  $("#btn_cancelID").click(function(){
         			  $(".dimension").hide();
         			  $("#categorySelectBoxID").find('span.holder').html("Select");
         			  $('#categoryID option:contains("0")').prop('selected', true);
         			  $(".holder").val('select')
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
             	
             	console.log("counter"+counter);
             	
             	
             	var imageLength=$("#itemImage_"+counter+" > input").length;

             	//var imageSrc=$('#itemImage_1').children('#image_0').val();
             
             		
             	console.log("length"+imageLength);
             	
             	 var html ="<ul id='imageulID'>";
             	
             	for(i=0;i<imageLength;i++){
             		
             		var imageSrc=$("#itemImage_"+counter).children('#image_'+i).val();
             		
             		html+="<li><img src='"+imageSrc+"' style='width:110px;height:100px'/></li>";
             		
             	}
             	
             	html+="</ul>";
             		 
             	  
             		  config = {
             					"body": html,
             					"title": '<strong>Item Images</strong>',
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
             		  
             		  console.log("imageURL"+imageURL);
             		  var imageLengthCount=$("#itemImage_"+counter+" > input").length;
             		  
             		  console.log("imageLengthCount:"+imageLengthCount);
             		  var imageLength=$("#itemImage_"+imageItemCount+" > input").length;
             		  console.log("imageLengthCount:"+imageLengthCount);
             		     var j=1;
             		  //
             		  
             		  if(imageURL && imageURL[0]) for(var i=0; i<imageURL.length; i++) {
             			  
             			 // console.log("files length"+imageURL[i]);		 
             			 
             			 	var filename = imageURL[i].name;
             			 	
             			 	 console.log("files name1"+filename);
                            var lastIndex = filename.lastIndexOf("\\");
                           if (lastIndex >= 0) {
                           filename = filename.substring(lastIndex + 1);
                            }
                           console.log("files name2"+filename);
                           
                       
             		     AppUtil.readImage(imageURL[i],j,"itemImage_"+imageItemCount,filename);
             		  
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
                   	
                   	var ontrailer=$("#ontrailerID").val();
                   	
                   	console.log(description+length+height+width+dimension+weight+weight_type+ontrailer)
                   	                  	
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
                   		
                   		var dymensionCal="<li>"+length+dimension+" X "+height+dimension+" X "+width+dimension+"</li><li>"+weight+weight_type+", Ontrailer:"+ontrailer+"</li>";
                   		
                   		addItem+="<h4>Item "+counter+"</h4>";
                   		addItem+="<div class='item_fur'>";
                   		addItem+="<ul><li>"+description+"</li><li>"+length+dimension+" X "+height+dimension+" X "+width+dimension+"</li><li>"+weight+weight_type+", Ontrailer:"+ontrailer+"</li></ul>";
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
                   			formVal+="<input type='hidden' id='ontrailer_"+counter+"' name='ontrailer_"+counter+"' value='"+ontrailer+"'/>";
                   		
                   		
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
                   			$(".dimension").show();
                   			editItem=$(this).attr('data');
                   			
                   		
                   			 
                   			console.log("edit Item:"+editItem);
                   			
                   			//var editDescription=;                  			
                   			$("#descriptionID").val($("#description_"+editItem).val());
                   			$("#lengthID").val($("#length_"+editItem).val());
                   			$("#heightID").val($("#height_"+editItem).val());
                   			$("#widthID").val($("#width_"+editItem).val());
                   			$("#weightID").val($("#weight_"+editItem).val());
                   			$("#weight_typeID").val($("#weight_type_"+editItem).val());
                   			$("#ontrailerID").val($("#ontrailer_"+editItem).val());
                   			
                   			
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
                   		$("#ontrailerID").val('');
                   		imageItemCount++;
             		  
             		  var subImageDiv="<div id='itemImage_"+imageItemCount+"'></div>";
             		  $("#displayImage").append(subImageDiv);
             		  
             		  $(".dimension").hide();
                   		
                   	}
                   	
                   	
             	  
             	  
             	  });
             	  
             	  
             	  $("#btn-updateID").click(function(){
             			
             			$(".dimension").hide();  
             		  var description=$("#descriptionID").val();
             		    
                     	var length=$("#lengthID").val();                            	
                     	
                     	var height=$("#heightID").val();    	
                     
                     	
                     	var width=$("#widthID").val();    
                     	
                     	var dimension=$("#dimensionID").val();
                     	
                     	var weight=$("#weightID").val();     
                     	
                     	var weight_type=$("#weight_typeID").val();
                     	
                     	var ontrailer=$("#ontrailerID").val();
                     	
             			console.log("edit Item 2:"+editItem);
             			
             			
                          var addItem="<div class='item_1' id='itemID_"+editItem+"'>";
                   		
                   		var dymensionCal="<li>"+length+dimension+" X "+height+dimension+" X "+width+dimension+"</li><li>"+weight+weight_type+", Ontrailer:"+ontrailer+"</li>";
                   		
                   		addItem+="<h4>Items"+editItem+"</h4>";
                   		addItem+="<div class='item_fur'>";
                   		addItem+="<ul><li>"+description+"</li><li>"+length+dimension+" X "+height+dimension+" X "+width+dimension+"</li><li>"+weight+weight_type+", Ontrailer:"+ontrailer+"</li></ul>";
                   		addItem+="<ul class='edit_del'><li><a  id='editItem_"+editItem+"' data='"+editItem+"' class='btn_edit'></a></li><li><a href='#' class='btn_del' data='"+editItem+"' id='removeItem_"+editItem+"'></a></li></ul>";                   		
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
                  			formVal+="<input type='hidden' id='ontrailer_"+editItem+"' name='ontrailer_"+editItem+"' value='"+ontrailer+"'/>";
                  		
                  		
                  		$("#itemID_"+editItem).append(formVal);
                  		
                  		$("#removeItem_"+editItem).on("click",function(event){
                   			
                  			 var deleteitem=$(this).attr('data');
                  			console.log("hi"+deleteitem);
                  			$("#itemID_" + deleteitem).remove();
                  			$("#addAnotherID").hide();
                  			
                  		});
                  		
                  		
                  		$("#editItem_"+editItem).on("click",function(event){
                  			
                 			 //$("#itemID_" + counter).remove();                 			 
                 			  	$(".dimension").show();           			 
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
                  			$("#ontrailerID").val($("#ontrailer_"+editItem1).val());
                  			
                  			
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