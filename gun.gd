extends Node3D

@export var Bullet: PackedScene
var rof_timer
var gun_controller
# Called when the node enters the scene tree for the first time.
var can_shoot = true
func _ready():
	rof_timer = $Timer
	rof_timer.wait_time = millis_between_shots/1000.0
	gun_controller = $GunController
@export var muzzle_speed = 30
@export var millis_between_shots = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func shoot():
	print("Gun Shoot")
	if can_shoot:
		var new_bullet = Bullet.instantiate()
		new_bullet.global_transform = $Muzzle.global_transform
		new_bullet.speed = muzzle_speed
		var scene_root = get_tree().get_root().get_child(0)
		scene_root.add_child(new_bullet)
		print("pew")
		can_shoot = false
		rof_timer.start()


func _on_timer_timeout():
	can_shoot = true
