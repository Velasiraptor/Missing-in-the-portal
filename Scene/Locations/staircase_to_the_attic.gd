extends StaticBody2D

@onready var collision_shape_2d_5_close = %CollisionShape2D5_close
@onready var staircase_to_the_attic = %Staircase_to_the_attic
@onready var audio_open_door = %Audio_open_door


func _ready():
	staircase_to_the_attic.play("close")

func open_close_colis():
	collision_shape_2d_5_close.disabled = true
	staircase_to_the_attic.play("open")
	audio_open_door.play()
	
