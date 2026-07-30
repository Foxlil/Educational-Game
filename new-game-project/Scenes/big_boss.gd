extends CharacterBody2D

enum State{Idle, Shoot_Attac, Type_Attac}
var current_state = State.Idle
var state_number
var stage = 1
var state_change = true

var boss_projectile = preload("res://Scenes/boss_projectiles.tscn")
var question = preload("res://Scenes/Questions.tscn")
var split = 4
var projectile_angle = 0
var wait_time = 3

func _physics_process(delta: float) -> void:
	$"../Questions".hide()
	$"../Boss projectiles".hide()
	current_state = State.Idle
	var time
	if state_change == true:
		state_change = false
		time = randi_range(1,3)
		await get_tree().create_timer(time).timeout
		state_number = randi_range(1,10)
		if stage == 1: 
			if state_number < 9: 
				current_state = State.Shoot_Attac
			else: 
				current_state = State.Type_Attac
		elif stage == 2: 
			if state_number < 6: 
				current_state = State.Shoot_Attac
			else: 
				current_state = State.Type_Attac
		elif stage == 3: 
			if state_number < 3: 
				current_state = State.Shoot_Attac
			else: 
				current_state = State.Type_Attac
		ask(delta)
		
		#state_change = true
	if Global.attacking_done == true: 
		boss_attacking_done.emit()
signal boss_attacking_done
var read_time = false
func ask(delta: float) -> void:
	var new_question = question.instantiate()
	new_question.show()
	new_question.global_position.y = -1000
	get_parent().add_child(new_question)
	if read_time == false:
		read_time = true
		await get_tree().create_timer(wait_time).timeout
		for i in range(3):
			firing(delta)
	await boss_attacking_done
	await get_tree().create_timer(1).timeout
	new_question.queue_free()
func firing(delta: float) -> void: 
	if projectile_angle == (180.0 - 180.0/split): 
		projectile_angle = 0
	projectile_angle = projectile_angle + 180.0/split
	fire(delta)
	
func fire(delta: float) -> void: 
	Global.attacking = true
	var new_bullet = boss_projectile.instantiate()
	new_bullet.show()
	new_bullet.projectile_position = $"Firing position".global_position
	new_bullet.projectile_rotation = deg_to_rad(projectile_angle)
	get_parent().add_child(new_bullet)
