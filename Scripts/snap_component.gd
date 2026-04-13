extends Node2D

@export var parent:Node2D
@export var hitbox:Area2D
var snap:bool = false
var snapObject:Area2D;
# Called when the node enters the scene tree for the first time.



func _ready() -> void:
	hitbox.area_entered.connect(_areaEntered)
	hitbox.area_exited.connect(_areaExited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if snap: 
		var snapPos:Vector2 = snapObject.find_child("CoverPos", false).global_position
		if snapPos.distance_to(get_global_mouse_position()) < 20:
			parent.global_position = snapObject.find_child("CoverPos", false).global_position
	print(snap)


func _areaExited(area:Area2D) -> void:
	if area.get_groups().has("PotCoverSnapPos"):
		snap = false

func _areaEntered(area:Area2D) -> void:
	if area.get_groups().has("PotCoverSnapPos"):
		snap = true
		snapObject = area 
		
