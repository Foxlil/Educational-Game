extends Sprite2D
var base_damage = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_2_pressed() -> void:
	global_position = Vector2(268.0, 467.0)
	var attack_tween = create_tween().set_ignore_time_scale(true)
	attack_tween.tween_property($".", "global_position", Vector2(611.0, -59.0), 1)
	Global.enemy_health = Global.enemy_health - (base_damage)
