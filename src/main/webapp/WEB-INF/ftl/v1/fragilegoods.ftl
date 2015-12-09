


      <div id="errorMessageSection"></div>
              
                <div class="dimension" >
              <div id="movingHomeForm">
              
            <div class="txt_area">
                           <p style=""><@spring.message 'label.getquote.description' /></p>
                                          
                                
       		  		<textarea placeholder="<@spring.message 'label.getquote.description' />" name="description" id="descriptionID"></textarea>
       		  		 <div>
                    	<!-- <p>Add Photos (Optional)</p> <a id="showimageID">showImage</a>
                        <input type="file" class="btn_photo" id="btn_photo" multiple> -->
                         <input type="button" class="btn_photo <@spring.message 'label.getquote.photos' />" id="btn_browse" >
                        <div id="imageInput"></div>
                        <br>
                        <img id="ajaxLoaderID" src="assets/img/ajax-loader.gif" style="display:none;"/>
                        <br>
                       <!--  <p id="imageUploadSuccessID" style="display:none;">Image Upload Successfully</p> -->
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
                                
                                 <div id="ImageThumnail" style="width:250px;float:right;">
                          <ul id='imageThumbnailulID'></ul>
                          </div>
                        
                    </div>
                    <div class="weight">
                    	
                        	
                        		<p><@spring.message 'label.getquote.weight' /></p>
                                <input type="text" id="weightID" style="float:left;padding-right:10px;margin-right: 22px;" class="size" placeholder="<@spring.message 'label.getquote.W' />"/>
                                <select name="weigth_type" id="weight_typeID" class="custom-select_1">
                                    <option>kg</option>
                                    <option>mg</option>
                                    <option>ml</option>
                                </select>
                            
                    </div>
                    
                    
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
              	 <script src="assets/js/fragileInit.js" type="text/javascript"></script>
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
          
            