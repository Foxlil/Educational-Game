extends CharacterBody2D

var projectile_position: Vector2
var projectile_rotation: float
var projectile_speed = 10000
var duration = 20
# Called when the node enters the scene tree for the first time.
#["hi","bro",":3"]
var correct_answers_1 = [
	2, 
	3, 
	1,
]
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

var index
func _ready() -> void:
	if Global.stage == 1: 
		index = Global.question_index_1.pick_random()
		var true_index = index + Global.which_question 
		$RichTextLabel.text = question_answers_1[true_index]
		if Global.attacking == true: 
			Global.question_index_1.erase(index)
	global_position = projectile_position
	global_rotation = projectile_rotation
func _process(delta: float) -> void:
	velocity = Vector2(projectile_speed, 0).rotated(projectile_rotation) * delta
	move_and_slide()
	rotation_degrees = 0
	if Global.attacking == true:
		pass
		if Global.flash == true: 
			if index == (correct_answers_1[Global.question_number] - 1):
				$AnimationPlayer.play("Flash_correct")
				await $AnimationPlayer.animation_finished
				Global.flash = false
		duration -= delta
		if duration <= 0:
			queue_free()
		if Global.shot_correct == true: 
			queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	Global.attacking_done = true
	Engine.time_scale = 1.0
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Fast"):
		Engine.time_scale = 1
	elif area.is_in_group("Slow"):
		if Global.shot_correct == false: 
			Engine.time_scale = 0.25
	if area.is_in_group("Bullet"):
		if Global.shot_yet == false:
			Global.shot_yet = true
			if Global.stage == 1: 
				if index == (correct_answers_1[Global.question_number] - 1): 
					Global.flash = false
					Global.shot_correct = true
					Engine.time_scale = 1
					Global.attacking_done = true
				else: 
					Global.shot_correct = false
					Global.flash = true
		elif Global.shot_yet == true: 
			pass
