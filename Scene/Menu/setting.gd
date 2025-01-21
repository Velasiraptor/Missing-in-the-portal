extends Control


@onready var volume = %Volume
@onready var mute = %Mute
@onready var button_back = %Button_back

#__________переменные для перевода_______________
@onready var label_control = %Label_control
@onready var texture_setting = %Texture_setting
var texture_setting_ru = preload("res://Sprites/UI/Setting_RU.png")
var texture_setting_en = preload("res://Sprites/UI/Setting_EN.png")
@onready var label_volume = %Label_volume
# mute (Объявлен выше)
# button_back (Объявлен выше)
#________________________________________________

func _ready():
	visible = false
	volume.mouse_filter = MOUSE_FILTER_IGNORE
	mute.mouse_filter = MOUSE_FILTER_IGNORE
	button_back.mouse_filter = MOUSE_FILTER_IGNORE


func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)

func _on_check_box_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)


func _on_button_pressed(): # кнопка назад
	visible = false
	volume.mouse_filter = MOUSE_FILTER_IGNORE
	mute.mouse_filter = MOUSE_FILTER_IGNORE
	button_back.mouse_filter = MOUSE_FILTER_IGNORE

func setting_visible():
	visible = true
	volume.mouse_filter = MOUSE_FILTER_PASS
	mute.mouse_filter = MOUSE_FILTER_PASS
	button_back.mouse_filter = MOUSE_FILTER_PASS

func language_RU(): # все что должно быть на ру
	label_control.text = "УПРАвЛЕНИЕ"
	texture_setting.texture = texture_setting_ru
	label_volume.text = "ГРОМКОСТЬ"
	mute.text = "БЕЗ ЗвУКА"
	button_back.text = "НАЗАД"
func language_EN(): # все что должно быть на англ
	label_control.text = "CONTROL"
	texture_setting.texture = texture_setting_en
	label_volume.text = "VOLUME"
	mute.text = "MUTE"
	button_back.text = "BACK"
