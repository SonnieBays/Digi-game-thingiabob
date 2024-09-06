extends CharacterBody3D
# Declare member variables here
var speed = 10.0
var jump_speed = 20.0
var gravity = -98
var is_jumping = false
@onready var gun_controller = $"gun controller"



@export var camera : Camera3D
@export var navigation_agent : NavigationAgent3D

func _process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var new_velocity = movement()
	
	velocity.x = new_velocity.x;
	velocity.z = new_velocity.z;
	
	move_and_slide()

func _input(event):
	if Input.is_action_just_pressed("Primary_action"):
		get_world_pos();

func get_world_pos() -> void:
	var key_pos = get_viewport().get_mouse_position();
	var ray_length = 100;
	var from = camera.project_ray_origin(key_pos);
	var to = from + camera.project_ray_normal(key_pos) * ray_length;
	var space = get_world_3d().direct_space_state;
	var ray_query = PhysicsRayQueryParameters3D.new();
	ray_query.from = from;
	ray_query.to = to;


	var result = space.intersect_ray(ray_query)
	navigation_agent.target_position = result.position;

func movement() -> Vector3:
	var next_path_position = navigation_agent.get_next_path_position()
	var current_agent_position = global_position 
	
	var new_velocity = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized() * speed
	
	return Vector3(new_velocity.x, velocity.y, new_velocity.z)

func _ready():
	# Initialization code here
	pass

func _physics_process(delta):
	# Input handling
	var direction = Vector3()
	
	
	direction = direction.normalized()
	if Input.is_action_pressed("primary_action"):
		print("primary action")
		gun_controller.shoot()
	# Calculate movement
	var move_direction = direction * speed
	
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Update velocity
	velocity.x = move_direction.x
	velocity.z = move_direction.z
	# Check if character is back on the floor
	if is_on_floor():
		is_jumping = false
	
	move_and_slide()


