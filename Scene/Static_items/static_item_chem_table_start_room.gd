extends Node2D


@onready var item_static_sprite = %Item_static_sprite


func _on_area_2d_body_entered(body):
	if body.has_method("I_player"):
		z_index = 1


func _on_area_2d_body_exited(body):
	if body.has_method("I_player"):
		z_index = 0
