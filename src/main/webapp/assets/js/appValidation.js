/**
 * 
 */


var AppValidation=new appValidation();


var desceiptionerror="*Enter Description value </br>";
var lengtherror="*Enter Correct Length filed Value </br>";
var heighterror="*Enter Correct Height filed Value </br>";
var widtherror="*Enter Correct Width filed Value </br>";
var weighterror="*Enter Correct weight filed Value </br>";

function appValidation(){
	
}




appValidation.prototype.descriptionValidation=function (description){
	
	 if(description ==''){
		 return desceiptionerror;
	 }else{
		 return "";
	 }
	
};

appValidation.prototype.lengthValidation=function(length){
	if(AppValidation.numberValidation(length)){
		return "";
	}else{
		return lengtherror;
	}
};

appValidation.prototype.heightValidation=function (height){
	if(AppValidation.numberValidation(height)){
		return "";
	}else{
		return heighterror;
	}
};

appValidation.prototype.widthValidation=function(width){
	if(AppValidation.numberValidation(width)){
		return "";
	}else{
		return widtherror;
	}
};

appValidation.prototype.weightValidation=function(weight){
	if(AppValidation.numberValidation(weight)){
		return "";
	}else{
		return weighterror;
	}
};


appValidation.prototype.numberValidation=function(value){
	  var error = true;
	    var stripped =value.replace(/[\(\)\.\-\ ]/g, '');    

	   if (value == "") {
	        error = false;
	      
	    } else if (isNaN(parseInt(stripped))) {
	    	  error = false;
	    }
	    return error;
};
