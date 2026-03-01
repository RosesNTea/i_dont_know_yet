extends Node2D

@onready var bug: Node2D = $armWithBug/bug;
@onready var bugVerticalMovementContainer: Node2D = $armWithBug/bug/Node2D;

@export var rate: float = 100;
@export var verticalRate: float = 100;

var right_moving: bool = true;
var up_moving: bool = true;

var startingPosition: Vector2;

var velocity = Vector2(2, -1.3)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startingPosition = bug.position;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (right_moving):
		if (bug.position.x < startingPosition.x + 150):
			bug.position += velocity * rate * delta;
		else:
			right_moving = false;
	else:
		if (bug.position.x > startingPosition.x - 100):
			bug.position -= velocity * rate * delta;
		else:
			right_moving = true;

	if (up_moving):
		if (bugVerticalMovementContainer.position.y < 100):
			bugVerticalMovementContainer.position.y += rate * delta;
		else:
			up_moving = false;
	else:
		if (bugVerticalMovementContainer.position.y > -100):
			bugVerticalMovementContainer.position.y -= rate * delta;
		else:
			up_moving = true;
