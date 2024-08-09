

# Declare member variables here. Examples:
var speed = 10.0
var jump_speed = 20.0
var gravity = -9.8
var is_jumping = false

# Velocity vector
var velocity = Vector3()

func _ready():
	# Initialization code here
	pass

func _physics_process(delta):
	# Input handling
	var direction = Vector3()
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.z += 1
	if Input.is_action_pressed("ui_up"):
		direction.z -= 1
	
	direction = direction.normalized()
	
	# Calculate movement
	var move_direction = direction * speed
	
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		if Input.is_action_just_pressed("jump") and not is_jumping:
			velocity.y = jump_speed
			is_jumping = true
	
	# Update velocity
	velocity.x = move_direction.x
	velocity.z = move_direction.z
	
	# Move the character
	velocity = move_and_slide(velocity, Vector3.UP)
	
	# Check if character is back on the floor
	if is_on_floor():
		is_jumping = false
