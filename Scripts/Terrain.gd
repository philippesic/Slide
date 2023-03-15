extends StaticBody2D

func _ready():
	$Collision.polygon = $Path.curve.tessellate()
	$Texture.points = $Path.curve.tessellate()
