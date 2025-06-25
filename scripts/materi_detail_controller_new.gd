extends Control

@onready var bg_texture = $bgtexture
@onready var papan_heading = $papan/heading
@onready var card_bg = $card/bg
@onready var card_heading = $card/heading
@onready var card_paragraph = $card/paragraph
@onready var button_sebelumnya = $buttons/ButtonSebelumnya
@onready var button_selanjutnya = $buttons/ButtonSelanjutnya

var materi_data = {}
var current_materi_type = ""
var current_section = ""
var current_content_index = 0
var contents = []

func _ready() -> void:
	# Get the materi type and section from Global
	current_materi_type = Global.game_controller.current_materi_type
	current_section = Global.game_controller.current_materi_section

	# Load the appropriate materi data
	load_materi_data()

	# Setup the scene with the loaded data
	setup_scene()

	# Connect button signals
	button_sebelumnya.pressed.connect(_on_button_sebelumnya_pressed)
	button_selanjutnya.pressed.connect(_on_button_selanjutnya_pressed)

# Load the materi data based on the current type and section
func load_materi_data() -> void:
	var materi_controller = MateriController.new()

	# Get the appropriate materi data
	if current_materi_type == Global.MATERI_TYPE.GEMPA:
		materi_data = materi_controller.materi["gempa"]
	elif current_materi_type == Global.MATERI_TYPE.LONGSOR:
		materi_data = materi_controller.materi["longsor"]
	else: # BANJIR
		materi_data = materi_controller.materi["banjir"]

	# Get the contents array for the current section
	contents = materi_data[current_section]["contents"]

# Setup the scene with the loaded data
func setup_scene() -> void:
	# Set the background texture
	bg_texture.texture = load(materi_data["bg"])

	# Set the papan heading
	var section_title = ""
	if current_section == "ciri-ciri":
		section_title = "Ciri-ciri"
	elif current_section == "penyebab":
		section_title = "Penyebab"
	else: # dampak
		section_title = "Dampak"

	papan_heading.text = section_title + " " + materi_data["name"]

	# Display the first content
	display_content(current_content_index)

	# Update navigation buttons
	update_navigation_buttons()

# Display the content at the given index
func display_content(index: int) -> void:
	if index >= 0 and index < contents.size():
		var content = contents[index]

		# Set the card heading
		card_heading.text = content["title"]

		# Set the card paragraph
		card_paragraph.text = content["description"]

		# Set the card background image
		card_bg.texture = load(content["image"])

		# Update the current index
		current_content_index = index

		# Update navigation buttons
		update_navigation_buttons()

# Update the navigation buttons based on the current index
func update_navigation_buttons() -> void:
	# Enable/disable the Sebelumnya button
	button_sebelumnya.disabled = (current_content_index <= 0)

	# Enable/disable the Selanjutnya button
	button_selanjutnya.disabled = (current_content_index >= contents.size() - 1)

# Handle the Sebelumnya button press
func _on_button_sebelumnya_pressed() -> void:
	if current_content_index > 0:
		display_content(current_content_index - 1)

# Handle the Selanjutnya button press
func _on_button_selanjutnya_pressed() -> void:
	if current_content_index < contents.size() - 1:
		display_content(current_content_index + 1)

# Handle the Back button press
func _on_back_button_pressed() -> void:
	# Go back to the materi menu
	Global.game_controller.change_gui_scene("res://scenes/materi.tscn", Global.game_controller.current_materi_type, false)
