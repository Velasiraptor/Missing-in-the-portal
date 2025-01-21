extends StaticBody2D

@onready var portal = %Portal
@onready var animation_portal = %Animation_portal
@onready var aran_death = %AranDeath
@onready var audio_portal = %Audio_portal


func _ready():
	portal.visible = false
	aran_death.visible = false

func portal_on():
	animation_portal.play("portal_on")
	Globals.audio_glass_play()
	portal.visible = true
	audio_portal.play()
	get_tree().call_group("Player", "stop_move")
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://Scene/Locations/The_end/the_end.tscn")


func Aran_death():
	aran_death.visible = true
