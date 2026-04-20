class_name MovmentComponent
extends Node

var velocity:= Vector2.ZERO
var parent:Node2D;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = self.get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	parent.global_position += velocity * delta


func setVelocity(vel:Vector2) -> void:
	velocity = vel;
	
func setPos(pos:Vector2) -> void:
	parent.global_position = pos;
