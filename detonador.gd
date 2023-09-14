extends Area2D


signal destroy_floor
signal spawn_dirt

func _on_body_entered(body):
	if body.name == "Player":
		destroy_floor.emit()
		spawn_dirt.emit()
		hide()

