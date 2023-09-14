extends Node

var gems_collected = 0
var lives_remain = 3

func _ready():
	print_debug(gems_collected)
	print_debug(lives_remain)

func _input(event):
	if event.is_action_pressed("return_to_main_menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
