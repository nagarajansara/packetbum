<#macro trucklayout>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>Transport</title>

<link href="assets/css/main.css" rel="stylesheet" type="text/css" ></link>
<link href="assets/css/mainSL.css" rel="stylesheet" type="text/css" ></link>
<link href="assets/css/appmodal.css" rel="stylesheet" type="text/css" ></link>
<link rel="stylesheet" type="text/css" href="assets/css/overrite.css"></link>
<script src="assets/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="assets/js/jquery.customSelect.js" type="text/javascript"></script>
<script src="assets/js/appmodal.js" type="text/javascript"></script>
<script src="assets/js/appUtil.js" type="text/javascript"></script>
 <script src="assets/js/appValidation.js" type="text/javascript"></script>
<script type="text/javascript">
 $(function(){
 $('select.styled').customSelect();
 $('select.styled_1').customSelect()
 
 
 });
</script>

</head>

<body >

	<#include "header.ftl">
	
	
			<div id="truckbody"><#nested>
			
			
			
			</div>
		
	

	   <footer>
                	<div class="footer_nav">
                    	<div class="nav_bot">
                        	<ul>                        	
                             <li><a href="getquote.html"><@spring.message "label.getquote" /></a></li>
                             <li><a href="listitem.html"><@spring.message "label.searchdelivery" /></a></li>                            	
                             <li><a href="#"><@spring.message "label.howitworks" /></a></li>
                            </ul>
                            <ul>
                              <li><a href="index.html"><@spring.message "label.home" /></a></li>
                                <li><a href="#"><@spring.message "label.aboutus" /></a></li>
                                <li><a href="#"><@spring.message "label.contactus" /></a></li>
                                <li><a href="#"><@spring.message "label.blog" /></a></li>
                                <li><a href="#"><@spring.message "label.press" /></a></li>
                                <li><a href="terms.html"><@spring.message "label.home.termscondition" /></a></li>
                               
                            </ul>
                        </div>
                        <div class="social_media">
                        	<p><@spring.message "label.home.followus" /></p>
                            <ul>
                            	<li><a href="#" class="btn_fb">Fb</a></li>
                                <li><a href="#" class="btn_tweet">Twitter</a></li>
                                <li><a href="#" class="btn_google">Google plus</a></li>
                                <li><a href="#" class="btn_tube">Youtube</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <p class="copy_right">© 2014 Paketbum Limited. All rights reserved.</p>
                    
                </footer>
                
       
            </div>
        </div>
        
    </div>
<div class="ajaxloadermodal"><!-- Place at bottom of page --></div>



</body>
</html>

</#macro>
