/**
 * 
 */




$(function(){
	


        $("#signupbtn").click(function(){
		    
		    var user=$("#username").val();
        	var email=$("#email").val();
        	var password=$("#password").val();
        	var conpassword=$("#conpassword").val();
        	var re = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

        	var isValidEmail = re.test(email);
        	
        	
        	
        	
        	
        	if(isValidEmail){
        		
        		if (password == conpassword) {
        			
        			
        			 var link="signup.html";     				
   				  
				  	    $.post(link, $("#tpsignupform").serialize(), function(data) {
		                 console.log("data:" + data);
		                // console.log("Body:" + $("#fencebody").innerHTML);
		                 $("#truckbody").html(data);
	                   });
        			
        			
        		}else{
        			alert("Enter Valid Password ");
            		$("#password").focus();
        		}
        		
        	}else{
        		alert("Enter Valid EMail id");
        		$("#email").focus();
        	}
        	
        	//alert(email+password+conpassword);
        	
        	
        	
        });


});