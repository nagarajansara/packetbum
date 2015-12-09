                      <div class="dimension">
              	<div class="txt_area">
       		  		<textarea placeholder="<@spring.message 'label.getquote.description' />" name="description" id="descriptionID"></textarea>
       		  		
                    <div>
                    	<!-- <p>Add Photos (Optional)</p>
                        <input type="file" class="btn_photo" id="btn_photo">
                        <a href="#" class="btn_images">VIEW IMAGES</a> -->
                          <input type="button" class="btn_photo <@spring.message 'label.getquote.photos' />" id="btn_browse" >
                        <div id="imageInput"></div>
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
                            <input type="text"  name="height" id="heightID" class="size" placeholder="<@spring.message 'label.getquote.H' />" />
                        </div>
                    	<select name="dimension" class="custom-select_1" id="dimensionID">
                                    <option>cm</option>
                                    <option>mm</option>
                                    <option>in</option>
                                </select>    
                                
                                 <div id="ImageThumnail" style="width:250px;float:right;">
                          <ul id='imageThumbnailulID'></ul>
                          </div>
                       
                    </div>
                    <div class="weight">
                    	
                        	
                        		<p><@spring.message 'label.getquote.weight' /></p>
                        		   <input type="text" class="weight"  id="weightID" style="width:50px;float:left;padding-right:10px;margin-right: 22px;" />
                                <select name="weigth_type" id="weight_typeID" class="custom-select_1">
                                    <option>kg</option>
                                    <option>mg</option>
                                    <option>ml</option>
                                </select>
                            
                            	<label><@spring.message 'label.getquote.No' /></label>
                                <input type="text" name="quantity" id="quantityID"  placeholder="0" style="width:50px;"/>
                               
                            
                        
                       
                    </div>
                     <div class="weight">
                    	
                        	<br>
                        		<p><@spring.message 'label.getquote.pets.breed' /></p>
                        		<input type="text" id="breedID" style="width:150px;float: left;height: 25px; margin-right: 15px;"/>
                        		 
                                                                                
                    </div>
                      <div class="btns">
                
                    <input type="button" id="btn_cancelID" class="btn_cancel <@spring.message 'label.getquote.cancel' />" />
                    <input type="button"  class="btn_done <@spring.message 'label.getquote.done' />" id="doneID"/>
                     <input type="button" id="btn-updateID" class="btn_up" value="update" style="display:none"/>
                    
                      <input type="hidden" value="1" id="numForms" name="numForms"/>
                       <input type="hidden" value="" id="deleteImageName" name="common.deleteImageName"/>
                </div>
              </div>
              <div  id="displayImage" style="display:none">
              
              
               </div>  
               
               </div>
              <script src="assets/js/jquery.customSelect.js" type="text/javascript"></script>
                <script src="assets/js/livestockInit.js" type="text/javascript"></script>
              <script>
              
              var deleteImageName=[];
              
              function imageRemove(val){
            	  
            	  console.log("callbck");
            	  
                
        			  
            		  var name=$(val).attr('data-name');
            		  
            		$(val).parent().hide();
            		  
            		  console.log("name"+name);
            		  
            		  deleteImageName.push(name)
            		  
            		//  console.log(dateteImageName);
            		  
            		  $("#deleteImageName").val(deleteImageName);
            		  
            		  
            	  
            	}
              </script>
          
            