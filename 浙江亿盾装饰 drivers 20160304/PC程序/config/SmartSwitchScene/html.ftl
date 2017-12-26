<!-- ${device.dataProcessingCfg.displayName} -->
<#assign stateMap={"Open":"断开","Close":"闭合"}/>
<span class="deviceName">${device.name}</span>
<!--div>
	<span class="deviceVarName">调光器</span>
	<span class="deviceVarValue">${(device.data["Dimmer"])!"未知"}</span>
	<span class="deviceVarUnit">%</span>
</div-->
<div>
	<span class="deviceVarName">继电器1</span>
	<span class="deviceVarValue">${stateMap[device.data["Relay1"]]!"未知"}</span>
	<span class="deviceVarUnit">状态</span>
</div><div>
	<span class="deviceVarName">继电器2</span>
	<span class="deviceVarValue">${stateMap[device.data["Relay2"]]!"未知"}</span>
	<span class="deviceVarUnit">状态</span>
</div><div>
	<span class="deviceVarName">工作模式</span>
	<span class="deviceVarValue">${(device.data["WorkMode"])!"未知"}</span>
	<span class="deviceVarUnit"></span>
</div>
<hr/>
<form action="/command"  method="post" target="post_page">
	<input name="deviceId" type="hidden" value="${device.id}"/>
	<label class="deviceVarUnit" for="${device.id}_group">场景</label>
	<select name="group" id="${device.id}_state">
		<option value="1">第一组</option>
		<option value="2">第二组</option>
	</select>
	<button name="commandCode" type="submit" value="PerformScene">执行</button>
</form>