 <div class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li>
                    <a href="dashboard.html" onclick="return false;"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Students<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="addStudent.html" onclick="loadBody(this); return false;">Add Students</a>
                        </li>
                        <li>
                            <a href="bulkUpload.html" onclick="return false;">Bulk Upload</a>
                        </li>
						<li>
                            <a href="studentList.html" onclick="loadBodyWithTable(this); return false;">Students List</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                 </li>
                 <li>
                     <a href="tables.html"><i class="fa fa-table fa-fw"></i> Fees<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
                         <li>
                             <a href="addStudentFees.html" onclick="loadBody(this); return false;">Add Student Fees</a>
                        </li>
                        <li>
                            <a href="studentFeesList.html" onclick="loadBodyWithTable(this); return false;">Student Fees List</a>
                        </li>
						<li>
                            <a href="cancelledFeesList.html" onclick="loadBody(this); return false;">Cancelled Fees List</a>
                        </li>
                    </ul>
                </li>
                
                 
                <li>
                    <a href="#"><i class="fa fa-edit fa-fw"></i> Reports<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="studentFeesReport.html" onclick="loadBodyWithTable(this); return false;">Fees Invoice</a>
                        </li>
                         <li>
                            <a href="studentFeesReportWithPaidTo.html" onclick="loadBodyWithTable(this); return false;">Fees Report </a>
                        </li>
                        
                    </ul>
                    <!-- /.nav-second-levelstudentFeesReport -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-wrench fa-fw"></i> Settings<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="feesSetting.html" onclick="loadBodyWithTable(this); return false;">Fees Settings</a>
                        </li>
                        <li>
                            <a href="addBusinessAssociate.html" onclick="return false;">Add Business Associates</a>
                        </li>
                        
                    </ul>
                    <!-- /.nav-second-levelstudentFeesReport -->
                </li>
                <li>
                    <a href="myProfile.html" onclick="return false;"><i class="fa fa-sitemap fa-fw"></i>My Profile</a>
                </li>
                  
            </ul>
            <!-- /#side-menu -->
        </div>
        <!-- /.sidebar-collapse -->
    </div>