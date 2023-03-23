extends Area2D

const BOUNCE_FORCE = 1800
const SPEED_BOOST = 3000


func _on_body_entered(body):
	if body.is_in_group("Player"):
		# calculate the bounce direction based on the rotation of the Spring node
		var rotation_deg = rotation_degrees * 180 / PI
		var direction = Vector2()
		
		if rotation_deg == 0:
			direction = Vector2(0, -1)
		if rotation_deg == 90:
			direction = Vector2(1, 0)
		if rotation_deg == 180:
			direction = Vector2(0, 1)
		if rotation_deg == 270:
			direction = Vector2(-1, 0)
			
		var velocity = direction * BOUNCE_FORCE
		velocity.x += body.velocity.x + SPEED_BOOST * direction.x
		body.velocity = velocity

