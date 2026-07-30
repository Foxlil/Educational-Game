extends CharacterBody2D

var projectile_position: Vector2
var projectile_rotation: float
var projectile_speed = 100000
var duration = 20
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = projectile_position
	global_rotation = projectile_rotation

# Called every frame. 'delta' is the elapsed time since the previous frame.
var timer = false
var speed_up = true
func _process(delta: float) -> void:
	velocity = Vector2(projectile_speed, 0).rotated(projectile_rotation) * delta
	move_and_slide()
	rotation_degrees = 0
	if Global.attacking == true:
		if timer == false: 
			if speed_up == true: 
				timer = true
				$Slow_down.start()
		duration -= delta
		if duration <= 0:
			queue_free()
var till_speed_up = false
func _on_timer_timeout() -> void:
	if speed_up == true: 
		if till_speed_up == false: 
			till_speed_up = true
			$Till_speed_up.start()
			timer = false
			Engine.time_scale = 0.25
	
func _on_till_speed_up_timeout() -> void:
	till_speed_up = false
	speed_up = false
	Engine.time_scale = 1
signal finished_attacking
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	emit_signal("finished_attacking", true)
	Global.attacking_done = true
