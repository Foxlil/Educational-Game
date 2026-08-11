extends Button

@export var index: int
@export var time: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var button_clicked = true
var timer_now = true
var times_clicked = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.what_available.has(index):
		if button_clicked == true: 
			if timer_now == true: 
				$".".disabled = true
				var timer = create_tween().set_ignore_time_scale()
				timer.tween_property($TextureProgressBar, "value", 0, time).set_trans(Tween.TRANS_LINEAR)
				await timer.finished
				button_clicked = false
		elif button_clicked == false: 
			$".".disabled = false
			timer_now = false
	else: 
		$".".disabled = true
		$TextureProgressBar.value = 100

func _on_pressed() -> void:
	print(Global.number_of_times)
	if Global.what_available.has(index):
		times_clicked = times_clicked + 1
	if times_clicked == Global.number_of_times:
		Global.what_available.erase(index)
		times_clicked = 0
	$TextureProgressBar.value = 100
	timer_now = false
	await player_attack_done
	timer_now = true
	button_clicked = true
signal player_attack_done
func _on_basic_arrow_attack_player_attack_done() -> void:
	if index == 1: 
		player_attack_done.emit()

func _on_two_arrows_1_two_arrows_attack_done() -> void:
	if index == 2: 
		player_attack_done.emit()
		
func _on_copper_sword_copper_sword_hit() -> void:
	if index == 3: 
		player_attack_done.emit()

func _on_diamond_sword_diamond_sword_hit() -> void:
	if index == 4: 
		player_attack_done.emit()
