extends Node2D

signal parent_ready

func _ready():
	Manager.levelModifier = 1
	Manager.playerReference = "/root/Level" + str(Manager.levelModifier) + "/Player"
	emit_signal("parent_ready")
