extends TextureButton

func _ready():
	$".".pressed.connect(_button_pressed)

func _button_pressed():
	Global.add_scene(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file("res://scenes/materi_scene_switcher.tscn")
