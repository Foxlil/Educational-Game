extends CharacterBody2D
var bullet_path = preload("res://bullet.tscn")
func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("space"):
		fire()

func _process(delta: float) -> void:
	pass
	if Global.player_health == 0 || Global.player_health < 0: 
		Global.lost = true
	elif Global.enemy_health == 0 || Global.enemy_health < 0: 
		Global.won = true
func fire():
	$AnimatedSprite2D.play()
	var bullet = bullet_path.instantiate()
	bullet.bullet_position = $"Firing position".global_position
	bullet.bullet_rotation = global_rotation
	get_parent().add_child(bullet)
