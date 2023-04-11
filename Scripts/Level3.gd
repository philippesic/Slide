extends Node2D

signal parent_ready

func _ready():
	Manager.levelModifier = 3
	Manager.playerReference = "/root/Level" + str(Manager.levelModifier) + "/Player"
	emit_signal("parent_ready")



func _on_death_box_area_entered(area):
	get_tree().change_scene_to_file("res://Scenes/Level3.tscn")
