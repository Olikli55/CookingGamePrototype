class_name MealObject
extends Node2D

@onready var texture: Sprite2D = $Texture
@export var meal:Meal;

func _ready() -> void:

	texture.texture = meal.texture
