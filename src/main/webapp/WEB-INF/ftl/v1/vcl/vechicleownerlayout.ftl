<#macro vechicleownerlayout>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Transport</title>


 <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
      <link rel="stylesheet" href="../assets/css/bootstrap.theme.min.css">
<link href="../assets/css/dashboard.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/main.css" rel="stylesheet" type="text/css" />
<link href="../assets/css/mainSL.css" rel="stylesheet" type="text/css" />


<link href="../assets/css/appmodal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="../assets/css/overrite.css"/>


<script src="../assets/js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="../assets/js/appUtil.js" type="text/javascript"></script>
 <script src="../assets/js/appValidation.js" type="text/javascript"></script>
 <script src="../assets/js/appmodal.js" type="text/javascript"></script>



<script src="../assets/js/jquery.customSelect.js" type="text/javascript"></script>
 <script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/jquery.droptabs.js"></script>


<script type="text/javascript">
	
 
    $(function(){
        $(".custom-select_3").each(function(){
            $(this).wrap("<span class='select-wrapper_3'></span>");
            $(this).after("<span class='holder'></span>");
        });	
        $(".custom-select_3").change(function(){
            var selectedOption = $(this).find(":selected").text();
            $(this).next(".holder").text(selectedOption);
        }).trigger('change');
		
    });
</script>

</head>

<body >

	<#include "vclheader.ftl">
	
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
                                <li><a href="terms.html">Terms & Conditions</a></li>
                               
                            </ul>
                        </div>
                        <div class="social_media">
                        	<p>Follow us</p>
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


  
<script type="text/javascript">
	$(function(){
	  $('#sidemenu a').on('click', function(e){
		e.preventDefault();
	
		if($(this).hasClass('open')) {
		  // do nothing because the link is already open
		} else {
		  var oldcontent = $('#sidemenu a.open').attr('href');
		  var newcontent = $(this).attr('href');
		  console.log("oldcontent"+oldcontent);
		  console.log("newcontent"+newcontent);
		  $(oldcontent).fadeOut('fast', function(){
			$(newcontent).fadeIn().removeClass('hidden');
			$(oldcontent).addClass('hidden');
		  });
		  
		 
		  $('#sidemenu a').removeClass('open');
		  $(this).addClass('open');
		}
	  });
	});

	$(".droptabs").droptabs({
		development:true
	});
</script>



<div class="ajaxloadermodal"><!-- Place at bottom of page --></div>



</body>
</html>
</#macro>
