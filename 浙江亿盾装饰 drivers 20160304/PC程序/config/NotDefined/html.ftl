<!-- ${device.dataProcessingCfg.displayName} -->
<span class="deviceName">${device.name}</span>
<span class="deviceVarName">(${device.profile})</span>
<#list device.data?keys as varName>
	<div> 
		<span class="deviceVarName">${varName}</span>
		<span class="deviceVarValue">${(device.data[varName])!"未知"}</span>
	</div>
</#list>
