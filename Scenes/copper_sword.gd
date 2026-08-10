extends AnimatedSprite2D

var base_damage = 15
var attacking = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

signal copper_sword_hit
func _on_button_3_pressed() -> void:
	show()
	attacking = true
	$".".play("default")
	Global.enemy_health = Global.enemy_health - (base_damage)
	await animation_finished
	hide()
	attacking = false
	copper_sword_hit.emit()
