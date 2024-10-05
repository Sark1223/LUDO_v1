extends CharacterBody2D

const fuera_base = false
var posicion_pieza

@onready var animation := $AnimationPlayer

func _physics_process(delta):
	animation.play("gato_salto")


## Esta función maneja el evento de clic
#func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#print("hola")
		#mostrar_info()  # Llama a la función para mostrar la información
#
## Muestra la información del personaje
#func mostrar_info():
	#print("Nombre del personaje:", name)  # Muestra el nombre del personaje
	## Aquí puedes mostrar más información si tienes más variables o datos
	#print("Posición del personaje:", global_position)
