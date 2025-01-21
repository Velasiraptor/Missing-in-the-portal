extends Sprite2D

@export var item_sprite = preload("res://Sprites/Items/Bottle_blue.png") ## Спрайт предмета, который нужен
@onready var circle_light = %CircleLight
@onready var area_2d = $Area2D


var ind_player_bottle_yelow := false

func _process(delta):
	if Input.is_action_pressed("interaction_button"): 
		if ind_player_bottle_yelow == true: 
			var item = "bottle_blue"
			get_tree().call_group("Inventory", "check_inventory_item", item_sprite, item)


func _on_area_2d_body_entered(body):
	if body.has_method("I_player"):
		ind_player_bottle_yelow = true
		circle_light.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("I_player"):
		ind_player_bottle_yelow = false
		circle_light.visible = false

func Open_portal():
	get_tree().call_group("Attic", "portal_on")
	queue_free()
