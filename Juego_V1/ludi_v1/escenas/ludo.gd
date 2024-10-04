extends Sprite2D

const tablero_tamanio = 13;
const cell_with = 50; #Tamaño de cada cuadro donde saltaran

const TEXTURE_HOLDER = preload("res://escenas/texture_holder.tscn")

#PERSONAJES 
const GATO_SALTO = preload("res://escenas/gato_salto.tscn")
const SOMBRERO = preload("res://escenas/sombrero.tscn")

#Personajes
const STATIC_CAT = preload("res://Rocky Roads/Rocky Roads/Personajes/static_cat.png")
const TORTUGA = preload("res://Rocky Roads/Rocky Roads/Personajes/tortuga.png")

@onready var dado: RichTextLabel = $disenio_tablero/cuadros/dado
@onready var piezas = $piezas
@onready var posicion_mov = $posicion_mov
@onready var turno = $turno

var tablero : Array
var turno_jugador: int

var  PLAYER1 : Array
var  PLAYER2 : Array
var  PLAYER3 : Array
var  PLAYER4 : Array
 
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
	tablero.append([0, 3, 0, 3, 0, 0, 0, 0, 0, 3, 0, 3, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])
	tablero.append([0, 3, 0, 3, 0, 0, 0, 0, 0, 3, 0, 3, 0,])
	tablero.append([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,])

	display_board()
	
	turno_jugador = 1;

#Generar tablero
func display_board():
	var noPiezaP1 = 0
	var noPiezaP2 = 0
	var noPiezaP3 = 0
	var noPiezaP4 = 0
	for y in range(tablero_tamanio):
		for x in range(tablero_tamanio):
			var holder = TEXTURE_HOLDER.instantiate()
			piezas.add_child(holder)
			
			#ESTO SE VA A BORRAR CUANDO SE AGREGUEN LOS PERSONAJES COMO OBJETOS--------------------------
			if (y == 1):#Acomodar los personajes de arriba correctamente en la base
				holder.global_position = Vector2(((x * cell_with)  + (cell_with / 5)) - 300, ((y * cell_with) + (cell_with/3)) - 305)
			elif ( y == 11):#Acomodar los personajes de abajo correctamente en la base
				holder.global_position = Vector2(((x * cell_with)  + (cell_with / 5)) - 300, ((y * cell_with) - (cell_with/3)) - 305)
			else:
				holder.global_position = Vector2(((x * cell_with)  + (cell_with / 5)) - 300, ((y * cell_with)) - 300)
			#----------------------------------------------------------------------------
			
			#CUADRANTE 1
			#Posicion del personaje 1 en el cuadrante 1 Vector2(-262,-225)
			#Posicion del personaje 2 en el cuadrante 2 Vector2(140,-225)
			
			# Asignar textura según el valor en el tablero
			match tablero[y][x]:
				1:
					var gato = GATO_SALTO.instantiate()  # Instancia la escena del personaje
					piezas.add_child(gato)  # Añadir el personaje al tablero
					gato.global_position = inicioPersonajes(Vector2(-260,-220), noPiezaP1, gato)  # Asegurarse de que esté en la posición correcta
					
					#ASIGNAR PERSONAJES AL PLAYER1
					PLAYER1.insert(noPiezaP1, gato)##De la posicion 0-4 se agrega el objeto personaje
					
					noPiezaP1 = noPiezaP1 + 1
				2:
					var sombrero = SOMBRERO.instantiate()  # Instancia la escena del personaje
					piezas.add_child(sombrero)  # Añadir el personaje al tablero
					sombrero.global_position = inicioPersonajes(Vector2(143,-220), noPiezaP2, sombrero)  # Asegurarse de que esté en la posición correcta
					
					#ASIGNAR PERSONAJES AL PLAYER2
					PLAYER2.insert(noPiezaP2, sombrero)
					
					noPiezaP2 = noPiezaP2 + 1
				3:
					holder.texture = TORTUGA

# Funcion que asigna posicion inicial a los personajes y un ID unico para cada uno
func inicioPersonajes (ubicacionInicial:Vector2, noPieza, personaje) -> Vector2:
	personaje.name = personaje.name + "_pieza_" + str(noPieza)
	#print(personaje.name +"\n")
	if(noPieza == 1):
		return ubicacionInicial
	elif (noPieza == 2):
		return Vector2(ubicacionInicial.x + 100, ubicacionInicial.y )
	elif(noPieza == 3):
		return Vector2(ubicacionInicial.x, ubicacionInicial.y + 82)
	else:
		return Vector2(ubicacionInicial.x + 100, ubicacionInicial.y + 82)

@onready var btn_dado: Button = $disenio_tablero/cuadros/btnDado

##Se ocupa saber si ya salio la pieza (un valor del arreglo bool) - LISTO!!!!
# Nombre de la pieza .name - LISTO!!!!
# objeto del personaje

#Se mandara el nombre del personaje elegido por el player
func moverPersonaje(valor:int, personaje):
	if(valor == 6):
		personaje.global_position = Vector2(-257,-45)
	
func _on_pressed() -> void:
	#Generar un numero aleatorio del 1 al 6
	var random = RandomNumberGenerator.new()
	random.randomize()
	var valor_dado = random.randi_range(1, 6)
	dado.text = "obtuviste: " + str(valor_dado)
	#-----------------------------------
	#print(PLAYER1[0].fuera_base)
	#print(PLAYER1[1])
	#print(PLAYER2[2])
	obtener_Jugador_Personje(valor_dado)

func obtener_Jugador_Personje(valor_dado):
	if(turno_jugador == 1): 
		moverPersonaje(valor_dado, PLAYER1[0])
	elif(turno_jugador == 2):
		moverPersonaje(valor_dado, PLAYER2[0])
	

func cambiar_turno_player(turno_jugador):
	if(turno_jugador <3 ):
		turno_jugador = turno_jugador + 1
	else:
		turno_jugador = 1;
