extends Node2D
@onready var input: TextEdit = $Input
@onready var question: Label = $Question

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input.text_submitted.connect(_on_LineEdit_text_entered)

func _on_LineEdit_text_entered(new_text: String) -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
