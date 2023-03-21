extends Area2D

const BOUNCE_FORCE = 1000
const SPEED_BOOST = 300

func _on_Spring_body_entered(body):
	if body.is_in_group("/root/Level1/Player"):
		var direction = -global_transform.x.normalized()
		var velocity = direction * BOUNCE_FORCE
		velocity.x += body.velocity.x + SPEED_BOOST * direction.x
		body.velocity = velocity
