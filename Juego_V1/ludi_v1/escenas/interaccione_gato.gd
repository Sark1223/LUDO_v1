extends Sprite2D

func _input(event):
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT: 
		print("hola")
		if mouseOverSprite():
			print("Clic en: " + name) # Imprime el nombre del objeto seleccionado

func mouseOverSprite():
	var rec = get_rect()
	rec.position += position
	if rec.has_point(get_global_mouse_position()):
		return true
	return false
