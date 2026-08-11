extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.disabled = true
	modulate.a = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.lost == true || Global.won == true: 
		if Global.lost == true: 
			$Label.text = "You"
			$Label2.text = "tried! :)"
			$Button/Label.text = "Try again?"
		elif Global.won == true: 
			$Label.text = "You"
			$Label2.text = "won!! :D"
			$Button/Label.text = "Play again?"
		#get_tree().paused = true
		Engine.time_scale = 1.0
		var show_myself = create_tween()
		show_myself.tween_property($".", "modulate:a", 1.0, 1)
		$Button.disabled = false


func _on_button_pressed() -> void:
	$Button/AudioStreamPlayer2D.play()
	await $Button/AudioStreamPlayer2D.finished
	Global.lost = false
	Global.won = false
	Global.player_health = 100
	Global.enemy_health = 200

	Global.shot_correct = false

	Global.attacking = false
	Global.attacking_done = false
	Global.which_question = 0
	Global.how_many_answ = 0
	Global.stage = 1
	Global.question_number = 0
	Global.slow_true = false
	Global.question_index_1 = [0, 1, 2]
	Global.shot_yet = false
	Global.flash = false
	Global.what_available = []
	Global.number_of_times = 1
	get_tree().paused = false
	get_tree().reload_current_scene()
