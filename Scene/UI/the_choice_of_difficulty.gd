extends Control

@onready var label_lock = %Label_LOCK
@onready var texture_lock = %Texture_LOCK

var main_scene := preload("res://Scene/Locations/Prologue/prologue.tscn")

#__________переменные для перевода_______________
# label_lock (Объявлена выше)
@onready var label_easy = %Label_Easy
@onready var label_normal = %Label_Normal
@onready var label_hard = %Label_Hard
@onready var texture_control = %Texture_Control
var control_RU = preload("res://Sprites/UI/Setting_RU.png")
var control_EN = preload("res://Sprites/UI/Setting_EN.png")
#________________________________________________

func _ready():
	if Globals.endings == ["bad", "good"]:
		open_lock_hard_button()
	else:
		close_lock_hard_button()
	if Globals.language == "ru":
		get_tree().call_group("Language", "language_RU")
	elif Globals.language == "en":
		get_tree().call_group("Language", "language_EN")

func _process(delta):
	if Input.is_action_just_pressed("ESC"):
		get_tree().change_scene_to_file("res://Scene/Menu/main_menu.tscn")

func close_lock_hard_button(): #Хард режим закрыт
	label_lock.visible = true
	texture_lock.visible = true

func open_lock_hard_button(): #Хард режим открыт
	label_lock.visible = false
	texture_lock.visible = false


func _on_texture_easy_pressed():
	Globals.difficulty = "easy"
	get_tree().change_scene_to_packed(main_scene)

func _on_texture_middle_pressed():
	Globals.difficulty = "normal"
	get_tree().change_scene_to_packed(main_scene)

func _on_texture_hard_pressed():
	Globals.difficulty = "hard"
	get_tree().change_scene_to_packed(main_scene)


func language_RU(): # все что должно быть на ру
	label_lock.text = "Откроется после
прохождения всех концовок"
	label_easy.text = "ЛЕГКО"
	label_normal.text = "НОРМАЛЬНО"
	label_hard.text = "ТЯЖЕЛО"
	texture_control.texture = control_RU
func language_EN(): # все что должно быть на англ
	label_lock.text = "It will open after
completing all the endings"
	label_easy.text = "EASY"
	label_normal.text = "NORMAL"
	label_hard.text = "HARD"
	texture_control.texture = control_EN
	
