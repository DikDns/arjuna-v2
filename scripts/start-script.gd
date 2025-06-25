extends Control

@onready var modalSettings = $SettingsPanel

@onready var MUSIC_BUS_ID = AudioServer.get_bus_index("Music")

func _ready() -> void:
	AudioPlayer.play_bgm(AudioPlayer.BGM_TYPE.MAIN)

func _settings_button_pressed():
	modalSettings.visible = true

func _info_button_pressed():
	pass

func _help_button_pressed():
	pass

func _x_button_pressed():
	modalSettings.visible = false

func _on_music_button_toggled(is_on: bool):
	AudioServer.set_bus_mute(MUSIC_BUS_ID, !is_on)
