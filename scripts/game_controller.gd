class_name GameController extends Node

@export var world_3d: Node3D
@export var world_2d: Node2D
@export var gui: Control

var current_3d_scene
var current_2d_scene
var current_gui_scene

var scene_history: Array[String] = []

func _ready() -> void:
	Global.game_controller = self
	current_gui_scene = $GUI/MateriMenu
	
func change_gui_scene(new_scene: String, delete = true, keep_running = false) -> void:
	if current_gui_scene != null:
		if delete:
			current_gui_scene.queue_free()
		elif keep_running:
			current_gui_scene.visible = false
		else:
			gui.remove_child(current_gui_scene)
	var new = load(new_scene).instantiate()
	gui.add_child(new)
	scene_history.push_back(new_scene)
	current_gui_scene = new

func go_back(delete = true, keep_running = false)-> void:
	if scene_history.size() > 0:
		change_gui_scene(scene_history.pop_back(), delete, keep_running)
	else:
		print('No Screen')

func change_2d_scene(new_scene: String, delete = true, keep_running = false) -> void:
	if current_2d_scene != null:
		if delete:
			current_2d_scene.queue_free()
		elif keep_running:
			current_2d_scene.visible = false
		else:
			world_2d.remove_child(current_2d_scene)
	var new = load(new_scene).instantiate()
	world_2d.add_child(new)
	current_2d_scene = new

func change_3d_scene(new_scene: String, delete = true, keep_running = false) -> void:
	if current_3d_scene != null:
		if delete:
			current_3d_scene.queue_free()
		elif keep_running:
			current_3d_scene.visible = false
		else:
			world_3d.remove_child(current_3d_scene)
	var new = load(new_scene).instantiate()
	world_3d.add_child(new)
	current_gui_scene = new
