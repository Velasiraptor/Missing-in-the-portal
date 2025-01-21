extends CharacterBody2D

@export var speed = 400
@onready var player_sprite = %Player_sprite
@onready var light = %Light
@onready var collision_player_on_monster = %Collision_player_on_monster
@onready var text_player = %Text_player
@onready var animation_text = %Animation_text
@onready var audio_step = %Audio_step

var is_audio_playing = false

var stop_move_player = 0

var ind_fear = 0

enum State { 
	IDLE,
	WALK,
	SIT_DOWN,
	FEAR
	}

var state := State.IDLE

#__________переменные для перевода_______________
# text_player (Объявлена выше)
#________________________________________________

func _ready():
	if Globals.language == "ru":
		get_tree().call_group("Language", "language_RU")
	elif Globals.language == "en":
		get_tree().call_group("Language", "language_EN")

func change_state(new_state: State): #функция изменения состояний
	state = new_state

func move():
	if ind_fear == 0:
		if stop_move_player == 0:
			var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
			velocity = input_direction.normalized() * speed
			change_state(State.WALK)
			collision_player_on_monster.shape.size = Vector2(62, 194)
			collision_player_on_monster.position = Vector2(0, -9)
			if !is_audio_playing and velocity != Vector2(0, 0):
				audio_step.play()
				is_audio_playing = true
			elif velocity == Vector2(0, 0):
				audio_step.stop()
				is_audio_playing = false
			if Input.is_action_pressed("sit_down") and velocity == Vector2(0, 0):
				change_state(State.SIT_DOWN)
				collision_player_on_monster.shape.size = Vector2(62, 44)
				collision_player_on_monster.position = Vector2(0, 141)
				audio_step.playing = false
			elif velocity == Vector2(0, 0):
				change_state(State.IDLE)
				collision_player_on_monster.shape.size = Vector2(62, 194)
				collision_player_on_monster.position = Vector2(0, -9)
				audio_step.playing = false
		else:
			velocity = Vector2(0, 0)
			audio_step.playing = false
	else:
		change_state(State.FEAR)
		audio_step.playing = false
		velocity = Vector2(0, 0)
		


func animate():
	if state == State.WALK and Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down"):
		player_sprite.play("walk")
	elif state == State.IDLE:
		player_sprite.play("idle")
	elif state == State.SIT_DOWN:
		player_sprite.play("ctrl")
	elif state == State.FEAR:
		player_sprite.play("fear")


func _physics_process(delta):
	if velocity.x > 0:
		player_sprite.flip_h = false
	elif velocity.x < 0:
		player_sprite.flip_h = true
	light.look_at(get_global_mouse_position())
	move()
	animate()
	move_and_slide()

func player_has_fear():
	ind_fear = 1

func I_player():
	pass

func stop_move():
	stop_move_player = 1
func start_move():
	stop_move_player = 0

func player_visible_off():
	visible = false
func player_visible_on():
	visible = true

func talk_player():
	animation_text.stop()
	animation_text.play("Text_puzzle")
	

func z_index_player():
	if z_index == 1:
		z_index = 0
	else:
		z_index = 1


func language_RU(): # все что должно быть на ру
	text_player.text = "Никак"

func language_EN(): # все что должно быть на англ
	text_player.text = "No way"
