extends AnimatedSprite2D

@export var item_sprite = preload("res://Sprites/Items/Gun.png") ## Спрайт

@onready var circle_light = %CircleLight

@onready var canvas_layer_code_panel = %CanvasLayer_code_panel
@onready var label_code = %Label_code
@onready var area_2d_safe = %Area2D_safe

@onready var animation_panel = %Animation_panel
@onready var audio_error = %Audio_Error
@onready var audio_open = %Audio_open
@onready var audio_close = %Audio_close
@onready var audio_gun = %Audio_gun
@onready var audio_cnock = %Audio_cnock

var password = ""

var number
var count_number = 0
var count_max = 3

var ind_player_in_safe := false

func _ready():
	play("close")
	canvas_layer_code_panel.visible = false

func _process(delta):
	if Input.is_action_pressed("interaction_button"): 
		if ind_player_in_safe == true: 
			canvas_layer_code_panel.visible = true
			audio_close.play()
			

func _on_area_2d_body_entered(body):
	if body.has_method("I_player"):
		ind_player_in_safe = true
		circle_light.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("I_player"):
		ind_player_in_safe = false
		circle_light.visible = false
		canvas_layer_code_panel.visible = false
		

func Input_label_code(number):
	if (count_number < count_max) and count_number != 3:
		label_code.text += str(number)
		count_number += 1


func _on_button_1_pressed():
	Input_label_code(1)
	audio_cnock.play()

func _on_button_2_pressed():
	Input_label_code(2)
	audio_cnock.play()

func _on_button_3_pressed():
	Input_label_code(3)
	audio_cnock.play()

func _on_button_4_pressed():
	Input_label_code(4)
	audio_cnock.play()

func _on_button_5_pressed():
	Input_label_code(5)
	audio_cnock.play()

func _on_button_6_pressed():
	Input_label_code(6)
	audio_cnock.play()

func _on_button_7_pressed():
	Input_label_code(7)
	audio_cnock.play()

func _on_button_8_pressed():
	Input_label_code(8)
	audio_cnock.play()

func _on_button_9_pressed():
	Input_label_code(9)
	audio_cnock.play()

func _on_button_0_pressed():
	Input_label_code(0)
	audio_cnock.play()



func _on_exit_pressed():
	canvas_layer_code_panel.visible = false

func get_password(actual_number):
	password = actual_number
	print(password)

func _on_input_code_pressed():
	if label_code.text == password:
		canvas_layer_code_panel.visible = false
		ind_player_in_safe = false
		area_2d_safe.queue_free()
		play("open")
		var item = "gun"
		audio_open.play()
		audio_gun.play()
		get_tree().call_group("Inventory", "check_inventory_null_slots", item_sprite, item)
		get_tree().call_group("Inventory", "inventory_check_finish")
	else:
		label_code.text = ""
		audio_error.play()
		count_number = 0
		animation_panel.play("rotation_panel")
		
