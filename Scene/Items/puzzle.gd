extends AnimatedSprite2D

@export var item_sprite = preload("res://Sprites/Items/Card.png")  ## Спрайт

@onready var circle_light = %CircleLight

@onready var canvas_layer_puzzle_panel = %CanvasLayer_puzzle_panel
@onready var area_2d_puzzle = %Area2D_puzzle

@onready var button_1 = %Button_1
@onready var button_2 = %Button_2
@onready var button_3 = %Button_3

@onready var audio_puzzle = %Audio_puzzle

@onready var animation_panel = %Animation_panel


var ind_player_in_puzzle := false

func _ready():
	play("close")
	canvas_layer_puzzle_panel.visible = false

func _process(delta):
	if Input.is_action_pressed("interaction_button"): 
		if ind_player_in_puzzle == true: 
			canvas_layer_puzzle_panel.visible = true
	if button_1.text == "Fe" and button_2.text == "N" and button_3.text == "O":
		canvas_layer_puzzle_panel.visible = false
		play("open")
		audio_puzzle.play()
		var item = "card"
		get_tree().call_group("Inventory", "check_inventory_null_slots", item_sprite, item)
		button_1.text = "stop"
		button_2.text = "stop"
		button_3.text = "stop"
		area_2d_puzzle.queue_free()

func _on_area_2d_puzzle_body_entered(body):
	if body.has_method("I_player"):
		ind_player_in_puzzle = true
		circle_light.visible = true



func _on_area_2d_puzzle_body_exited(body):
	if body.has_method("I_player"):
		ind_player_in_puzzle = false
		circle_light.visible = false
		canvas_layer_puzzle_panel.visible = false
		


func _on_button_1_pressed():
	Globals.audio_cnock_play()
	if button_1.text == "Li":
		button_1.text = "O"
	elif button_1.text == "O":
		button_1.text = "Fe"
	elif button_1.text == "Fe":
		button_1.text = "B"
	elif button_1.text == "B":
		button_1.text = "F"
	elif button_1.text == "F":
		button_1.text = "N"
	else:
		button_1.text = "Li" 

func _on_button_2_pressed():
	Globals.audio_cnock_play()
	if button_2.text == "Li":
		button_2.text = "O"
	elif button_2.text == "O":
		button_2.text = "Fe"
	elif button_2.text == "Fe":
		button_2.text = "B"
	elif button_2.text == "B":
		button_2.text = "F"
	elif button_2.text == "F":
		button_2.text = "N"
	else:
		button_2.text = "Li" 

func _on_button_3_pressed():
	Globals.audio_cnock_play()
	if button_3.text == "Li":
		button_3.text = "O"
	elif button_3.text == "O":
		button_3.text = "Fe"
	elif button_3.text == "Fe":
		button_3.text = "B"
	elif button_3.text == "B":
		button_3.text = "F"
	elif button_3.text == "F":
		button_3.text = "N"
	else:
		button_3.text = "Li" 



func _on_exit_pressed():
	canvas_layer_puzzle_panel.visible = false
