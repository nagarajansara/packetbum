                                                     
                <#import "lib/truckadminlayout.ftl" as u>
<@u.truckadminlayout>


                <!-- Main content -->
                <section class="content">

                   <div class="row">
                        <!-- left column -->
                        <div class="col-md-8">
                            <!-- general form elements -->
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title">Messages</h3>
                                     
                                      
                                      
                                </div><!-- /.box-header -->
                                
                                <div>
                                
                                
                                <#list model["retrieveMessages"] as retrieveMessage>
   	                                
   	                                <p><strong><a href="#">${retrieveMessage.shortname} </a></strong> <span>${retrieveMessage.creates} </span><a href="#" onclick="hidemsg(this)" data-id="${retrieveMessage.id}"><i class="fa fa-trash-o"></i></a></br> ${retrieveMessage.message} </p>
   	                               </#list>
   	                                
   	                                </div>                    
                              </div>
                           </div>
                               </div>                                   
                                 
                                                    
                                                    
    <script>
    
    function hidemsg(val){    	
    	
    //	alert("fdgdfgdf");    
    
    
    	var link="viewmsg.html";
    	var id=$(val).attr('data-id');
    	
    	var con=confirm("Are you sure?");
    	if(con){
    		
    	
		
		
		$.post(link, {id:id},function(data){
            console.log("data:" + data);
            
            alert("Updated Successfully");
            
           // location.reload();
         
         });
    	
    }
    }
   
    
    </script>
</div><!-- /.box-body -->
                            </div><!-- /.box -->
                          </div> 

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
 
     
</@u.truckadminlayout> 