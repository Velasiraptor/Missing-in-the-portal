extends StaticBody2D

@onready var timer_monster_room_3 = %Timer_monster_room_3
@onready var animation_monster_room_3 = %Animation_monster_room_3

func idle_monster():
	get_tree().call_group("monster", "animation_monster_idle")
func walk_monster():
	get_tree().call_group("monster", "animation_monster_walk")
func collide_monster_off():
	get_tree().call_group("monster", "collide_off")
func collide_monster_on():
	get_tree().call_group("monster", "collide_on")

func animation_monster_room_3_pause():
	animation_monster_room_3.pause()
	timer_monster_room_3.stop()

func start_timer_monster_room_3():
	if Globals.difficulty == "easy":
		timer_monster_room_3.wait_time = 14.0
		timer_monster_room_3.start()
	elif Globals.difficulty == "normal":
		timer_monster_room_3.wait_time = 7.0
		timer_monster_room_3.start()
	elif Globals.difficulty == "hard":
		timer_monster_room_3.wait_time = 2.0
		timer_monster_room_3.start()

func random_on_animation_monster_room_3():
	if Globals.difficulty == "easy":
		timer_monster_room_3.wait_time = randi_range(28, 30)
		timer_monster_room_3.start()
	elif Globals.difficulty == "normal":
		timer_monster_room_3.wait_time = randi_range(18, 22)
		timer_monster_room_3.start()
	elif Globals.difficulty == "hard":
		timer_monster_room_3.wait_time = randi_range(13, 15)
		timer_monster_room_3.start()
	timer_monster_room_3.start()

func stop_monster():
	timer_monster_room_3.stop()
	animation_monster_room_3.stop()

func _on_timer_monster_room_2_timeout():
	animation_monster_room_3.play("left_door_room_3")
	random_on_animation_monster_room_3()
