extends Node2D


func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	pass


func _on_hitbox_pot_cover_snap_area_entered(area: Area2D) -> void:
	print( area.get_parent().get_groups())
	if area.get_parent().get_groups().has("PotCover"):
		Global.potClosed.emit()


func _on_hitbox_pot_cover_snap_area_exited(area: Area2D) -> void:
	if area.get_parent().get_groups().has("PotCover"):
		Global.potOpened.emit()
