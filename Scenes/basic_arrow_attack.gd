extends Sprite2D

var x_position
var base_damage = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".global_position.y = 473.0
	x_position = global_position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

signal player_attack_done
func _on_button_pressed() -> void:
	$AudioStreamPlayer2D.play()
	$".".global_position.y = 473.0
	var attack_tween = create_tween().set_ignore_time_scale(true)
	attack_tween.tween_property($".", "global_position", Vector2(x_position, -59.0), 1)
	if Global.enemy_health == 200: 
		Global.enemy_health = Global.enemy_health - 5
	else: 
		Global.enemy_health = Global.enemy_health - (base_damage)
	$"..".button_clicked = true
	await attack_tween.finished
	player_attack_done.emit()
