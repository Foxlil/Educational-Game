extends RichTextLabel
var question_list = ["hi","bro",":3"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.question_number = randi_range(0,(question_list.size()-1))
	$".".text = question_list[Global.question_number]
	Global.which_question = Global.question_number * Global.how_many_answ
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	await get_tree().create_timer(1.5).timeout
	var tween = get_tree().create_tween()
	var x = global_position.x
	tween.tween_property($".", "global_position", Vector2(x,-2000), 1)
