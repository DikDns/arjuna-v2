extends Control

# Variabel untuk menyimpan pertanyaan dan jawaban kuis
var kuis_data = [
	{
		"pertanyaan": "Hari Sabtu kamu sedang nonton kartun di ruang tamu, tiba-tiba lantai bergoyang pelan. Apa yang kamu lakukan?",
		"jawaban": [
			{"teks": "Masuk ke bawah meja dan tutup kepala dengan bantal", "skor": 10},
			{"teks": "Duduk diam sambil lihat sekeliling", "skor": 7},
			{"teks": "Panggil orang tua sambil berdiri", "skor": 5},
			{"teks": "Nangis dan bingung harus ngapain", "skor": 3}
		]
	},
	{
		"pertanyaan": "Setelah gempa selesai, kamu lihat kakakmu mulai membereskan barang yang jatuh. Kamu akan...",
		"jawaban": [
			{"teks": "Membantu beresin dan tetap hati-hati kalau ada pecahan", "skor": 10},
			{"teks": "Duduk di sofa sambil lihat-lihat keadaan", "skor": 7},
			{"teks": "Main HP karena merasa gempa sudah selesai", "skor": 5},
			{"teks": "Tanya-tanya \"kapan boleh main lagi?\"", "skor": 3}
		]
	},
	{
		"pertanyaan": "Pagi-pagi kamu bangun dan melihat air masuk ke dalam rumah. Banjir! Apa yang kamu lakukan?",
		"jawaban": [
			{"teks": "Ajak keluarga naik ke lantai atas/benda tinggi", "skor": 10},
			{"teks": "Cari senter dan alat penting bareng ibu", "skor": 7},
			{"teks": "Main air sebentar sebelum disuruh naik", "skor": 5},
			{"teks": "Duduk di kasur dan tunggu orang tua datang", "skor": 3}
		]
	},
	{
		"pertanyaan": "Di sekolah, kamu dan teman-teman sedang di lapangan. Tiba-tiba, guru bilang \"Kita latihan evakuasi bencana, ya!\" Kamu...",
		"jawaban": [
			{"teks": "Ikut baris rapi dan dengarkan instruksi", "skor": 10},
			{"teks": "Jalan sambil ngobrol sama teman", "skor": 7},
			{"teks": "Tanya-tanya, \"kenapa sih harus latihan?\"", "skor": 5},
			{"teks": "Lari ke arah yang salah karena panik", "skor": 3}
		]
	},
	{
		"pertanyaan": "Setelah letusan gunung, kamu tinggal sementara di tenda pengungsian. Di sana, kamu lihat ada anak kecil yang sedih. Kamu...",
		"jawaban": [
			{"teks": "Ajak main dan berbagi cemilan", "skor": 10},
			{"teks": "Senyum dan bilang 'jangan sedih ya'", "skor": 7},
			{"teks": "Lihat saja dari jauh", "skor": 5},
			{"teks": "Malah bermain sendiri tanpa mempedulikan", "skor": 3}
		]
	},
	{
		"pertanyaan": "Kamu sedang main di pantai, lalu air laut tiba-tiba surut jauh dan cepat. Semua orang mulai panik. Apa yang kamu lakukan?",
		"jawaban": [
			{"teks": "Ajak teman dan keluarga lari ke tempat tinggi", "skor": 10},
			{"teks": "Lihat dulu orang lain pergi ke mana", "skor": 7},
			{"teks": "Tanya-tanya kenapa airnya jadi begitu", "skor": 5},
			{"teks": "Penasaran dan jalan ke arah air", "skor": 3}
		]
	},
	{
		"pertanyaan": "Hari itu listrik padam dan orang tuamu bilang ada angin kencang di luar. Kamu...",
		"jawaban": [
			{"teks": "Tutup jendela, lalu duduk tenang di dalam rumah", "skor": 10},
			{"teks": "Intip lewat jendela untuk lihat anginnya", "skor": 7},
			{"teks": "Buka pintu sebentar lalu ditutup lagi", "skor": 5},
			{"teks": "Keluar rumah karena ingin tahu", "skor": 3}
		]
	},
	{
		"pertanyaan": "Di dekat rumahmu ada tanah yang mulai retak dan bergeser setelah hujan lebat. Kamu...",
		"jawaban": [
			{"teks": "Beritahu orang tua dan menjauh", "skor": 10},
			{"teks": "Foto dan kirim ke grup keluarga", "skor": 7},
			{"teks": "Ajak teman untuk lihat bareng", "skor": 5},
			{"teks": "Berdiri di dekat retakan sambil lihat-lihat", "skor": 3}
		]
	},
	{
		"pertanyaan": "Setelah bencana, kamu dan keluarga tinggal di tempat sementara. Tapi kamu kangen rumah. Apa yang kamu lakukan?",
		"jawaban": [
			{"teks": "Bantu beres-beres dan tetap semangat", "skor": 10},
			{"teks": "Curhat ke ibu sambil tetap bantu", "skor": 7},
			{"teks": "Cemberut dan tidak mau bicara", "skor": 5},
			{"teks": "Marah-marah dan tidak mau makan", "skor": 3}
		]
	},
	{
		"pertanyaan": "Saat terjadi kebakaran kecil di dapur, kamu mencium bau asap. Apa yang kamu lakukan?",
		"jawaban": [
			{"teks": "Beritahu orang tua dan cepat keluar rumah", "skor": 10},
			{"teks": "Mengajak adik keluar tanpa panik", "skor": 7},
			{"teks": "Diam saja dan tutup hidung", "skor": 5},
			{"teks": "Teriak dan lari sendiri", "skor": 3}
		]
	}
]

# Variabel untuk menyimpan node-node UI
@onready var pertanyaan_label = $PapanPertanyaan/PertanyaanLabel
@onready var option_buttons = [
	$OptionsGroup/Option1,
	$OptionsGroup/Option2,
	$OptionsGroup/Option3,
	$OptionsGroup/Option4
]
@onready var jawaban_labels = [
	$OptionsGroup/Option1/JawabanLabel,
	$OptionsGroup/Option2/JawabanLabel,
	$OptionsGroup/Option3/JawabanLabel,
	$OptionsGroup/Option4/JawabanLabel
]
@onready var score_label = $CurrentSkorPanel/ScoreLabel
@onready var result_panel = $ResultPanel
@onready var result_score_label = $ResultPanel/Panel/HBoxContainer/CurrentSkorPanel/CurrentSkorLabel
@onready var result_heading = $ResultPanel/Panel/Heading
@onready var restart_button = $ResultPanel/Panel/RestartButton
@onready var background = $bgtexture

# Variabel untuk menyimpan path background berdasarkan tipe bencana
var background_paths = {
	"gempa": "res://assets/kuis/gempa-bg.png",
	"banjir": "res://assets/kuis/banjir-bg.png",
	"longsor": "res://assets/kuis/longsor-bg.png",
	"gunung_meletus": "res://assets/kuis/gunung-meletus-bg.png"
}

# Variabel untuk menyimpan state kuis
var current_question_index = 0
var total_score = 0
var max_questions = 10
var best_score = 0
var shuffled_questions = []

func _ready():
	# Sembunyikan panel hasil
	result_panel.visible = false
	
	# Muat skor terbaik dari data tersimpan
	load_best_score()
	
	# Inisialisasi kuis
	initialize_quiz()
	
	# Hubungkan sinyal tombol jawaban
	for i in range(option_buttons.size()):
		option_buttons[i].pressed.connect(func(): _on_option_pressed(i))
	# Hubungkan sinyal tombol restart
	restart_button.pressed.connect(_on_restart_button_pressed)

# Fungsi untuk memuat skor terbaik
func load_best_score():
	var saved_score = Global.load_data("best_score_quiz")
	if saved_score != null:
		best_score = int(saved_score)
	else:
		best_score = 0

# Fungsi untuk menginisialisasi kuis
func initialize_quiz():
	AudioPlayer.play_bgm(AudioPlayer.BGM_TYPE.KUIS)

	# Reset skor dan indeks pertanyaan
	total_score = 0
	current_question_index = 0
	
	# Acak pertanyaan
	shuffle_questions()
	
	# Tampilkan pertanyaan pertama
	show_question(current_question_index)
	
	# Update tampilan skor
	update_score_display()

# Fungsi untuk mengacak pertanyaan dan jawaban
func shuffle_questions():
	# Buat salinan array pertanyaan
	shuffled_questions = kuis_data.duplicate(true)
	
	# Acak urutan pertanyaan
	shuffled_questions.shuffle()
	
	# Acak urutan jawaban untuk setiap pertanyaan
	for question in shuffled_questions:
		question["jawaban"].shuffle()

# Fungsi untuk menentukan tipe pertanyaan berdasarkan kata kunci
func determine_question_type(question_text):
	var question_text_lower = question_text.to_lower()
	
	if "gempa" in question_text_lower or "lantai bergoyang" in question_text_lower:
		return "gempa"
	elif "banjir" in question_text_lower or "air masuk" in question_text_lower:
		return "banjir"
	elif "tanah retak" in question_text_lower or "tanah bergeser" in question_text_lower or "longsor" in question_text_lower:
		return "longsor"
	elif "letusan gunung" in question_text_lower or "gunung" in question_text_lower:
		return "gunung_meletus"
	elif "air laut surut" in question_text_lower or "pantai" in question_text_lower or "tsunami" in question_text_lower:
		return "gempa" # Tsunami biasanya terkait dengan gempa
	elif "angin kencang" in question_text_lower:
		return "banjir" # Angin kencang sering terkait dengan hujan/banjir
	elif "kebakaran" in question_text_lower or "asap" in question_text_lower:
		return "gunung_meletus" # Kebakaran visual mirip dengan gunung meletus
	else:
		return "gempa" # Default jika tidak ada kata kunci yang cocok

# Fungsi untuk menampilkan pertanyaan
func show_question(index):
	# Pastikan indeks valid
	if index >= shuffled_questions.size():
		finish_quiz()
		return

	if index > 0:
		AudioPlayer.play_sfx_type("next_kuis")

	# Ambil data pertanyaan saat ini
	var current_question = shuffled_questions[index]
	
	# Tampilkan pertanyaan
	if pertanyaan_label:
		pertanyaan_label.text = current_question["pertanyaan"]
	else:
		push_error("Error: pertanyaan_label node not found")
	
	# Tampilkan jawaban
	for i in range(option_buttons.size()):
		if i < jawaban_labels.size() and jawaban_labels[i]:
			jawaban_labels[i].text = current_question["jawaban"][i]["teks"]
		else:
			push_error("Error: jawaban_label " + str(i) + " not found")
	
	# Ubah background berdasarkan tipe pertanyaan
	var question_type = determine_question_type(current_question["pertanyaan"])
	
	# Pastikan background node ada dan path texture valid
	if background:
		var texture_path = background_paths[question_type]
		var texture = load(texture_path)
		if texture:
			background.texture = texture
		else:
			push_error("Error: Could not load texture from path: " + texture_path)
	else:
		push_error("Error: background node not found")

# Fungsi untuk menangani ketika opsi jawaban dipilih
func _on_option_pressed(option_index):
	# Ambil data pertanyaan saat ini
	var current_question = shuffled_questions[current_question_index]
	
	# Tambahkan skor berdasarkan jawaban yang dipilih
	total_score += current_question["jawaban"][option_index]["skor"]
	
	# Update tampilan skor
	update_score_display()
	
	# Pindah ke pertanyaan berikutnya
	current_question_index += 1
	show_question(current_question_index)

# Fungsi untuk mengupdate tampilan skor
func update_score_display():
	score_label.text = str(total_score)

# Fungsi untuk menyelesaikan kuis
func finish_quiz():
	AudioPlayer.play_sfx_type("success")
	AudioPlayer.play_bgm(AudioPlayer.BGM_TYPE.MAIN)
	
	# Tampilkan panel hasil
	result_panel.visible = true
	
	# Sembunyikan elemen UI kuis
	$PapanPertanyaan.visible = false
	$OptionsGroup.visible = false
	$CurrentSkorPanel.visible = false
	
	# Update teks hasil
	result_heading.text = "Kamu berhasil menyelesaikan kuis!"
	result_score_label.text = str(total_score)
	
	# Periksa apakah skor saat ini lebih baik dari skor terbaik
	if total_score > best_score:
		best_score = total_score
		Global.save_data("best_score_quiz", str(best_score))
		result_heading.text = "Selamat! Kamu mendapatkan skor terbaik baru!"
	
	# Tambahkan informasi skor terbaik
	var best_score_node = $ResultPanel/Panel/HBoxContainer/BestSkorPanel
	if best_score_node:
		var best_score_label = best_score_node.get_node("BestSkorLabel")
		if best_score_label:
			best_score_label.text = str(best_score)
		else:
			push_error("Error: BestSkorLabel node not found")
	else:
		push_error("Error: BestSkorPanel node not found")
	
# Fungsi untuk memulai ulang kuis
func _on_restart_button_pressed():
	# Sembunyikan panel hasil
	result_panel.visible = false
	
	# Tampilkan kembali elemen UI kuis
	$PapanPertanyaan.visible = true
	$OptionsGroup.visible = true
	$CurrentSkorPanel.visible = true
	
	# Tampilkan kembali tombol opsi
	for button in option_buttons:
		button.visible = true
	
	# Mulai ulang kuis
	initialize_quiz()
