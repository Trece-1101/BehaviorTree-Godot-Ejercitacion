tool
extends Decorator
class_name Inverter, "res://assets/inverter_icon.png"

# Metodo run
func run(tick: Tick) -> int:
	for child in get_children():
		var result: int = child._execute(tick)
		
		if result == ERR_BUSY:
			return result
		elif result == OK:
			return FAILED
		elif result == FAILED:
			return OK
		else:
			return result
	
	return ERR_BUG
