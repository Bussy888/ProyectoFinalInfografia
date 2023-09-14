extends Node


func _on_level_4_actual_level(level):
	if level == 4:
		$Entrada.play()


func _on_key_spawn_boss():
	$Entrada.stop()
	$BossFight.play()


func _on_boss_unlock():
	$BossFight.stop()
	$Peace.play()
