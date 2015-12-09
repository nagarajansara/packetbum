$(function(){
            	 
	
	  $('select.styled').customSelect();
	  var resean="";
	  var counter = $("#numForms").val();
	  var imageItemCount=$("#numForms").val();
	  
	  var editItem;
	  
	  
	  var subImageDiv="<div id='itemImage_"+counter+"'></div>";
	  $("#displayImage").append(subImageDiv);
	  
	 
	  var counterImage =counter;
	  
	  
	
        		  
        		  var subImageDiv="<div id='itemImage_"+counter+"'></div>";
        		  $("#displayImage").append(subImageDiv);
        		  
        		  
        		  $("#btn_cancelID").click(function(){
        			  $(".dimension").hide();
        			  $("#descriptionID").val('');
                		$("#carmakeID").val('');
                		$("#carmodelID").val(''); 
                		
        			  
        		  });
            	  $("#addAnotherID").click(function(){
            		 
            		  
            		  $(".dimension").show();
            			$("#carform").show();
            			
            			$("#descriptionID").val('');
                		$("#carmakeID").val('');
                		$("#carmodelID").val('');
            		  
            		  
            		  
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
            	 
            	
            	 /* 
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
            			
            		  
            		   AppUtil.readImage(imageURL, function(base64Img){
            		        //$('.output').find('img').attr('src', base64Img);            		        
            		        var subImageDiv="<div id='itemImage_'"+counter+">";
                  		  
                  		  subImageDiv+="<input type='hidden' id='image_'"+counter+"value='"+base64Img+"' /> </div>";              		  
                  		  
                  		  $("#displayImage").append(subImageDiv);
            		        
            		    });
            		   
            		  
            		  
            		  
            	  });*/
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
                  		    
                  		
                  			
                  	
                  		       counterImage++;  
                  		       
                  		                 		       
                  		       
                  		       
                  		    }); 
                  		
        			    
        			
                    	
                    	
                  		  if(change==0){
                  			$("itemFileImage_"+counterImage).remove();
                  		  }
                  		  
                  		  
                  	  });
            	  
            	  $("#doneID").click(function(){
            		  
            		  
            		  
            		 // alert("formcount"+counter);
            		 
            		 
            		var description=$("#descriptionID").val();
          		    
                  	var carmake=$("#carmakeID").val();                            	
                  	
                  	var carmodel=$("#carmodelID").val();    	
                   
                  	var modeofmoving=$("input[name=modeofmoving]:checked").val();
                  	
                
                  	
                  	console.log(description+carmake+carmodel+modeofmoving)
                  	      
                  	if(carmake==''&&carmodel==''){
                  		resean +="Please Enter Car Make& Model";
                  	}
                  	resean +=AppValidation.descriptionValidation(description);        	
                  	
                            
                  	
                  	
                  	$("#errorMessageSection").html(resean);       
                  	
                  	console.log(resean);
                  	
                  	if(resean==''){
                  		
                  		$("#noItemAddedID").hide();
                  		
                  		var addItem="<div class='item_1' id='itemID_"+counter+"'>";
                  		
                  	
                  		addItem+="<h4>Items"+counter+"</h4>";
                  		addItem+="<div class='item_fur'>";
                  		addItem+="<ul><li>"+description+"</li><li>"+carmake+"</li><li>"+carmodel+"</li></ul>";
                  		addItem+="<ul class='edit_del'><li><a  id='editItem_"+counter+"' data='"+counter+"' class='btn_edit'></a></li><li><a  class='btn_del'  data='"+counter+"' id='removeItem_"+counter+"'></a></li></ul>";                   		
                  		addItem+="</div></div>";               		
                  		
                  		
                  		
                  		$("#itemDetailID").append(addItem);
                  		
                  		 $("#addAnotherID").show();
                  		
                  		var formVal="";
                  		
                  		                 
                  		    formVal="<input  type='hidden'  id='description_"+counter+"' name='description_"+counter+"' value='"+description+"'/>";
                  			formVal+="<input type='hidden' id='make_"+counter+"' name='make_"+counter+"' value='"+carmake+"'/>";
                  			formVal+="<input type='hidden' id='model_"+counter+"' name='model_"+counter+"' value='"+carmodel+"'/>";
                  			formVal+="<input type='hidden' id='modeofmoving_"+counter+"' name='modeofmoving_"+counter+"' value='"+modeofmoving+"'/>";
                  			
                  		
                  		$("#itemID_"+counter).append(formVal);
                  		
                  		
                  		$("#removeItem_"+counter).on("click",function(event){
                  			
                  			 var deleteitem=$(this).attr('data');
                  			console.log("hi"+deleteitem);
                  			$("#itemID_" + deleteitem).remove();
                  			$("#addAnotherID").hide();
                  			
                  		});
                  		
                  		
                  		$("#editItem_"+counter).on("click",function(event){
                  			
                 			 //$("#itemID_" + counter).remove();                 			 
                 			             			 
                  			$("#carform").show();
                  			editItem=$(this).attr('data');
                  			                 			
                  			 
                  			console.log("edit Item:"+editItem);
                  			
                  			//var editDescription=;                  			
                  			$("#descriptionID").val($("#description_"+editItem).val());
                  			$("#carmakeID").val($("#make_"+editItem).val());
                  			$("#carmodelID").val($("#model_"+editItem).val());
                  			var preSelect = $("#modeofmoving_"+editItem).val();
                  			
                  			$('input[name=modeofmoving][value=' + preSelect + ']').prop('checked',true)
                  			
                  			
                  			
                  			$("#btn_cancelID").hide();
                  			$("#doneID").hide();
                  			$("#btn-updateID").show();
                  			
                  				$("#addAnotherID").hide();
                          
                  			 $('#itemID_'+editItem).remove();  
                  			 
                  		
                  			
                 		});
                  		
                  		
                  		$("#carform").hide();
                  		
                  		counter++;
                  		
                  		$("#numForms").val(counter);
                  		
                  		$("#descriptionID").val('');
                  		$("#carmakeID").val('');
                  		$("#carmodelID").val(''); 
                  		
                  		
                  		imageItemCount++;
            		  
            		  var subImageDiv="<div id='itemImage_"+imageItemCount+"'></div>";
            		  $("#displayImage").append(subImageDiv);
            		  
            		  $(".dimension").hide();
                  		
                  	}
                  	
                  	
            	  
            	  
            	  });
            	  
            	  
            	  $("#btn-updateID").click(function(){
            			
            		  
            		  var description=$("#descriptionID").val();
            		    
                    	var carmake=$("#carmakeID").val();                            	
                    	
                    	var carmodel=$("#carmodelID").val();    	
                    
                    	var modeofmoving=$("input[name=modeofmoving]:checked").val();
                    	
                    	
            			console.log("edit Item 2:"+editItem);
            			
            			
                         var addItem="<div class='item_1' id='itemID_"+editItem+"'>";
                  		
                         addItem+="<h4>Items "+editItem+"</h4>";
                   		addItem+="<div class='item_fur'>";
                   		addItem+="<ul><li>"+description+"</li><li>"+carmake+"</li><li>"+carmodel+"</li></ul>";
                   		addItem+="<ul class='edit_del'><li><a  id='editItem_"+editItem+"' data='"+editItem+"' class='btn_edit'></a></li><li><a  class='btn_del'  data='"+editItem+"' id='removeItem_"+editItem+"'></a></li></ul>";                   		
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
                 		    
                 		  		 formVal+="<input type='hidden' id='make_"+editItem+"' name='make_"+editItem+"' value='"+carmake+"'/>";
                         			formVal+="<input type='hidden' id='model_"+editItem+"' name='model_"+editItem+"' value='"+carmodel+"'/>";
                         			formVal+="<input type='hidden' id='modeofmoving_"+editItem+"' name='modeofmoving_"+editItem+"' value='"+modeofmoving+"'/>";
                         			
                         			
                        			console.log("formVal:"+formVal);
                        			
                 			
                 		
                 		
                 		$("#itemID_"+editItem).append(formVal);
                 		
                 		$("#removeItem_"+editItem).on("click",function(event){
                  			
                 			 var deleteitem=$(this).attr('data');
                 			console.log("hi"+deleteitem);
                 			$("#itemID_" + deleteitem).remove();
                 			$("#addAnotherID").hide();
                 			
                 		});
                 		
                 		
                 		$("#editItem_"+editItem).on("click",function(event){
                 			
                			 //$("#itemID_" + counter).remove();                 			 
                			             			 
                 			$("#carform").show();
                 			editItem1=$(this).attr('data');
                 			
                 		
                 			 
                 			console.log("edit Item:"+editItem1);
                 			
                 			//var editDescription=;                  			
                 				$("#descriptionID").val($("#description_"+editItem).val());
                  			$("#carmakeID").val($("#make_"+editItem).val());
                  			$("#carmodelID").val($("#model_"+editItem).val());
                  			var preSelect = $("#modeofmoving_"+editItem).val();
                  			
                  			$('input[name=modeofmoving][value=' + preSelect + ']').prop('checked',true)
                  			
                  			
                 			
                 			
                 			$("#btn_cancelID").hide();
                 			$("#doneID").hide();
                 			$("#btn-updateID").show();
                 			
                 				$("#addAnotherID").hide();
                         
                 			 $('#itemID_'+editItem).remove();  
                 			
                		});
                		
            			$("#btn_cancelID").show();
            			$("#doneID").show();
            			
            			$("#btn-updateID").hide();
            			
            			$("#carform").hide();
            			$("#addAnotherID").show();
            		
            		});
            	  
            	  
            	  
            	  
              });
              
              