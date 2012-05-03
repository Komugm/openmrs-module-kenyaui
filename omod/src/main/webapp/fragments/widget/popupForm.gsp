<%
	config.require("buttonConfig", "popupTitle")
	// config should be like the config of widget/form plus a buttonConfig, which is passed to widget/button
	
	def id = config.id ?: ui.randomId("popupForm")
	config.id = id

	config.cancelFunction = "closeDialog"
    
	def closeCallback = "closeDialog(false);"
	if (config.successCallbacks)
		config.successCallbacks << closeCallback
	else
		config.successCallbacks = [ closeCallback ]
	
	config.buttonConfig.onClick = "showDivAsDialog('#${ id }_form', '${ ui.escapeJs(config.popupTitle) }')"
%>

${ ui.includeFragment("widget/button", config.buttonConfig) }

<div id="${ id }_form" style="display: none">
    ${ ui.includeFragment("widget/form", config) }
</div>