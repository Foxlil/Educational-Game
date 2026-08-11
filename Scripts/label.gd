extends Label
var start = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		var tween = create_tween().set_ignore_time_scale()
		tween.tween_property($".", "modulate:a", 0, 1)
