<#if model["messagetype"]?? && (model["messagetype"] == "Success")>
<div class="alert alert-success">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Success: </strong>${model["message"]}
</div>
<#elseif model["messagetype"]?? && ((model["messagetype"]) == "Failed")>
<div class="alert alert-danger">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Failed: </strong>${model["message"]}
</div>
</#if>
