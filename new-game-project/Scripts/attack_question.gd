extends Node2D
@onready var input: LineEdit = $Input
@onready var question: Label = $Question
@onready var check_button: Button = $CheckButton

var question_list = ["hi","bro",":3"]
var correct_answers_1 = [
	2, 
	3, 
	1,
]
var amount_per_question = 3
var question_answers_1 = [
	"there",
	"correct",
	"bye",
	
	"ski",
	"tato",
	"correct",
	
	"correct",
	"mew",
	"meowchi"
]

var normal_button_position
var pressed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#input.text_submitted.connect(_on_LineEdit_text_entered)
	normal_button_position = check_button.global_position
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
var answered = true
func _physics_process(delta: float) -> void:
	pass
	$Input.text_submitted.connect(_input_received)
var question_number
func _process(delta: float) -> void:
	if pressed == true: 
		if answered == true: 
			question_number = randi_range(0, question_list.size() - 1)
			$Question.text = question_list[question_number]
			$Input.clear()
			answered = false
		var pressed_input = create_tween().set_ignore_time_scale(true)
		var pressed_button = create_tween().set_ignore_time_scale(true)
		var pressed_question = create_tween().set_ignore_time_scale(true)
		pressed_input.tween_property($Input, "global_position", Vector2($Input.global_position.x, 383.0), 1)
		pressed_button.tween_property($CheckButton, "global_position", Vector2($CheckButton.global_position.x, 312.0), 1)
		pressed_question.tween_property($Question, "global_position", Vector2($Question.global_position.x, 352.0), 1)
	elif pressed == false: 
		var pressed_input = create_tween().set_ignore_time_scale(true)
		var pressed_button = create_tween().set_ignore_time_scale(true)
		var pressed_question = create_tween().set_ignore_time_scale(true)
		pressed_input.tween_property($Input, "global_position", Vector2($Input.global_position.x, 454.0), 1)
		pressed_button.tween_property($CheckButton, "global_position", Vector2($CheckButton.global_position.x, 383.0), 1)
		pressed_question.tween_property($Question, "global_position", Vector2($Question.global_position.x, 423.0), 1)

func _on_check_button_pressed() -> void:
	if pressed == true: 
		pressed = false
	elif pressed == false: 
		pressed = true
func _input_received(new_text: String) -> void: 
	if new_text.to_lower() == question_answers_1[(question_number * amount_per_question) + (correct_answers_1[question_number] - 1)]: 
		answered = true
