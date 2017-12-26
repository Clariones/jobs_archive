<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html;charset=gb2312">
		<title>Control4 数据 </title>
	</head>
	<script type="text/javascript">
function toggleShow(itemId){
	var traget=document.getElementById(itemId);
	if(traget.style.display=="none"){
		traget.style.display="";
	}else{
		traget.style.display="none";
	}
}
    </script>
    <style>
.groupDiv{
    padding:10px; 
    border: 2px solid #4c9ed9;
    background-color: #4c9ed9;
    -moz-border-radius: 15px; 
    -webkit-border-radius: 15px; 
    border-radius:15px;
    margin: 10px;
}
.groupName{
    color: #FFFFFF;
    font-weight: bold;
}
.deviceDiv{
	display: inline-block;
	margin: 5px;
	padding:5px; 
    background-color: #C5E0F3;
    -moz-border-radius: 15px; 
    -webkit-border-radius: 15px; 
    border-radius:8px;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ebf7ff', endColorstr='#cbedff');
	background:-webkit-gradient(linear,left top,left bottom,from(#ebf7ff),to(#cbedff));
	background:-moz-linear-gradient(top,#ebf7ff,#E7FBC7);
	background:-o-linear-gradient(top,#ebf7ff,#E7FBC7);
	vertical-align: top;
}
.deviceName{
	min-width: 200px;
	display: block;
	color: #156B7A;
	font-weight: initial;
	font-style: oblique;
	font-size-adjust: 0.7;
	text-align: center;
}
.deviceVarName{
	min-width: 120px;
	display: inline-block;
	padding:1px 0px 1px 10px;
	color: #156B7A;
}
.deviceVarValue{
	min-width: 50px;
	display: inline-block;
	text-align: right;
	font-size:24px;
}
.deviceVarUnit{
	min-width: 30px;
	display: inline-block;
	color: #156B7A;
}
    </style>
	<body>
	
<h1>Control4数据查看</h1>
<#assign groupId=1/>
<#if groups?has_content>
<#list groups?keys as profile>
	<#assign group = groups[profile]/>
	<#assign groupCfg = profiles[profile]/>
	<#if (groupCfg.startTemplate)?has_content && (groupCfg.endTemplate)?has_content>
		<#include groupCfg.startTemplate/>
		<div id="div_${groupId}">
			<#list group as deviceId>
				<#assign device = devices[deviceId]/>
				<div class="deviceDiv">
				<#include device.dataProcessingCfg.htmlTemplate/>
				</div>
			</#list>
		</div>
		<#include groupCfg.endTemplate/>
	<#else>
	<div class="groupDiv">
		<div class="groupName" onclick="toggleShow('div_${groupId}')">${(groupCfg.displayName)!profile} 数据</div>
		<div id="div_${groupId}">
			<#list group as deviceId>
				<#assign device = devices[deviceId]/>
				<div class="deviceDiv">
				<#include device.dataProcessingCfg.htmlTemplate/>
				</div>
			</#list>
		</div>
	</div>
	</#if>
	<#assign groupId=groupId+1/>
</#list>	
<#else>
	<div class="deviceDiv">
		<span class="deviceName">没有收到任何数据</span>
	</div>
</#if>

<iframe id="post_page" name="post_page" style="display:none;"></iframe> 
	</body>
</html>