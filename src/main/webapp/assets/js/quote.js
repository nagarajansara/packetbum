/**
 * 
 */




$(function(){
	
           var link="vclitemdetail.html";

        $("#quotebtn").click(function(){
		    
        	var amount,vehicle,timescale,information;
        	
        	
        	amount=$("#amount").val();
        	vehicle=$("#vehicle").val();
        	timescale=$("#timescale").val();
        	information=$("information").val();
        	
        	if(amount==''&&vehicle==''&&timescale==''&&information==''){
        		
        		alert("Enter all the value");
        	}else{
        	

            	$.post(link, $("#quoteform").serialize(), function(data) {
                    console.log("data:" + data);
                   // $("#truckbody").innerHTML=data;
                  //  $("#quoteform").reset();
                    alert("quote added successfully");
                 
                 });
        		
        	}
        	
        	
        });


});