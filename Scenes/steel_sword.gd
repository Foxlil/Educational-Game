extends AnimatedSprite2D
var attacking = false
var base_damage = 20
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

signal diamond_sword_hit

#func _on_button_3_pressed() -> void:
	#show()
	#$".".play("default")
	#Global.enemy_health = Global.enemy_health - 15
	#await animation_finished
	#hide()
	#copper_sword_hit.emit()


func _on_button_4_pressed() -> void:
	show()
	attacking = true
	$".".play("default")
	Global.enemy_health = Global.enemy_health - (base_damage)
	await animation_finished
	hide()
	attacking = false
	diamond_sword_hit.emit()
	#
