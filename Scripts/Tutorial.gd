extends Node2D


func _ready():
	$Terrain/TerrainCollision.polygon = $Terrain/Path.curve.tessellate()
	$Terrain/Texture.points = $Terrain/Path.curve.tessellate()
