class_name AnimationComponent extends Node

@export var hover_scale: Vector2 = Vector2(1.1, 1.1)
@export var pressed_scale: Vector2 = Vector2(0.9, 0.9)
@export var animation_speed: float = 0.5
@export var is_center_pivot: bool = true
@export var auto_connect: bool = true
@export_enum("None", "Hover", "Pressed", "Normal") var default_state: int = 0

@onready var parent = get_parent()
var original_scale: Vector2
var tween: Tween
var current_state: int = 0 # 0: normal, 1: hover, 2: pressed

func _ready():
	if parent:
		original_scale = parent.scale

		# Set pivot to center if needed
		if is_center_pivot:
			_set_center_pivot()

		if auto_connect:
			_connect_signals()

		# Apply default state if specified
		if default_state > 0:
			if default_state == 1: # Hover
				play_hover_animation()
			elif default_state == 2: # Pressed
				play_pressed_animation()
			elif default_state == 3: # Normal
				play_normal_animation()


func _connect_signals():
	# Connect signals if parent is a Control node
	if parent is Control:
		parent.mouse_entered.connect(_on_parent_mouse_entered)
		parent.mouse_exited.connect(_on_parent_mouse_exited)

		# Check if it's a button-like control
		if parent.has_signal("button_down") and parent.has_signal("button_up"):
			parent.button_down.connect(_on_parent_button_down)
			parent.button_up.connect(_on_parent_button_up)

	# Connect signals if parent has area entered/exited signals (like Area2D)
	elif parent.has_signal("mouse_entered") and parent.has_signal("mouse_exited"):
		parent.mouse_entered.connect(_on_parent_mouse_entered)
		parent.mouse_exited.connect(_on_parent_mouse_exited)

		if parent.has_signal("input_event"):
			parent.input_event.connect(_on_parent_input_event)

	# For other node types, we'll use the public methods to trigger animations manually

# Signal handlers
func _on_parent_mouse_entered():
	play_hover_animation()


func _on_parent_mouse_exited():
	play_normal_animation()


func _on_parent_button_down():
	play_pressed_animation()


func _on_parent_button_up():
	play_hover_animation()


func _on_parent_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			play_pressed_animation()
		else:
			play_hover_animation()


# Public methods for manual animation control
func play_normal_animation() -> void:
	current_state = 0
	_animate_scale(original_scale)


func play_hover_animation() -> void:
	current_state = 1
	_animate_scale(original_scale * hover_scale)


func play_pressed_animation() -> void:
	current_state = 2
	_animate_scale(original_scale * pressed_scale)


# Get current animation state (0: normal, 1: hover, 2: pressed)
func get_current_state() -> int:
	return current_state


# Force connect signals (useful when parent changes or for manual setup)
func force_connect_signals() -> void:
	_connect_signals()


# Set the pivot point to center for the parent node
func _set_center_pivot() -> void:
	if parent is Control:
		parent.pivot_offset = parent.size / 2

	elif parent is Node2D:
		# For Node2D nodes like Sprite2D, Area2D, etc.
		if parent.has_method("get_rect"):
			var rect = parent.get_rect()
			parent.offset = rect.size / 2
		elif parent is Sprite2D:
			# Directly set the centered property for Sprite2D
			parent.centered = true

# Animation helper
func _animate_scale(target_scale: Vector2) -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(parent, "scale", target_scale, animation_speed)
