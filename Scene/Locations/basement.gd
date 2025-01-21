extends StaticBody2D

var pass_018 = preload("res://Sprites/Locations/Basement/Password_018.png")
var pass_365 = preload("res://Sprites/Locations/Basement/Password_365.png")
var pass_703 = preload("res://Sprites/Locations/Basement/Password_703.png")

@onready var password_sprite = %Password_sprite


var passwords = [pass_018, pass_365, pass_703]

func _ready():
	var actual_password = passwords.pick_random()
	if actual_password == pass_018:
		password_sprite.texture = pass_018
		get_tree().call_group("safe", "get_password", "018")
	elif actual_password == pass_365:
		password_sprite.texture = pass_365
		get_tree().call_group("safe", "get_password", "365")
	else:
		password_sprite.texture = pass_703
		get_tree().call_group("safe", "get_password", "703")
