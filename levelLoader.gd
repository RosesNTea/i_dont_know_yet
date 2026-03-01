extends Node

var levelInstance;
var levelnumber: int = 1;

func unloadLevel():
	if (is_instance_valid(levelInstance)):
		levelInstance.queue_free();
	levelInstance = null;

func loadNewLevel():
	unloadLevel();
	var levelPath : String
#	If

	levelPath = "res://scenes/levels/scn%s.tscn" % str(levelnumber);
	
	var levelResource : PackedScene = load(levelPath);
	
	if levelResource:
		levelInstance = levelResource.instantiate();
		add_child(levelInstance);
		levelnumber += 1;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadNewLevel();



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
