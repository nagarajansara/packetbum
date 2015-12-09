<style>
.btn_logoutSL{
	background: url("../assets/img/btn_logoutSL.png");
	width: 80px;
	height: 26px;
	text-indent: -9999px;
	}
</style>
    <div id="wrapper">
    	<div class="container">
       
       		<div class="header">
            	<div class="logo">
           	   		 <img src="../assets/img/logonew.png" width="179" height="42" />
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
                    <div class="ph_num">nfadijiuj </div>
                </div>
            </div>
            
            <div class="menu">   
             
                <nav>
                    <li><a href="../index.html" class="selected"><@spring.message "label.home" /></a></li>
                    <li><a href="../getquote.html"><@spring.message "label.getquote" /></a></li>
                    <li><a href="../listitem.html"><@spring.message "label.searchdelivery" /></a></li>
                    <li><a href="#"><@spring.message "label.howitworks" /></a></li>
                    <li><a href="#"><@spring.message "label.aboutus" /></a></li>
                    <li><a href="#"><@spring.message "label.contactus" /></a></li>
                </nav>
                               
                <ul>
                <li><a href="../j_spring_security_logout" class="<@spring.message "label.prohome.btnlogout" />"><@spring.message "label.prohome.logout" /></a></li>
                </ul>
            </div>     
        
        </div>
        
         <div class="banner_left">
        	<div class="banner_right">
            	<div class="ser_content_bg">
            		<div class="container">
                    	<div class="viewrsDashboard">
                       	  <ul>
                          	<li><a href="#" class="btn_setting"><@spring.message "label.prohome.setting" /></a></li>
                            <li><a href="index.html">${model["username"]}</a></li>
                          </ul>
                        </div> 
                                                 	
                    </div>                    
                </div>
            </div>
      </div>
        
            <script type="text/javascript">
	$(function(){
	  $('#sidemenu a').on('click', function(e){
		e.preventDefault();
	
		if($(this).hasClass('open')) {
		  // do nothing because the link is already open
		} else {
		  var oldcontent = $('#sidemenu a.open').attr('href');
		  var newcontent = $(this).attr('href');
		  
		  $(oldcontent).fadeOut('fast', function(){
			$(newcontent).fadeIn().removeClass('hidden');
			$(oldcontent).addClass('hidden');
		  });
		  
		 
		  $('#sidemenu a').removeClass('open');
		  $(this).addClass('open');
		}
	  });
	  
	  $('#selectall').click(function(event) {  //on click 
	        if(this.checked) { // check select status
	            $('.case').each(function() { //loop through each checkbox
	                this.checked = true;  //select all checkboxes with class "checkbox1"               
	            });
	        }else{
	            $('.case').each(function() { //loop through each checkbox
	                this.checked = false; //deselect all checkboxes with class "checkbox1"                       
	            });         
	        }
	    });
	  
	});


</script>