class_name DraggableComponent
extends Node

var velocity:= Vector2.ZERO;
var isPickedUp:bool = false;
var mouseInside:bool = false;
var parent:Node2D;
@export var hitbox:Area2D;
@export var movmentComponent:MovmentComponent;

func _ready() -> void:
	hitbox.mouse_entered.connect(_mouseEntered);
	hitbox.mouse_exited.connect(_mouseeExited);
	parent = self.get_parent() 

func _process(_delta: float) -> void:
	Dragg();




func Dragg() -> void:
	if mouseInside: 
		if Input.is_action_just_pressed("Dragg"):
			isPickedUp = true
	
	if isPickedUp:
		if Input.is_action_just_released("Dragg"):
			isPickedUp = false;
			var overlappingAreas:= hitbox.get_overlapping_areas();
			if overlappingAreas.size() > 0:
				print(overlappingAreas.size());
				var dir: = Vector2.RIGHT.rotated(randf_range(0, TAU));
				velocity = dir.normalized() * 1000
				print("velocity: ", velocity)
		
		
		var mousePos:= parent.get_global_mouse_position()
		var dist_to_mouse: = parent.global_position.distance_to(mousePos)
		if dist_to_mouse > 6.0:
			#drift twords mouse
			var speed :float = min(dist_to_mouse * 10, 5000.0)
			var dir:= Vector2.RIGHT.rotated(parent.global_position.angle_to_point(mousePos))
			velocity = velocity.lerp(dir.normalized() * speed, 0.8)

		else:
			#gently slow down when neer mouse
			velocity = velocity.lerp(Vector2.ZERO, 0.8)
		
	else:
		#slow down when the object is put down
		velocity = velocity.lerp(Vector2.ZERO,0.05)
		
	#apply the velocity
	movmentComponent.setVelocity(velocity)





func _mouseEntered() -> void:
	mouseInside = true
func _mouseeExited() -> void:
	mouseInside = false
