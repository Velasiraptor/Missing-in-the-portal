extends Control

#__________переменные для перевода_______________
@onready var label_end = %Label_end
#________________________________________________

func _ready():
	if Globals.language == "ru":
		get_tree().call_group("Language", "language_RU")
	elif Globals.language == "en":
		get_tree().call_group("Language", "language_EN")

func good_finish_game():
	get_tree().change_scene_to_file("res://Scene/Menu/main_menu.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scene/Menu/main_menu.tscn")


func language_RU(): # все что должно быть на ру
	label_end.text = "Я выбралась, но какой ценой? 
Я убила единственного любимого человека.
Смогу ли я теперь жить прежней жизнью? 
Или я начинаю погружаться в безумие, как Аран? 
Хороший вопрос."
func language_EN(): # все что должно быть на англ
	label_end.text = "I got out, but at what cost? 
I killed the only person I loved.
Will I be able to live my old life now? 
Or am I starting to sink into madness like Aran? 
Good question."
