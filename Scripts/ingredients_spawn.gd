extends Node2D

@export var ingredientResource:Ingredient
var mouseInside:bool = false;
@export var hitbox:Area2D;
@onready var ingredientScene:PackedScene = preload("res://Scenes/ingredient.tscn");
@onready var sprite: Sprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = ingredientResource.texture;
	hitbox.mouse_entered.connect(_mouseEntered);
	hitbox.mouse_exited.connect(_mouseeExited);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mouseInside:
		if  Input.is_action_just_pressed("Dragg"):
			var ingredient:IngredientScene = ingredientScene.instantiate();
			ingredient.ingredient = ingredientResource;
			ingredient.global_position = get_global_mouse_position();
			ingredient.get_node("DraggableComponent").isPickedUp = true;
			get_parent().get_parent().get_node("Ingredients").add_child(ingredient);
		
		





func _mouseEntered() -> void:
	mouseInside = true
func _mouseeExited() -> void:
	mouseInside = false
