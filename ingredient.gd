class_name IngredientScene
extends Node2D

@onready var texture: Sprite2D = $Texture
@export var snapComponent:SnapComponent
@export var ingredient:Ingredient;
#@export var randomResourcesArray:Array[Ingredient]


func _ready() -> void:
	#if ingredient == null:
		#ingredient = randomResourcesArray.pick_random()
	Global.potClosed.connect(func(): snapComponent.enabled = false)
	Global.potOpened.connect(func(): snapComponent.enabled = true)
	texture.texture = ingredient.texture



func _on_snap_component_snapped() -> void:
	Global.itemListInPot.append(ingredient.name)
	self.queue_free()
