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
                                    <h3 class="box-title">Category</h3>
                                      <#include "error-section.ftl">
                                </div><!-- /.box-header -->
                                <!-- form start -->
                                
                                <#if model["edit"] == "true">
                                   <#list model["getCategory"] as getCategory>
                                  <form role="form" name="categoryform" action="category.html" method="post" enctype="multipart/form-data" >
                                    <div class="box-body">
									    <div class="form-group">
                                            <label for="exampleInputName">Category Name</label>
                                            <input type="text" name="name" class="form-control" id="exampleInputName"  value="${getCategory.name}">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Category Icon</label>
                                            <img src="${getCategory.icon}" width="100" height="50"/>
                                              <input type="hidden" name="edit" value="true"/> 
                                                <input type="hidden" name="icon" value="${getCategory.name}"/>   
                                              <input type="file" name="file" class="form-control"  placeholder="">
                                              <input type="hidden" name="id" value="${getCategory.id}"/>                                    
                                        </div>
                                        
                                    </div><!-- /.box-body -->

                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                   </form>
                                 </#list>
                                <#else>
                                <!-- 
                                
                                  <form role="form" action="category.html"  name="categoryform" method="post" enctype="multipart/form-data" >
                                    <div class="box-body">
									    <div class="form-group">
                                            <label for="exampleInputName">Category Name</label>
                                            <input type="text" name="name" class="form-control" id="exampleInputName" placeholder="Name">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Category Icon</label>
                                            <input type="file" name="file" class="form-control"  placeholder="">
                                              <input type="hidden" name="edit" value="false"/>
                                        </div>
                                        
                                    </div>/.box-body

                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form> -->
                                
                                
                                </#if>
                            </div><!-- /.box -->
                          
                            
                            </div> 
                            
                    </div>   <!-- /.row -->
                        
                          
                   <div class="row">
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Category List</h3>                                    
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th>Category Name</th>
                                                <th>Icon</th>
                                                <th>Edit</th>
                                                <th>Delete</th>
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <#list model["retrieveCategory"] as retrieveCategory>
                                            <tr>
                                                <td>${retrieveCategory.name}</td>
                                                <td><img src="${retrieveCategory.icon}" width="100" height="50"/></td>
                                                <td><a   href="category.html?id=${retrieveCategory.id}&flag=edit"><i class="fa fa-edit"></i></a></td>
                                                <td><a  href="category.html?id=${retrieveCategory.id}&flag=delete"><i class="fa fa-trash-o"></i></a></td>
                                                
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