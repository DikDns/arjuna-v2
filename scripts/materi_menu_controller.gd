extends Control

func _on_gempa_pressed():
	Global.game_controller.change_gui_scene("res://scenes/materi.tscn", Global.MATERI_TYPE.GEMPA, false)

func _on_banjir_pressed():
	Global.game_controller.change_gui_scene("res://scenes/materi.tscn", Global.MATERI_TYPE.BANJIR, false)

func _on_longsor_pressed():
	Global.game_controller.change_gui_scene("res://scenes/materi.tscn", Global.MATERI_TYPE.LONGSOR, false)
