extends Button

func _ready():
	AudioPlayer.play_bgm(AudioPlayer.BGM_TYPE.MAIN)

	# Hubungkan sinyal pressed dengan fungsi _on_pressed
	pressed.connect(_on_pressed)

	# Cek apakah ada waktu terbaik yang tersimpan
	var best_score = Global.load_data("best_score_quiz")
	if best_score:
		var label_skor = $"../HBoxContainer/BestTimePanel/BestTimeLabel"
		label_skor.text = best_score

func _on_pressed():
	Global.add_scene(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/kuis_game.tscn")
