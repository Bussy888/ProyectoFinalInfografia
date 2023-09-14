extends Node2D


func _on_restart_button_pressed():
	Global.gems_collected = 0
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")
