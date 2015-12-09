<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>
	
      <div class="banner_left">
        	<div class="banner_right">
            	<div class="ser_banner_bg inner">
            		<div class="container">
                          
                          <div class="ser_banner">
                                 <div class="banner_sea">
                                    <h1><!--<@spring.message "label.transporter.transporterform" />--><@spring.message "label.regtransporter.carrier" /></h1>
                                   
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
	
	
</div>
<#elseif model["messagetype"]?? && ((model["messagetype"]) == "Failed")>
<div class="alert alert-danger">

	<strong>Failed: </strong>${model["message"]}
</div>
</#if>
        	<div class="form">
            	 <h1 class="h1head">Paketbum <@spring.message "label.regtransporter.registration" /> <@spring.message "label.regtransporter.carrier" /></h1>
                <p>(<span class="formStar">*</span><@spring.message "label.transporter.require" />)</p>
            	<form name="regtransporter" id="regtransporter" action="regtransporter.html" method="post" onsubmit="return validateTransporter();">
                	<p>
                    	<label><span class="formStar">*</span><@spring.message "label.prohome.email" /> <@spring.message "label.transporter.address" /> :</label>
                        <input type="text" name="email" id="email" />
                    </p>
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.prohome.username" />:</label>
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
                   <h2 style="margin:20px auto; padding: 20px 0; border-top: solid 1px #eee;"><img src="<@spring.message "img.regtransporter.personalinfo.URL" />" width="113" height="15" /></h2>
                    <p>
                   	  <label><span class="formStar">*</span><@spring.message "label.transporter.firstname" />:</label>
                        <input type="text"  id="firstname" name="firstname"/>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.transporter.lastname" />:</label>
                        <input type="text" id="lastname" name="lastname"/>
                    </p>
                     <p>
                    	<label><span class="formStar">*</span><@spring.message "label.transporter.companyname" />:</label>
                        <input type="text" id="companyname" name="companyname"/>
                    </p>
                     <p>
                    	<label><span class="formStar">*</span><@spring.message "label.transporter.taxnumber" /> :</label>
                        <input type="text" id="taxnumber" name="taxnumber"/>
                    </p>
                      <p>
                    	<label><span class="formStar">*</span> <@spring.message "label.transporter.vechilenumber" /> :</label>
                        <input type="text" id="vehiclenumber" name="vehiclenumber"/>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.transporter.phone" /> :</label>
                        <input type="text" id="phone" name="phone"/>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.transporter.mobile" /> :</label>
                        <input type="text" id="mobile" name="mobile"/>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.transporter.city" /> :</label>
                        <input type="text" id="city" name="city"/>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.transporter.country" /> :</label>
                      
                         <select name="country" id="country" class="country">
                              <#list model["retrieveCountry"] as retrieveCountry>
                                      <option value="${retrieveCountry.id}"> ${retrieveCountry.country_name}  </option>
                                      
                               </#list>
                            </select>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span> <@spring.message "label.transporter.companyaddress" /> :</label>
                        <input type="text" id="address1" name="address1" />
                    </p>
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.transporter.privateaddress" /> :</label>
                        <input type="text" id="address2" name="address2"/>
                    </p>
                                       
                    <p>
                    	<label><span class="formStar">*</span><@spring.message "label.transporter.postcode" /> :</label>
                        <input type="text" id="postcode" name="postcode"/>
                    </p>
                    
                 <p class="btnValue">
                    
                    	<button class="<@spring.message "label.transporter.btnsignup" />" id="signupID" value="" style="border:none;"></button>
                    </p>
                    
                   
                    
                    
                </form>
            </div>
        </div><!--End Content container-->
        
        <script >
      function validateTransporter(){
        		
        	var re = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        		
        	var email,shortname,password,confirmpassword,firstname,lastname,phone,mobile,city,country,address1,address2,postcode;
        	
        	email=$("#email").val();
        	shortname=$("#shortname").val();
        	password=$("#password").val();
        	confirmpassword=$("#confirmpassword").val();
        	mobile=$("#mobile").val();
        	//firstname,lastname,phone,mobile,city,country,address1,address2,postcode
        	firstname=$("#firstname").val();
        	lastname=$("#lastname").val();
        	phone=$("#phone").val();
        	city=$("#city").val();
        	country=$("#country").val();
        	address1=$("#address1").val();
        	address2=$("#address2").val();
        	postcode=$("#postcode").val();

        	var isValidEmail = re.test(email);
        	
        	
      
        //	isValidEmail=true;
        	
        	if(isValidEmail){
        		if(shortname!=''){
        			
        		
        		if (password == confirmpassword) {
        			
        			if(firstname!=''&&lastname!=''&&phone!=''&&mobile!=''&&city!=''&&country!=''&&address1!=''&&address2!=''&&postcode!=''){
        				
        			
        				
        			return true;
	
        				
        				
        			}else{
        				alert("All the fields are Mandatory");
                		$("#mobile").focus();
                		return false;
        			}
        			
        		}else{
        			alert("Enter Valid Password ");
            		$("#password").focus();
            		return false;
        		}
        		}else{
        			alert("Enter Shortname");
        			$("#shortname").focus();
        			return false;
        		}
        	}else{
        		alert("Enter Valid EMail id");
        		$("#email").focus();
        		return false;
        	}	
        		
        		
        		
        		
        		
        		
        		
        	}
        
        
        
        
        
        </script>
        
        
</@u.trucklayout> 