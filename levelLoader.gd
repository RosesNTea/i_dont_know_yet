extends Node

var levelInstance;
var levelnumber: int = 1;

func unloadLevel():
	if (is_instance_valid(levelInstance)):
		levelInstance.queue_free();
	levelInstance = null;

func loadNewLevel():
	unloadLevel();
	SignalBus.mainMenuHide.emit();
	var levelPath : String
#	If

	levelPath = "res://scenes/levels/scn%s.tscn" % str(levelnumber);
	
	if (ResourceLoader.exists(levelPath)):
		var levelResource : PackedScene = load(levelPath);
		
		if levelResource:
			levelInstance = levelResource.instantiate();
			add_child(levelInstance);
			levelnumber += 1;
	else:
		SignalBus.mainMenuShow.emit();
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.sceneEnd.connect(loadNewLevel);
	SignalBus.deathScene.connect(onDeath);
	SignalBus.mainMenuShow.connect(unloadLevel);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	loadNewLevel();
	
func onDeath() -> void:
	unloadLevel();
	var levelResource : PackedScene = load("res://scenes/death.tscn");
	
	if levelResource:
		levelInstance = levelResource.instantiate();
		add_child(levelInstance);
	
