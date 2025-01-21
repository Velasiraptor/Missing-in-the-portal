extends Node

@onready var audio_glass = %Audio_glass
@onready var audio_water = %Audio_water
@onready var audio_portal = %Audio_portal
@onready var audio_key = %Audio_key
@onready var audio_cnock = %Audio_cnock
@onready var audio_scrap = %Audio_scrap
@onready var audio_hatch = %Audio_hatch
@onready var music = %Music

var difficulty_scene = preload("res://Scene/UI/the_choice_of_difficulty.tscn")

var difficulty := "easy"

var endings = ["-", "-"] # ["good", "bad"]
var language = "en"

const SAVE_GAME_FILE := "user://Missing_in_the_portal.save"
const SAVE_VARIABLES := ["endings", "language"]


func _ready():
	load_game()
	

func save_game():
	var save_game_file = FileAccess.open(SAVE_GAME_FILE, FileAccess.WRITE)
	if save_game_file == null:
		printerr("сохарнение провалилось с ошибкой {0}".format([FileAccess.get_open_error()]))
		return
	var game_data := {}
	for varible in SAVE_VARIABLES:
		game_data[varible] = get(varible)
	var json_object := JSON.new()
	save_game_file.store_line(json_object.stringify(game_data))

func load_game():
	if not FileAccess.file_exists(SAVE_GAME_FILE):
		return
	var save_game_file = FileAccess.open(SAVE_GAME_FILE, FileAccess.READ)
	if save_game_file == null:
		printerr("сохарнение провалилось с ошибкой {0}".format([FileAccess.get_open_error()]))
		return
	var json_object = JSON.new()
	var error = json_object.parse(save_game_file.get_line())
	if error != OK:
		return
	var game_data = json_object.get_data()
	for varible in SAVE_VARIABLES:
		if varible in game_data:
			set(varible, game_data[varible])


func audio_glass_play():
	audio_glass.play()

func audio_water_play():
	audio_water.play()

func audio_portal_play():
	audio_portal.play()

func audio_scrap_play():
	audio_scrap.play()

func audio_key_play():
	audio_key.play()

func audio_cnock_play():
	audio_cnock.play()

func audio_hatch_play():
	audio_hatch.play()
