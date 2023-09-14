extends Area2D

signal open_door
signal spawn_boss


func _on_body_entered(body):
	if body.name == "Player":
		$unlockSound.play()
		open_door.emit()
		spawn_boss.emit()
		
		hide()



