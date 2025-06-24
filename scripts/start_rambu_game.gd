extends Button

func _ready():
	# Hubungkan sinyal pressed dengan fungsi _on_pressed
	pressed.connect(_on_pressed)

	# Cek apakah ada waktu terbaik yang tersimpan
	var best_time = Global.load_data("best_time_rambu")
	if best_time:
		var seconds = float(best_time) / 1000.0
		# Perbarui label rekor tercepat
		var label_skor = $"../HBoxContainer/BestTimePanel/BestTimeLabel"
		label_skor.text = "%0.2f detik" % seconds

func _on_pressed():
	Global.add_scene(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/rambu_game.tscn")
