extends Sprite2D

@export var item_sprite = preload("res://Sprites/Items/Bottle_yelow.png") ## Спрайт предмета, который нужен
@onready var circle_light = %CircleLight
@onready var area_2d = $Area2D


var ind_player_in_bottle_portal := false

func _process(delta):
	if Input.is_action_pressed("interaction_button"): 
		if ind_player_in_bottle_portal == true: 
			var item = "bottle_yellow"
			get_tree().call_group("Inventory", "check_inventory_item", item_sprite, item)


func _on_area_2d_body_entered(body):
	if body.has_method("I_player"):
		ind_player_in_bottle_portal = true
		circle_light.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("I_player"):
		ind_player_in_bottle_portal = false
		circle_light.visible = false

func Open_portal_start():
	get_tree().call_group("Room_start", "portal_on")
	Globals.audio_water_play()
	Globals.audio_portal_play()
	queue_free()
