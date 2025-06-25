extends Control

func _ready() -> void:
	AudioPlayer.play_bgm(AudioPlayer.BGM_TYPE.MAIN)

func _on_simulasi_bencana_rumah_pressed():
	Global.add_scene(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/simulasi_bencana_rumah.tscn")

func _on_simulasi_bencana_sekolah_pressed():
	Global.add_scene(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/simulasi_bencana_sekolah.tscn")

func _on_simulasi_bencana_supermarket_pressed():
	Global.add_scene(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/simulasi_bencana_supermarket.tscn")
