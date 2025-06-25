# Splash Screen Manager
# Script ini mengelola tampilan splash screen dengan animasi logo-logo
# Fitur:
# - Menampilkan logo secara berurutan dengan efek fade in/out dan skala
# - Efek suara saat logo muncul
# - Kemampuan untuk melewati splash screen dengan tap/klik
# - Transisi halus ke scene utama
extends Control

# Konstanta untuk durasi animasi
const FADE_IN_DURATION = 1.0
const DISPLAY_DURATION = 2.0
const FADE_OUT_DURATION = 0.5

# Logo yang akan ditampilkan secara berurutan
var logos = [
	"res://assets/brands/logo-upi.png",
	"res://assets/brands/logo-bppp.png",
]


# Variabel untuk melacak logo saat ini
var current_logo_index = 0
var tween: Tween

# Label untuk petunjuk melewati
var skip_label: Label = null

@onready var texture_rect = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sembunyikan logo pada awalnya
	texture_rect.modulate.a = 0
	# Mulai menampilkan logo secara berurutan
	show_next_logo()

# Variabel untuk melacak apakah splash screen dapat dilewati
var can_skip = false

# Fungsi untuk mengaktifkan kemampuan melewati splash screen
func _enable_skip() -> void:
	can_skip = true

	add_child(skip_label)

	# Animasi fade in untuk petunjuk
	var label_tween = create_tween()
	label_tween.tween_property(skip_label, "modulate:a", 1.0, 0.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Periksa apakah pengguna menekan tombol atau menyentuh layar untuk melewati splash screen
	if can_skip and (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_cancel") or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		# Hentikan tween yang sedang berjalan jika ada
		if tween and tween.is_valid():
			tween.kill()

		# Langsung lanjut ke scene utama
		go_to_main_scene()

# Fungsi untuk menampilkan logo berikutnya
func show_next_logo() -> void:
	# Periksa apakah masih ada logo yang perlu ditampilkan
	if current_logo_index < logos.size():
		var current_logo_path = logos[current_logo_index]
		var logo_texture = load(current_logo_path)

		# Periksa apakah logo berhasil dimuat
		if logo_texture:
			texture_rect.texture = logo_texture

			# Atur skala logo ke ukuran normal
			texture_rect.scale = Vector2(1.0, 1.0)

			# Aktifkan kemampuan melewati splash setelah logo pertama muncul
			if current_logo_index == 0:
				_enable_skip()

			# Buat tween baru untuk animasi
			tween = create_tween()

			# Animasi fade in sederhana
			tween.tween_property(texture_rect, "modulate:a", 1.0, FADE_IN_DURATION)

			# Tahan logo selama beberapa detik
			tween.tween_interval(DISPLAY_DURATION)

			# Animasi fade out
			tween.tween_property(texture_rect, "modulate:a", 0.0, FADE_OUT_DURATION)

			# Tunggu hingga animasi selesai
			await tween.finished

			# Lanjut ke logo berikutnya
			current_logo_index += 1
			show_next_logo()
		else:
			# Logo tidak berhasil dimuat, lanjut ke logo berikutnya
			current_logo_index += 1
			show_next_logo()
	else:
		# Semua logo telah ditampilkan, lanjut ke scene utama
		go_to_main_scene()

# Fungsi untuk beralih ke scene utama dengan transisi yang menarik
func go_to_main_scene() -> void:
	# Sembunyikan label petunjuk jika ada
	if skip_label:
		skip_label.visible = false

	# Buat efek transisi fade out untuk seluruh layar
	var transition_rect = ColorRect.new()
	transition_rect.color = Color(228, 238, 251, 0) # Hitam transparan
	transition_rect.size = get_viewport_rect().size
	transition_rect.set_anchors_preset(Control.PRESET_FULL_RECT) # Pastikan menutupi seluruh layar
	add_child(transition_rect)

	# Animasi fade out
	var final_tween = create_tween()
	final_tween.tween_property(transition_rect, "color:a", 1.0, 1.0) # Fade to black
	await final_tween.finished

	# Beralih ke scene utama
	get_tree().change_scene_to_file("res://scenes/start.tscn")
