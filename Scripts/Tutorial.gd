extends Node2D


func _ready():
	$Tips/Text/Tip9.visible = false
	

func _on_door_area_entered(area):
	$Tips/Text/Tip9.visible = true
