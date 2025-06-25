extends Control

# Variabel untuk menyimpan waktu
var start_time = 0
var current_time = 0
var best_time = 999999 # Waktu terbaik (dalam milidetik)
var game_finished = false

# Variabel untuk menyimpan item perilaku hidup sehat dan tidak sehat
var item_data = [
	{"name": "healty-1", "type": "healty", "shape": "lingkaran"},
	{"name": "healty-2", "type": "healty", "shape": "persegi"},
	{"name": "healty-3", "type": "healty", "shape": "segitiga"},
	{"name": "healty-4", "type": "healty", "shape": "persegi_panjang"},
	{"name": "healty-5", "type": "healty", "shape": "oktagon"},
	{"name": "unhealty-1", "type": "unhealty", "shape": "lingkaran"},
	{"name": "unhealty-2", "type": "unhealty", "shape": "persegi"},
	{"name": "unhealty-3", "type": "unhealty", "shape": "segitiga"},
	{"name": "unhealty-4", "type": "unhealty", "shape": "persegi_panjang"},
	{"name": "unhealty-5", "type": "unhealty", "shape": "oktagon"}
]

# Variabel untuk menyimpan item yang sedang di-drag
var dragged_item = null
var drag_offset = Vector2.ZERO
var original_positions = {}

# Variabel untuk menyimpan jumlah item yang sudah benar
var correct_count = 0

# Referensi ke node-node UI
@onready var timer_label = $CurrentTimePanel/TimerLabel
@onready var item_container = $activity_groups
@onready var descriptions_group = $descriptions_group
@onready var result_panel = $ResultPanel
@onready var current_time_label = $ResultPanel/Panel/HBoxContainer/CurrentTimePanel/CurrentTimeLabel
@onready var best_time_label = $ResultPanel/Panel/HBoxContainer/BestTimePanel/BestTimeLabel
@onready var restart_button = $ResultPanel/Panel/RestartButton

func _ready():
	# Sembunyikan panel hasil
	result_panel.visible = false

	# Tunggu satu frame agar posisi item sudah benar
	await get_tree().process_frame

	AudioPlayer.play_bgm(AudioPlayer.BGM_TYPE.PHBGAME)

	for item_info in item_data:
		var item = item_container.get_node(NodePath(item_info.name))
		if item:
			# Simpan posisi awal
			original_positions[item.name] = item.global_position

			# Pastikan item bisa di-drag
			item.mouse_filter = Control.MOUSE_FILTER_PASS

			# Simpan informasi tipe dan bentuk pada item untuk digunakan saat pencocokan
			item.set_meta("type", item_info.type)
			item.set_meta("shape", item_info.shape)

	for i in range(1, 6):
		# Untuk container healty
		var healty_item_name = "healty-" + str(i)
		var healty_slot = descriptions_group.get_node(NodePath(healty_item_name))
		if healty_slot:
			# Dapatkan bentuk dari item data
			for item_info in item_data:
				if item_info.name == healty_item_name:
					healty_slot.set_meta("shape", item_info.shape)
					break

		# Untuk container unhealty
		var unhealty_item_name = "unhealty-" + str(i)
		var unhealty_slot = descriptions_group.get_node(NodePath(unhealty_item_name))
		if unhealty_slot:
			# Dapatkan bentuk dari item data
			for item_info in item_data:
				if item_info.name == unhealty_item_name:
					unhealty_slot.set_meta("shape", item_info.shape)
					break

	# Mulai timer
	start_time = Time.get_ticks_msec()

	# Cek apakah ada waktu terbaik yang tersimpan
	best_time = Global.load_data("best_time_perilaku_hidup_sehat", 999999)
	restart_button.pressed.connect(_on_restart_button_pressed)

# Fungsi untuk memperbarui timer
func _process(_delta):
	if !game_finished:
		current_time = Time.get_ticks_msec() - start_time
		var seconds = current_time / 1000.0
		timer_label.text = "%0.2f" % seconds

# Fungsi untuk menangani input mouse dan touch
func _input(event):
	if game_finished:
		return

	# Handle mouse input
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				_handle_touch_down(event.global_position)
			else: # Mouse dilepas
				_handle_touch_up(event.global_position)

	elif event is InputEventMouseMotion:
		if dragged_item:
			_handle_touch_move(event.global_position)
	
	# Handle touch screen input
	elif event is InputEventScreenTouch:
		if event.pressed:
			_handle_touch_down(event.position)
		else:
			_handle_touch_up(event.position)
	
	elif event is InputEventScreenDrag:
		if dragged_item:
			_handle_touch_move(event.position)

# Fungsi untuk menangani sentuhan awal (touch down)
func _handle_touch_down(position):
	# Cek apakah sentuhan pada item
	for item_info in item_data:
		var item_name = item_info.name
		var item = item_container.get_node(NodePath(item_name))
		if item and item.get_global_rect().has_point(position):
			dragged_item = item
			drag_offset = position - item.global_position
			# Bawa item yang di-drag ke depan
			item.z_index = 1
			break

# Fungsi untuk menangani pergerakan sentuhan (touch move)
func _handle_touch_move(position):
	dragged_item.global_position = position - drag_offset

# Fungsi untuk menangani sentuhan dilepas (touch up)
func _handle_touch_up(position):
	if dragged_item:
		# Reset z-index
		dragged_item.z_index = 0

		# Cek apakah item dilepas di atas container yang benar
		var matched = false

		# Cari slot yang sesuai berdasarkan nama item
		var slot_name = dragged_item.name
		var target_slot = descriptions_group.get_node(NodePath(slot_name))

		if target_slot:
			# Cek apakah item dan slot bersinggungan
			var item_rect = dragged_item.get_global_rect()
			var slot_rect = target_slot.get_global_rect()

			if item_rect.intersects(slot_rect):
				AudioPlayer.play_sfx_type("correct")
				# Posisikan item di dalam slot
				var parent = dragged_item.get_parent()
				parent.remove_child(dragged_item)
				target_slot.add_child(dragged_item)

				# Reset ukuran dan properti tampilan
				dragged_item.scale = Vector2(0.00005, 0.00005)

				dragged_item.global_position = Vector2(target_slot.global_position.x + 40, target_slot.global_position.y + 45)
				# Nonaktifkan interaksi dengan item ini
				dragged_item.mouse_filter = Control.MOUSE_FILTER_IGNORE

				# Tandai sebagai cocok
				matched = true
				correct_count += 1

				# Cek apakah semua item sudah cocok
				if correct_count >= item_data.size():
					game_finished = true
					show_result()
					return

		if !matched:
			# Kembalikan item ke posisi awal dengan animasi halus
			var tween = create_tween()
			tween.tween_property(dragged_item, "global_position", original_positions[dragged_item.name], 0.2)

		dragged_item = null

# Fungsi untuk menampilkan hasil
func show_result():
	AudioPlayer.play_sfx_type("success")
	AudioPlayer.play_bgm(AudioPlayer.BGM_TYPE.MAIN)

	var final_time = current_time / 1000.0

	# Cek apakah ini waktu terbaik
	if current_time < best_time:
		best_time = current_time
		Global.save_data("best_time_perilaku_hidup_sehat", best_time)

	# Tampilkan panel hasil
	current_time_label.text = "%0.2f detik" % final_time
	best_time_label.text = "%0.2f detik" % (best_time / 1000.0)
	result_panel.visible = true

# Fungsi untuk me-restart permainan
func restart_game():
	# Sembunyikan panel hasil
	result_panel.visible = false

	# Reset variabel permainan
	game_finished = false
	correct_count = 0
	start_time = Time.get_ticks_msec()
	current_time = 0

	# Kembalikan semua item ke posisi awal
	for item_info in item_data:
		var item_name = item_info.name
		var item = item_container.get_node(NodePath(item_name))
		if item:
			# Jika item berada di container lain, pindahkan kembali
			if item.get_parent() != item_container:
				item.get_parent().remove_child(item)
				item_container.add_child(item)

			# Reset properti item
			item.z_index = 0
			item.mouse_filter = Control.MOUSE_FILTER_PASS
			item.scale = Vector2(1, 1)

			# Kembalikan ke posisi awal
			item.global_position = original_positions[item_name]

# Fungsi untuk memulai ulang permainan
func _on_restart_button_pressed():
	AudioPlayer.play_bgm(AudioPlayer.BGM_TYPE.PHBGAME)
	restart_game()
