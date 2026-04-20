class_name SnapComponent
extends Node

var enabled:bool = true
var parent:Node2D;
@export var hitbox:Area2D;
@export var snapPointGrupName:String;
@export var dragComponent:DraggableComponent;
@export var movmentComponent:MovmentComponent;

var snap:bool = false;
signal snapped
var snapObject:Area2D;



func _ready() -> void:
	parent = self.get_parent()
	hitbox.area_entered.connect(_areaEntered);
	hitbox.area_exited.connect(_areaExited);


func _process(_delta: float) -> void:
	if snap: 
		var snapPos:Vector2 = snapObject.find_child("snapPoint", false).global_position;
		
		if dragComponent.isPickedUp and snapPos.distance_to(parent.get_global_mouse_position()) > 20:
			return
		
		parent.global_position = snapPos
		if Input.is_action_just_released("Dragg"): snapped.emit()
		
		



func _areaExited(area:Area2D) -> void:
	if area.get_groups().has(snapPointGrupName):
		snap = false;

func _areaEntered(area:Area2D) -> void:
	if area.get_groups().has(snapPointGrupName) and enabled and dragComponent.isPickedUp:
		snap = true;
		snapObject = area;
		print("ff")
		
