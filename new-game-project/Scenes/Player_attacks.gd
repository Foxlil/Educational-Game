extends Button

@export var index: int
@export var time: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var button_clicked = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.what_available.has(index):
		if button_clicked == true: 
			$".".disabled = true
			var timer = create_tween().set_ignore_time_scale()
			timer.tween_property($TextureProgressBar, "value", 0, time).set_trans(Tween.TRANS_LINEAR)
			await timer.finished
			button_clicked = false
		elif button_clicked == false: 
			$".".disabled = false
	else: 
		$".".disabled = true
		$TextureProgressBar.value = 100

func _on_pressed() -> void:
	button_clicked = true
	$TextureProgressBar.value = 100
	if index == 2: 
		print("active")
