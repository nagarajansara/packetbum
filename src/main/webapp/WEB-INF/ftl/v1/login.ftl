<#import "lib/trucklayout.ftl" as u>
<@u.trucklayout>

	<div class="row">
		<p></p>
	</div>
	<div class="row">
		<p></p>
	</div>
	<div class="row">
		<p></p>
	</div>
	<div class="row">
		<p></p>
	</div>
	<div class="row">
		<div class="col-sm-3 col-sm-offset-4 well">
			<legend>Please Sign In</legend>
			
			<form name="loginForm" method="POST" action="j_spring_security_check">
				<div class="form-group">
					<label class="control-label">Login ID</label>
					<div class="controls">
						<div class="input-prepend">
							<span class="add-on"><i class="glyphicon glyphicon-user"></i></span> <input type="text" id="username" class="" name="j_username"  placeholder="Username">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">Password</label>
					<div class="input-group">
						<span class="glyphicon glyphicon-lock"></span> <input type="password" id="password" class=""  name="j_password" placeholder="Password">
					</div>
				</div>
				<div class="form-group">
					<div class="controls">
						<div class="input-prepend">
							<label class="checkbox"> <input type="checkbox" name="remember" value="1"> Remember Me
							</label>
						</div>
					</div>
				</div>
				<!-- <div class="input-prepend">
					<span class="add-on"><i class="glyphicon glyphicon-leaf"></i></span>
					<button type="submit" name="submit" class="btn btn-info btn-block">Sign in</button>
				</div> -->
				<button type="submit" name="submit" class="btn btn-success btn-block" id="cmdLogin">
					<span class="glyphicon glyphicon-log-in"></span> Login
				</button>
				<button type="button" name="cancel" class="btn btn-danger btn-block" id="cmdCancel">
					<span class="glyphicon glyphicon-remove-circle"></span> Cancel
				</button>
			</form>
		</div>
	</div>
</div>
</@u.trucklayout> 

