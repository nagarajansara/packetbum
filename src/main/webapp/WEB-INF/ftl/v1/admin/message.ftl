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
                                      <#include "error-section.ftl">
                                </div><!-- /.box-header -->
                              </div>
                           </div>
                           
                            </div>
                   <div class="row">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Messages List</h3>                                    
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Message</th>
                                                <th>Message ID</th>
                                                <th>creates</th>
                                                <th>view</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <#list model["retrieveMessages"] as retrieveMessages>
                                            <tr>
                                                <td>${retrieveMessages.message}</td>
                                                <td>${retrieveMessages.messageid}</td>
                                                <td>${retrieveMessages.creates}</td>
                                                <td><a  href="viewmsg.html?msgid=${retrieveMessages.messageid}"><i class="fa fa-external-link"></i></a></td>
                                                
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