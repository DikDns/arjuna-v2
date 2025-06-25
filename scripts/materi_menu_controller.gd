extends Control

func _ready() -> void:
	AudioPlayer.play_bgm(AudioPlayer.BGM_TYPE.MATERI)

func _on_gempa_pressed():
	Global.game_controller.change_gui_scene("res://scenes/materi.tscn", Global.MATERI_TYPE.GEMPA, false)

func _on_banjir_pressed():
	Global.game_controller.change_gui_scene("res://scenes/materi.tscn", Global.MATERI_TYPE.BANJIR, false)

func _on_longsor_pressed():
	Global.game_controller.change_gui_scene("res://scenes/materi.tscn", Global.MATERI_TYPE.LONGSOR, false)
