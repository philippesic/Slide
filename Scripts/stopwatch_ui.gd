extends Label

var format
	
func _process(delta):
	Stopwatch.time_save += delta
	format = round_float(Stopwatch.time_save, 3)
	self.text = str(format)

func round_float(num: float, decimal_places: int) -> float:
	var decimal_shift = pow(10, decimal_places)
	return round(num * decimal_shift) / decimal_shift
