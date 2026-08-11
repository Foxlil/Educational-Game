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


var pressed = false
var weapon_type = [
	2.0, 
	4.0, 
	6.0, 
	8.0,
	#10.0,
	#12.0, 
	#14.0, 
	#16.0, 
	#18.0, 
	#20.0
]
var weapon_number = 0
var juice_phase = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	$Node2D/TextureProgressBar.value = 0
	$Input.text_submitted.connect(_input_received)
# Called every frame. 'delta' is the elapsed time since the previous frame.
var answered = true
var question_number
func _physics_process(delta: float) -> void:
	pass
	
var new_value
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
		pressed_button.tween_property($CheckButton, "global_position", Vector2($CheckButton.global_position.x, 318.0), 1)
		pressed_question.tween_property($Question, "global_position", Vector2($Question.global_position.x, 352.0), 1)
	elif pressed == false: 
		var pressed_input = create_tween().set_ignore_time_scale(true)
		var pressed_button = create_tween().set_ignore_time_scale(true)
		var pressed_question = create_tween().set_ignore_time_scale(true)
		pressed_input.tween_property($Input, "global_position", Vector2($Input.global_position.x, 454.0), 1)
		pressed_button.tween_property($CheckButton, "global_position", Vector2($CheckButton.global_position.x, 389.0), 1)
		pressed_question.tween_property($Question, "global_position", Vector2($Question.global_position.x, 423.0), 1)

func _on_check_button_pressed() -> void:
	$CheckButton/AudioStreamPlayer2D.play()
	if pressed == true: 
		pressed = false
	elif pressed == false: 
		pressed = true

var stage = 0

func _input_received(new_text: String) -> void:  
	if new_text.to_lower() == question_answers_1[(question_number * amount_per_question) + (correct_answers_1[question_number] - 1)]: 
		answered = true
	if answered == true: 
		juice_phase = juice_phase + 1.0
		new_value = (juice_phase/weapon_type[weapon_number]) * 100
		var juice_tween = create_tween().set_ignore_time_scale(true)
		juice_tween.tween_property($Node2D/TextureProgressBar, "value", new_value, 0.5)
		if weapon_type[weapon_number] == juice_phase:
			if stage > 0: 
				Global.number_of_times = Global.number_of_times + 1
				stage = 0
			weapon_number = weapon_number + 1
			if !Global.what_available.has(weapon_number):
				Global.what_available.append(weapon_number)
			new_value = 0.0
			juice_phase = 0.0
			$AudioStreamPlayer2D.play()
			$Node2D/Bar.play("Flash!")
			
		juice_tween.tween_property($Node2D/TextureProgressBar, "value", new_value, 0)
		if weapon_number == weapon_type.size() && juice_phase == 0.0: 
			
			stage = stage + 1
			weapon_number = 0
			#Global.number_of_times = Global.number_of_times + 1
