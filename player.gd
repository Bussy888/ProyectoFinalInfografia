extends CharacterBody2D

class_name MyPlayer
const SPEED = 250.0
const JUMP_VELOCITY = -400.0
signal weDead
var isAlive = true
var on_jump = false
@export var end_gravity = 1.0
#var bullet = Bullet.new()

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _physics_process(delta):
	print(position.y)
	if not is_on_floor():
		velocity.y += gravity * delta *end_gravity

	if (Input.is_action_just_pressed("jump") and is_on_floor()) or on_jump:
		velocity.y = JUMP_VELOCITY
		$JumpSfx.play()
		on_jump = false

	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.play("run")
		if direction == -1:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED / 2)

	if not is_on_floor():
		$AnimatedSprite2D.play("jump")
	
	if position.y >= 1200:
		dead()
	move_and_slide()
	
	
	
func _on_bullet_bullet_on_player():
	print("se murio ")
	dead()
	
func dead():
	Global.lives_remain = Global.lives_remain - 1
	if Global.lives_remain <= 0 :
		Global.lives_remain = 3
		get_tree().change_scene_to_file("res://restart_menu.tscn")
	else:
		get_tree().reload_current_scene.call_deferred()
		


func _on_hit_body_entered(body):
	velocity.y = JUMP_VELOCITY
	velocity.x = SPEED
	$JumpSfx.play()


func _on_area_2d_area_entered(area):
	get_tree().change_scene_to_file("res://main_menu.tscn")
