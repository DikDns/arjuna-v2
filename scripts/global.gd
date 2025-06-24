extends Node

enum MATERI_TYPE {
	GEMPA = 0,
	LONGSOR = 1,
	BANJIR = 2
}

var game_controller: GameController
var scenes_history: Array[String]
var save_path = OS.get_user_data_dir() + "/arjuna_data.cfg"

func prev_scene():
	if scenes_history.size() > 0:
		return scenes_history.pop_back()
	else:
		get_tree().quit()

func add_scene(scene: String):
	scenes_history.push_back(scene)

# Fungsi untuk menyimpan data ke file
# Di fungsi save_data
func save_data(key: String, value) -> void:
	print('save data dipanggil untuk key: ' + key + ' dengan nilai: ' + str(value))
	var config = ConfigFile.new()

	# Print path untuk debugging
	print("Saving to path: ", ProjectSettings.globalize_path(save_path))

	# Muat file konfigurasi jika sudah ada
	if FileAccess.file_exists(save_path):
		var err = config.load(save_path)
		if err != OK:
			print("Error loading save file: ", err)
			return

	# Simpan data
	config.set_value("SaveData", key, value)
	print("Saving data: ", key, " = ", value)

	# Tulis ke file
	var err = config.save(save_path)
	if err != OK:
		print("Error saving data: ", err)
	else:
		print("Data saved successfully")

# Fungsi untuk membaca data dari file
func load_data(key: String, default_value = null):
	var config = ConfigFile.new()

	# Cek apakah file ada
	if not FileAccess.file_exists(save_path):
		return default_value

	# Muat file konfigurasi
	var err = config.load(save_path)
	if err != OK:
		print("Error loading save file: ", err)
		return default_value

	# Baca data
	if config.has_section_key("SaveData", key):
		return config.get_value("SaveData", key)
	else:
		return default_value

# Di _ready() dari global.gd
func _ready():
	# Pastikan direktori ada
	var dir = DirAccess.open("user://")
	if dir:
		print("User directory exists: ", ProjectSettings.globalize_path("user://"))
	else:
		print("Failed to open user directory")
