<html>
   <head>
     <meta http-equiv="refresh" content="1; url=http://bytemindztech.com/truck/purchase.html?ConfirmationID=${model['ConfirmationID']}" />
     <meta name='Price' content='1'>
     <meta name='Quantity' content='1'>
     <meta name='VATRate' content='22'>    
     <meta name='Description' content='Item'>
     <meta name='Currency' content='EUR'>
   </head>
<body>

  <#list model["orderdata"] as orderdata>
  Purchase info: ${orderdata.purchasestatus}
  
   </#list>      
</body>
</html>
