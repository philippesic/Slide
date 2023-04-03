extends Camera2D

@onready var player = get_node("/root/Level2/Player")

func _process(_delta):
	position.x = player.position.x
	position.y = player.position.y - 300

