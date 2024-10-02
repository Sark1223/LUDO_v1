extends Sprite2D

const tablero_tamanio = 13;
const cell_with = 50; #Tamaño de cada cuadro donde saltaran

const TEXTURE_HOLDER = preload("res://escenas/texture_holder.tscn")

#Personajes
const gato_salto  = preload("res://Rocky Roads/Rocky Roads/Personajes/gato_salto.png");
const STATIC_CAT = preload("res://Rocky Roads/Rocky Roads/Personajes/static_cat.png")
const SOMBRERO = preload("res://Rocky Roads/Rocky Roads/Personajes/sombrero.png")
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
			
			# Asignar textura según el valor en el tablero
			match tablero[y][x]:
				1:holder.texture = STATIC_CAT
				2:holder.texture = SOMBRERO
				3:holder.texture = TORTUGA
