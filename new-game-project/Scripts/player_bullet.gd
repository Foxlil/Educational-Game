extends CharacterBody2D

var bullet_position: Vector2
var bullet_rotation: float
var speed = 200000

var duration = 20

func _ready() -> void:
	global_position = bullet_position
	global_rotation = bullet_rotation
func _physics_process(delta: float) -> void:
	velocity = Vector2(speed,0).rotated(bullet_rotation) * (delta/Engine.time_scale)
	move_and_slide()
	duration -= delta
	if duration <= 0:
		queue_free()
