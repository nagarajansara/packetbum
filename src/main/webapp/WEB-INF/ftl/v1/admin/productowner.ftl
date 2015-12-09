<#import "lib/truckadminlayout.ftl" as u>
<@u.truckadminlayout>


                <!-- Main content -->
                <section class="content">

                  
                                      <#include "error-section.ftl">
                              
                          
                   <div class="row">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Product Owner List</h3>                                    
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Product Owner</th>
                                                <th>Email</th>
                                                <th>Mobile</th>
                                                <th>Delete</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <#list model["retrieveProductOwner"] as retrieveProductOwner>
                                            <tr>
                                                <td>${retrieveProductOwner.shortname}</td>
                                                <td>${retrieveProductOwner.username}</td>
                                                  <td>${retrieveProductOwner.mobile}</td>
                                            
                                                <td><a  href=""><i class="fa fa-trash-o"></i></a></td>
                                                
                                            </tr>
                                              </#list>
                                         </tbody>
                                      
                                    </table>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->
                          </div> 

                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
 <!-- DATA TABES SCRIPT -->
       <link href="../assets/admin/css/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <script src="../assets/admin/js/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="../assets/admin/js/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
        
        <script type="text/javascript">
            $(function() {
            	 $('#example1').dataTable({
                 	"iDisplayLength": 5,
                     "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]]
                 });
               
            });
        </script>
        <!-- add new calendar event modal -->
</@u.truckadminlayout> 