


      <div id="errorMessageSection"></div>
              
                <div class="dimension" >
              <div id="movingHomeForm">
              
            <div class="txt_area">
       		  		<textarea placeholder="<@spring.message 'label.getquote.description' />" name="description" id="descriptionID"></textarea>
       		  		 <div>
                    <!-- 	<p>Add Photos (Optional)</p> <a id="showimageID">showImage</a>
                        <input type="file" class="btn_photo" id="btn_photo" multiple> -->
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
                            <p style="float:left;"><@spring.message "label.getquote.typeof.boat" /></p>
                               <select name="timepass" id="typeofboatID" class="custom-select_1" >
                                    <option value="sail">sail</option>
                                    <option value="power">power</option>
                                    <option value="other">other</option>
                                </select>  
                                
                       
                                
                                
                                         
                        </div>
                    	            <div id="ImageThumnail" style="width:250px;float:right;">
                          <ul id='imageThumbnailulID'></ul>
                          </div>
                    </div>
                    <div class="weight">
                    	
                        	
                        <p style="float:left;"><@spring.message "label.getquote.typeof.Keel" /></p>
                            
                        		  <select name="boat_keel" class="typeOfKeel custom-select_1"  id="typeofkeelID" style="float:left;padding-right:10px;margin-right: 22px;">
                                  <option value="Fin">Fin</option>
                                  <option value="Bilge">Bilge</option>
                                  <option value="Displacement">Displacement</option>
                                  <option value="Planing">Planing</option>
                                  <option value="Other">Other</option>
                                  </select>
                            
                             <label style="float:left;padding-right:10px;"><@spring.message "label.getquote.Is.boat.already.trailer" /></label><input type="text" name="ontrailer" id="ontrailerID" style="width:50px;height: 20px;" />
                            
                            	
                          
                        
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
              	  <script src="assets/js/boatInit.js" type="text/javascript"></script>
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
          
            
             
    
              