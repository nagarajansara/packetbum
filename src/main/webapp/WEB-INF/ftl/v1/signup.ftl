<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>

   
       
              <div class="col-md-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Sign Up</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" id="tpsignupform" name="tpsignupform">
                            <fieldset>
                               
                                <div class="form-group">
                                    <input class="form-control" placeholder="E-mail" id="email" name="email" type="email" autofocus="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" id="password" name="password" type="password" value="">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="confirm Password" id="conpassword" name="conpassword" type="password" value="">
                                </div>
                               
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="javascript:;" class="btn btn-sm btn-success" id="signupbtn">Login</a>
                            </fieldset>
                        </form>
                     </div>
                   </div>
               </div>
    
     <script src="assets/js/signuptp.js"></script>
   </@u.trucklayout> 