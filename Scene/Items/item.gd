extends Sprite2D

@export var item_sprite = preload("res://Sprites/Items/Key.png") ## Спрайт
@export var item = "bottle_blue"
@onready var circle_light = %CircleLight


var ind_player := false

func _process(delta):
	if Input.is_action_pressed("interaction_button"): 
		if ind_player == true: 
			get_tree().call_group("Inventory", "check_inventory_null_slots", item_sprite, item)
			Globals.audio_glass_play()
			queue_free()

func _on_area_2d_body_entered(body):
	if body.has_method("I_player"):
		ind_player = true
		circle_light.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("I_player"):
		ind_player = false
		circle_light.visible = false
