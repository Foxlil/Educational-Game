extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.disabled = false
	modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.won == true: 
		$Label.text = "You"
		$Label2.text = "won!! :D"
		$Button/Label.text = "Try again?"
		get_tree().paused = true
		Engine.time_scale = 1.0
		var show_myself = create_tween()
		show_myself.tween_property($".", "modulate:a", 1.0, 1)



func _on_button_pressed() -> void:
	print("true")
