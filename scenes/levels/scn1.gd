extends Node2D
var progress: float = 1;
@onready var hands: AnimatedSprite2D = $AnimatedSprite2D;
@onready var background: StaticBody2D = $StaticBody2D;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (progress >= 2):
		SignalBus.sceneEnd.emit();
	else:
		if (Input.is_action_pressed("Forward")):
			progress += 0.3 * delta;
			hands.visible = true;
		elif (Input.is_action_pressed("Backward")):
			progress -= 0.3 * delta;
			hands.visible = true;
		else:
			hands.visible = false;
		if (progress < 1):
			progress = 1;
			hands.visible = false;
		background.scale = Vector2(progress, progress);
		print(progress);
