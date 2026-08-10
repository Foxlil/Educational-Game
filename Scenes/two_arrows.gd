extends Sprite2D
var base_damage = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

signal two_arrows_attack_done
func _on_button_2_pressed() -> void:
	global_position = Vector2(536.0, 468.0)
	var attack_tween = create_tween().set_ignore_time_scale(true)
	attack_tween.tween_property($".", "global_position", Vector2(159.0, -59.0), 1)
	Global.enemy_health = Global.enemy_health - base_damage
	await attack_tween.finished
	two_arrows_attack_done.emit()
