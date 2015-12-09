
<style>
	.pbCommonFontFamily_V
	{
		font-family: verdana;
	}
	.pbCommonFontWeight_B
	{
		font-weight: bold;
	}
</style>
<div id="wrapper">
    	<div class="container">
       
       		<div class="header">
            	<div class="logo">
           	   		 <img src="assets/img/logonew.png"  style="width: 222px; margin-top: -13px;" />
                </div>
                <div class="header_right">
                	<div class="lanuguage">
                    	<p><@spring.message "label.prohome.searchyourlaguage" /></p>
                    	    <div class="select-style">
                        

<select name="forma" onchange="location = this.options[this.selectedIndex].value;">


 <#if model["defaultLanguage"]??&&model["defaultLanguage"]=='English'>
   <option value="index.html?language=en" selected="true">EN</option>
  <#else> 
  <option value="index.html?language=en" >EN</option>
  </#if>
 
  <#if  model["defaultLanguage"]??&&model["defaultLanguage"]=='Slovenian'>
  <option value="index.html?language=sl" selected="true">SL</option>
  <#else> 
  <option value="index.html?language=sl">SL</option>
  </#if>
 
 
</select>

                      
                        </div>                                              
                    </div>
                    <div class="ph_num">+386 (0)686 37 153 </div>
                </div>
            </div>
            
            <div class="menu">            
                <nav>
                 <#if model["curpage"]??>
                      <#if model["curpage"] =="home">
                 
                  <li class="pbCommonMain_Menu"><a href="index.html" class="selected"><@spring.message "label.home" /></a></li>
                  <#else> 
                  <li class="pbCommonMain_Menu"><a href="index.html" ><@spring.message "label.home" /></a></li>
                   </#if>
                   
                   <#if model["curpage"] =="getquote">
                   <li class="pbCommonMain_Menu"><a href="getquote.html" class="selected"><@spring.message "label.getquote" /></a></li>
                  
                  <#else> 
                    <li class="pbCommonMain_Menu"><a href="getquote.html"><@spring.message "label.getquote" /></a></li>
                   </#if>
                   
                   <#if model["curpage"] =="listitem">
                 
                    <li><a href="listitem.html" class="selected"><@spring.message "label.searchdelivery" /></a></li>
                  <#else> 
                  <li class="pbCommonMain_Menu"><a href="listitem.html"><@spring.message "label.searchdelivery" /></a></li>
                   </#if>
                 </#if> 
                   
                  
                  
                    <li class="pbCommonMain_Menu pbHowToWrk_Menu"><a href="hwtowrk.html"><@spring.message "label.howitworks" /></a></li>
                    <li class="pbCommonMain_Menu"><a href="#"><@spring.message "label.aboutus" /></a></li>
                    <li class="pbCommonMain_Menu"><a href="contactus.html"><@spring.message "label.contactus" /></a></li>
                </nav>
                      <#if model["username"]??>
                    <ul>
                     <li class="pbCommonMain_Menu"><a href="j_spring_security_logout" class="<@spring.message "label.prohome.btnlogout" />"><@spring.message "label.prohome.logout" /></a></li>
                     <#if model["role"]??&& (model["role"] == "proOwner")>
                	<li class="pbCommonMain_Menu"><a href="pro/" class="combtn" style="font-family:'GothamRoundedBook'; font-size: 12px; line-height: 5px;text-transform: uppercase;padding: 10px;" id=""><@spring.message "label.proindex.myaccount" /></a></li>
                	<#elseif model["role"]??&& (model["role"] == "vclOwner")> 
                	<li class="pbCommonMain_Menu"><a href="vcl/" class="combtn" style="font-size: 12px; line-height: 6px;font-family: 'GothamRoundedBook';text-transform: uppercase;padding: 10px;" class="" id=""><@spring.message "label.proindex.myaccount" /></a></li>
                	</#if> 
                	</ul>
                         <#else>         
                <ul>
                	<li class="pbCommonMain_Menu"><a href="#" class='<@spring.message "label.login" />' id="loginID"><@spring.message "label.login" /></a></li>
                    <li class="pbCommonMain_Menu"><a href="#" class='<@spring.message "label.signup" />' id="signupID"><@spring.message "label.signup" /></a></li>
                </ul>
                </#if>
            </div>      
            
        
        </div>
        <script>
        var loginMsg="";
        
        </script>
        
        <#if model["loginMsg"]?? && (model["loginMsg"] == "true")>
 <script>
  loginMsg="Enter a Valid Email And Password";
 
 </script>
   
</#if>
        <script>

$(function(){
	
	 AppUtil.shortHeadByLength(20);
	
$("#signupID").click(function(){
		
		var html="<div class='container_signup'>";
		  html+="<div class='login'>";
		    html+="<div class='sigin'> <form name='loginForm' method='POST' action='j_spring_security_check'>";
		    html+="<h2><@spring.message "label.modal.signin" /></h2>";
		    html+="<div class='sign_text'>";
		    html+="<p><input type='text' placeholder='<@spring.message "label.modal.email" />' class='username' id='username' name='j_username'/></p>";
		    html+="<p><input type='password' placeholder='<@spring.message "label.modal.password" />' class='username' id='username' name='j_password'/></p>";
		  //  html+="<p style='text-align:center;'>";	
		 //   html+="<input type='checkbox' class='checkbox' id='checkbo' />";
		 	  html+="<p><a href='forgotpassword.html' style='text-align:center;color:#333;'>Forgot <@spring.message "label.modal.password" />?</a></p>";
		//    html+="</p>";
		    html+="<button type='submit'  class='<@spring.message "label.modal.btnsignin" />'></button>";
		    html+="</div>";
		    html+="</form></div>"; 
		    html+="<div class='sigup'>";
		    html+="<h2><@spring.message "label.modal.signup" /></h2>";
            
		    html+="<div class='sign_text'>";
		    html+="<p><@spring.message "label.modal.iam" /></p>";
		    html+="<div class='customer_select'>";
		    html+="<a href='regcustomer.html' class='<@spring.message "label.modal.customer" />'></a>";
		    html+="<a href='regtransporter.html' class='<@spring.message "label.modal.carrier" />'></a>";
		    html+="</div>";
		  //  html+="<p style='text-align:center;'>";	
		 //   html+="<input type='checkbox' class='checkbox' id='checkbox' />";
		 //   html+="<label>I read the agree to the <a href='#'>user agreement</a></label>";
		//    html+="</p>";
		//    html+="<a href='#' class='btn_sigup'></a>";
		    html+="</div>";
		    html+="</div>";
		    html+="</div>";
		    html+="</div>";
		
	
		
		  config = {
					"body": html,
					"title": '',
					"top":'4%',
					"width":'61%',
					"right":'19%'
		           };
				popUp = new PopUp(config);
				popUp.render();
	
	
	
	});
	


	
	
	$("#loginID").click(function(){
		
		var html="<div class='container_signup'>";
		    html+="<div class='login'>";
		    html+="<div class='sigin'> <form name='loginForm' method='POST' action='j_spring_security_check'>";
		    html+="<h2><@spring.message "label.modal.signin" /></h2>";
		    html+="<div class='sign_text'>";
		    html+="<p>*"+loginMsg+"</p>";
		    html+="<p><input type='text' placeholder='<@spring.message "label.modal.email" />' class='username' id='username' name='j_username'/></p>";
		    html+="<p><input type='password' placeholder='<@spring.message "label.modal.password" />' class='username' id='username' name='j_password'/></p>";
		  //  html+="<p style='text-align:center;'>";	
		 //   html+="<input type='checkbox' class='checkbox' id='checkbox' />";
		  html+="<p><a href='forgotpassword.html' style='text-align:center;color:#333;'><@spring.message "label.modal.forgot" /> <@spring.message "label.modal.password" />?</a></p>";
		//    html+="</p>";
		    html+="<button type='submit'  class='<@spring.message "label.modal.btnsignin" />'></button>";
		    html+="</div>";
		    html+="</form></div>";
		    html+="<div class='sigup'>";
		    html+="<h2><@spring.message "label.modal.signup" /></h2>";
            
		    html+="<div class='sign_text'>";
		    html+="<p><@spring.message "label.modal.iam" /></p>";
		    html+="<div class='customer_select'>";
		    html+="<a href='regcustomer.html' class='<@spring.message "label.modal.customer" />'></a>";
		    html+="<a href='regtransporter.html' class='<@spring.message "label.modal.carrier" />'></a>";
		    html+="</div>";
		  //  html+="<p style='text-align:center;'>";	
		 //   html+="<input type='checkbox' class='checkbox' id='checkbox' />";
		 //   html+="<label>I read the agree to the <a href='#'>user agreement</a></label>";
		//    html+="</p>";
		//    html+="<a href='#' class=''></a>";
		    html+="</div>";
		    html+="</div>";
		    html+="</div>";
		    html+="</div>";
		
	
		
		  config = {
					"body": html,
					"title": '',
					"top":'4%',
					"width":'61%',
					"right":'19%'
		           };
				popUp = new PopUp(config);
				popUp.render();
	
	
	
	});
	
	
});





</script>


<#if model["loginError"]?? && (model["loginError"] == "failed")>
<script>
$(function(){
	
	$( "#loginID" ).trigger( "click" );

	
});
</script>
</#if>
