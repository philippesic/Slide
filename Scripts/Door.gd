extends Area2D

var canPass = false

signal door_interact

func interact():
	print("Level " + str(Manager.levelModifier) + ": " + str(Stopwatch.time_save))
	Manager.levelModifier += 1
	get_tree().change_scene_to_file("res://Scenes/Level" + str(Manager.levelModifier) + ".tscn")


func _on_player_interacted():
	if canPass:
		interact()


func _on_area_entered(area):
	canPass = true

func _on_area_exited(area):
	canPass = false
