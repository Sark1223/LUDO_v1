extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://Mapas/MapaIsleño/tumba_del_heroe.tscn")
	DisplayServer.window_set_size(Vector2(942, 734))
	

func _on_btn_salir_pressed() -> void:
	get_tree().quit()