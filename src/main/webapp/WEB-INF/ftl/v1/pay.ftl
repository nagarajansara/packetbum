<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>
	<style>
	
	#page-wrap {
    margin: 0 auto;
    width: 800px;
}
textarea {
    border: 0 none;
  
    overflow: hidden;
    resize: none;
}
table {
    border-collapse: collapse;
}
table td, table th {
    border: 1px solid black;
    padding: 5px;
}
#header {
    background:none repeat scroll 0 0 #ff7f00;
    color: white;
  
    height: 15px;
    letter-spacing: 20px;
    margin: 20px 0;
    padding: 8px 0;
    text-align: center;
    width: 100%;
}
#address {
    float: left;
    height: 150px;
    width: 250px;
}
#customer {
    overflow: hidden;
}
#logo {
    border: 1px solid #fff;
    float: right;
    margin-top: 25px;
    max-height: 100px;
    max-width: 540px;
    overflow: hidden;
    position: relative;
    text-align: right;
}
#logo:hover, #logo.edit {
    border: 1px solid #000;
    margin-top: 0;
    max-height: 125px;
}
#logoctr {
    display: none;
}
#logo:hover #logoctr, #logo.edit #logoctr {
    background: none repeat scroll 0 0 #eee;
    display: block;
    line-height: 25px;
    padding: 0 5px;
    text-align: right;
}
#logohelp {
    display: none;
    font-style: italic;
    padding: 10px 5px;
    text-align: left;
}
#logohelp input {
    margin-bottom: 5px;
}
.edit #logohelp {
    display: block;
}
.edit #save-logo, .edit #cancel-logo {
    display: inline;
}
.edit #image, #save-logo, #cancel-logo, .edit #change-logo, .edit #delete-logo {
    display: none;
}
#customer-title {
    float: left;
    font-size: 20px;
    font-weight: bold;
}
#meta {
    float: right;
    margin-top: 1px;
    width: 300px;
}
#meta td {
    text-align: right;
}
#meta td.meta-head {
    background: none repeat scroll 0 0 #eee;
    text-align: left;
}
#meta td textarea {
    height: 20px;
    text-align: right;
    width: 100%;
}
#items {
    border: 1px solid black;
    clear: both;
    margin: 30px 0 0;
    width: 100%;
}
#items th {
    background: none repeat scroll 0 0 #eee;
}
#items textarea {
    height: 50px;
    width: 80px;
}
#items tr.item-row td {
    border: 0 none;
    vertical-align: top;
}
#items td.description {
    width: 300px;
}
#items td.item-name {
    width: 175px;
}
#items td.description textarea, #items td.item-name textarea {
    width: 100%;
}
#items td.total-line {
    border-right: 0 none;
    text-align: right;
}
#items td.total-value {
    border-left: 0 none;
    padding: 10px;
}
#items td.total-value textarea {
    background: none repeat scroll 0 0 rgba(0, 0, 0, 0);
    height: 20px;
}
#items td.balance {
    background: none repeat scroll 0 0 #eee;
}
#items td.blank {
    border: 0 none;
}
#terms {
    margin: 20px 0 0;
    text-align: center;
}
#terms h5 {
    border-bottom: 1px solid black;
   
    letter-spacing: 10px;
    margin: 0 0 8px;
    padding: 0 0 8px;
    text-transform: uppercase;
}
#terms textarea {
    text-align: center;
    width: 100%;
}
textarea:hover, textarea:focus, #items td.total-value textarea:hover, #items td.total-value textarea:focus, .delete:hover {
    background-color: #eeff88;
}
.delete-wpr {
    position: relative;
}
.delete {
    background: none repeat scroll 0 0 #eeeeee;
    border: 1px solid;
    color: #000;
    display: block;
  
    font-size: 12px;
    font-weight: bold;
    left: -22px;
    padding: 0 3px;
    position: absolute;
    text-decoration: none;
    top: -6px;
}
	
	
	
	</style>
        <div class="banner_left">
        	<div class="banner_right">
            	<div class="ser_banner_bg inner">
            		<div class="container">
                          
                          <div class="ser_banner">
                                 <div class="banner_sea">
                                    <h1>User Form</h1>
                                   
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
            	
                <div id="page-wrap">

		<textarea id="header">INVOICE</textarea>
		
		<div id="identity">
		
            <textarea id="address" placeholder="Enter address"></textarea>

            <div id="logo">

           

              <div id="logohelp">
                <input type="text" value="" size="50" id="imageloc"><br>
                (max width: 540px, max height: 100px)
              </div>
              <img alt="logo" src="assets/img/logonew.png" id="image">
            </div>
		
		</div>
		
		<div style="clear:both"></div>
		
		<div id="customer">

           <p>Paketbum
           </p>

            <table id="meta">
                <tbody><tr>
                
                    <td class="meta-head">Invoice #</td>
                      <#list model["retrieveItem"] as retrieveItem>
                    <td>000${retrieveItem.id}</td>
                     </#list>
                </tr>
                <tr>

                    <td class="meta-head">Date</td>
                    <td>${model["curDate"]}</td>
                </tr>
                <tr>
                    <td class="meta-head">Amount </td>
                    <td><div class="due">$${model["amount"]}</div></td>
                </tr>

            </tbody></table>
		
		</div>
		
		<table id="items">
		
		  <tbody><tr>`
		      <th style="width:75%;" style="color:#333;">Item</th>
		     
		      <th style="width:75%;" style="color:#333;">Price</th>
		  </tr>
		  
		  <tr class="item-row">
		  <#list model["retrieveItem"] as retrieveItem>
		      <td class="item-name">${retrieveItem.description}</td>
		       </#list>
		      <td><span class="price">$${model["amount"]}</span></td>
		  </tr>
		  
		
		  <tr>

		    
		      <td class="total-line" colspan="">Total</td>
		      <td class="meta-head"><span class="price">$${model["amount"]}</span></td>
		  </tr>
		
		 
		 
		 
		 <tr>
		 
		 <td>
		 	<div style="width: 100%">
			 	<div style="float: left;">
					<a target="_balnk" href="/paketbum/payment/paymente24/index.jsp?amount=${model["amount"]}" style="padding:0px;" class="combtn">Pay with bankart</a>
				</div>
				<div align="right">
				<a target="_balnk" href="http://test.moneta.mobitel.si/placevanje/TarifficationE.dll?TARIFFICATIONID=2138&ConfirmationID=${model['ConfirmationID']}" style="padding:0px;" class="combtn">pay with mobitel</a>
				</div>
		 	</div>
		 </td>
		 <td>
		 
			
		 
		 </td>
		 
		 
		 </tr>
		
		</tbody>
		
		
		
		
		</table>
		
		
	
	</div>
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