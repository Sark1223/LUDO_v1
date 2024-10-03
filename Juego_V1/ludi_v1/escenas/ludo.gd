extends Sprite2D

const tablero_tamanio = 13;
const cell_with = 50; #Tamaño de cada cuadro donde saltaran

const TEXTURE_HOLDER = preload("res://escenas/texture_holder.tscn")

#PERSONAJES 
const GATO_SALTO = preload("res://escenas/gato_salto.tscn")
const SOMBRERO = preload("res://escenas/sombrero.tscn")

#Personajes
#const gato_salto  = preload("res://Rocky Roads/Rocky Roads/Personajes/gato_salto.png");
const STATIC_CAT = preload("res://Rocky Roads/Rocky Roads/Personajes/static_cat.png")
const TORTUGA = preload("res://Rocky Roads/Rocky Roads/Personajes/tortuga.png")

@onready var piezas = $piezas
@onready var posicion_mov = $posicion_mov
@onready var turno = $turno

var tablero : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 1, 0, 1, 0, 0, 0, 0, 0, 2, 0, 2, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 1, 0, 1, 0, 0, 0, 0, 0, 2, 0, 2, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 3, 0, 3, 0, 0, 0, 0, 0, 1, 0, 1, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 3, 0, 3, 0, 0, 0, 0, 0, 1, 0, 1, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])


	display_board()
	
func display_board():
	var noPiezaP1 = 0
	var noPiezaP2 = 0
	var noPiezaP3 = 0
	var noPiezaP4 = 0
	for y in range(tablero_tamanio):
		for x in range(tablero_tamanio):
			var holder = TEXTURE_HOLDER.instantiate()
			piezas.add_child(holder)
			
			if (y == 1):#Acomodar los personajes de arriba correctamente en la base
				holder.global_position = Vector2(((x * cell_with)  + (cell_with / 5)) - 300, ((y * cell_with) + (cell_with/3)) - 305)
			elif ( y == 11):#Acomodar los personajes de abajo correctamente en la base
				holder.global_position = Vector2(((x * cell_with)  + (cell_with / 5)) - 300, ((y * cell_with) - (cell_with/3)) - 305)
			else:
				holder.global_position = Vector2(((x * cell_with)  + (cell_with / 5)) - 300, ((y * cell_with)) - 300)
			
			#CUADRANTE 1
			#Posicion del personaje 1 en el cuadrante 1 Vector2(-262,-225)
			#Posicion del personaje 2 en el cuadrante 2 Vector2(140,-225)
			
			# Asignar textura según el valor en el tablero
			match tablero[y][x]:
				1:
					var gato = GATO_SALTO.instantiate()  # Instancia la escena del personaje
					piezas.add_child(gato)  # Añadir el personaje al tablero
					gato.global_position = inicioPersonajes(Vector2(-260,-220), noPiezaP1)  # Asegurarse de que esté en la posición correcta
					noPiezaP1 = noPiezaP1 + 1
				2:
					var sombrero = SOMBRERO.instantiate()  # Instancia la escena del personaje
					piezas.add_child(sombrero)  # Añadir el personaje al tablero
					sombrero.global_position = inicioPersonajes(Vector2(143,-220), noPiezaP2)  # Asegurarse de que esté en la posición correcta
					noPiezaP2 = noPiezaP2 + 1
				3:
					holder.texture = TORTUGA
					
func inicioPersonajes (ubicacionInicial:Vector2, noPieza) -> Vector2:
	if(noPieza == 1):
		return ubicacionInicial
	elif (noPieza == 2):
		return Vector2(ubicacionInicial.x + 100, ubicacionInicial.y )
	elif(noPieza == 3):
		return Vector2(ubicacionInicial.x, ubicacionInicial.y + 82)
	else:
		return Vector2(ubicacionInicial.x + 100, ubicacionInicial.y + 82)
