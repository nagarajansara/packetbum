
<#import "vechicleownerlayout.ftl" as u>
<@u.vechicleownerlayout>

        
      <div class="container">
        	<#if model["messagetype"]?? && (model["messagetype"] == "Success")>
<div class="alert alert-success">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Success: </strong>${model["message"]}
</div>
<#elseif model["messagetype"]?? && ((model["messagetype"]) == "Failed")>
<div class="alert alert-danger">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Failed: </strong>${model["message"]}
</div>
</#if>
        	<div class="form">
            	 <h1 class="h1head">Paketbum Sign Up Information</h1>
                <p>(<span class="formStar">*</span> indicates a required field)</p>
            	<form name="regtransporter" id="regtransporter" action="regtransporter.html" method="post" onsubmit="return validateTransporter();">
                	<p>
                    	<label><span class="formStar">*</span>Email Address :</label>
                        <input type="text" name="email" id="email" />
                    </p>
                    <p>
                    	<label><span class="formStar">*</span>User Name :</label>
                        <input type="text" name="shortname" id="shortname" />
                    </p>
                    <p>
                    	<label><span class="formStar">*</span>Password :</label>
                        <input type="password"  name="password" id="password"/>
                    </p>
                  <p>
                    	<label><span class="formStar">*</span>Confirm Password :</label>
                        <input type="password" name="confirmpassword" id="confirmpassword"  />
                    </p>
                   <h2 style="margin:20px auto; padding: 20px 0; border-top: solid 1px #eee;"><img src="../assets/img/personalinfo.png" width="113" height="15" /></h2>
                    <p>
                   	  <label><span class="formStar">*</span>First Name :</label>
                        <input type="text"  id="firstname" name="firstname"/>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span>Last Name :</label>
                        <input type="text" id="lastname" name="lastname"/>
                    </p>
                     <p>
                    	<label><span class="formStar">*</span>Company Name :</label>
                        <input type="text" id="companyname" name="companyname"/>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span>Phone :</label>
                        <input type="text" id="phone" name="phone"/>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span>Mobile Phone :</label>
                        <input type="text" id="mobile" name="mobile"/>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span>City :</label>
                        <input type="text" id="city" name="city"/>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span>County :</label>
                      
                         <select name="country" id="country" class="country">
                              <#list model["retrieveCountry"] as retrieveCountry>
                                      <option value="${retrieveCountry.id}"> ${retrieveCountry.country_name}  </option>
                                      
                                       </#list>
                            </select>
                    </p>
                    <p>
                    	<label><span class="formStar">*</span>Address1 :</label>
                        <input type="text" id="address1" name="address1" />
                    </p>
                    <p>
                    	<label><span class="formStar">*</span>Address2 :</label>
                        <input type="text" id="address2" name="address2"/>
                    </p>
                                       
                    <p>
                    	<label><span class="formStar">*</span>Post Code :</label>
                        <input type="text" id="postcode" name="postcode"/>
                    </p>
                    
                 <p class="btnValue">
                    
                    	<button class="btnSignup" id="signupID" value="" style="border:none;"></button>
                    </p>
                    
                   
                    
                    
                </form>
            </div>
        </div><!--End Content container-->
    
	
	</@u.vechicleownerlayout> 