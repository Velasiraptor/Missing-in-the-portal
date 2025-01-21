extends CharacterBody2D

@export var speed = 700 # Скорость движения NPC

@onready var raycast_1 = %raycast_1#player
@onready var raycast_2 = %raycast_2#player
@onready var raycast_3 = %raycast_3
@onready var raycast_4 = %raycast_4
@onready var raycast_5 = %raycast_5 #player

@onready var game_over = %Game_over


@onready var collision_monster = %Collision_monster


@onready var player = get_node("/root/Main_scene/Player")
@onready var monster_sprite = %Monster_sprite

@onready var canvas_layer_game_over = %CanvasLayer_game_over

var ind_player_death = 0
var ind_area = 0

#__________переменные для перевода_______________
var texture_text_die_RU = preload("res://Sprites/Monster/You_die_RU.png")
var texture_text_die_EN = preload("res://Sprites/Monster/You_die_EN.png")
#________________________________________________

func _ready():
	collide_off()
	canvas_layer_game_over.visible = false
	
	if Globals.language == "ru":
		get_tree().call_group("Language", "language_RU")
	elif Globals.language == "en":
		get_tree().call_group("Language", "language_EN")


func collide_off():
	raycast_1.enabled = false
	raycast_2.enabled = false
	raycast_3.enabled = false
	raycast_4.enabled = false
	raycast_5.enabled = false
	collision_monster.disabled = true
	

func collide_on():
	raycast_1.enabled = true
	raycast_2.enabled = true
	raycast_3.enabled = true
	raycast_4.enabled = true
	raycast_5.enabled = true
	collision_monster.disabled = false

func _physics_process(delta):
	if raycast_3.is_colliding() or raycast_4.is_colliding():
		pass
	else:
		if raycast_1.is_colliding() or raycast_2.is_colliding():
			ind_player_death = 1
			get_tree().call_group("Player", "stop_move")
			get_tree().call_group("Player", "player_has_fear")
	if raycast_5.is_colliding():
		ind_player_death = 1
		get_tree().call_group("Player", "stop_move")
		get_tree().call_group("Player", "player_has_fear")
		
	if ind_player_death == 1 and ind_area == 0:
		var direction = player.global_position - global_position 
		direction = direction.normalized() 
		get_tree().call_group("Room_1", "animation_monster_room_1_pause")
		get_tree().call_group("Room_2", "animation_monster_room_2_pause")
		get_tree().call_group("Room_3", "animation_monster_room_3_pause")
		velocity = direction * speed 
		move_and_slide() 

func animation_monster_idle():
	monster_sprite.play("idle")
func animation_monster_walk():
	monster_sprite.play("walk")



func _on_area_player_body_entered(body):
	if body.has_method("I_player"):
		get_tree().call_group("Room_1", "animation_monster_room_1_pause")
		get_tree().call_group("Room_2", "animation_monster_room_2_pause")
		get_tree().call_group("Room_3", "animation_monster_room_3_pause")
		get_tree().call_group("Player", "stop_move")
		game_over.play()
		get_tree().call_group("Player", "player_has_fear")
		ind_area = 1
		velocity = Vector2.ZERO
		await get_tree().create_timer(2.0).timeout
		canvas_layer_game_over.visible = true
		await get_tree().create_timer(2.0).timeout
		get_tree().change_scene_to_file("res://Scene/Locations/main_scene.tscn")


func language_RU(): # все что должно быть на ру
	$CanvasLayer_game_over/Control/Texture_text.texture = texture_text_die_RU
func language_EN(): # все что должно быть на англ
	$CanvasLayer_game_over/Control/Texture_text.texture = texture_text_die_EN
