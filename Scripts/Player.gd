extends CharacterBody2D

const STD_SPEED = 1400.0
const STD_ACCELERATION = 2000.0
const STD_FRICTION = 60.0

var SPEED = STD_SPEED
var ACCELERATION = STD_ACCELERATION
var FRICTION = STD_FRICTION
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var slope_angle
var springX
var springY

signal interacted

@onready var scene = get_tree().current_scene.name
var currentScene = "res://Scenes/" + str(scene) + ".tscn"

@onready var canProceed = false

func _ready():
	pass

func _physics_process(delta):
	print(str(position.x) + ", " + str(position.y) )

	if Input.is_action_just_pressed("reset"):
		get_tree().change_scene_to_file(currentScene)
	
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
		FRICTION = STD_FRICTION
		
		if abs(velocity.x) > FRICTION * delta:
			velocity.x -= FRICTION * delta * velocity.x / abs(velocity.x)
			
		else:
			velocity.x = 0
	

	if not is_on_floor():
		
		ACCELERATION = STD_ACCELERATION * 1.5
		FRICTION = STD_FRICTION * 1.5
		
		velocity.y += gravity * delta * 0.5
		
		if is_on_wall():
			
			if velocity.y > 0:
				velocity.y -= gravity * delta * 1.4
			
			if Input.is_action_just_pressed("jump"):
				direction = -direction
				
				if velocity.y < -1200:
					velocity.y  = -abs(velocity.y) * 1.4 - 400
				
				else:
					velocity.y -= 800 - gravity * delta
			
				if direction > 0:
					velocity.x += 800
				if direction < 0:
					velocity.x -= 800
			
	move_and_slide()
	
	if Input.is_action_just_pressed("enter"):
		emit_signal("interacted")
