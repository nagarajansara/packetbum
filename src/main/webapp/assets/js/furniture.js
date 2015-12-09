


 function initExtraItem(){
	 
	 var count=$("#numForms").val();
	 var newFormDiv = $("#addForm");
	 
	// alert(count);
	 var extraitem='<div id="addItem_'+count+'"><div class="form-group">';
	 extraitem+= '<label for="description" class="col-sm-5 control-label">Describe briefly what you need to move</label> ';
	 extraitem+=  '<div class="col-sm-7"> ';
	 extraitem+=  '<input type="text" class="form-control" name="description_'+count+'" id="description_'+count+'" placeholder="description"> ';
	 extraitem+=   '</div> ';
	 extraitem+=  '</div> ';
	 extraitem+= '<div class="form-group"> ';
	 extraitem+= ' <label for="length" class="col-sm-5 control-label">Item '+count+' Length</label> ';
	 extraitem+= '<div class="col-sm-3"> ';
	 extraitem+= '<input type="text" class="form-control" name="length_'+count+'" id="length '+count+'" placeholder="Item Length "> ';
	 extraitem+=  '</div> ';
	 extraitem+= '  <div class="col-sm-2"> ';
	 extraitem+= '<select tabindex="-1" name="item_length_un_'+count+'" class="form-field-input-select formeleset" id="form_item_length_un_'+count+'"> ';
	 extraitem+=  ' <option selected="selected" value="cm">cm</option> ';
	 extraitem+= '  <option value="m">m</option> ';
	 extraitem+= '   <option value="ft">ft</option> ';
	 extraitem+= '  <option value="in">in</option> ';
	 extraitem+= ' </select> ';
	 extraitem+= ' </div> ';
	 extraitem+= '  </div> ';
	 extraitem+= '<div class="form-group"> ';
	 extraitem+= ' <label for="length" class="col-sm-5 control-label">Item '+count+' Width</label> ';
	 extraitem+='<div class="col-sm-3"> ';
	 extraitem+=' <input type="text" class="form-control" name="width_'+count+'" id="width_'+count+'" placeholder="Item Length "> ';
	 extraitem+='</div> ';
	 extraitem+='<div class="col-sm-2"> ';
	 extraitem+='<select tabindex="-1" name="item_length_un_'+count+'" class="form-field-input-select formeleset" id="form_item_length_un_'+count+'"> ';
	 extraitem+=' <option selected="selected" value="cm">cm</option> ';
	 extraitem+='  <option value="m">m</option> ';
	 extraitem+='   <option value="ft">ft</option> ';
	 extraitem+=' <option value="in">in</option> ';
	 extraitem+='</select> ';
	 extraitem+=' </div> ';
	 extraitem+='</div> ';
	 extraitem+='<div class="form-group"> ';
	 extraitem+='<label for="height" class="col-sm-5 control-label">Item  '+count+' Height </label> ';
	 extraitem+=' <div class="col-sm-3"> ';
	 extraitem+=' <input type="text" class="form-control" name="height_'+count+'" id="height_'+count+'" placeholder="Item Height  "> ';
	 extraitem+=' </div> ';
	 extraitem+=' <div class="col-sm-2"> ';
	 extraitem+='<select tabindex="-1" name="item_height_un_'+count+'" class="form-field-input-select formeleset" id="form_item_height_un_'+count+'"> ';
	 extraitem+='<option selected="selected" value="cm">cm</option> ';
	 extraitem+='  <option value="m">m</option> ';
	 extraitem+='<option value="ft">ft</option> ';
	 extraitem+='<option value="in">in</option> ';
	 extraitem+='</select> ';
	 extraitem+='</div> ';
	 extraitem+=' </div> ';
	 extraitem+='<div class="form-group"> ';
	 extraitem+='<label for="weight" class="col-sm-5 control-label">Item '+count+' Weight</label> ';
	 extraitem+=' <div class="col-sm-3"> ';
	 extraitem+='<input type="text" class="form-control" name="weight_'+count+'" id="weight_'+count+'" placeholder="Item Weight"> ';
	 extraitem+=' </div> ';
	 extraitem+='  <div class="col-sm-2"> ';
	 extraitem+='<select tabindex="-1" name="item_weight_un_'+count+'" class="form-field-input-select formeleset" id="form_item_weight_un_'+count+'"> ';
	 extraitem+='<option selected="selected" value="cm">cm</option> ';
	 extraitem+='<option value="m">m</option> ';
	 extraitem+=' <option value="ft">ft</option> ';
	 extraitem+='<option value="in">in</option> ';
	 extraitem+= '</select> ';
	 extraitem+='</div> ';
	 extraitem+= '<div id="addForm"><input type="button" id="addButton_'+count+'" value="Add Item"><input type="button" value="Remove Button" id="removeButton_'+count+'"></div> ';
	    
	 extraitem+= '</div> </div>';
	 
	
     
 	newFormDiv.append(extraitem);
  
 	//newFormDiv.appendTo("#TextBoxesGroup");
  
 	
 	$("#addButton_"+count).on("click", function(event) {
        
     	//alert("sadfadfdsf");
     	count++;
     	 $("#numForms").val(count);
  
 	//newFormDiv.appendTo("#TextBoxesGroup");     
     	initExtraItem();
 	
      });
      $("#removeButton_"+count).on("click", function(event) {
    	 // alert(count);
    	  var con=$("#numForms").val();
    	 // console.log("before delete"+con);
    	  if(con==2){
         	 $("#addButton").show();
         	 $( ".update-field" ).each(function( ) {
           		$( this ).html($(this).attr("data-update-original") );
           		});
          }
	        // alert(count);
         $("#addItem_" + con).remove();
         con--;
         $("#numForms").val(con);
         
        
  
      });

	     
	 
 }
 
 
$(function(){
	

	  var counter = $("#numForms").val();
	
	    $("#furnituresubmitbtn").click(function(){
		    
	    	var resean="";
	    	
	    	//var BASE_URL="http://54.68.37.228/truck/";
	    	
		    var description=$("#description").val();
		    
        	var length=$("#length").val();        	
        	var form_item_length_un=$("#form_item_length_un").val();
        	
        	
        	var height=$("#height").val();        	
        	var form_item_height_un=$("#form_item_height_un").val();
        	
        	var width=$("#width").val();        	
        	var form_item_width_un=$("#form_item_width_un").val();
        	
        	var weight=$("#weight").val();        	
        	var form_item_weight_un=$("#form_item_weight_un").val();
        	
        	var colcountry=$("#colcountry").val();
        	var colpostcode=$("#colpostcode").val();
        	
        	var delcountry=$("#delcountry").val();
        	var delpostcode=$("#delpostcode").val();
        	
        	resean +=appValidation.descriptionValidation(description);        	
        	
        	resean +=appValidation.lengthValidation(length);
        	
        	resean +=appValidation.heightValidation(height);
        
        	resean +=appValidation.widthValidation(width);
        	
        	resean +=appValidation.weightValidation(weight);
        	
        	
        	$("#fmessagesection").html(resean);
        	
        	console.log(resean);
        	
        	var link="qfurniture.html";
        	
        	if(resean==''){
        		
        		 var oMyForm = new FormData();
        		 
        		 var imagefile;
        		 
        		 imagefile =document.getElementById("photosmultipart").files[0];
        		  oMyForm.append("photosmultipart", imagefile);
        		  
        		  xhr = new XMLHttpRequest();
        		  
        			xhr.onreadystatechange = function() 
        			{ 
        				
        				
        				if(xhr.readyState === 4 && xhr.status === 200)
        				{
        					
        					//   $("#truckbody").html(xhr.responseText);
        					
        					window.location.href=BASE_URL+"pro/";
        				}	
        			}
        		  
        		   var  url = link+"?" +$("#furnitureform").serialize();
        		 
        			xhr.open("POST", url, true);
        			xhr.send(oMyForm);
        			
        			
        		  
        		/*$.post(link, $("#furnitureform").serialize()+'&photosmultipart='+imagefile, function(data) {
	                 console.log("data:" + data);
	                // console.log("Body:" + $("#fencebody").innerHTML);
	              
                  });*/
        		
        	}
        	
        	
        });
        
	  
      
        
        $("#addButton").click(function () {
             
        	     	//alert(counter);
        	$(this).hide();
        	$( ".update-field" ).each(function( ) {
         		$( this ).html($(this).attr("data-update1") );
         		});
        	
         	 $("#numForms").val(2);
         	 
        	initExtraItem();   
    	
    		
    	
    	
         });
    	
        
        
        

});