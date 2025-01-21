extends StaticBody2D

@onready var portal = %Portal
@onready var animation_portal = %Animation_portal
@onready var player_start = %Player_start


func _ready():
	portal.visible = false

func portal_on():
	animation_portal.play("portal_on")
	get_tree().call_group("Player", "stop_move")
	portal.visible = true
	await get_tree().create_timer(1.0).timeout
	player_start.position = portal.position
	await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://Scene/Locations/main_scene.tscn")
