extends Control

# Variabel untuk menyimpan waktu
var start_time = 0
var current_time = 0
var best_time = 999999 # Waktu terbaik (dalam milidetik)
var game_finished = false

# Variabel untuk menyimpan rambu dan deskripsinya
var rambu_data = [
	{"name": "Banjir", "description": "Kawasan Rawan
Bencana Banjir"},
	{"name": "Gempa", "description": "Kawasan Rawan
Bencana Gempa"},
	{"name": "Tsunami", "description": "Kawasan Rawan
Bencana Tsunami"},
	{"name": "Longsor", "description": "Kawasan Rawan
Bencana Longsor"},
	{"name": "Gunung Meletus", "description": "Kawasan Rawan
Bencana Gunung Api"}
]

# Variabel untuk menyimpan rambu yang sedang di-drag
var dragged_rambu = null
var drag_offset = Vector2.ZERO
var original_positions = {}

# Variabel untuk menyimpan jumlah rambu yang sudah benar
var correct_count = 0

# Referensi ke node-node UI
@onready var timer_label = $CurrentTimePanel/TimerLabel
@onready var rambu_container = $rambu_groups
@onready var description_container = $descriptions_group
@onready var result_panel = $ResultPanel
@onready var result_label = $ResultPanel/Panel/Heading
@onready var current_time_label = $ResultPanel/Panel/HBoxContainer/CurrentTimePanel/CurrentTimeLabel
@onready var best_time_label = $ResultPanel/Panel/HBoxContainer/BestTimePanel/BestTimeLabel
@onready var restart_button = $ResultPanel/Panel/RestartButton

func _ready():
	# Sembunyikan panel hasil
	result_panel.visible = false

	# Tunggu satu frame agar posisi rambu sudah benar
	await get_tree().process_frame

	# Simpan posisi awal rambu untuk kembalikan jika tidak cocok
	for rambu in rambu_container.get_children():
		original_positions[rambu.name] = rambu.global_position
		# Pastikan rambu bisa di-drag
		rambu.mouse_filter = Control.MOUSE_FILTER_PASS

	# Mulai timer
	start_time = Time.get_ticks_msec()

	# Cek apakah ada waktu terbaik yang tersimpan
	best_time = Global.load_data("best_time_rambu", 999999)

	print('best time: ' + str(best_time))

	restart_button.pressed.connect(_on_restart_button_pressed)

# Fungsi untuk memperbarui timer
func _process(_delta):
	if !game_finished:
		current_time = Time.get_ticks_msec() - start_time
		var seconds = current_time / 1000.0
		timer_label.text = "%0.2f" % seconds

# Fungsi untuk menangani input mouse
func _input(event):
	if game_finished:
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Cek apakah klik pada rambu
				for rambu in rambu_container.get_children():
					if rambu.get_global_rect().has_point(event.global_position):
						dragged_rambu = rambu
						drag_offset = event.global_position - rambu.global_position
						# Bawa rambu yang di-drag ke depan
						rambu.z_index = 1
						break
			else: # Mouse dilepas
				if dragged_rambu:
					# Reset z-index
					dragged_rambu.z_index = 0

					# Cek apakah rambu dilepas di atas deskripsi yang benar
					var matched = false

					# Dapatkan nama rambu yang sedang di-drag
					var rambu_name = dragged_rambu.name

					# Cek setiap container deskripsi
					for container in description_container.get_children():
						# Cek apakah ini container yang sesuai dengan rambu
						# Perlu menyesuaikan nama rambu dengan nama panel deskripsi
						var match_found = false

						# Periksa apakah ini adalah pasangan yang cocok
						if (rambu_name == container.name):
							match_found = true

						if match_found:
							# Ambil rambu_slot dari container deskripsi
							var rambu_slot = container.get_node("RambuSlot")

							# Cek apakah rambu dan container bersinggungan
							var rambu_rect = dragged_rambu.get_global_rect()
							var rambu_slot_rect = rambu_slot.get_global_rect()

							if rambu_rect.intersects(rambu_slot_rect):
								# Posisikan rambu di dalam rambu_slot
								var parent = dragged_rambu.get_parent()
								parent.remove_child(dragged_rambu)
								container.add_child(dragged_rambu)

								# Atur posisi rambu agar berada di posisi yang sama dengan rambu slot
								# Pastikan rambu berada tepat di atas rambu slot dengan menyesuaikan posisi
								dragged_rambu.global_position = rambu_slot.global_position
								dragged_rambu.scale = Vector2(1.2, 1.2)
								# Tandai sebagai cocok
								matched = true
								correct_count += 1

								# Cek apakah semua rambu sudah cocok
								if correct_count >= rambu_data.size():
									game_finished = true
									show_result()
								break

					if !matched:
						# Kembalikan rambu ke posisi awal dengan animasi halus
						var tween = create_tween()
						tween.tween_property(dragged_rambu, "global_position", original_positions[dragged_rambu.name], 0.2)

					dragged_rambu = null

	elif event is InputEventMouseMotion:
		if dragged_rambu:
			dragged_rambu.global_position = event.global_position - drag_offset

# Fungsi untuk menampilkan hasil
func show_result():
	# Hitung waktu akhir
	var final_time = current_time / 1000.0

	# Cek apakah ini waktu terbaik
	if current_time < best_time:
		best_time = current_time
		print('best time: ' + str(best_time))
		Global.save_data("best_time_rambu", best_time)

	# Tampilkan panel hasil
	result_label.text = "Kamu berhasil menyelesaikan permainan."
	current_time_label.text = "%0.2f" % final_time
	best_time_label.text = "%0.2f" % (best_time / 1000.0)
	result_panel.visible = true

# Fungsi untuk memulai ulang permainan
func _on_restart_button_pressed():
	get_tree().reload_current_scene()
