extends Control

var world = "res://world.tscn"
var store = "res://store.tscn"
var options = "res://options.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	get_tree().change_scene_to_file(world)


func _on_options_button_pressed():
	get_tree().change_scene_to_file(options)



func _on_store_button_pressed():
	get_tree().change_scene_to_file(store)
