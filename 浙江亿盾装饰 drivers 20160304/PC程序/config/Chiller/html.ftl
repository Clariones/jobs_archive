<!-- ${device.dataProcessingCfg.displayName} -->
<span class="deviceName">${device.name}</span>
<table>
	<tr><td valign="top"  width="300px">
<div>
	<span class="deviceVarName" style="width: 150px;">机组启停状态</span>
	<span class="deviceVarValue" title="${device.data['Chiller Running State']}">
		<#if device.data["Chiller Running State"] == "Stop">停止<#else>运行</#if>
	</span>
	<span class="deviceVarUnit"> </span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">防冻运行状态</span>
	<span class="deviceVarValue" title="${device.data['Chiller Antifreezing State']}">
		<#if device.data["Chiller Antifreezing State"] == "Stop">停止<#else>运行</#if>
	</span>
	<span class="deviceVarUnit"> </span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">机组故障指示</span>
	<span class="deviceVarValue" title="${device.data['Chiller Fault State']}">
		<#if device.data["Chiller Fault State"] == "No Alarm">无<#else>有告警</#if>
	</span>
	<span class="deviceVarUnit"> </span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">当前运行模式</span>
	<span class="deviceVarValue" title="${device.data['Chiller Working Mode']}">
		<#if device.data["Chiller Working Mode"] == "Cool">制冷<#else>制热</#if>
	</span>
	<span class="deviceVarUnit"> </span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">机油预加热状态</span>
	<span class="deviceVarValue" title="${device.data['Oil pre-Heating State']}">
		<#if device.data["Oil pre-Heating State"] == "No">否<#else>是</#if>
	</span>
	<span class="deviceVarUnit"> </span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">空调水泵状态</span>
	<span class="deviceVarValue" title="${device.data['AC Water Pump State']}">
		<#if device.data["AC Water Pump State"] == "OFF">关闭<#else>打开</#if>
	</span>
	<span class="deviceVarUnit"> </span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">辅助电加热状态</span>
	<span class="deviceVarValue" title="${device.data['Auxiliary Heating State']}">
		<#if device.data["Auxiliary Heating State"] == "OFF">关闭<#else>打开</#if>
	</span>
	<span class="deviceVarUnit"> </span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">和线控器通讯</span>
	<span class="deviceVarValue" title="${device.data['Communicate With Wired Controller']}">
		<#if device.data["Communicate With Wired Controller"] == "ERROR">故障<#else>正常</#if>
	</span>
	<span class="deviceVarUnit"> </span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">系统类型</span>
	<span class="deviceVarValue" title="${device.data['System Type']}">
		<#if device.data["System Type"] == "Only Cool">	仅制冷	<#else>	冷热	</#if>
	</span>
	<span class="deviceVarUnit"> </span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">运行模式设定</span>
	<span class="deviceVarValue" title="${device.data['Chiller Work Mode Setting']}">
		<#if device.data["Chiller Work Mode Setting"] == "Heat">冷暖<#else>单冷</#if>
	</span>
	<span class="deviceVarUnit"> </span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">机组制冷温度</span>
	<span class="deviceVarValue">${device.data["Chiller Refrideration Temperature"]}</span>
	<span class="deviceVarUnit">℃</span>
</div>
<div>
	<span class="deviceVarName" style="width: 150px;">机组制热温度</span>
	<span class="deviceVarValue">${device.data["Chiller Heat Temperature"]}</span>
	<span class="deviceVarUnit"> </span>
</div>
<hr/>
<div style="padding: 3px 30px;">
	<form action="/command"  method="post" target="post_page" style="display: inline-block">
		<input name="deviceId" type="hidden" value="${device.id}"/>
		<input name="state" type="hidden" value="Start"/>
		<button name="commandCode" type="submit" value="StartStopChiller">启动机组</button>
	</form>
	<form action="/command"  method="post" target="post_page" style="display: inline-block; float:right;">
		<input name="deviceId" type="hidden" value="${device.id}"/>
		<input name="state" type="hidden" value="Stop"/>
		<button name="commandCode" type="submit" value="StartStopChiller">关闭机组</button>
	</form>
</div>
<hr/>
<form action="/command"  method="post" target="post_page">
	<input name="deviceId" type="hidden" value="${device.id}"/>
	<button name="commandCode" type="submit" value="SetChillerFault">执行</button>
	<input name="state" type="radio" value="Clear Alarm" checked="checked"/>清除告警
	<input name="state" type="radio" value="Alarm"/>告警
</form>
<hr/>
<form action="/command"  method="post" target="post_page">
	<input name="deviceId" type="hidden" value="${device.id}"/>
	
	<label class="deviceVarUnit" for="${device.id}_cool">制冷(10.0~25.0)</label>
	<input name="cool" type="number" step="0.1" min="10.0" max="25.0" id="${device.id}_cool"/>
	
	<label class="deviceVarUnit" for="${device.id}_heat">制热(25.0~55.0)</label>
	<input name="heat" type="number" step="0.1" min="25.0" max="55.0" id="${device.id}_heat"/>

	<button name="commandCode" type="submit" value="SetCoolHeatTemperature">设定温度</button>
</form>
<hr/>
<form action="/command"  method="post" target="post_page">
	<input name="deviceId" type="hidden" value="${device.id}"/>
	<button name="commandCode" type="submit" value="SetChillerRunningMode">设定运行模式</button>
	<input name="state" type="radio" value="Cool" checked="checked"/>单冷
	<input name="state" type="radio" value="Heat"/>冷暖
</form>
	</td><td>
	<table border="1">
		<tr><th>模块号</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th><th>7</th><th>8</th></tr>
		<tr>
			<td><span class="deviceVarName">在线状态</span></td>
			<#list 1..8 as i>
			<td><span class="deviceVarValue">${device.data["Module " + i + " Online"]}</span></td>
			</#list>
		</tr>
		<tr>
		<td><span class="deviceVarName">压缩机电流</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " Compressor Current"]}</span></td>
		</#list>
	</tr>
	<tr>
		<td><span class="deviceVarName">压缩机状态</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " Compressor State"]}</span></td>
		</#list>
	</tr>
	<tr>
		<td><span class="deviceVarName">系统融霜运行</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " Defrost Running"]}</span></td>
		</#list>
	</tr>
	<tr>
		<td><span class="deviceVarName">环境温度</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " Environment Temperature"]}</span></td>
		</#list>
	</tr>
	<tr>
		<td><span class="deviceVarName">排气温度</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " Exhause Air Temperature"]}</span></td>
		</#list>
	</tr>
	<tr>
		<td><span class="deviceVarName">故障码</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " Fault Code"]}</span></td>
		</#list>
	</tr>
	<tr>
		<td><span class="deviceVarName">翅片温度</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " Fin Temperature"]}</span></td>
		</#list>
	</tr>
	<tr>
		<td><span class="deviceVarName">进水口温度</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " Inlet Water Temperature"]}</span></td>
		</#list>
	</tr>
	<tr>
		<td><span class="deviceVarName">输入电压</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " Input Voltage"]}</span></td>
		</#list>
	</tr>
	<tr>
		<td><span class="deviceVarName">IO板输出</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " IO Board Output"]}</span></td>
		</#list>
	</tr>
	<tr>
		<td><span class="deviceVarName">出水口温度</span></td>
		<#list 1..8 as i>
		<td><span class="deviceVarValue">${device.data["Module " + i + " Outlet Water Temperature"]}</span>/td>
		</#list>
	</tr>
	</table>
	</td></tr>
</table>


