   <div id="errorMessageSection"></div>
              
                <div class="dimension" id="carform">
              	<div class="txt_area">
       		  		<textarea placeholder="<@spring.message 'label.getquote.description' />" id="descriptionID" name="description" ></textarea>
       		  		<div>
                    	<!-- <p>Add Photos (Optional)</p> <a id="showimageID">showImage</a> -->
                       <input type="button"  class="btn_photo <@spring.message 'label.getquote.photos' />" id="btn_browse" >
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
                    		
                    		 <label><@spring.message 'label.getquote.motorcyclemake' /></label>
                                 <input type="text" class="carmake" id="carmakeID" name="make" style="height:23px;margin-bottom:7px;"/> 
                                 <br>
                                   <label><@spring.message 'label.getquote.motorcyclemodel' /></label>
                        		   <input type="text" class="carmodel" id="carmodelID" name="model" style="height:23px;margin-bottom:7px;" />
                        		   <br> 
                          
                            
                        </div>
                      <div id="ImageThumnail" style="width:250px;float:right;">
                          <ul id='imageThumbnailulID'></ul>
                          </div>
                        
                    </div>
                    <div class="weight">
                    	                
                                           <p><@spring.message 'label.getquote.motordesc' /></p>                        		                                
                                           <input type="radio" name="modeofmoving" checked value="nopreference" class="nopreference" />
                                           <label style=""><@spring.message 'label.getquote.nopreference' /></label>
                                           <input type="radio" name="modeofmoving" value="driven" class="driven" />
                                           <label style=""><@spring.message 'label.getquote.driven' /></label>
                                           <input type="radio" name="modeofmoving" value="transported" class="transported" />
                                           <label style=""><@spring.message 'label.getquote.transported' /></label>
                            
                            	
                        
                    </div>
                    
                    
                </div>
                <div class="btns">
                
                    <input type="button" id="btn_cancelID" class="btn_cancel <@spring.message 'label.getquote.cancel' />" />
                    <input type="button"   class="btn_done <@spring.message 'label.getquote.done' />" id="doneID"/>
                     <input type="button" id="btn-updateID" class="btn_up" value="update" style="display:none"/>
                    
                      <input type="hidden" value="1" id="numForms" name="numForms"/>
                        <input type="hidden" value="" id="dateteImageName" name="common.deleteImageName"/>
                </div>
              </div>
                <script src="assets/js/motorcycleInit.js" type="text/javascript"></script>
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
          
          
          