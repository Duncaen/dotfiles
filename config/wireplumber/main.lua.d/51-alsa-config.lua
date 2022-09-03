rule = {
	matches = {
		{
			{"device.nick", "equals", "HDA ATI HDMI"},
		},
	},
	apply_properties = {
		["device.disabled"] = true,
	},
}
table.insert(alsa_monitor.rules, rule)

rule = {
	matches = {
		{
			{"node.name", "equals", "alsa_output.pci-0000_2a_00.4.analog-stereo"},
		},
	},
	apply_properties = {
		["node.description"] = "HIFIMAN Sundara",
		["node.nick"] = "HIFIMAN Sundara",
		["device.icon-name"] = "audio-headphones-analog-pci",
	},
}
table.insert(alsa_monitor.rules, rule)

rule = {
	matches = {
		{
			{"node.name", "equals", "alsa_output.usb-Logitech_Logitech_G430_Gaming_Headset-00.analog-stereo"},
		},
	},
	apply_properties = {
		["node.description"] = "AKG K371",
		["node.nick"] = "AKG K371",
		["device.icon-name"] = "audio-headphones-analog-usb",
	},
}
table.insert(alsa_monitor.rules, rule)

rule = {
	matches = {
		{
			{"node.name", "equals", "alsa_output.usb-Creative_Technology_Ltd_Sound_BlasterX_G5_6B0061476AX-00.analog-stereo"},
		},
	},
	apply_properties = {
		["node.description"] = "Sennheiser HD560S",
		["node.nick"] = "Sennheiser HD560S",
		["device.icon-name"] = "audio-headphones-analog-usb",
	},
}
table.insert(alsa_monitor.rules, rule)
