extends Area2D
class_name  Bullet
# Variables para el movimiento de la bala
var velocity = Vector2(0, 0)
var speed = 150  # Velocidad de la bala
signal bullet_on_player

@export var player : MyPlayer

# Función llamada al instanciar la bala
func set_bullet_direction(direction):
	velocity = direction * speed

	

# Función llamada en cada frame
func _process(delta):
	# Mover la bala en la dirección y velocidad configuradas
	position += velocity * delta

# Función para manejar colisiones con otros objetos
# Elimina la bala al colisionar con el jugador


func _on_body_entered(body):
	if body.name == "Player":
		bullet_on_player.emit()
		print(_on_body_entered)
		self.queue_free()
