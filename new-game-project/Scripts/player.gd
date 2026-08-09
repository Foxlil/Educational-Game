extends CharacterBody2D
var bullet_path = preload("res://bullet.tscn")
func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("space"):
		fire()
func fire():
	$AnimatedSprite2D.play()
	var bullet = bullet_path.instantiate()
	bullet.bullet_position = $"Firing position".global_position
	bullet.bullet_rotation = global_rotation
	get_parent().add_child(bullet)
