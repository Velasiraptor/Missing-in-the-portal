extends AnimatedSprite2D

@export var item_sprite = preload("res://Sprites/Items/Scrap.png") ## Спрайт предмета, который нужен
@onready var circle_light = %CircleLight
@onready var area_2d = $Area2D


var ind_player_in_hatch := false

func _ready():
	play("Close")

func _process(delta):
	if Input.is_action_pressed("interaction_button"): 
		if ind_player_in_hatch == true: 
			var item = "scrap"
			get_tree().call_group("Inventory", "check_inventory_item", item_sprite, item)

func _on_area_2d_body_entered(body):
	if body.has_method("I_player"):
		ind_player_in_hatch = true
		circle_light.visible = true

func _on_area_2d_body_exited(body):
	if body.has_method("I_player"):
		ind_player_in_hatch = false
		circle_light.visible = false

func Open_hatch():
	area_2d.queue_free()
	play("Open")
	get_tree().call_group("Main_scene", "open_hatch")
	Globals.audio_scrap_play()
