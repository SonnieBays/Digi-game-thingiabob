extends Node3D

@export var speed = 70
const kill_time = 0.2
var timer =0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _physics_process(delta):
	var forward_direction =  global_transform.basis.z.normalized()
	global_translate(forward_direction *speed*delta)
	
	timer+= delta
	if timer >= kill_time:
		queue_free()
