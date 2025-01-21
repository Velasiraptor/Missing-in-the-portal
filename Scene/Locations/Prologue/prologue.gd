extends Control

#__________переменные для перевода_______________
@onready var label_prologue = %Label_prologue
#________________________________________________

func _ready():
	if Globals.language == "ru":
		get_tree().call_group("Language", "language_RU")
	elif Globals.language == "en":
		get_tree().call_group("Language", "language_EN")

func start_game_start_room():
	get_tree().change_scene_to_file("res://Scene/Locations/room_start.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scene/Locations/room_start.tscn")



func language_RU(): # все что должно быть на ру
	label_prologue.text = "Я не видела мужа два дня после ночи 31 октября, 
когда он ушел в секретную лабораторию.
Единственное сообщение от него было:
 
'ЖЁЛТАЯ ПРОБИРКА!'

Потеряв надежду на его возвращение, 
я отправилась искать его сама."

func language_EN(): # все что должно быть на англ
	label_prologue.text = "I did not see my husband for two days after the night of October 31,
when he went to a secret laboratory.
The only message from him was:

'YELLOW TEST TUBE!'

Having lost hope of his return, 
I went to look for him myself."
