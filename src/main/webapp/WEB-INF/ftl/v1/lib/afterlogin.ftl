<#macro afterlogin>
<#import "layout.ftl" as u>
<@u.layoutnew>
	<div class="row">
		<div class="col-sm-2"><#include "../menu.ftl"></div>
		<div class="col-sm-10 panel">
			<div class="panel-body">
				<div id="smartbody">
					<!-- <ul class="breadcrumb">
						<li><a href="#">Home</a> <span class="divider"></span></li>
					</ul> -->
					<#nested>
				</div>
			</div>
		</div>
	</div>
</@u.layoutnew>
</#macro>