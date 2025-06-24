extends Control

@onready var modalSettings = $SettingsPanel

func _settings_button_pressed():
	modalSettings.visible = true

func _info_button_pressed():
	pass

func _help_button_pressed():
	pass

func _x_button_pressed():
	modalSettings.visible = false
