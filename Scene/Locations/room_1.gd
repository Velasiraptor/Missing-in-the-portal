extends StaticBody2D

@onready var animation_monster_room_1 = %Animation_monster_room_1
@onready var timer_monster_room_1 = %Timer_monster_room_1

var anim_list = ["left_door", "right_door"]


func _ready():
	start_timer_monster_room_1()

func start_timer_monster_room_1():
	if Globals.difficulty == "easy":
		timer_monster_room_1.wait_time = 14.0
		timer_monster_room_1.start()
	elif Globals.difficulty == "normal":
		timer_monster_room_1.wait_time = 7.0
		timer_monster_room_1.start()
	elif Globals.difficulty == "hard":
		timer_monster_room_1.wait_time = 2.0
		timer_monster_room_1.start()

func idle_monster():
	get_tree().call_group("monster", "animation_monster_idle")
func walk_monster():
	get_tree().call_group("monster", "animation_monster_walk")
func collide_monster_off():
	get_tree().call_group("monster", "collide_off")
func collide_monster_on():
	get_tree().call_group("monster", "collide_on")

func animation_monster_room_1_pause():
	animation_monster_room_1.pause()
	timer_monster_room_1.stop()

func random_on_animation_monster_room_1():
	if Globals.difficulty == "easy":
		timer_monster_room_1.wait_time = randi_range(28, 30)
		timer_monster_room_1.start()
	elif Globals.difficulty == "normal":
		timer_monster_room_1.wait_time = randi_range(18, 22)
		timer_monster_room_1.start()
	elif Globals.difficulty == "hard":
		timer_monster_room_1.wait_time = randi_range(13, 15)
		timer_monster_room_1.start()
	timer_monster_room_1.start()

func stop_monster():
	timer_monster_room_1.stop()
	animation_monster_room_1.stop()

func _on_timer_monster_timeout():
	var anim = anim_list[randi_range(0,1)]
	if animation_monster_room_1.is_playing():
		timer_monster_room_1.start()
	else:
		animation_monster_room_1.play(anim)
		random_on_animation_monster_room_1()
