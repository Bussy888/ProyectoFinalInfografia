extends RigidBody2D
@export var real_bullet : Bullet # Carga la escena de la bala
var shoot_timer = Timer.new()
var shoot_interval = 2 
var radius = 70  # Radio del círculo
var angular_speed = 2.0  # Velocidad angular (radianes por segundo)
var angle = 0.0  # Ángulo actual
signal kill
var hit_count = 0
var dont_kill = true
signal unlock


func _process(delta):
	# Actualiza el ángulo en función del tiempo
	angle += angular_speed * delta
	# Calcula las coordenadas x e y en función del ángulo y el radio
	var x = radius * cos(angle) + 642
	var y = radius * sin(angle) 
	# Establece la nueva posición del jefe
	position.x = x
	position.y = y

func _ready():
	add_child(shoot_timer)
	shoot_timer.wait_time = shoot_interval
	self.set_deferred("disabled",true)

func _shoot(body):
	real_bullet.global_position = global_position  # Coloca la bala en la posición del jefe
	var direction = body.global_position - global_position  # Calcula la dirección hacia el jugador
	direction = direction.normalized()
	real_bullet.set_bullet_direction(direction)  # Configura la dirección de la bala

	# Reinicia el temporizador para el próximo disparo
	shoot_timer.start()

# Función para manejar colisiones con otras balas
func _on_Boss_area_entered(area):
	if area.is_in_group("Bullet"):
		queue_free()  # Elimina el jefe al colisionar con una bala


func _on_timer_timeout():
	pass


func _on_hurt_area_entered(area):
	if area.is_in_group("Player"):
		_shoot(area)


func _on_hurt_body_entered(body):
	if body.name == "Player":
		_shoot(body)



func _on_bullet_bullet_on_player():
	print("_on_bullet_kill_player")
	kill.emit()


func _on_hit_body_entered(body):
	if body.name == "Player":
		if dont_kill == false:
			hit_count += 1  # Incrementa el contador de golpes
			if hit_count >= 3:  # Si se alcanzan tres golpes, el jefe muere
				unlock.emit()
				queue_free()
		else:
			dont_kill = true


func _on_dont_hurt_body_entered(body):
	dont_kill = false


func _on_key_spawn_boss():
	self.set_deferred("disabled",false)
