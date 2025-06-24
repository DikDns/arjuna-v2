extends Control

# Variabel untuk tempat aman (akan diatur berdasarkan jenis scene)
var safe_places = []

# Variabel untuk timer
@export var timer = 30.0
var best_time = 0.0
@export var game_active = false
@export var children_safe = 0
@export var total_children = 2
var current_scene_type = ''

# Variabel untuk drag and drop
var dragging_child = null
var drag_offset = Vector2.ZERO

# Variabel untuk gempa
var shake_intensity = 2.0
var original_positions = {}
@onready var anak1_start_position = $anak1.global_position
@onready var anak2_start_position = $anak2.global_position

func _ready():
	# Deteksi jenis scene berdasarkan nama node
	current_scene_type = detect_scene_type()

	# Inisialisasi tempat aman dan instruksi berdasarkan jenis scene
	setup_scene(current_scene_type)

	# Simpan posisi awal untuk efek gempa
	for child in get_children():
		if child is TextureRect:
			print("Found TextureRect: ", child.name)
			# Untuk TextureRect, kita perlu menggunakan global_position
			original_positions[child.name] = child.global_position

	# Muat best_time dari global.gd
	best_time = Global.load_data(current_scene_type + "_best_time", 0.0)

	# Mulai permainan
	start_game()

	# Hubungkan sinyal
	$ResultPanel/Panel/RestartButton.connect("pressed", Callable(self, "restart_game"))

# Fungsi untuk mendeteksi jenis scene
func detect_scene_type() -> String:
	var scene_name = $Title.text.to_lower()
	if "rumah" in scene_name:
		return "rumah"
	elif "sekolah" in scene_name:
		return "sekolah"
	elif "supermarket" in scene_name:
		return "supermarket"
	else:
		return "rumah" # Default

# Fungsi untuk mengatur scene berdasarkan jenisnya
func setup_scene(scene_type: String) -> void:
	match scene_type:
		"rumah":
			safe_places = ["Meja"]
		"sekolah":
			safe_places = ["Meja"]
		"supermarket":
			safe_places = ["Meja"]
		_:
			safe_places = ["Meja"]

# Fungsi untuk memulai permainan
func start_game():
	timer = 30.0
	game_active = true
	children_safe = 0
	$ResultPanel.visible = false

# Fungsi untuk restart permainan
func restart_game():
	get_tree().reload_current_scene()

# Fungsi untuk update timer
func _process(delta):
	if game_active:
		# Update timer
		timer -= delta
		$CurrentTimePanel/TimerLabel.text = str(snapped(timer, 0.01))

		# Cek apakah waktu habis
		if timer <= 0:
			end_game(false)

		# Efek gempa
		apply_earthquake_effect()

# Fungsi untuk efek gempa
func apply_earthquake_effect():
	for node_name in original_positions.keys():
		var node = get_node(NodePath(node_name))
		if node != dragging_child: # Jangan goyangkan node yang sedang di-drag
			var random_offset = Vector2(
				randf_range(-shake_intensity, shake_intensity),
				randf_range(-shake_intensity, shake_intensity)
			)
			# Untuk TextureRect, kita perlu menggunakan global_position
			node.global_position = original_positions[node_name] + random_offset

# Fungsi untuk input
func _input(event):
	if not game_active:
		return

	# Deteksi input mouse (untuk desktop)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				# Cek apakah mengklik anak
				var mouse_pos = event.position
				var anak1 = $anak1
				var anak2 = $anak2

				# Gunakan get_global_rect() untuk mendapatkan area klik yang akurat
				var anak1_rect = anak1.get_global_rect()
				var anak2_rect = anak2.get_global_rect()

				print("Mouse position: ", mouse_pos)
				print("Anak1 rect: ", anak1_rect)
				print("Anak1 position: ", anak1.global_position)

				if anak1_rect.has_point(mouse_pos):
					dragging_child = anak1
					drag_offset = mouse_pos - anak1.global_position
					print("Mulai drag Anak1")
				elif anak2_rect.has_point(mouse_pos):
					dragging_child = anak2
					drag_offset = mouse_pos - anak2.global_position
					print("Mulai drag Anak2")
			else:
				# Lepas anak
				if dragging_child:
					print("Lepas drag anak")
					# Cek apakah anak berada di tempat aman
					check_safe_place()
					dragging_child = null

	# Deteksi gerakan mouse saat drag (untuk desktop)
	if event is InputEventMouseMotion and dragging_child:
		# Pindahkan anak
		dragging_child.global_position = event.position - drag_offset

	# Deteksi input touch (untuk mobile)
	if event is InputEventScreenTouch:
		if event.pressed:
			# Cek apakah menyentuh anak
			var touch_pos = event.position
			var anak1 = $anak1
			var anak2 = $anak2

			# Gunakan get_global_rect() untuk mendapatkan area klik yang akurat
			var anak1_rect = anak1.get_global_rect()
			var anak2_rect = anak2.get_global_rect()

			if anak1_rect.has_point(touch_pos):
				dragging_child = anak1
				drag_offset = touch_pos - anak1.global_position
			elif anak2_rect.has_point(touch_pos):
				dragging_child = anak2
				drag_offset = touch_pos - anak2.global_position
		else:
			# Lepas anak
			if dragging_child:
				# Cek apakah anak berada di tempat aman
				check_safe_place()
				dragging_child = null

	if event is InputEventScreenDrag and dragging_child:
		# Pindahkan anak
		dragging_child.global_position = event.position - drag_offset

# Fungsi untuk cek apakah anak berada di tempat aman
func check_safe_place():
	for safe_place in safe_places:
		if has_node(NodePath(safe_place)):
			var safe_node = get_node(NodePath(safe_place))

			# Gunakan get_global_rect() untuk mendapatkan area yang akurat
			var safe_rect = safe_node.get_global_rect()
			var child_rect = dragging_child.get_global_rect()

			print("Safe place: ", safe_place)
			print("Safe rect: ", safe_rect)
			print("Child rect: ", child_rect)

			# Cek apakah area anak bersinggungan dengan area tempat aman
			if safe_rect.intersects(child_rect):
				# Anak berada di tempat aman
				var child_name = dragging_child.name
				print("Anak " + child_name + " berada di tempat aman!")
				children_safe += 1
				original_positions[child_name] = safe_node.global_position

				# Cek apakah semua anak sudah aman
				if children_safe >= total_children:
					end_game(true)
				return # Keluar dari fungsi setelah menemukan tempat aman

# Fungsi untuk mengakhiri permainan
func end_game(success):
	game_active = false

	if success:
		$ResultPanel/Panel/TextureRect.visible = true
		$ResultPanel/Panel/Heading.visible = true
		
		# Simpan waktu terbaik
		if best_time == 0 or timer > best_time:
			best_time = timer
			Global.save_data(current_scene_type + "_best_time", best_time) # Simpan best_time ke global.gd

		# Tampilkan hasil
		$ResultPanel/Panel/Heading.text = "Kamu berhasil menyelesaikan permainan."
		$ResultPanel/Panel/HBoxContainer/CurrentTimePanel/CurrentTimeLabel.text = str(snapped(timer, 0.01)) + " detik."
		$ResultPanel/Panel/HBoxContainer/BestTimePanel/BestTimeLabel.text = str(snapped(best_time, 0.01)) + " detik"
	else:
		$ResultPanel/Panel/TextureRect.visible = false
		$ResultPanel/Panel/HBoxContainer.visible = false
		# Tampilkan hasil gagal
		$ResultPanel/Panel/Heading.text = "Waktu habis! Kamu belum berhasil menyelamatkan semua anak."
		$ResultPanel/Panel/HBoxContainer/CurrentTimePanel/CurrentTimeLabel.text = str(snapped(timer, 0.01)) + " detik."
		$ResultPanel/Panel/HBoxContainer/BestTimePanel/BestTimeLabel.text = str(snapped(best_time, 0.01)) + " detik"

	$ResultPanel.visible = true
