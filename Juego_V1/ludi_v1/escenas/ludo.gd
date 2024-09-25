extends Sprite2D

const tablero_tamanio = 13;
const cell_with = 50; #Tamaño de cada cuadro donde saltaran

const TEXTURE_HOLDER = preload("res://escenas/texture_holder.tscn")

#Personajes
const gato_salto  = preload("res://Rocky Roads/Rocky Roads/Personajes/gato_salto.png");
const STATIC_CAT = preload("res://Rocky Roads/Rocky Roads/Personajes/static_cat.png")

@onready var piezas = $piezas
@onready var posicion_mov = $posicion_mov
@onready var turno = $turno

var tablero : Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])


	display_board()

#func display_board():
	#for y in tablero_tamanio:
		#for x in tablero_tamanio:
			#var holder = TEXTURE_HOLDER.instantiate()
			#piezas.add_child(holder)
			#holder.global_position = Vector2((-x * cell_with + (cell_with / 2))+300, (-y * cell_with - (cell_with / 2))+300)
			#
			#match tablero[x][y]:
				#1:holder.texture = STATIC_CAT
func display_board():
	for y in range(tablero_tamanio):
		for x in range(tablero_tamanio):
			var holder = TEXTURE_HOLDER.instantiate()
			piezas.add_child(holder)
			
			if (y == 1):
				holder.global_position = Vector2(((x * cell_with)  + (cell_with / 5)) - 300, ((y * cell_with) + (cell_with/3)) - 300)
			elif ( y == 11):
				holder.global_position = Vector2(((x * cell_with)  + (cell_with / 5)) - 300, ((y * cell_with) - (cell_with/3)) - 300)
			else:
				holder.global_position = Vector2(((x * cell_with)  + (cell_with / 5)) - 300, ((y * cell_with)) - 300)
			
			#elif (x == 9 or x == 11):
				## Ajustar la posición de estas columnas en particular
				#holder.global_position = Vector2(((x * cell_with) + (cell_with / 2)) - 315, ((y * cell_with) ) - 340)
			#else:
				## Posicionar normalmente las otras columnas
				#holder.global_position = Vector2(((x * cell_with) + (cell_with / 2)) - 300, ((y * cell_with) - 40) - 300)
			#
			# Asignar textura según el valor en el tablero
			match tablero[y][x]:
				1:holder.texture = STATIC_CAT
