extends Camera2D

var player

func _process(_delta):
	position.x = player.position.x
	position.y = player.position.y - 300



func _on_level_1_parent_ready():
	player = get_node(Manager.playerReference)


func _on_level_2_parent_ready():
	player = get_node(Manager.playerReference)


func _on_level_3_parent_ready():
	player = get_node(Manager.playerReference)
