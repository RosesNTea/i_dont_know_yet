extends Node2D

var bugVisible: bool = true;

@onready var bug: Node2D = $armWithBug/bug;
@onready var bugVerticalMovementContainer: Area2D = $armWithBug/bug/Node2D;
@onready var slapper: Area2D = $slappyArm;
@onready var slapperHand: AnimatedSprite2D = $slappyArm/AnimatedSprite2D;

var horizontalRate;
var verticalRate;
@export var initHorizontalRate: float;
@export var initVerticalRate: float;

var right_moving: bool = true;
var up_moving: bool = true;

var startingPosition: Vector2;

var velocity = Vector2(2, -1.3)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startingPosition = bug.position;
	horizontalRate = initHorizontalRate;
	verticalRate = initVerticalRate;
	$Timer2.start();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ($Timer2.time_left != 0):
		if (right_moving):
			if (bug.position.x < startingPosition.x + 150):
				bug.position += velocity * horizontalRate * delta;
			else:
				right_moving = false;
		else:
			if (bug.position.x > startingPosition.x - 100):
				bug.position -= velocity * horizontalRate * delta;
			else:
				right_moving = true;

		if (up_moving):
			if (bugVerticalMovementContainer.position.y < 100):
				bugVerticalMovementContainer.position.y += verticalRate * delta;
			else:
				up_moving = false;
		else:
			if (bugVerticalMovementContainer.position.y > -100):
				bugVerticalMovementContainer.position.y -= verticalRate * delta;
			else:
				up_moving = true;
	else:
		
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		horizontalRate = 0;
		verticalRate = 0;
		slapperHand.frame = 1;
		slapper.position = Vector2(129.73, 98.51);
		slapper.rotation = 0;
		if (slapper.overlaps_area(bugVerticalMovementContainer)):
			print("You win");
			SignalBus.sceneEnd.emit();
		else: 
			$Timer.start();
			await $Timer.timeout;
			slapper.position = Vector2(252.155, 313.5);
			slapper.rotation = -12;
			horizontalRate = initHorizontalRate * 2;
			verticalRate = initVerticalRate;
			slapperHand.frame = 0;
			
func _physics_process(delta: float) -> void:
	if (horizontalRate < 1000):
		horizontalRate *= 1.002;
