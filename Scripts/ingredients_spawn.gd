extends Node2D

@export var ingredient:Ingredient
var mouseInside:bool = false;
@export var hitbox:Area2D;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hitbox.mouse_entered.connect(_mouseEntered);
	hitbox.mouse_exited.connect(_mouseeExited);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouseInside:
		if not Input.is_action_just_pressed("Dragg"):
			return;
		
		





func _mouseEntered() -> void:
	mouseInside = true
func _mouseeExited() -> void:
	mouseInside = false
