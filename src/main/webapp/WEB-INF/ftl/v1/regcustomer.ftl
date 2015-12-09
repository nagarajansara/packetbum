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
                                    <h1><@spring.message "label.vclhome.user" /> <@spring.message "label.regcustomer.form" /></h1>
                                   
                                 </div>
                                 <div class="btn_banner_sea">
                           	         <p><span><@spring.message "label.transporter.areyoutransporter" />,</span><br /> <@spring.message "label.transporter.areyoutransporter1" /><br /><!--<@spring.message "label.transporter.areyoutransporter2" />--> </p>
                                    <a href="#" style="margin: 5px 0 0 285px !important;" class="<@spring.message "label.transporter.btnlearn" />">Learn More</a>
                                 </div>
                          </div>
                                                             	
                    </div>                    
                </div>
            </div>
        </div>
      <div class="container">
        	<#if model["messagetype"]?? && (model["messagetype"] == "Success")>
<div class="alert alert-success">

	<strong>Success: </strong>${model["message"]}
	<script>
$(function(){
	
	$( "#loginID" ).trigger( "click" );

	
});
</script>
</div>
<#elseif model["messagetype"]?? && ((model["messagetype"]) == "Failed")>
<div class="alert alert-danger">
	
	<strong>Failed: </strong>${model["message"]}
</div>
</#if>

        	<div class="form">
            	 <h1 class="h1head">Paketbum <@spring.message "label.modal.signup" /> <!--<@spring.message "label.transporter.information" />--></h1>
                <p>(<span class="formStar">*</span> <@spring.message "label.transporter.require" />)</p>
            	<form name="regcustomer" id="regcustomer" action="regcustomer.html" method="post" onsubmit="return validate();">
                	<p>
                    	<label><span class="formStar">*</span><@spring.message "label.prohome.email" /> <@spring.message "label.transporter.address" /> :</label>
                        <input type="text" name="email" id="email" />
                    </p>
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.prohome.username" /> :</label>
                        <input type="text" name="shortname" id="shortname" />
                    </p>
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.prohome.password" /> :</label>
                        <input type="password"  name="password" id="password"/>
                    </p>
                  <p>
                    	<label><span class="formStar">*</span><@spring.message "label.prohome.changepassword" /> :</label>
                        <input type="password" name="confirmpassword" id="confirmpassword"  />
                    </p>
                                      
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.transporter.mobile" /> :</label>
                        <input type="text" name="mobile" id="mobile"  />
                    </p>
                   
                    
                    <p class="btnValue">
                    
                    	<button class="<@spring.message "label.transporter.btnsignup" />" id="signupID" value="" style="border:none;"></button>
                    </p>
                    
                    
                </form>
            </div>
        </div><!--End Content container-->
        
        <script >
      function validate(){
        		
        	var re = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        		
        	var email,shortname,password,confirmpassword,mobile;
        	
        	email=$("#email").val();
        	shortname=$("#shortname").val();
        	password=$("#password").val();
        	confirmpassword=$("#confirmpassword").val();
        	mobile=$("#mobile").val();
        	
        	

        	var isValidEmail = re.test(email);
        	
        	
      
        //	isValidEmail=true;
        	
        	if(isValidEmail){
        		if(shortname!=''){
        			
        		
        		if (password == confirmpassword) {
        			
        			if(mobile!=''){
        				
        			
        				
        			return true;
	
        				
        				
        			}else{
        				alert("Enter Mobile Number ");
                		$("#mobile").focus();
                		return false;
        			}
        			
        		}else{
        			alert("Enter Valid Password ");
            		$("#password").focus();
            		return false;
        		}
        		}else{
        			alert("Enter Username");
        			$("#shortname").focus();
        			return false;
        		}
        	}else{
        		alert("Enter Valid Email id");
        		$("#email").focus();
        		return false;
        	}	
        		
        		
        		
        		
        		
        		
        		
        	}
        
        
        
        
        
        </script>
        
        
</@u.trucklayout> 