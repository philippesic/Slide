extends CharacterBody2D

const STD_SPEED = 1400.0
const STD_ACCELERATION = 2000.0
const FRICTION = 60.0

var SPEED = STD_SPEED
var ACCELERATION = STD_ACCELERATION
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var slope_angle

func _physics_process(delta):
	
	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file("./Scenes/Tutorial.tscn")
	
	var dot = get_floor_normal().dot(Vector2.UP)
	var JUMP_VELOCITY = -(abs(velocity.x) / 3) - 500
	
	if dot < 1.0:
		slope_angle = acos(dot)

		velocity.y += gravity * delta * 1.3
		ACCELERATION = STD_ACCELERATION / 1.3

	var direction = Input.get_axis("left", "right")
	
	if direction > 0:
		$PlayerAnimation.play("right")
		
	elif direction < 0:
		$PlayerAnimation.play("left")
	
	else:
		$PlayerAnimation.play("idle")
	
	if direction:
		velocity.x += direction * ACCELERATION * delta
		velocity.x = clamp(velocity.x, -SPEED, SPEED)
		
	else:
		
		if abs(velocity.x) > FRICTION * delta:
			velocity.x -= FRICTION * delta * velocity.x / abs(velocity.x)
			
		else:
			velocity.x = 0
		velocity.x = move_toward(velocity.x, 0, FRICTION)


	if is_on_floor():
		
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			
		else:
			set_floor_snap_length(100.0)
	
		ACCELERATION = STD_ACCELERATION
		SPEED = STD_SPEED
		
		if abs(velocity.x) > FRICTION * delta:
			velocity.x -= FRICTION * delta * velocity.x / abs(velocity.x)
			
		else:
			velocity.x = 0
	

	if not is_on_floor():
		
		velocity.y += gravity * delta * 0.5
		
		if Input.is_action_just_pressed("jump") and is_on_wall():
			
			direction = -direction
			velocity.y -= 600
		
			if direction > 0:
				velocity.x += 600
			if direction < 0:
				velocity.x -= 600
			
	move_and_slide()


func _on_door_area_entered(area):
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene_to_file("res://Scenes/Title.tscn")
