


      <div id="errorMessageSection"></div>
              
                <div class="dimension" >
              <div id="movingHomeForm">
              
            <div class="txt_area">
                           <p style=""><@spring.message 'label.getquote.description' /> <@spring.message 'label.getquote.ofcargo' /></p>
                                          
                                
       		  		<textarea placeholder="<@spring.message 'label.getquote.description' />" name="description" id="descriptionID"></textarea>
       		  		 <div>
                    	<!-- <p>Add Photos (Optional)</p> <a id="showimageID">showImage</a>
                        <input type="file" class="btn_photo" id="btn_photo" multiple> -->
                          <input type="button" class="btn_photo <@spring.message 'label.getquote.photos' />" id="btn_browse" >
                        <div id="imageInput"></div>
                        
                        <br>
                        <img id="ajaxLoaderID" src="assets/img/ajax-loader.gif" style="display:none;"/>
                        <br>
                    <!--     <p id="imageUploadSuccessID" style="display:none;">Image Upload Successfully</p> -->
                    </div>
       		  		
                </div>
                
                
                <div class="scale_dim">
                	<div class="">
                    	 <p style="float:left;"><@spring.message 'label.getquote.hwitwrk' /> <@spring.message 'label.getquote.description' /></p><br>
                            <textarea placeholder="<@spring.message 'label.getquote.description' />" name="packagedescription" id="packagedescriptionID" style="border: 1px solid #d9d9d9;border-radius: 5px;width:540px; padding: 10px; resize: none;"></textarea>  
                          
                                 <div id="ImageThumnail" style="width:250px;float:right;">
                          <ul id='imageThumbnailulID'></ul>
                          </div>       
                        
                    </div>
                    <div class="weight">
                    	<br>
                          <p style="float:left;"><@spring.message 'label.getquote.dimensions' /></p><br>
                                 <textarea placeholder="<@spring.message 'label.getquote.description' />" name="relevantdimension" id="relevantdimensionID"  style="border: 1px solid #d9d9d9;border-radius: 5px;width:540px;padding: 10px; resize: none;"></textarea> 
                    </div>
                     <div class="weight" >
                    	
                        	<br>
                        		<p><@spring.message 'label.getquote.totalweight' /> <@spring.message 'label.getquote.optional' /></p>
                        		<input type="text" id="weightID" style="width:50px;float: left;height: 25px; margin-right: 15px;"/>
                        		   <select  name="weigth_type" id="weight_typeID" class="custom-select_1">
                                    <option>kg</option>
                                    <option>lbs</option>
                                     <option>oz</option>
                                    
                                   </select> 
                                                                                
                    </div>
                    
                </div>`
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
              	  <script src="assets/js/haulageInit.js" type="text/javascript"></script>
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
          
            
          
            