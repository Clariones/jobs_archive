<span class="deviceName">${device.name}</span>
<div>
	<span class="deviceVarName">二氧化碳浓度</span>
	<span class="deviceVarValue">${(device.data["CO2 Concentration"])!"未知"}</span>
	<span class="deviceVarUnit">ppm</span>
</div><div>
	<span class="deviceVarName">调整偏移量</span>
	<span class="deviceVarValue">${(device.data["Measuring Range Offset"])!"未知"}</span>
	<span class="deviceVarUnit">%</span>
</div><div>
	<span class="deviceVarName">测量范围当量</span>
	<span class="deviceVarValue">${(device.data["Range Scale Factor"])!"未知"}</span>
	<span class="deviceVarUnit"></span>
</div>
