extends Sprite2D

@export var item_sprite_card = preload("res://Sprites/Items/Card.png")  ## Спрайт предмета, который нужен
@onready var circle_light = %CircleLight
@onready var area_2d = $Area2D
@onready var red_light = %Red_Light


var ind_player_in_code_card := false

func _process(delta):
	if Input.is_action_pressed("interaction_button"): 
		if ind_player_in_code_card == true: 
			var item = "card"
			get_tree().call_group("Inventory", "check_inventory_item", item_sprite_card, item)


func _on_area_2d_body_entered(body):
	if body.has_method("I_player"):
		ind_player_in_code_card = true
		circle_light.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("I_player"):
		ind_player_in_code_card = false
		circle_light.visible = false

func Open_door_card():
	red_light.visible = false
	get_tree().call_group("Main_scene", "open_card")
	area_2d.queue_free()
	
	
