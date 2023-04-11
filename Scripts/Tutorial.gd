extends Node2D

signal parent_ready

func _ready():
	$Tips/Text/Tip9.visible = false
	Manager.levelModifier = 0
	Manager.playerReference = "/root/Level" + str(Manager.levelModifier) + "/Player"
	emit_signal("parent_ready")
	
	

func _on_door_area_entered(area):
	$Tips/Text/Tip9.visible = true


func _on_death_box_area_entered(area):
	get_tree().change_scene_to_file("res://Scenes/Level0.tscn")
