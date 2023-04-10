extends Node2D


func _ready():
	$Score.text = "Congratulations!\nFinal Time: " + str(Stopwatch.time_save)
