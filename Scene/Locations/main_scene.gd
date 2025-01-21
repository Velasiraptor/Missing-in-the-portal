extends Node2D

@onready var camera_room_1 = %camera_room_1
@onready var camera_room_2 = %camera_room_2
@onready var camera_room_3 = %camera_room_3
@onready var camera_room_4 = %camera_room_4
@onready var camera_basement = %camera_basement
@onready var camera_staircase = %camera_staircase
@onready var camera_attic = %camera_attic

@onready var left_door_room_1 = %left_door_room_1
@onready var right_door_room_1 = %right_door_room_1
@onready var left_door_room_2 = %left_door_room_2
@onready var right_door_room_2 = %right_door_room_2
@onready var door_in_staircase = %door_in_staircase
@onready var left_door_room_3 = %left_door_room_3
@onready var right_door_in_basement_room_3 = %right_door_in_basement_room_3
@onready var right_door_room_4 = %right_door_room_4
@onready var right_door_basement = %right_door_basement
@onready var down_door_staircase = %down_door_staircase
@onready var up_door_staircase = %up_door_staircase
@onready var door_attic = %door_attic

@onready var collision_shape_2d_hatch = %CollisionShape2D_hatch

@onready var collision_shape_2d_card = %CollisionShape2D_card

@onready var canvas_layer_yes_no = %CanvasLayer_Yes_No


@onready var player = %Player

@onready var button_yes = %Button_Yes

@onready var animation_aran_1 = %Animation_Aran_1

@onready var animation_no = %Animation_No

@onready var animation_yes = %Animation_Yes

@onready var color_black = %ColorBLACK
@onready var death_sprite = %Death_sprite

@onready var aran = %Aran
@onready var player_talk = %Player_talk


var camera_room
var finish_catscene_ind = 0
var skip_ind = 1


func _ready():
	print(Globals.endings)
	camera_curent(camera_room_1)
	get_tree().call_group("Player", "start_move")
	canvas_layer_yes_no.visible = false
	if Globals.language == "ru":
		get_tree().call_group("Language", "language_RU")
	elif Globals.language == "en":
		get_tree().call_group("Language", "language_EN")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and finish_catscene_ind == 1 and skip_ind == 1:
		skip_ind = 0
		animation_aran_1.stop()
		canvas_layer_yes_no_visible_on()

func camera_curent(camera_room): # делаем камеру главной
	camera_room.make_current()


func _on_area_door_room_1_left_body_entered(body):
	body.global_position = right_door_room_2.global_position
	camera_curent(camera_room_2)
	player.modulate = "b7c3ad"
	get_tree().call_group("Room_1", "stop_monster")
	get_tree().call_group("Room_2", "start_timer_monster_room_2")

func _on_area_door_room_1_right_body_entered(body):
	body.global_position = left_door_room_3.global_position
	camera_curent(camera_room_3)
	player.modulate = "e1e7dc"
	get_tree().call_group("Room_1", "stop_monster")
	get_tree().call_group("Room_3", "start_timer_monster_room_3")

func _on_area_door_room_2_right_body_entered(body):
	body.global_position = left_door_room_1.global_position
	camera_curent(camera_room_1)
	player.modulate = "b7c3ad"
	get_tree().call_group("Room_1", "start_timer_monster_room_1")
	get_tree().call_group("Room_2", "stop_monster")

func _on_area_door_room_3_left_body_entered(body):
	body.global_position = right_door_room_1.global_position
	camera_curent(camera_room_1)
	player.modulate = "b7c3ad"
	get_tree().call_group("Room_1", "start_timer_monster_room_1")
	get_tree().call_group("Room_3", "stop_monster")


func _on_area_door_in_basement_room_3_right_body_entered(body):
	body.global_position = right_door_basement.global_position
	camera_curent(camera_basement)
	player.modulate = "adadad"
	get_tree().call_group("Room_3", "stop_monster")

func open_hatch():
	collision_shape_2d_hatch.disabled = false
	Globals.audio_hatch_play()

func _on_area_door_room_3_right_body_entered(body):
	body.global_position = right_door_in_basement_room_3.global_position
	camera_curent(camera_room_3)
	player.modulate = "e1e7dc"
	get_tree().call_group("Room_3", "start_timer_monster_room_3")

func open_card():
	collision_shape_2d_card.disabled = false
	Globals.audio_cnock_play()

func _on_area_door_room_2_left_body_entered(body):
	body.global_position = right_door_room_4.global_position
	camera_curent(camera_room_4)
	player.modulate = "e1e7dc"
	get_tree().call_group("Room_2", "stop_monster")


func _on_area_door_room_4_right_body_entered(body):
	body.global_position = left_door_room_2.global_position
	camera_curent(camera_room_2)
	player.modulate = "b7c3ad"
	get_tree().call_group("Room_2", "start_timer_monster_room_2")


func _on_area_door_in_staircase_body_entered(body):
	body.global_position = down_door_staircase.global_position
	camera_curent(camera_staircase)
	player.modulate = "e1e7dc"
	get_tree().call_group("Room_2", "stop_monster")


func _on_area_door_in_staircase_room_2_body_entered(body):
	body.global_position = door_in_staircase.global_position
	camera_curent(camera_room_2)
	player.modulate = "b7c3ad"
	get_tree().call_group("Room_2", "start_timer_monster_room_2")


func _on_area_door_in_attic_body_entered(body): # здесь нужно 1 раз сделать диалоговое окно, а потом удалить его
	body.global_position = door_attic.global_position
	camera_curent(camera_attic)
	player.modulate = "e1e7dc"
	if finish_catscene_ind == 0:
		animation_aran_1.play("aran_talk")
		get_tree().call_group("Player", "stop_move")
		get_tree().call_group("Player", "player_visible_off")
		finish_catscene_ind = 1
		player_talk.play()
		aran.play()

func disabled_button_YES_off():
	button_yes.disabled = false
	if Globals.language == "ru":
		button_yes.text = "УБИТЬ"
	elif Globals.language == "en":
		button_yes.text = "KILL HIM"
	

func canvas_layer_yes_no_visible_on():
	canvas_layer_yes_no.visible = true


func _on_area_door_in_staircase_up_body_entered(body):
	body.global_position = up_door_staircase.global_position
	camera_curent(camera_staircase)
	player.modulate = "e1e7dc"


func _on_button_no_pressed(): #Выбор НЕТ
	animation_no.play("no")
	canvas_layer_yes_no.visible = false
	await get_tree().create_timer(17.0).timeout
	bad_finish()

func bad_finish():
	if Globals.endings[0] == "-":
		Globals.endings[0] = "bad"
		Globals.save_game()
	else:
		pass
	get_tree().change_scene_to_file("res://Scene/Menu/main_menu.tscn")

func _on_button_yes_pressed(): #Выбор ДА
	animation_yes.play("yes")
	canvas_layer_yes_no.visible = false

func good_finish():
	if Globals.endings[1] == "-":
		Globals.endings[1] = ("good")
		Globals.save_game()
	else:
		pass
	get_tree().call_group("Player", "start_move")
	get_tree().call_group("Player", "player_visible_on")
	get_tree().call_group("Attic", "Aran_death")


#__________переменные для перевода_______________

#________________________________________________


func language_RU(): # все что должно быть на ру
	%"Label_what?".text = "Что? Кто здесь?"
	%"Label_no!".text = "НЕТ! Не подходи ко мне. Это место сводит с ума...
Каждая мысль здесь подталкивает к черте безумия. 
Я провел слишком много времени и уже никогда не буду прежним. 
Эта тварь внизу... 
Я заперся от нее, но не смог выбраться. 
Я испугался. Убей меня, закончи страдания..."
	%"Label_NONO!!!".text = "НЕТ! 
ТЫ ДОЛЖНА МЕНЯ УБИТЬ. 
Прошу..."
	%Label_KILL.text = "Зря ты сделала 
такой выбор."
	%"Label_Aran!".text = "Аран!"
	%Label_I_Kira.text = "Это я, Кира, я пришла
 за тобой! 
Давай выбираться 
отсюда!"
	%Label_go_home.text = "Что ты такое говоришь? 
Не переживай, я вытащу 
тебя отсюда, пойдем..."
	%Label_sorry_Yes.text = "Прости.."
	%Label_sorry_No.text = "Я... я не могу этого 
сделать, прости.."
	%Button_No.text = "Не убивать"
	%Button_Yes.text = "*Закрыто*"

func language_EN(): # все что должно быть на англ
	%"Label_what?".text = "What? Who's here?"
	%"Label_no!".text = "No! Don't come near me. This place is maddening...
every thought here pushes you to the edge of madness. 
I've spent too much time and I'll never be the same again. 
That thing downstairs...
I locked myself away from it, but I couldn't get out. 
I was scared. Kill me, end the suffering..."
	%"Label_NONO!!!".text = "No! 
YOU HAVE TO KILL ME. 
I beg..."
	%Label_KILL.text = "You shouldn't have made
such a choice."
	%"Label_Aran!".text = "Aran!"
	%Label_I_Kira.text = "It's me, Kira, I've come
for you! 
Let's get out of here 
From here!"
	%Label_go_home.text = "What are you saying? 
Don't worry, I'll get it out. 
Get you out of here, let's go..."
	%Label_sorry_Yes.text = "Sorry.."
	%Label_sorry_No.text = "I... I can't
do this, I'm sorry.."
	%Button_No.text = "Don't kill him"
	%Button_Yes.text = "*Closed*"
