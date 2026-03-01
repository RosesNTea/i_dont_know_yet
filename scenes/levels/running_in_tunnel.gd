extends Node2D
var progress: float = 1;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (progress >= 2):
		pass
	else:
		if (Input.is_action_pressed("Forward")):
			progress += 0.3 * delta;
		elif (Input.is_action_pressed("Backward")):
			progress -= 0.3 * delta;
		if (progress < 1):
			progress = 1;
		scale = Vector2(progress, progress);
		print(progress);
