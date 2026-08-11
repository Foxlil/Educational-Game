extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CharacterBody2D.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $"..".attacking == true: 
		$CharacterBody2D.disabled = false
	elif $"..".attacking == false: 
		$CharacterBody2D.disabled = true
