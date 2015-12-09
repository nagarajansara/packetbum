	<#include "message-section.ftl">
   
      <div class="col-sm-6">
       <form class="form-horizontal" role="form" id="furnitureform" enctype="multipart/form" name="furnitureform">
  <div class="form-group">
    <label for="description" class="col-sm-5 control-label">Describe briefly what you need to move</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="description" name="description" placeholder="description">
    </div>
  </div>
  <div class="form-group">
    <label for="length" class="col-sm-5 control-label update-field" data-update-original="Item Length" data-update1="Item 1 Length">Item Length</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="length" name="length" placeholder="Item Length ">
    </div>
     <div class="col-sm-2">
     <select tabindex="-1" name="item_length_un" class="form-field-input-select formeleset" id="form_item_length_un">
                <option selected="selected" value="cm">cm</option>
                <option value="m">m</option>
                <option value="ft">ft</option>
                <option value="in">in</option>
            </select>
    </div>
  </div>
 
 <div class="form-group">
    <label for="length" class="col-sm-5 control-label update-field"  data-update-original="Item Width" data-update1="Item 1 Width">Item Width</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="width" name="width" placeholder="Item Length ">
    </div>
     <div class="col-sm-2">
     <select tabindex="-1" name="item_width_un" class="form-field-input-select formeleset" id="form_item_length_un">
                <option selected="selected" value="cm">cm</option>
                <option value="m">m</option>
                <option value="ft">ft</option>
                <option value="in">in</option>
            </select>
    </div>
  </div>
  
  
  <div class="form-group">
    <label for="height" class="col-sm-5 control-label update-field" data-update-original="Item Height" data-update1="Item 1 Height">Item Height </label>
    <div class="col-sm-3">
      <input type="text" class="form-control" id="height" name="height" placeholder="Item Height  ">
    </div>
     <div class="col-sm-2">
     <select tabindex="-1" name="item_height_un" class="form-field-input-select formeleset" id="form_item_height_un">
                <option selected="selected" value="cm">cm</option>
                <option value="m">m</option>
                <option value="ft">ft</option>
                <option value="in">in</option>
            </select>
    </div>
  </div>
  <div class="form-group">
    <label for="weight" class="col-sm-5 control-label update-field" data-update-original="Item Weight" data-update1="Item 1 Weight">Item Weight</label>
    <div class="col-sm-3">
      <input type="text" class="form-control" name="weight" id="weight" placeholder="Item Weight">
    </div>
     <div class="col-sm-2">
     <select tabindex="-1" name="item_weight_un" class="form-field-input-select formeleset" id="form_item_weight_un">
                <option value="g">g</option>
                <option selected="selected" value="kg">kg</option>
                <option value="lbs">lbs</option>
                <option value="oz">oz</option>
            </select>
    </div>
    <input type="hidden" value="1" id="numForms" name="numForms"/>
    
    <div id="addForm" ><input type="button" id="addButton" value="Add Item"></div>
    
  </div>
  <div id="addextraitem"></div>
  
  
 <div class="form-group">
    <label for="photo" class="col-sm-5 control-label">Photos</label>
    <div class="col-sm-7">
      <input type="file" class="form-control" id="photosmultipart" class="photosmultipart" name="photosmultipart" />
      
    </div>
  </div>
  <h3>Collection Details</h3>
  <div class="form-group">
    <label for="length" class="col-sm-5 control-label">Country</label>
    <div class="col-sm-7">
      <select id="colcountry" name="colcountry">
      <option Value="India">India</option>
       <option Value="England">England</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="postcode" class="col-sm-5 control-label">Post Code</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="colpostcode" name="colpostcode" placeholder="Post Code/Cityname">
    </div>
  </div>
   <h3>Delivery Details</h3>
  <div class="form-group">
    <label for="length" class="col-sm-5 control-label">Country</label>
    <div class="col-sm-7">
      <select id="delcountry" name="delcountry">
      <option Value="India">India</option>
       <option Value="England">England</option>
      </select>
    </div>
  </div>
  <div class="form-group">
    <label for="postcode" class="col-sm-5 control-label">Post Code</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" id="delpostcode" name="delpostcode" placeholder="Post Code/Cityname">
    </div>
  </div>
  
   
  <h3>Where should we email the quotes?</h3>
 
   <div class="form-group">
    <label for="postcode" class="col-sm-5 control-label">Email Address</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" name="email" id="email" placeholder="email">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-default btn-success" id="furnituresubmitbtn">Submit&start get Quotes</button>
    </div>
  </div>
</form>
        
   </div>
   
   
   <script src="assets/js/furniture.js"></script> 
   