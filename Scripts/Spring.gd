extends Area2D

var BOUNCE_FORCE = 1800

func _on_body_entered(body):
	if body.is_in_group("Player"):
		# calculate the bounce direction based on the rotation of the Spring node
		var direction = Vector2()

		if rotation_degrees > -1 and rotation_degrees < 1:
			direction = Vector2(0, -1)
		elif abs(rotation_degrees - 90) < 1:
			direction = Vector2(1, 0)
		elif abs(rotation_degrees + 90) < 1:
			direction = Vector2(-1, 0)
		elif abs(rotation_degrees + 180) < 1:
			direction = Vector2(0, 1)
			BOUNCE_FORCE /= 2

		var velocity = direction * BOUNCE_FORCE
		body.velocity = velocity
