extends Node2D

var oculto = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_detonador_destroy_floor():
	self.queue_free()


func _on_detonador_spawn_dirt():
	$StaticBody2D/CollisionShape2D.set_deferred("disabled",false)
	show() # Replace with function body.


func _on_level_3_actual_level(level):
	if level == 3 && oculto == false:
		$StaticBody2D/CollisionShape2D.set_deferred("disabled",true)
		hide()
	else:
		$StaticBody2D/CollisionShape2D.set_deferred("disabled",false)
		show()
