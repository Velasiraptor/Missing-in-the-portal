extends CanvasLayer

@onready var inventory_slot_1 = %Inventory_slot_1
@onready var inventory_slot_2 = %Inventory_slot_2
@onready var inventory_slot_3 = %Inventory_slot_3
@onready var inventory_slot_4 = %Inventory_slot_4


@onready var item_texture_1 = %Item_Texture_1
@onready var item_texture_2 = %Item_Texture_2
@onready var item_texture_3 = %Item_Texture_3
@onready var item_texture_4 = %Item_Texture_4



@onready var inventory_slot_color_on = Color8(142, 156, 131, 255) # активная ячейка
@onready var inventory_slot_color_off = Color8(67, 76, 60, 255) # НЕ активная ячейка

var inventory_items = ["", "", "", ""]

# ИНВЕНТАРЬ

func _ready():
	inventory_slot_1.color = inventory_slot_color_on
	inventory_slot_2.color = inventory_slot_color_off
	inventory_slot_3.color = inventory_slot_color_off
	inventory_slot_4.color = inventory_slot_color_off

func _input(event): # Работа клавиш
	if event.is_action_pressed("Inventory_slot_1"):
		inventory_slot_1.color = inventory_slot_color_on
		
		inventory_slot_2.color = inventory_slot_color_off
		inventory_slot_3.color = inventory_slot_color_off
		inventory_slot_4.color = inventory_slot_color_off
	
	if event.is_action_pressed("Inventory_slot_2"):
		inventory_slot_2.color = inventory_slot_color_on
		
		inventory_slot_1.color = inventory_slot_color_off
		inventory_slot_3.color = inventory_slot_color_off
		inventory_slot_4.color = inventory_slot_color_off
	if event.is_action_pressed("Inventory_slot_3"):
		inventory_slot_3.color = inventory_slot_color_on
		
		inventory_slot_1.color = inventory_slot_color_off
		inventory_slot_2.color = inventory_slot_color_off
		inventory_slot_4.color = inventory_slot_color_off
	if event.is_action_pressed("Inventory_slot_4"):
		inventory_slot_4.color = inventory_slot_color_on
		
		inventory_slot_1.color = inventory_slot_color_off
		inventory_slot_2.color = inventory_slot_color_off
		inventory_slot_3.color = inventory_slot_color_off



func check_inventory_null_slots(new_texture_in_slot, new_item): # проверяем на свободный слот, принимает текстуру и ее название
	var item = new_item 
	if item_texture_1.texture != null and item not in inventory_items:
		print("занято")
	else:
		item_texture_1.texture = new_texture_in_slot
		inventory_items[0] = item
		return
	if item_texture_2.texture != null and item not in inventory_items:
		print("занято")
	else:
		item_texture_2.texture = new_texture_in_slot
		inventory_items[1] = item
		return
	if item_texture_3.texture != null and item not in inventory_items:
		print("занято")
	else:
		item_texture_3.texture = new_texture_in_slot
		inventory_items[2] = item
		return
	if item_texture_4.texture != null and item not in inventory_items:
		print("занято")
	else:
		item_texture_4.texture = new_texture_in_slot
		inventory_items[3] = item
		return


func check_inventory_item(item_texture, new_item): # проверяем на нужный предмет, принимает текстуру
	var item = new_item
	if inventory_items[0] == item and inventory_slot_1.color == inventory_slot_color_on:
		items_on(inventory_items[0])
		inventory_items[0] = ""
		item_texture_1.texture = null
	elif inventory_items[1] == item and inventory_slot_2.color == inventory_slot_color_on:
		items_on(inventory_items[1])
		inventory_items[1] = ""
		item_texture_2.texture = null
	elif inventory_items[2] == item and inventory_slot_3.color == inventory_slot_color_on:
		items_on(inventory_items[2])
		inventory_items[2] = ""
		item_texture_3.texture = null
	elif inventory_items[3] == item and inventory_slot_4.color == inventory_slot_color_on:
		items_on(inventory_items[3])
		inventory_items[3] = ""
		item_texture_4.texture = null
	else:
		get_tree().call_group("Player", "talk_player")


func items_on(item): #что произойдет с предметом
	if item == "card": #здесь карта
		get_tree().call_group("Card_code", "Open_door_card")
	if item == "scrap": #здесь лом
		get_tree().call_group("Hatch", "Open_hatch")
	if item == "key": #здесь ключ
		get_tree().call_group("Door_attic", "Open_Door")
	if item == "bottle_blue": #здесь синее зелье
		get_tree().call_group("Yelow_bottle_in_attic", "Open_portal")
	if item == "bottle_yellow": #здесь синее зелье
		get_tree().call_group("start_portal", "Open_portal_start")

func inventory_check_finish():
	var item = "gun"
	if item in inventory_items:
		get_tree().call_group("Main_scene", "disabled_button_YES_off")
	
