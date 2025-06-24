extends Control

func _ready():	
	var best_time = Global.load_data("best_time_perilak_hidup_sehat")
	if best_time:
		var seconds = float(best_time) / 1000.0
		# Perbarui label rekor tercepat
		var label_skor = get_node("Panel/HBoxContainer/BestTimePanel/BestTimeLabel")
		label_skor.text = "%0.2f detik" % seconds

func _on_Start_Button_pressed():
	Global.add_scene(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/perilaku_hidup_sehat_game.tscn")
