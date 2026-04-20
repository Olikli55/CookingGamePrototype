extends Node2D

@export var mealsObjects:Node2D
@export var recipes:Array[IngredientRecipe]
@onready var mealScene:= preload("res://Scenes/meal.tscn")
func _ready() -> void:
	pass 




func _on_hitbox_pot_cover_snap_area_entered(area: Area2D) -> void:
	if area.get_parent().get_groups().has("PotCover"):
		Global.potClosed.emit()
		cook()


func _on_hitbox_pot_cover_snap_area_exited(area: Area2D) -> void:
	if area.get_parent().get_groups().has("PotCover"):
		Global.potOpened.emit()
		

func cook() -> void:
	for recipe:IngredientRecipe in recipes:
		if recipe.ingredients.size() != Global.itemListInPot.size():
			print("sorry wrong recipe");
			print(Global.itemListInPot);
			return;
		for ingredient:Ingredient in recipe.ingredients:
			if not Global.itemListInPot.has(ingredient.name):
				print("sorry wrong recipe");
				print(Global.itemListInPot);
				return;
			
		print("coocked: ", recipe.name);
		var mealObject:MealObject = mealScene.instantiate();
		mealObject.meal = recipe.output
		await get_tree().process_frame
		mealsObjects.add_child(mealObject)
		Global.itemListInPot.clear()
