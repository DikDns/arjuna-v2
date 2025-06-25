extends Control

func _ready() -> void:
	AudioPlayer.play_bgm(AudioPlayer.BGM_TYPE.MAIN)

func _on_rambu_bencana_pressed():
	Global.add_scene(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/rambu_bencana.tscn")

func _on_simulasi_bencana_pressed():
	Global.add_scene(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/simulasi_bencana.tscn")

func _on_perilaku_hidup_sehat_pressed():
	Global.add_scene(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/perilaku_hidup_sehat_menu.tscn")
