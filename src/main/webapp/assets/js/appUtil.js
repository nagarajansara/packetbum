/**
 * 
 */
//http://bytemindztech.com/truck/assets/img/ajax-loader.gif

var AppUtil=new appUtil();

var CONTEXT_PATH = "paketbum";

var LIVE_URL = "http://"+ location.host + "/" + CONTEXT_PATH;

var LOCAL_URL = "http://"+ location.host + "/" + CONTEXT_PATH;

var BASE_URL = LOCAL_URL;

BASE_URL = BASE_URL + "/";

var CATEGORY_URL = BASE_URL + "services/rest/truckservice/retrieveCategory";

var SUB_CATEGORY_URL = BASE_URL + "services/rest/truckservice/retrieveSubCategory/";

var READMSG = BASE_URL + "services/rest/truckservice/updateReadMsg/";

var WEB_SEVICES_URL=BASE_URL + "services/rest/truckservice/";

var FURNITURE_URL="furniture.html";

var GENERAL_ITEM_URL="generalitem.html";

var CARS_URL="cars.html";

var MOTORCYCLE_URL="motorcycle.html";

var CARS_URL="cars.html";

var VEHICLE_PART_URL="vechicleparts.html";

var MOVING_HOME_URL="movinghome.html";

var BOAT_URL="boats.html";

var HAULAGE_URL="haulage.html";

var FRAGILE_GOODS_URL="fragilegoods.html";

var LIVE_STOCKS_URL="livestocks.html";

var OTHERS_URL="others.html";


function appUtil(){
	
}

appUtil.prototype.getBaseURL=function(){
	return BASE_URL;
};
 
appUtil.prototype.getWebServiceURL=function(){
	return WEB_SEVICES_URL;
};


appUtil.prototype.showAjaxLoader=function(){
	$body = $("body");
	$body.addClass("loading");
};

appUtil.prototype.removeAjaxLoader=function(){
	$body = $("body");
	$body.removeClass("loading");
};

appUtil.prototype.getFurnitureURL=function(){
	return FURNITURE_URL;
};

appUtil.prototype.getGeneralItemURL=function(){
	return GENERAL_ITEM_URL;
};


appUtil.prototype.getCarsURL=function(){
	return CARS_URL;
};

appUtil.prototype.getMotorCycleURL=function(){
	return MOTORCYCLE_URL;
};


appUtil.prototype.getVechiclePartsURL=function(){
	return VEHICLE_PART_URL;
};

appUtil.prototype.getMovingHomeURL=function(){
	return MOVING_HOME_URL;
};

appUtil.prototype.getBoatURL=function(){
	return BOAT_URL;
};

appUtil.prototype.getHaulageURL=function(){
	return HAULAGE_URL;
};

appUtil.prototype.getFragileGoodsURL=function(){
	return FRAGILE_GOODS_URL;
};

appUtil.prototype.getLiveStockURL=function(){
	return LIVE_STOCKS_URL;
};

appUtil.prototype.getOthersURL=function(){
	return OTHERS_URL;
};

appUtil.prototype.getCategoryURL=function(){
	return CATEGORY_URL;
};

appUtil.prototype.getSubCategoryURL=function(){
	return SUB_CATEGORY_URL;
};

appUtil.prototype.getReadMsgURL=function(){
	return READMSG;
};

appUtil.prototype.getCategoryJSONObj=function(){
	
	var obj = jQuery.parseJSON(CATEGORY_URL);
	return obj;
};

appUtil.prototype.getSubCategoryJSONObj=function(id){
	
	var obj = jQuery.parseJSON(SUB_CATEGORY_URL+id);
	return obj;
};

appUtil.prototype.getFormURLByID=function(formId) {
	
	var URL="";
	
	if(formId==1){
		URL=AppUtil.getFurnitureURL();
	}else if(formId==2){
		URL=AppUtil.getGeneralItemURL();
	}else if(formId==3){
		URL=AppUtil.getCarsURL();
	}else if(formId==4){
		URL=AppUtil.getMotorCycleURL();
	}else if(formId==5){
		URL=AppUtil.getVechiclePartsURL();
	}else if(formId==6){
		URL=AppUtil.getMovingHomeURL();
	}else if(formId==7){
		URL=AppUtil.getBoatURL();
	}else if(formId==8){
		URL=AppUtil.getHaulageURL();
	}else if(formId==9){
		URL=AppUtil.getFragileGoodsURL();
	}else if(formId==10){
		URL=AppUtil.getLiveStockURL();
	}else if(formId==11){
		URL=AppUtil.getOthersURL();
	}
	
	
	return URL;
	
};

appUtil.prototype.addSelectOption=function(elementId, value,disable,SubCategoryValue) {
	//$("#" + elementId).prepend($("<option selected='selected'></option>").attr("value", value).text("Select"));
	$("#" + elementId).val(value);
	//$("#" + elementId).find('option:eq(0)').prop('selected', true);
	$("#" + elementId).attr("disabled",disable);
	$("#"+elementId).val("Select");
	
//	
	
	
	if(disable){
		$("#"+elementId).addClass("diable");
		//console.log("done");
	}/*else{
		$(".subcategory").next(".subcategoryDropDown").text(SubCategoryValue);
		
	}*/
	

};

appUtil.prototype.loadDropdowns=function(url, resultElementId, jsonElement,language) {
	$("#" + resultElementId).empty();
	var isDisable=true;
	var SubCategoryValue;
	$.get(url, function(data) {
		$.each( data[jsonElement], function( key, val ) {
			
			var salectCat="";
			if(language=="SL"){
				salectCat=val.nameSL
			}else{
				salectCat=val.name
			}
			
		    $("#" + resultElementId).append($("<option></option>").attr("value", val.id).text(salectCat));
		   // SubCategoryValue=val.name;
		    isDisable=false;
		  });
		
		//cbk.call();
		AppUtil.addSelectOption(resultElementId,0,isDisable,SubCategoryValue);
		
		
	});
};



appUtil.prototype.readImage=function(file,i,id,filename) {
   
	/*console.log("file"+file);
	console.log("i"+i);
	console.log("id"+id);*/
	 
    var reader = new FileReader();
    var image  = new Image();
    var subImageDiv="";
    reader.readAsDataURL(file);  
    reader.onload = function(_file) {
        image.src    = _file.target.result;              // url.createObjectURL(file);
        image.onload = function() {
            var w = this.width,
                h = this.height,
                t = file.type,                           // ext only: // file.type.split('/')[1],
                n = file.name,
                s = ~~(file.size/1024) +'KB';
            
            subImageDiv+="<input type='hidden' id='image_"+i+"' data-file='"+filename+"' value='"+image.src +"' /> </div>";  
            
           
            var html ="";
        		
        		html+="<li><span class='imageRemove' data-name='"+n+"'  onclick='imageRemove(this);'></span><img src='"+image.src+"' style='width:30px;height:30px'/></li>";
        		
        	//	 console.log("image name1:"+ imageSrc);
        	//	html+="<li><img src='"+imageSrc+"' style='width:30px;height:30px'/></li>";
        		
        	
        	
        	//html+="</ul>";
  		       
  		       $("#imageThumbnailulID").append(html);
  		       
  		    
         //   console.log("image name1:"+ image.src);
           // $('#uploadPreview').append('<img src="'+ this.src +'"> '+w+'x'+h+' '+s+' '+t+' '+n+'<br>');
        };
        image.onerror= function() {
          //  alert('Invalid file type: '+ file.type);
        };      
    };
   
    return subImageDiv;
    
    

};
appUtil.prototype.convertImgToBase64=function(url, callback, outputFormat){
	var canvas = document.createElement('CANVAS');
	var ctx = canvas.getContext('2d');
	var img = new Image;
	img.crossOrigin = 'Anonymous';
	img.onload = function(){
		canvas.height = img.height;
		canvas.width = img.width;
	  	ctx.drawImage(img,0,0);
	  	var dataURL = canvas.toDataURL(outputFormat || 'image/png');
	  	callback.call(this, dataURL);
        // Clean up
	  	canvas = null; 
	};
	img.src = url;
};
appUtil.prototype.dropdownDesign=function(){
	
	  $(".custom-select").each(function(){
          $(this).wrap("<span class='select-wrapper'></span>");
          $(this).after("<span class='holder'></span>");
      });
      
      $(".subcategory").each(function(){
          $(this).wrap("<span class='select-wrapper'></span>");
          $(this).after("<span class='subcategoryDropDown'></span>");
      });
      
		$(".custom-select_1").each(function(){
          $(this).wrap("<span class='select-wrapper_1'></span>");
          $(this).after("<span class='holder'></span>");
      });
		$(".custom-select_2").each(function(){
          $(this).wrap("<span class='select-wrapper_2'></span>");
          $(this).after("<span class='holder'></span>");
      });
      $(".custom-select").change(function(){
          var selectedOption = $(this).find(":selected").text();
          $(this).next(".holder").text(selectedOption);
      }).trigger('change');
      
      $(".subcategory").change(function(){
          var selectedOption = $(this).find(":selected").text();
          $(this).next(".subcategoryDropDown").text(selectedOption);
      }).trigger('change');
      
      
      
		$(".custom-select_1").change(function(){
          var selectedOption = $(this).find(":selected").text();
          $(this).next(".holder").text(selectedOption);
      }).trigger('change');
		$(".custom-select_2").change(function(){
          var selectedOption = $(this).find(":selected").text();
          $(this).next(".holder").text(selectedOption);
      }).trigger('change');
		
	
	
};
appUtil.prototype.trim=function(s)
{
  return s.replace(/^\s+|\s+$/, '');
};

appUtil.prototype.validateEmail=function(fld) {
    var error="";
    var tfld = trim(fld);                        // value of field with whitespace trimmed off
    var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
    var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;
   
    if (fld == "") {
       // fld.style.background = 'Yellow';
        error = "You didn't enter an email address.\n";
    } else if (!emailFilter.test(tfld)) {              //test email for illegal characters
       // fld.style.background = 'Yellow';
        error = "Please enter a valid email address.\n";
    } else if (fld.value.match(illegalChars)) {
       // fld.style.background = 'Yellow';
        error = "The email address contains illegal characters.\n";
    } else {
        fld.style.background = 'White';
    }
    return error;
};

 appUtil.prototype.validateEmpty=function(fld) {
    var error = "";
 
    if (fld.length == 0) {
       // fld.style.background = 'Yellow'; 
        error = "The required field has not been filled in.\n";
    } else {
        //fld.style.background = 'White';
    }
    
    return error;  
};

appUtil.prototype.shortHeadByLength=function(length){
	
	 $(".shortHead").each(function()
				{
			var val=$(this).html();
			
			
			if(val.length>20){
				val=val.substr(0,20);
				
				$(this).html(val+'.....');
			}else{
				$(this).html(val);
			}
			
				});
	
	
};