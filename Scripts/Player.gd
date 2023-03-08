extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -800.0
const ACCELERATION = 3000.0
const FRICTION = 20.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	else:
		set_floor_snap_length(5)
		if abs(velocity.x) > FRICTION * delta:
			velocity.x -= FRICTION * delta * velocity.x / abs(velocity.x)
		else:
			velocity.x = 0
				
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x += direction * ACCELERATION * delta
		velocity.x = clamp(velocity.x, -SPEED, SPEED)
		
	else:

		if abs(velocity.x) > FRICTION * delta:
			velocity.x -= FRICTION * delta * velocity.x / abs(velocity.x)
		else:
			velocity.x = 0
		velocity.x = move_toward(velocity.x, 0, FRICTION)

	move_and_slide()
