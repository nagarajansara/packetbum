<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>
	<script>
	
	
	
	
	</script>
        <div class="banner_left">
        	<div class="banner_right">
            	<div class="ser_banner_bg inner">
            		<div class="container">
                          
                          <div class="ser_banner">
                                 <div class="banner_sea">
                                    <h1>ForgotPassword</h1>
                                   
                                 </div>
                                 <div class="btn_banner_sea">
                           	        <p><span>Are you a transport company?</span><br /> You can quote on this work<br /> with no sign up or subscription fees.</p>
                                    <a href="#" class="btn_learn">Learn More</a>
                                 </div>
                          </div>
                                                             	
                    </div>                    
                </div>
            </div>
        </div>
      <div class="container">
   

        	<div class="form">
                    <div class="panel-heading">
                        
                             	<#if model["messagetype"]?? && (model["messagetype"] == "Success")>
<div class="alert alert-success">

	<strong>Success: </strong>${model["message"]}
	
</div>
<#elseif model["messagetype"]?? && ((model["messagetype"]) == "Failed")>
<div class="alert alert-danger">
	
	<strong>Failed: </strong>${model["message"]}
</div>
</#if>
                    </div>
                    <div class="panel-body">
                        <form role="form"  action="forgotpassword.html" method="post" id="forgotpassword" name="forgotpassword">
                            <fieldset>
                               
                                <div class="form-group">
                                    <input class="form-control" placeholder="UserName" id="email" name="email" type="email" autofocus="">
                                </div>
                                  <!-- Change this to a button or input when using this as a form -->
                               
                            </fieldset>
                            <div class="" style="margin-top: 29px;">  <a id="forgotpasswordbtn" class="combtn" href="javascript:;">Submit</a></div>
                        </form>
                     </div>
                   </div>
               
    </div><!--End Content container-->
     <script >
     $(function(){
    		


         $("#forgotpasswordbtn").click(function(){
 		    
 		   
         	var email=$("#email").val();
         	
         	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

         	var isValidEmail = re.test(email);
         	
         	
         	
         	
         	
         	if(isValidEmail){
         		
         		
         			
         			
         			 var link="forgotpassword.html";     				
    				  
 				  	   /*  $.post(link, $("#forgotpassword").serialize(), function(data) {
 		                 console.log("data:" + data);
 		                // console.log("Body:" + $("#fencebody").innerHTML);
 		                 $("#truckbody").html(data);
 	                   });
         			 */
 				  	//$("#forgotpassword").submit();
 				  	document.getElementById("forgotpassword").submit();
         		
         		
         	}else{
         		alert("Enter Valid EMail id");
         		$("#email").focus();
         	}
         	
         	//alert(email+password+conpassword);
         	
         	
         	
         });


 });
     
     
     
     
     </script>
   </@u.trucklayout> 