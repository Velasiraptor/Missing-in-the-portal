extends Sprite2D

@export var item_sprite = preload("res://icon.svg") ## Спрайт
@onready var circle_light = %CircleLight

@export var item = "bottle_yelow"

@onready var collision_shape_2d = %CollisionShape2D

@onready var audio_stream_player_2d = %AudioStreamPlayer2D

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
